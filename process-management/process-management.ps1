# Process Management Assignment
# Script to list processes based on specific conditions

Write-Host "=== Process Management Assignment ===" -ForegroundColor Green
Write-Host ""

# Q1: Process Name starts with 's' and ends with 't'
Write-Host "Q1. Processes with names starting with 's' and ending with 't':" -ForegroundColor Yellow
Write-Host "================================================================" -ForegroundColor Yellow

$q1_processes = Get-Process | Where-Object { $_.ProcessName -like "s*t" }

if ($q1_processes) {
    $q1_processes | Select-Object ProcessName, Id, WorkingSet, Path | Format-Table -AutoSize
} else {
    Write-Host "No processes found matching this criteria." -ForegroundColor Red
}

Write-Host ""

# Q2: Process with WorkingSet higher than 100000 and lesser than 9999999
Write-Host "Q2. Processes with WorkingSet between 100,000 and 9,999,999 bytes:" -ForegroundColor Yellow
Write-Host "====================================================================" -ForegroundColor Yellow

$q2_processes = Get-Process | Where-Object { 
    $_.WorkingSet -gt 100000 -and $_.WorkingSet -lt 9999999 
}

if ($q2_processes) {
    $q2_processes | Select-Object ProcessName, Id, @{Name='WorkingSet(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}}, Path | 
    Sort-Object WorkingSet -Descending | Format-Table -AutoSize
} else {
    Write-Host "No processes found matching this criteria." -ForegroundColor Red
}

Write-Host ""

# Q3: Processes with specific criteria
Write-Host "Q3. Processes with Id > 10, Path contains 'system', and PriorityBoostEnabled = True:" -ForegroundColor Yellow
Write-Host "===================================================================================" -ForegroundColor Yellow

$q3_processes = Get-Process | Where-Object { 
    $_.Id -gt 10 -and 
    $_.Path -like "*system*" -and 
    $_.PriorityBoostEnabled -eq $true 
}

if ($q3_processes) {
    $q3_processes | Select-Object ProcessName, Id, Path, PriorityBoostEnabled, 
    @{Name='WorkingSet(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}} | Format-Table -AutoSize
} else {
    Write-Host "No processes found matching this criteria." -ForegroundColor Red
}

Write-Host ""

# Summary
Write-Host "=== Summary ===" -ForegroundColor Green
Write-Host "Q1 Results: $(($q1_processes | Measure-Object).Count) processes found"
Write-Host "Q2 Results: $(($q2_processes | Measure-Object).Count) processes found"
Write-Host "Q3 Results: $(($q3_processes | Measure-Object).Count) processes found"

# Optional: Export results to files
$export_choice = Read-Host "`nWould you like to export results to CSV files? (y/n)"
if ($export_choice -eq 'y' -or $export_choice -eq 'Y') {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    
    if ($q1_processes) {
        $q1_processes | Export-Csv -Path "Q1_Processes_$timestamp.csv" -NoTypeInformation
        Write-Host "Q1 results exported to Q1_Processes_$timestamp.csv" -ForegroundColor Green
    }
    
    if ($q2_processes) {
        $q2_processes | Export-Csv -Path "Q2_Processes_$timestamp.csv" -NoTypeInformation
        Write-Host "Q2 results exported to Q2_Processes_$timestamp.csv" -ForegroundColor Green
    }
    
    if ($q3_processes) {
        $q3_processes | Export-Csv -Path "Q3_Processes_$timestamp.csv" -NoTypeInformation
        Write-Host "Q3 results exported to Q3_Processes_$timestamp.csv" -ForegroundColor Green
    }
}
