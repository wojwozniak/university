## Zad. 1 Lista 4

Multitenant aplication - jedna aplikacja obsługuje wielu klientów (tenantów).
Zapobiegamy powielaniu kodu, upraszczamy np. aktualizacje (jedna zamiast n dla 
n klientów), znacząco zwiększając skalowalność.


Kod z wykładu obsługujący routing:

``` cs
public class CustomRoute : Route
{
    public const string DEFAULTPAGEEXTENSION = ".html";
    public const string TENANT   = "tenant";
    public const string SITENAME = "siteName";
    public const string PAGENAME = "pageName";

    public CustomRoute(RouteValueDictionary defaults, IRouteHandler routeHandler)
        : base(string.Empty, defaults, routeHandler)
    {
        this.Defaults = defaults;
        this.RouteHandler = routeHandler;
    }

    public override RouteData GetRouteData(HttpContextBase httpContext)
    {
        RouteData routeData = new RouteData(this, this.RouteHandler);
        string virtualPath = httpContext.Request.AppRelativeCurrentExecutionFilePath
                             .Substring(2) + (httpContext.Request.PathInfo ?? string.Empty);

        string[] segments = virtualPath.ToLower().Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);

        if (segments.Length >= 1)
        {
            routeData.Values[TENANT] = segments.First();
            if (segments.Last().IndexOf(DEFAULTPAGEEXTENSION) > 0)
            {
                routeData.Values[SITENAME] = string.Join("/", segments.Skip(1).Take(segments.Length - 2).ToArray());
                routeData.Values[PAGENAME] = segments.Last().Substring(0, segments.Last().IndexOf("."));
            }
            else if (segments.Last().IndexOf(".") < 0)
            {
                routeData.Values[SITENAME] = string.Join("/", segments.Skip(1).ToArray());
                routeData.Values[PAGENAME] = "index.html";
            }
            else
            {
                return null;
            }

            foreach (KeyValuePair<string, object> def in this.Defaults)
            {
                if (!routeData.Values.ContainsKey(def.Key))
                {
                    routeData.Values.Add(def.Key, def.Value);
                }
            }

            return routeData;
        }
        else
            return null;
    }
}

```