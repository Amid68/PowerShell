function Get-ComputersByOS {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Computers,
		[Parameter(Mandatory=$true)]
		[string]$OperatingSystem
	)
	
	$filteredComputers = $Computers | Where-Object { $_.OS -eq $OperatingSystem } |
									Select-Object -ExpandProperty ComputerName |
									Sort-Object
	
	return @($filteredComputers)
}