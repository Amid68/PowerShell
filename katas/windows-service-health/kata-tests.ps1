BeforeAll { 
	. $PSCommandPath.Replace(".Tests.ps1", ".ps1") 
}

Describe "Get-ProblematicServices Tests" {
	It "Should detect stopped automatic services" {
		$services = @(
			@{ ServiceName = "ImportantSvc"; DisplayName = "Important Service"; Status = "Stopped"; StartupType = "Automatic"; Description = "Critical service" }
			@{ ServiceName = "NormalSvc"; DisplayName = "Normal Service"; Status = "Running"; StartupType = "Automatic"; Description = "Working service" }
		)
		$result = Get-ProblematicServices -Services $services
		Write-Host "Test 1 result: $($result -join ',')" -ForegroundColor Cyan
		$result.Count | Should -Be 1
		$result -contains "ImportantSvc" | Should -Be $true
	}
	
	It "Should detect running disabled services" {
		$services = @(
			@{ ServiceName = "SecurityRisk"; DisplayName = "Risky Service"; Status = "Running"; StartupType = "Disabled"; Description = "Should not run" }
			@{ ServiceName = "GoodSvc"; DisplayName = "Good Service"; Status = "Running"; StartupType = "Automatic"; Description = "Should run" }
		)
		$result = Get-ProblematicServices -Services $services
		Write-Host "Test 2 result: $($result -join ',')" -ForegroundColor Cyan
		$result.Count | Should -Be 1
		$result -contains "SecurityRisk" | Should -Be $true
	}
	
	It "Should ignore stopped manual services" {
		$services = @(
			@{ ServiceName = "ManualSvc"; DisplayName = "Manual Service"; Status = "Stopped"; StartupType = "Manual"; Description = "On-demand service" }
			@{ ServiceName = "AutoSvc"; DisplayName = "Auto Service"; Status = "Running"; StartupType = "Automatic"; Description = "Always running" }
		)
		$result = Get-ProblematicServices -Services $services
		Write-Host "Test 3 result count: $($result.Count)" -ForegroundColor Cyan
		$result.Count | Should -Be 0
	}
	
	It "Should sort results alphabetically" {
		$services = @(
			@{ ServiceName = "ZebraService"; DisplayName = "Zebra"; Status = "Stopped"; StartupType = "Automatic"; Description = "Should run" }
			@{ ServiceName = "AlphaService"; DisplayName = "Alpha"; Status = "Running"; StartupType = "Disabled"; Description = "Should not run" }
			@{ ServiceName = "BetaService"; DisplayName = "Beta"; Status = "Running"; StartupType = "Automatic"; Description = "Normal" }
			@{ ServiceName = "GammaService"; DisplayName = "Gamma"; Status = "Stopped"; StartupType = "Automatic"; Description = "Should run" }
		)
		$result = Get-ProblematicServices -Services $services
		Write-Host "Test 4 result: $($result -join ',')" -ForegroundColor Cyan
		$result.Count | Should -Be 3
		# Test sorting by converting to single string and comparing
		($result -join ",") | Should -Be "AlphaService,GammaService,ZebraService"
	}
	
	It "Should handle empty service array" {
		$services = @()
		$result = Get-ProblematicServices -Services $services
		Write-Host "Test 5 result count: $($result.Count)" -ForegroundColor Cyan
		$result.Count | Should -Be 0
	}
	
	It "Should handle paused services correctly" {
		$services = @(
			@{ ServiceName = "PausedSvc"; DisplayName = "Paused Service"; Status = "Paused"; StartupType = "Automatic"; Description = "Currently paused" }
			@{ ServiceName = "StoppedSvc"; DisplayName = "Stopped Service"; Status = "Stopped"; StartupType = "Automatic"; Description = "Currently stopped" }
		)
		$result = Get-ProblematicServices -Services $services
		Write-Host "Test 6 result: $($result -join ',')" -ForegroundColor Cyan
		$result.Count | Should -Be 1
		$result -contains "StoppedSvc" | Should -Be $true
	}
}
