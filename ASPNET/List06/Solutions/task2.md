### Jak to zrobić

```cs
public class Program
{
    public static void Main(string[] args)
    {
        CreateHostBuilder(args).Build().Run();
    }

    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.ConfigureServices((context, services) =>
                {
                    // #HERE
                    services.AddSingleton(new SqlConnection("YourConnectionString"));
                    // #HERE
                    services.AddControllersWithViews();
                });
                webBuilder.UseStartup<Startup>();
            });
}
```

### Użycie

```cs
public class HomeController : Controller
{
    private readonly SqlConnection _sqlConnection;

    // Konstruktor który przyjmuje SqlConnection
    public HomeController(SqlConnection sqlConnection)
    {
        _sqlConnection = sqlConnection;
    }

    public IActionResult Index()
    {
        // I tu mamy dostęp do _sqlConnection
        return View();
    }
}

```

### Framework?

Nie da się, chyba że zewnętrzną biblioteką