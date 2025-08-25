# JSON Configuration Parser

**Difficulty**: 6 kyu (Intermediate)  
**Focus**: JSON Processing, Nested Objects, Configuration Management  

[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)
![Difficulty](https://img.shields.io/badge/Difficulty-6%20kyu-orange)

## Problem Description

Modern applications store configuration in JSON files. You need to parse JSON configuration strings and extract specific environment settings for deployment validation.

### Requirements

Write a PowerShell function `Get-InvalidConfigurations` that:

1. ✅ Takes an array of JSON configuration strings
2. ✅ Parses each JSON into PowerShell objects
3. ✅ Finds configurations where `database.timeout` is greater than 30 seconds
4. ✅ OR where `api.retries` is less than 3
5. ✅ Returns an array of application names that have invalid configs
6. ✅ Returns names sorted alphabetically

### Input Format

Each JSON string represents an application configuration:
```json
{
    "appName": "WebApp1",
    "database": {
        "connectionString": "Server=localhost",
        "timeout": 45
    },
    "api": {
        "endpoint": "https://api.example.com",
        "retries": 2
    }
}
```

### Example

```powershell
$configs = @(
    '{"appName": "WebApp1", "database": {"timeout": 25}, "api": {"retries": 5}}',
    '{"appName": "WebApp2", "database": {"timeout": 45}, "api": {"retries": 3}}',
    '{"appName": "WebApp3", "database": {"timeout": 15}, "api": {"retries": 1}}'
)

Get-InvalidConfigurations -JsonConfigs $configs
# Expected: @("WebApp2", "WebApp3")
```

### Learning Goals

- **JSON Processing**: `ConvertFrom-Json` cmdlet
- **Nested Property Access**: Using dot notation (`$obj.database.timeout`)
- **Complex Conditions**: Multiple OR conditions with nested properties
- **Modern PowerShell**: Working with `PSCustomObject` from JSON

### Hints

- Use `ConvertFrom-Json` to parse JSON strings
- Access nested properties with dot notation: `$config.database.timeout`
- Combine conditions with `-or` operator
- Remember to handle potential missing properties gracefully