# PostgreSQL 18 im Docker-Container starten (Windows PowerShell, im Projektordner ausfuehren).
# Die Daten liegen im Host-Ordner .\pgdata, init.sql legt Datenbank, Tabellen und Daten an.
docker run -d --name postgres --restart unless-stopped `
  -e POSTGRES_PASSWORD=postgres `
  -p 127.0.0.1:5432:5432 `
  -v "${PWD}\pgdata:/var/lib/postgresql" `
  -v "${PWD}\init.sql:/docker-entrypoint-initdb.d/init.sql" `
  postgres:18
