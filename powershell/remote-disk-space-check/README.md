# Remote Disk Space Check

**Schwierigkeit**: 7 kyu (Einfach)  
**Fokus**: PowerShell Remoting, Invoke-Command, Systemüberwachung  
**Typ**: Funktion schreiben

[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)
![Difficulty](https://img.shields.io/badge/Difficulty-7%20kyu-green)

## Szenario

Als System-Administrator musst du regelmäßig den verfügbaren Speicherplatz auf mehreren Servern überwachen. Erstelle eine Funktion, die remote den Festplattenspeicher überprüft und kritische Situationen meldet.

## Aufgabe

Schreibe eine PowerShell-Funktion `Get-RemoteDiskSpace` die:

1. ✅ Eine Liste von Computer-Namen entgegennimmt
2. ✅ Mit `Invoke-Command` remote die Festplatten-Informationen abruft
3. ✅ Nur Laufwerke mit weniger als 20% freiem Speicherplatz zurückgibt
4. ✅ Das Ergebnis nach Computer-Namen sortiert

## Parameter

- `ComputerNames` (array): Liste der zu überprüfenden Computer
- `Credential` (PSCredential, optional): Anmeldedaten für Remote-Zugriff

## Eingabeformat

Die Funktion soll folgende Eigenschaften pro kritischem Laufwerk zurückgeben:
- `ComputerName` (string): Server-Name
- `Drive` (string): Laufwerksbuchstabe (z.B. "C:")
- `FreeSpaceGB` (int): Freier Speicherplatz in GB
- `TotalSpaceGB` (int): Gesamtspeicherplatz in GB
- `PercentFree` (int): Prozent freier Speicherplatz

## Beispiel

```powershell
$servers = @("SRV-001", "SRV-002", "SRV-003")
$result = Get-RemoteDiskSpace -ComputerNames $servers

# Beispiel-Output:
# ComputerName  Drive  FreeSpaceGB  TotalSpaceGB  PercentFree
# ------------  -----  -----------  ------------  -----------
# SRV-001       C:     15           100           15
# SRV-002       D:     8            50            16
```

## Lernziele

- **PowerShell Remoting** mit `Invoke-Command`
- **WMI-Abfragen** für Systemdaten (`Get-CimInstance Win32_LogicalDisk`)
- **Berechnungen** für Prozentwerte und GB-Konvertierung
- **Fehlerbehandlung** bei nicht erreichbaren Computern
- **Pipeline-Verarbeitung** für mehrere Remote-Computer

## Hinweise

- Verwende `Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"` für Festplatten
- Konvertiere Bytes zu GB mit `[math]::Round($bytes / 1GB, 0)`
- Berechne Prozent mit `[math]::Round(($free / $total) * 100, 0)`
- Nutze `Try-Catch` für Fehlerbehandlung bei nicht erreichbaren Computern
- Filtere nur Laufwerke mit `$percentFree -lt 20`

## Erweiterte Aufgabe

Erweitere die Funktion um:
- Parameter `-ThresholdPercent` zum Anpassen des kritischen Schwellwerts
- Ausgabe von Fehlermeldungen für nicht erreichbare Computer
- Farbige Konsolen-Ausgabe für kritische Laufwerke