function Get-InvalidConfigurations {
	param(
		[Parameter(Mandatory=$true)]
		[AllowEmptyCollection()]
		[array]$JsonConfigs
	)
	
	$invalidApps = $JsonConfigs | ForEach-Object {
		$config = ConvertFrom-Json $_
		
		if ($config.database.timeout -gt 30 -or $config.api.retries -lt 3) {
			$config.appName
		}
	} | Sort-Object
	
	return @($invalidApps)
}