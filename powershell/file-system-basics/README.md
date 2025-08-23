# Log-Dateien aufräumen

**Schwierigkeit**: 8 kyu (Sehr einfach)  
**Fokus**: Dateisystem-Operationen, Verzeichnisse erstellen  
**Typ**: Praktische Übung

[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)
![Difficulty](https://img.shields.io/badge/Difficulty-8%20kyu-brightgreen)

## Szenario

In `C:\Logs\` liegen verschiedene Log-Dateien durcheinander. Du sollst Ordnung schaffen und die Dateien nach Typ sortieren.

**Aktuelle Situation:**
```
C:\Logs\
├── app.log
├── error.log
├── debug.log
├── system.log
```

## Aufgabe

Verwende PowerShell-Befehle um:

1. **Verzeichnisse erstellen**: Erstelle die Ordner `Application` und `System`
2. **Dateien sortieren**: 
   - Alle Dateien mit "app" oder "error" → `Application` Ordner
   - Alle Dateien mit "debug" oder "system" → `System` Ordner
3. **Überprüfen**: Liste den Inhalt beider neuen Ordner auf

## Erwartetes Ergebnis
```
C:\Logs\
├── Application\
│   ├── app.log
│   └── error.log
├── System\
│   ├── debug.log
│   └── system.log
```

## Lernziele
- `New-Item` zum Erstellen von Ordnern
- `Move-Item` zum Verschieben von Dateien  
- `Get-ChildItem` zum Auflisten von Inhalten

## Hinweise
- `New-Item -ItemType Directory` erstellt Ordner
- `Move-Item -Path "datei.log" -Destination "Ordner\"` verschiebt Dateien
- `Get-ChildItem -Path "Ordner\"` zeigt Ordnerinhalt