public class CMSCustomRouteTransformer : DynamicRouteValueTransformer
{
    public const string DEFAULTPAGEEXTENSION = ".html";
    public const string CMS = "CMS";
    public const string SITENAME = "siteName";
    public const string PAGENAME = "pageName";
    public override async ValueTask<RouteValueDictionary> TransformAsync(HttpContext httpContext, RouteValueDictionary values)
    {
        if (!values.ContainsKey("sitepage")) return values;
        var virtualPath = values["sitepage"].ToString();
        if (string.IsNullOrEmpty(virtualPath)) return values;
        string[] segments = virtualPath.ToLower().Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
        if (segments.Length >= 0)
        {
            if (segments.Last().IndexOf(DEFAULTPAGEEXTENSION) > 0)
            {
                values["controller"] = "Page";
                values["action"] = "Render";
                values[SITENAME] = string.Join("/", segments.Take(segments.Length - 1).ToArray());
                values[PAGENAME] = segments.Last().Substring(0, segmen
                ts.Last().IndexOf("."));
            }
            else if (segments.Last().IndexOf(".") < 0)
            {
                values["controller"] = "Page";
                values["action"] = "Render";
                values[SITENAME] = string.Join("/", segments.ToArray());
                values[PAGENAME] = "index.html";
            }
        }
        return values;
    }
}
