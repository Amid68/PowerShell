# Log-Dateien aufräumen - Lösung

# 1. Verzeichnisse erstellen
New-Item -Path "C:\Logs\Application" -ItemType Directory -Force
New-Item -Path "C:\Logs\System" -ItemType Directory -Force

# 2. Application-Dateien verschieben
Move-Item -Path "C:\Logs\app.log" -Destination "C:\Logs\Application\"
Move-Item -Path "C:\Logs\error.log" -Destination "C:\Logs\Application\"

# 3. System-Dateien verschieben  
Move-Item -Path "C:\Logs\debug.log" -Destination "C:\Logs\System\"
Move-Item -Path "C:\Logs\system.log" -Destination "C:\Logs\System\"

# 4. Überprüfung
Get-ChildItem -Path "C:\Logs\Application"
Get-ChildItem -Path "C:\Logs\System"