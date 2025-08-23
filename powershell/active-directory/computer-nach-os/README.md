# Computer nach Betriebssystem filtern

**Schwierigkeit**: 8 kyu (Sehr einfach)  
**Fokus**: Objektfilterung, String-Vergleiche  

## Beschreibung

Du musst alle Computer mit einem bestimmten Betriebssystem im Netzwerk identifizieren. Erstelle eine Funktion, die Computer-Objekte nach dem Betriebssystem filtert.

## Aufgabe

Schreibe eine PowerShell-Funktion `Get-ComputersByOS` die:

1. ✅ Ein Array von Computer-Objekten (Hashtables) entgegennimmt
2. ✅ Einen Betriebssystem-Namen als Parameter erhält
3. ✅ Alle Computer mit dem angegebenen Betriebssystem filtert
4. ✅ Ein Array von Computer-Namen zurückgibt (nur die Namen, nicht die kompletten Objekte)
5. ✅ Das Ergebnis alphabetisch sortiert

## Eingabeformat

Jedes Computer-Objekt enthält:
- `ComputerName` (string): Der Computer-Name
- `OS` (string): Das Betriebssystem
- `Domain` (string): Die Domain

## Beispiel

```powershell
$computers = @(
    @{ ComputerName = "PC-001"; OS = "Windows 11"; Domain = "company.local" }
    @{ ComputerName = "PC-002"; OS = "Windows 10"; Domain = "company.local" }
    @{ ComputerName = "SRV-001"; OS = "Windows Server 2022"; Domain = "company.local" }
)

Get-ComputersByOS -Computers $computers -OperatingSystem "Windows 11"
# Ergebnis: @("PC-001")
```

## Hinweise

- Verwende exakte String-Vergleiche (`-eq`)
- Das Betriebssystem muss genau übereinstimmen (case-sensitive)
- Nutze die PowerShell-Pipeline für effiziente Verarbeitung
- Vergiss nicht die alphabetische Sortierung