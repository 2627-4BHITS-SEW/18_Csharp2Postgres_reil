using Npgsql;

var password = Environment.GetEnvironmentVariable("DB_PASSWORD") ?? "postgres";
var connectionString =
    $"Host=localhost;Port=5432;Username=postgres;Password={password};Database=hellodatabase";

await using var dataSource = NpgsqlDataSource.Create(connectionString);
await using (var cmd = dataSource.CreateCommand(
    "SELECT id, vorname, nachname, alter_jahre FROM personen ORDER BY id"))
await using (var reader = await cmd.ExecuteReaderAsync())
{
    Console.WriteLine("Personen:");
    while (await reader.ReadAsync())
    {
        Console.WriteLine(
            $"{reader.GetInt32(0)}: {reader.GetString(1)} {reader.GetString(2)}, {reader.GetInt32(3)} Jahre");
    }
}

await using (var cmd = dataSource.CreateCommand(
    "SELECT h.name, h.tierart, p.vorname FROM haustiere h " +
    "JOIN personen p ON p.id = h.person_id ORDER BY h.id"))
await using (var reader = await cmd.ExecuteReaderAsync())
{
    Console.WriteLine();
    Console.WriteLine("Haustiere:");
    while (await reader.ReadAsync())
    {
        Console.WriteLine(
            $"{reader.GetString(0)} ({reader.GetString(1)}) gehoert {reader.GetString(2)}");
    }
}
