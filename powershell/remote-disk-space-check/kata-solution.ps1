function Get-RemoteDiskSpace {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$ComputerNames,
		[Parameter(Mandatory=$false)]
		[System.Management.Automation.PSCredential]$Credential
	)
	
	$results = @()
	
	foreach ($computer in $ComputerNames) {
		try {
			$scriptBlock = {
				Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
					$totalSpaceGB = [math]::Round($_.Size / 1GB, 0)
					$freeSpaceGB = [math]::Round($_.FreeSpace / 1GB, 0)
					$percentFree = if ($totalSpaceGB -gt 0) { 
						[math]::Round(($freeSpaceGB / $totalSpaceGB) * 100, 0) 
					} else { 0 }
					
					# Only return drives with less than 20% free space
					if ($percentFree -lt 20) {
						[PSCustomObject]@{
							ComputerName = $env:COMPUTERNAME
							Drive = $_.DeviceID
							FreeSpaceGB = $freeSpaceGB
							TotalSpaceGB = $totalSpaceGB
							PercentFree = $percentFree
						}
					}
				}
			}
			
			$invokeParams = @{
				ComputerName = $computer
				ScriptBlock = $scriptBlock
				ErrorAction = 'Stop'
			}
			
			if ($Credential) {
				$invokeParams.Credential = $Credential
			}
			
			$computerResults = Invoke-Command @invokeParams
			$results += $computerResults
			
		} catch {
			Write-Warning "Failed to connect to $computer`: $($_.Exception.Message)"
		}
	}
	
	# Sort results by ComputerName, then by Drive
	$sortedResults = $results | Sort-Object ComputerName, Drive
	
	return @($sortedResults)
}