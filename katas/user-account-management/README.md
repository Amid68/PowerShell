# User Account Management Kata 🔐

**Difficulty**: 7 kyu (Basic)  
**Source**: Codewars (Self-created)  
**Completed**: August 2025  
**Focus**: PowerShell Fundamentals, Pipeline Operations, Object Filtering

[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)
![Difficulty](https://img.shields.io/badge/Difficulty-7%20kyu-green)

## Problem Description

As a system administrator, you need to identify inactive user accounts for security audits. Create a function that processes user account data and returns users who haven't logged in for more than 30 days.

### Requirements

Write a PowerShell function `Get-InactiveUsers` that:

1. ✅ Takes an array of user account objects (hashtables)
2. ✅ Filters users who haven't logged in for more than 30 days from today
3. ✅ Returns only **enabled** accounts (`Enabled = $true`)
4. ✅ Returns an array of usernames (just the usernames, not full objects)
5. ✅ Returns usernames sorted alphabetically

### Input Format

Each user object contains:
- `Username` (string): The user's login name
- `LastLogin` (DateTime): When the user last logged in
- `Department` (string): User's department  
- `Enabled` (boolean): Whether the account is enabled

### Example

```powershell
$users = @(
    @{ Username = "john.doe"; LastLogin = (Get-Date).AddDays(-45); Department = "IT"; Enabled = $true }
    @{ Username = "jane.smith"; LastLogin = (Get-Date).AddDays(-15); Department = "HR"; Enabled = $true }
    @{ Username = "old.account"; LastLogin = (Get-Date).AddDays(-60); Department = "Finance"; Enabled = $false }
)

Get-InactiveUsers -Users $users
# Expected: @("john.doe")
