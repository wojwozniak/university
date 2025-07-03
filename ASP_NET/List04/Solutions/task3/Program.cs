using list04task03;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.Xml;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddScoped(typeof(IDapperRepository<>), typeof(DapperRepository<>));

var app = builder.Build();

app.MapGet("/", (IDapperRepository<Person> repository) =>
{
    var data = repository.GetAll();
    return Results.Ok(data);
});

app.Run();