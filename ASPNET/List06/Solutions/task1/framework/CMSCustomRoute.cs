public class CMSCustomRoute : Route
{
    public const string DEFAULTPAGEEXTENSION = ".html";
    public const string CMS = "CMS";
    public const string SITENAME = "siteName";
    public const string PAGENAME = "pageName";
    public CMSCustomRoute(
    RouteValueDictionary defaults,
    IRouteHandler routeHandler)
    : base(string.Empty, defaults, routeHandler)
    {
        this.Defaults = defaults;
        this.RouteHandler = routeHandler;
    }
    /// <summary>
    /// Metoda która dostaje Url i ma zwrócić segmenty routy
    /// </summary>
    public override RouteData GetRouteData(HttpContextBase httpContext)
    {
        RouteData routeData = new RouteData(this, this.RouteHandler);
        string virtualPath = httpContext.Request.AppRelativeCurrentExecutionFilePath.Substring(2) + (httpContext.Request.PathInfo ?? string.Empty);
        string[] segments = virtualPath.ToLower().Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
        if (segments.Length >= 1 && string.Equals(segments.First(), CMS, StringComparison.InvariantCultureIgnoreCase))
        {
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
            // add remaining default values
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
    /// <summary>
    /// Metoda która dostaje segmenty routy a ma zwrócić URL
    /// </summary>
    /// <remarks>
    /// Wykorzystuje ją np. UrlHelper
    /// </remarks>
    public override VirtualPathData GetVirtualPath(
    RequestContext requestContext,
    RouteValueDictionary values)
    {
        List<string> baseSegments = new List<string>();
        List<string> queryString = new List<string>();
        if (values[SITENAME] is string)
            baseSegments.Add((string)values[SITENAME]);
        if (values[PAGENAME] is string)
        {
            string pageName = (string)values[PAGENAME];
            if (!string.IsNullOrEmpty(pageName) &&
            !pageName.EndsWith(DEFAULTPAGEEXTENSION))
                pageName += DEFAULTPAGEEXTENSION;
            baseSegments.Add(pageName);
        }
        string uri = string.Join("/", baseSegments.Where(s => !string.IsNullOrEmpty(s)));
        return new VirtualPathData(this, uri);
    }
}