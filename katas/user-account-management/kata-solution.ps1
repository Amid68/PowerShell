function Get-InactiveUsers {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Users
	)
	
	$cutoffDate = (Get-Date).AddDays(-30)
	
	$inactiveUsers = $Users | Where-Object {
		$_.Enabled -eq $true -and $_.LastLogin -lt $cutoffDate
	} | Select-Object -ExpandProperty Username | Sort-Object
	
	return $inactiveUsers
}
