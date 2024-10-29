using list04task02;
using Microsoft.AspNetCore.Routing.Matching;
using System.Text.Json;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<EndpointSelector, CustomEndpointSelector>();
var app = builder.Build();

app.UseRouting();

app.MapGet("/", () => "Hello World!");

app.MapGet("/{param}", (string param) =>
{
    return $"Parametr: {param}";
});

app.MapGet("/{param:int}", (int param) =>
{
    return $"Parametr typu int: {param}";
});

app.MapGet("/{param:length(1,10)}", (string param) =>
{
    return $"Parametr z ograniczeniem d³ugoœci: {param}";
});

app.MapGet("/{param:required}", (string param) =>
{
    return $"Parametr wymagany: {param}";
});

app.MapGet("/{param:regex(^\\d{{4}}$)}", (string param) =>
{
    return $"Parametr spe³niaj¹cy wyra¿enie regularne: {param}";
});

// Przyk³ad konfliktu
app.MapGet("/conflict/{param}", (string param) =>
{
    return $"Conflict Path 1: {param}";
});

app.MapGet("/conflict/{param:int}", (int param) =>
{
    return $"Conflict Path 2 (int): {param}";
});



app.UseEndpoints((endpoints) => { });

app.Run();