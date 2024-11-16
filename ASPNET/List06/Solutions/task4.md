## Statyczne wskazanie Layoutu

```cs
@{
    Layout = "~/Views/Shared/_Layout.cshtml";
}
```

## Dynamiczne wskazanie Layoutu

```cs
// Kontroler
public IActionResult Index()
{
    bool useAlternateLayout = true;
    ViewData["Layout"] = useAlternateLayout ? "~/Views/Shared/_AlternateLayout.cshtml" : "~/Views/Shared/_Layout.cshtml";
    return View();
}

// Widok
@{
    Layout = ViewData["Layout"] as string;
}
```

## Widok częściowy

```cs
// Plik z partial widokiem
@model string
<div>
    <p>Message: @Model</p>
</div>

// Miejsce użycia
@Html.Partial("~/Views/Shared/_Partial.cshtml", "parameter")
```

## Sekcje z renderowaniem warunkowym

```cs
// Definicja w layoucie
<!DOCTYPE html>
<html>
<head>
    <title>@ViewData["Title"]</title>
</head>
<body>
    <div>
        @RenderBody()
    </div>

    @if (IsSectionDefined("Footer"))
    {
        <footer>
            @RenderSection("Footer", required: false)
        </footer>
    }
</body>
</html>

// Użycie w widoku
@{
    ViewData["Title"] = "Home Page";
}

<h1>Home Page</h1>

@section Footer {
    <p>Content</p>
}
```