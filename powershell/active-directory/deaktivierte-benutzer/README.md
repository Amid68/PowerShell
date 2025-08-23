# Deaktivierte Benutzerkonten mit letztem Login

**Schwierigkeit**: 7 kyu (Einfach)  
**Fokus**: Kombinierte Bedingungen, Sicherheitsaudit  

## Beschreibung

Für eine Sicherheitsaudit musst du alle deaktivierten Benutzerkonten finden, die in den letzten 90 Tagen noch aktiv waren. Diese könnten verdächtige Aktivitäten anzeigen.

## Aufgabe

Schreibe eine PowerShell-Funktion `Get-RecentlyDisabledUsers` die:

1. ✅ Ein Array von Benutzer-Objekten (Hashtables) entgegennimmt
2. ✅ Benutzer filtert, die deaktiviert sind UND in den letzten 90 Tagen einen Login hatten
3. ✅ Ein Array von Benutzernamen zurückgibt (nur die Namen, nicht die kompletten Objekte)
4. ✅ Das Ergebnis alphabetisch sortiert

## Eingabeformat

Jedes Benutzer-Objekt enthält:
- `Username` (string): Der Benutzername
- `Enabled` (boolean): Ob das Konto aktiviert ist
- `LastLogin` (DateTime): Wann sich der Benutzer zuletzt angemeldet hat

## Beispiel

```powershell
$users = @(
    @{ Username = "ex.employee"; Enabled = $false; LastLogin = (Get-Date).AddDays(-30) }
    @{ Username = "current.user"; Enabled = $true; LastLogin = (Get-Date).AddDays(-5) }
    @{ Username = "old.account"; Enabled = $false; LastLogin = (Get-Date).AddDays(-120) }
)

Get-RecentlyDisabledUsers -Users $users
# Ergebnis: @("ex.employee")
```

## Hinweise

- Verwende kombinierte Bedingungen mit `-and`
- Berechne das Stichtag mit `(Get-Date).AddDays(-90)`
- Ein Benutzer muss BEIDE Bedingungen erfüllen: deaktiviert UND kürzlicher Login
- Verwende DateTime-Vergleiche (`-ge` für "größer oder gleich")
- Dies ist ein typisches Sicherheitsaudit-Szenario