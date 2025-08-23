# Benutzer nach Organisationseinheit filtern

**Schwierigkeit**: 8 kyu (Sehr einfach)  
**Fokus**: PowerShell Grundlagen, Objektfilterung  

## Beschreibung

Als Administrator musst du alle Benutzer aus einer bestimmten Organisationseinheit (OU) finden. Erstelle eine Funktion, die Benutzer-Objekte filtert und nur die aus der gewünschten OU zurückgibt.

## Aufgabe

Schreibe eine PowerShell-Funktion `Get-UsersFromOU` die:

1. ✅ Ein Array von Benutzer-Objekten (Hashtables) entgegennimmt
2. ✅ Einen OU-Namen als Parameter erhält
3. ✅ Alle Benutzer aus der angegebenen OU filtert
4. ✅ Ein Array von Benutzernamen zurückgibt (nur die Namen, nicht die kompletten Objekte)
5. ✅ Das Ergebnis alphabetisch sortiert

## Eingabeformat

Jedes Benutzer-Objekt enthält:
- `Name` (string): Der Benutzername
- `OU` (string): Die Organisationseinheit
- `Enabled` (boolean): Ob das Konto aktiviert ist

## Beispiel

```powershell
$users = @(
    @{ Name = "Hans Mueller"; OU = "IT-Abteilung"; Enabled = $true }
    @{ Name = "Anna Schmidt"; OU = "Buchhaltung"; Enabled = $true }
    @{ Name = "Peter Weber"; OU = "IT-Abteilung"; Enabled = $false }
)

Get-UsersFromOU -Users $users -OUName "IT-Abteilung"
# Ergebnis: @("Hans Mueller", "Peter Weber")
```

## Hinweise

- Benutze die PowerShell-Pipeline für effiziente Filterung
- `Where-Object` ist dein Freund für Konditionierung
- Vergiss nicht die alphabetische Sortierung
- Behandle leere Arrays korrekt