# Windows Service Health Check

## Description

As a system administrator, you regularly need to monitor Windows services to ensure critical systems are running properly. Service outages can cause significant downtime, so identifying problematic services quickly is essential for maintaining system reliability.

Your task is to create a function that analyzes Windows service status data and identifies services that require immediate attention based on their current state and configuration.

## Task

Write a PowerShell function called `Get-ProblematicServices` that:

1. Takes an array of Windows service objects (hashtables)
2. Finds services that are **problematic** based on these criteria:
   - Service status is "Stopped" AND startup type is "Automatic" (should be running)
   - OR service status is "Running" but startup type is "Disabled" (shouldn't be running)
3. Returns an array of service names (just the names, not the full objects)
4. Returns the service names sorted alphabetically
5. Handles empty input arrays gracefully

Each service object contains:
- `ServiceName` (string): The service's system name
- `DisplayName` (string): The friendly display name
- `Status` (string): Current status ("Running", "Stopped", "Paused")
- `StartupType` (string): How the service starts ("Automatic", "Manual", "Disabled")
- `Description` (string): Service description

## Example

```powershell
$services = @(
    @{ ServiceName = "Spooler"; DisplayName = "Print Spooler"; Status = "Running"; StartupType = "Automatic"; Description = "Print service" }
    @{ ServiceName = "BITS"; DisplayName = "Background Transfer"; Status = "Stopped"; StartupType = "Automatic"; Description = "File transfer" }
    @{ ServiceName = "TelnetSvc"; DisplayName = "Telnet"; Status = "Running"; StartupType = "Disabled"; Description = "Remote access" }
    @{ ServiceName = "Themes"; DisplayName = "Themes"; Status = "Stopped"; StartupType = "Manual"; Description = "Visual themes" }
)

Get-ProblematicServices -Services $services
# Should return: @("BITS", "TelnetSvc")
```

## Notes

- Focus on **automatic services that are stopped** (critical services down)
- Focus on **disabled services that are running** (potential security issues)
- Ignore manual services that are stopped (this is normal)
- Ignore running automatic services (this is good)
- Return service names in alphabetical order
- If no services have problems, return an empty array
