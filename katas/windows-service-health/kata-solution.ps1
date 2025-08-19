function Get-ProblematicServices {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Services
	)
	
	$filtered = $Services | Where-Object {
		($_.Status -eq "Stopped" -and $_.StartupType -eq "Automatic") -or
		($_.Status -eq "Running" -and $_.StartupType -eq "Disabled")
	}
	
	if ($filtered) {
		$problematicServices = $filtered | Select-Object -ExpandProperty ServiceName | Sort-Object
		return @($problematicServices)
	} else {
		return @()
	}
}
