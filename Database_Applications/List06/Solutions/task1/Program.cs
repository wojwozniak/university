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
