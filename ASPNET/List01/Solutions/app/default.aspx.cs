using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace list01task05
{
  public partial class WebForm1 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      string filePath = @"D:\pages\example.txt";

      try
      {
        using (StreamReader sr = new StreamReader(filePath))
        {
          string fileContent = sr.ReadToEnd();
          Response.Write("<p>Zawartość pliku:</p>");
          Response.Write("<pre>" + fileContent + "</pre>");
        }
      }
      catch (FileNotFoundException ex)
      {
        Response.Write("<p>Nie znaleziono pliku: " + ex.Message + "</p>");
      }
      catch (UnauthorizedAccessException ex)
      {
        Response.Write("<p>Brak uprawnień: " + ex.Message + "</p>");
      }
      catch (Exception ex)
      {
        Response.Write("<p>Wystąpił błąd: " + ex.Message + "</p>");
      }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      string inputText = TextBox1.Text;
    }
  }
}