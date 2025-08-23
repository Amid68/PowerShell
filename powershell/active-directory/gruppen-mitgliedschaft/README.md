# Gruppen-Mitgliedschaft überprüfen

**Schwierigkeit**: 8 kyu (Sehr einfach)  
**Fokus**: PowerShell Arrays, Contains-Operator  

## Beschreibung

Du musst überprüfen, welche Benutzer Mitglied einer bestimmten AD-Gruppe sind. Erstelle eine Funktion, die Benutzer findet, die zu einer angegebenen Gruppe gehören.

## Aufgabe

Schreibe eine PowerShell-Funktion `Get-GroupMembers` die:

1. ✅ Ein Array von Benutzer-Objekten (Hashtables) entgegennimmt
2. ✅ Einen Gruppennamen als Parameter erhält
3. ✅ Alle Benutzer filtert, die Mitglied der angegebenen Gruppe sind
4. ✅ Ein Array von Benutzernamen zurückgibt (nur die Namen, nicht die kompletten Objekte)
5. ✅ Das Ergebnis alphabetisch sortiert

## Eingabeformat

Jedes Benutzer-Objekt enthält:
- `Username` (string): Der Benutzername
- `Groups` (array): Array von Gruppennamen, denen der Benutzer angehört

## Beispiel

```powershell
$users = @(
    @{ Username = "max.mustermann"; Groups = @("Admins", "IT-Team") }
    @{ Username = "lisa.mueller"; Groups = @("Buchhaltung", "Benutzer") }
    @{ Username = "tom.schneider"; Groups = @("Admins", "Benutzer") }
)

Get-GroupMembers -Users $users -GroupName "Admins"
# Ergebnis: @("max.mustermann", "tom.schneider")
```

## Hinweise

- Verwende den `-contains` Operator für Array-Mitgliedschaft
- Die `Groups`-Eigenschaft ist ein Array von Strings
- Benutze die PowerShell-Pipeline für effiziente Verarbeitung
- Vergiss nicht die alphabetische Sortierung