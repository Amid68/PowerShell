function Get-RecentlyDisabledUsers {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Users
	)
	
	$cutoffDate = (Get-Date).AddDays(-90)
	
	$suspiciousUsers = $Users | Where-Object { 
		$_.Enabled -eq $false -and $_.LastLogin -ge $cutoffDate 
	} | Select-Object -ExpandProperty Username |
	   Sort-Object
	
	return @($suspiciousUsers)
}