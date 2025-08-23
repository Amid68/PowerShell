# Abgelaufene Passwörter finden

**Schwierigkeit**: 7 kyu (Einfach)  
**Fokus**: DateTime-Berechnungen, Sicherheitsaudit  

## Beschreibung

Für die Sicherheit musst du Benutzer finden, deren Passwörter in den nächsten 7 Tagen ablaufen oder bereits abgelaufen sind. Erstelle eine Funktion zur Passwort-Überwachung.

## Aufgabe

Schreibe eine PowerShell-Funktion `Get-ExpiringSoonPasswords` die:

1. ✅ Ein Array von Benutzer-Objekten (Hashtables) entgegennimmt
2. ✅ Benutzer filtert, deren Passwörter in den nächsten 7 Tagen ablaufen (oder bereits abgelaufen sind)
3. ✅ Ein Array von Benutzernamen zurückgibt (nur die Namen, nicht die kompletten Objekte)
4. ✅ Das Ergebnis alphabetisch sortiert

## Eingabeformat

Jedes Benutzer-Objekt enthält:
- `Username` (string): Der Benutzername
- `PasswordExpiry` (DateTime): Wann das Passwort abläuft

## Beispiel

```powershell
$users = @(
    @{ Username = "user1"; PasswordExpiry = (Get-Date).AddDays(3) }
    @{ Username = "user2"; PasswordExpiry = (Get-Date).AddDays(15) }
    @{ Username = "user3"; PasswordExpiry = (Get-Date).AddDays(-2) }
)

Get-ExpiringSoonPasswords -Users $users
# Ergebnis: @("user1", "user3")
```

## Hinweise

- Verwende `(Get-Date).AddDays(7)` um das Stichtag zu berechnen
- Passwörter die heute oder in der Vergangenheit ablaufen sind auch "bald abgelaufen"
- Verwende DateTime-Vergleiche (`-le` für "kleiner oder gleich")
- Bereits abgelaufene Passwörter (negative Tage) sollen auch erfasst werden