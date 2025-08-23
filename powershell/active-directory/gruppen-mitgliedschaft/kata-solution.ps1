function Get-GroupMembers {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Users,
		[Parameter(Mandatory=$true)]
		[string]$GroupName
	)
	
	$groupMembers = $Users | Where-Object { $_.Groups -contains $GroupName } |
						   Select-Object -ExpandProperty Username |
						   Sort-Object
	
	return @($groupMembers)
}