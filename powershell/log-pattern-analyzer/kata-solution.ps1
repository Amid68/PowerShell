function Get-FailedLoginIPs {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$LogLines
	)
	
	$failedIPs = $LogLines | ForEach-Object {
		if ($_ -match "FAILED LOGIN.*from (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})") {
			$Matches[1]
		}
	} | Select-Object -Unique | Sort-Object
	
	return @($failedIPs)
}