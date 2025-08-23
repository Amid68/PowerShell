function Get-UsersFromOU {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Users,
		[Parameter(Mandatory=$true)]
		[string]$OUName
	)
	
	$filteredUsers = $Users | Where-Object { $_.OU -eq $OUName } |
							Select-Object -ExpandProperty Name |
							Sort-Object
	
	return @($filteredUsers)
}