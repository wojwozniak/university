using list05task03.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Xml.Linq;

namespace list05task03.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly string _uploadPath;

        public HomeController()
        {
            _uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");
            if (!Directory.Exists(_uploadPath))
            {
                Directory.CreateDirectory(_uploadPath);
            }
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(FileUploadModel model)
        {
            if (model.File != null && model.File.Length > 0)
            {
                string filePath = Path.Combine(_uploadPath, model.File.FileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    model.File.CopyTo(stream);
                }

                byte[] fileBytes;
                using (var memoryStream = new MemoryStream())
                {
                    model.File.CopyTo(memoryStream);
                    fileBytes = memoryStream.ToArray();
                }

                long fileSize = model.File.Length;
                int signature = fileBytes.Sum(b => b) % 0xFFFF;

                var xmlDescription = new XElement("opis",
                    new XElement("nazwa", model.File.FileName),
                    new XElement("rozmiar", fileSize),
                    new XElement("sygnatura", signature)
                );

                string xmlString = xmlDescription.ToString();

                return Content(xmlString, "application/xml");
                //return File(System.Text.Encoding.UTF8.GetBytes(xmlString), "application/xml", model.File.FileName + ".xml");
            }

            return Content("No file uploaded.");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
