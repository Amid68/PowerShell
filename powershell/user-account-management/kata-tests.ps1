# Test cases for User Account Management Kata
# Run with: Invoke-Pester .\kata-tests.ps1

BeforeAll { 
	. "$PSScriptRoot\kata-solution.ps1"
}

Describe "Get-InactiveUsers Tests" {
	Context "Basic functionality" {
		It "Should return users inactive for more than 30 days" {
			$users = @(
				@{ Username = "active.user"; LastLogin = (Get-Date).AddDays(-15); Department = "IT"; Enabled = $true }
				@{ Username = "inactive.user"; LastLogin = (Get-Date).AddDays(-45); Department = "HR"; Enabled = $true }
			)
			$result = Get-InactiveUsers -Users $users
			$result | Should -Be @("inactive.user")
		}
	}
	
	Context "Account filtering" {
		It "Should only include enabled accounts" {
			$users = @(
				@{ Username = "disabled.user"; LastLogin = (Get-Date).AddDays(-45); Department = "IT"; Enabled = $false }
				@{ Username = "enabled.inactive"; LastLogin = (Get-Date).AddDays(-45); Department = "HR"; Enabled = $true }
			)
			$result = Get-InactiveUsers -Users $users
			$result | Should -Be @("enabled.inactive")
		}
	}
	
	Context "Sorting and ordering" {
		It "Should return results in alphabetical order" {
			$users = @(
				@{ Username = "zebra.user"; LastLogin = (Get-Date).AddDays(-45); Department = "IT"; Enabled = $true }
				@{ Username = "alpha.user"; LastLogin = (Get-Date).AddDays(-60); Department = "HR"; Enabled = $true }
				@{ Username = "beta.user"; LastLogin = (Get-Date).AddDays(-35); Department = "Finance"; Enabled = $true }
			)
			$result = Get-InactiveUsers -Users $users
			$result[0] | Should -Be "alpha.user"
			$result[1] | Should -Be "beta.user" 
			$result[2] | Should -Be "zebra.user"
		}
	}
	
	Context "Edge cases" {
		It "Should return empty array when no users meet criteria" {
			$users = @(
				@{ Username = "recent.user"; LastLogin = (Get-Date).AddDays(-10); Department = "IT"; Enabled = $true }
				@{ Username = "disabled.old"; LastLogin = (Get-Date).AddDays(-50); Department = "HR"; Enabled = $false }
			)
			$result = Get-InactiveUsers -Users $users
			$result.Count | Should -Be 0
		}
		
		It "Should handle empty input array" {
			$users = @()
			$result = Get-InactiveUsers -Users $users
			$result.Count | Should -Be 0
		}
	}
}
