# HelloDatabase

C#/.NET-10-Konsolenanwendung, die sich mit Npgsql mit PostgreSQL im Docker-Container verbindet
und die Tabellen `personen` und `haustiere` ausliest.

## Starten

1. Docker Desktop starten, dann im Projektordner:

   ```powershell
   .\docker-run.ps1
   ```

   Das Skript enthaelt das `docker run`-Kommando. `init.sql` legt beim ersten Start die Datenbank
   `hellodatabase` samt Tabellen und Daten an. Die Daten liegen im Host-Ordner `pgdata`.

2. Anwendung starten:

   ```powershell
   dotnet run
   ```

Das Passwort kommt aus der Umgebungsvariable `DB_PASSWORD`. Ist sie nicht gesetzt, gilt `postgres`
(das Passwort aus `docker-run.ps1`).
