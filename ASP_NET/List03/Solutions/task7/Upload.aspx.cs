using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace list03task07
{
  public partial class Upload : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
      if (FileUpload1.HasFile)
      {
        byte[] fileBytes = null;
        using (var memoryStream = new MemoryStream())
        {
          FileUpload1.SaveAs(Path.Combine(Server.MapPath("~/Uploads"), FileUpload1.FileName));
          using (var fileStream = FileUpload1.FileContent)
          {
            fileStream.CopyTo(memoryStream);
          }
          fileBytes = memoryStream.ToArray();
        }

        long fileSize = FileUpload1.PostedFile.ContentLength;
        int signature = fileBytes.Sum(b => b) % 0xFFFF;

        var xmlDescription = new XElement
        (
            "opis",
            new XElement("nazwa", FileUpload1.FileName),
            new XElement("rozmiar", fileSize),
            new XElement("sygnatura", signature)
        );

        string xmlString = xmlDescription.ToString();

        Response.Clear();
        Response.ContentType = "application/xml";

        string fileName = FileUpload1.FileName;
        string encodedFileName = Uri.EscapeDataString(fileName); // RFC5987
        string header = $"attachment; filename=\"{fileName}\"; filename*=UTF-8''{encodedFileName}"; // jeśli nie obsługuje, mamy fallback

        Response.AddHeader("Content-Disposition", header); // content-disposition attachment/inline zdecyduje jak ma być potraktowane
        Response.Write(xmlString);
        Response.End();
      }
      else
      {
        Response.Write("No file uploaded.");
      }
    }
  }
}