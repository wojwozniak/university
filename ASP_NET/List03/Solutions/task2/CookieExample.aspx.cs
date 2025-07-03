using System;
using System.Web;

namespace list03task02
{
  public partial class CookiesExample : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Request.Cookies["test_cookie"] == null)
      {
        HttpCookie testCookie = new HttpCookie("test_cookie", "1");
        testCookie.Expires = DateTime.Now.AddMinutes(10);
        Response.Cookies.Add(testCookie);
      }
    }

    protected void btnAddCookie_Click(object sender, EventArgs e)
    {
      string cookieName = txtCookieName.Text;
      string cookieValue = txtCookieValue.Text;

      HttpCookie cookie = new HttpCookie(cookieName, cookieValue);
      cookie.Expires = DateTime.Now.AddMinutes(10);
      Response.Cookies.Add(cookie);
    }

    protected void btnReadCookies_Click(object sender, EventArgs e)
    {
      string cookieInfo = "Ciastka:<br />";
      foreach (string key in Request.Cookies.AllKeys)
      {
        cookieInfo += $"{key}: {Request.Cookies[key].Value}<br />";
      }

      lblCookies.Text = cookieInfo;
    }

    protected void btnDeleteCookie_Click(object sender, EventArgs e)
    {
      string cookieName = txtDeleteCookie.Text;
      if (Request.Cookies[cookieName] != null)
      {
        HttpCookie cookie = new HttpCookie(cookieName);
        cookie.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(cookie);
      }
    }
  }
}