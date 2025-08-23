function Get-ExpiringSoonPasswords {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Users
	)
	
	$cutoffDate = (Get-Date).AddDays(7)
	
	$expiringUsers = $Users | Where-Object { $_.PasswordExpiry -le $cutoffDate } |
							Select-Object -ExpandProperty Username |
							Sort-Object
	
	return @($expiringUsers)
}