function Get-MemoryHungryProcesses {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$Processes,
		[Parameter(Mandatory=$true)]
		[int]$ThresholdMB
	)
	
	$hungryProcesses = $Processes | Where-Object { $_.WorkingSetMB -gt $ThresholdMB } |
									Select-Object -ExpandProperty ProcessName |
									Sort-Object
	
	return @($hungryProcesses)
}