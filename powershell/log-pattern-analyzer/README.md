# Log Pattern Analyzer

**Difficulty**: 6 kyu (Intermediate)  
**Focus**: Regular Expressions, Text Processing, Log Analysis  

[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)
![Difficulty](https://img.shields.io/badge/Difficulty-6%20kyu-orange)

## Problem Description

System administrators need to analyze log files to extract specific information. You must parse log entries and extract IP addresses that appear in failed login attempts.

### Requirements

Write a PowerShell function `Get-FailedLoginIPs` that:

1. ✅ Takes an array of log line strings
2. ✅ Uses regular expressions to find lines containing "FAILED LOGIN"
3. ✅ Extracts IP addresses from those lines using regex capture groups
4. ✅ Returns unique IP addresses (no duplicates)
5. ✅ Returns IPs sorted alphabetically

### Input Format

Log lines follow this pattern:
```
[2025-01-15 10:30:45] INFO: User john.doe logged in from 192.168.1.100
[2025-01-15 10:31:22] ERROR: FAILED LOGIN attempt for user admin from 10.0.0.55
[2025-01-15 10:32:10] ERROR: FAILED LOGIN attempt for user root from 172.16.0.25
```

### Example

```powershell
$logLines = @(
    "[2025-01-15 10:30:45] INFO: User john.doe logged in from 192.168.1.100",
    "[2025-01-15 10:31:22] ERROR: FAILED LOGIN attempt for user admin from 10.0.0.55",
    "[2025-01-15 10:32:10] ERROR: FAILED LOGIN attempt for user root from 172.16.0.25",
    "[2025-01-15 10:33:15] ERROR: FAILED LOGIN attempt for user admin from 10.0.0.55",
    "[2025-01-15 10:34:20] INFO: User jane.smith logged in from 192.168.1.200"
)

Get-FailedLoginIPs -LogLines $logLines
# Expected: @("10.0.0.55", "172.16.0.25")
```

### Learning Goals

- **Regular Expressions**: Pattern matching with `-match` operator
- **Capture Groups**: Extracting specific parts with `$Matches`
- **Text Processing**: Parsing structured log data
- **Deduplication**: Using `Select-Object -Unique`

### Hints

- Use `-match` operator to test if a string matches a regex pattern
- IP address regex pattern: `(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})`
- Access captured groups with `$Matches[1]` (first capture group)
- Use `Select-Object -Unique` to remove duplicates
- Combine patterns: look for "FAILED LOGIN" AND extract IP in same regex

### Regex Primer

- `\d` = any digit (0-9)
- `{1,3}` = 1 to 3 occurrences
- `\.` = literal dot (escaped)
- `()` = capture group (saves matched part)
- `.*` = any characters (wildcard)