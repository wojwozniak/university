- Start server: D:\mongo\bin> `.\mongod.exe --config D:\mongo\bin\mongod.cfg`
- Then `mongosh` works
- Query availible databases with `show dbs`
- Client in VS project `databaseslist06`
- I created my own (very simple) client in newer .NET version (8.0 .NET Core)
  
```cs
using databaseslist06.Classes;
using MongoDB.Driver;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSingleton<IMongoClient, MongoClient>(sp =>
    new MongoClient("mongodb://localhost:27017"));

var app = builder.Build();

app.MapGet("/", () => "Hello World!");


app.MapGet("/authors", async (IMongoClient client) =>
{
    var library = client.GetDatabase("library");
    var authors = library.GetCollection<Author>("authors");
    var items = await authors.Find(_ => true).ToListAsync();

    return items.Select(a => a.Name);
});

app.Run();

```