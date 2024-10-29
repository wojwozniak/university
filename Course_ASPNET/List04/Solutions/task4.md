## Dla .NET Framework

```cs
// appSettings i connectionStrings w web.config
<configuration>
  <appSettings>
    <add key="SettingKey" value="SettingValue" />
  </appSettings>
  
  <connectionStrings>
    <add name="DefaultConnection" connectionString="Data Source=server;Initial Catalog=db;User ID=user;Password=pass;" />
  </connectionStrings>
</configuration>

// odczytanie z ConfigurationManager
using System.Configuration;

string appSetting = ConfigurationManager.AppSettings["SettingKey"];
string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

// wyniesienie do osobnych plików
<configuration>
  <appSettings configSource="AppSettings.config" />
  <connectionStrings configSource="ConnectionStrings.config" />
</configuration>

// i robimy pliki i tam dajemy

// AppSettings.config
<appSettings>
  <add key="SettingKey" value="SettingValue" />
</appSettings>

// ConnectionStrings.config
<connectionStrings>
  <add name="DefaultConnection" connectionString="Data Source=server;Initial Catalog=db;User ID=user;Password=pass;" />
</connectionStrings>


```

## Dla .NET Core

```cs
// dodatkowe pliki
builder.Configuration
    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
    .AddJsonFile("extraSettings.json", optional: true, reloadOnChange: true)
    .AddXmlFile("extraSettings.xml", optional: true, reloadOnChange: true);

// wartosci z plikow konfiguracyjnych za pomoca IConfiguration 
var configValue = builder.Configuration["SettingKey"];

// getSection
var section = builder.Configuration.GetSection("NestedSetting");
string subSetting = section["SubSetting"];

// IOptions
public class AppSettings
{
    public string SettingKey { get; set; }
    public NestedSettingConfig NestedSetting { get; set; }
}

public class NestedSettingConfig
{
    public string SubSetting { get; set; }
}

// w program.cs
builder.Services.Configure<AppSettings>(builder.Configuration);

// i tu mozna odczytac
app.MapGet("/", (IOptions<AppSettings> options) =>
{
    var settingKey = options.Value.SettingKey;
    var subSetting = options.Value.NestedSetting.SubSetting;
    
    return Results.Json(new { SettingKey = settingKey, SubSetting = subSetting });
});

```