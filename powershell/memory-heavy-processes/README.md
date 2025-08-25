# Memory-Heavy Processes Kata 🔧

**Difficulty**: 7 kyu (Basic)  
**Focus**: Process Management, Memory Calculations, Numeric Filtering  

[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)
![Difficulty](https://img.shields.io/badge/Difficulty-7%20kyu-green)

## Problem Description

As a system administrator, you need to identify processes that are consuming excessive memory for performance monitoring. Create a function that finds processes using more than a specified amount of RAM.

### Requirements

Write a PowerShell function `Get-MemoryHungryProcesses` that:

1. ✅ Takes an array of process objects (hashtables)
2. ✅ Takes a memory threshold in MB as parameter
3. ✅ Finds processes using more memory than the threshold
4. ✅ Returns an array of process names (just the names, not full objects)
5. ✅ Returns process names sorted alphabetically

### Input Format

Each process object contains:
- `ProcessName` (string): The process name
- `WorkingSetMB` (int): Memory usage in megabytes
- `Id` (int): Process ID

### Example

```powershell
$processes = @(
    @{ ProcessName = "chrome"; WorkingSetMB = 250; Id = 1234 }
    @{ ProcessName = "notepad"; WorkingSetMB = 15; Id = 5678 }
    @{ ProcessName = "firefox"; WorkingSetMB = 180; Id = 9012 }
    @{ ProcessName = "outlook"; WorkingSetMB = 320; Id = 3456 }
)

Get-MemoryHungryProcesses -Processes $processes -ThresholdMB 100
# Expected: @("chrome", "firefox", "outlook")
```

### Your Task

Write the function and test it! Focus on:
- Numeric comparisons (`-gt` for "greater than")
- Pipeline operations for filtering
- Property selection and sorting