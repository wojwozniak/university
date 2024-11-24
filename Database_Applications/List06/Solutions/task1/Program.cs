using databaseslist06.Classes;
using MongoDB.Driver;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSingleton<IMongoClient, MongoClient>(sp =>
    new MongoClient("mongodb://localhost:27017"));

var app = builder.Build();

app.MapGet("/", async (IMongoClient client) =>
{
    var library = client.GetDatabase("library");
    var booksCollection = library.GetCollection<Book>("books");
    var books = await booksCollection.Find(_ => true).ToListAsync();

    return books.Select(b => new
    {
        b.ISBN,
        b.Title,
        b.Author,
        b.YearOfPublication,
        b.Price,
        Copies = b.Copies.Select(c => new
        {
            c.CopyId,
            c.Signature,
            c.Status,
            c.BorrowedBy,
            c.BorrowDate,
            c.ReturnDate
        })
    });
});

app.Run();