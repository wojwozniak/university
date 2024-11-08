using list05task01.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace list05task01.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Start()
        {
            var model = new TaskSubmissionModel();
            return View(model);
        }

        [HttpPost]
        public IActionResult Start(TaskSubmissionModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            for (int i = 0; i < model.TaskScores.Count; i++)
            {
                if (!model.TaskScores[i].HasValue)
                {
                    model.TaskScores[i] = 0;
                }
            }

            var queryString = $"name={model.Name}&date={model.Date}&subject={model.Subject}&set={model.SetNumber}&tasks={string.Join(",", model.TaskScores)}";
            return Redirect("Print?" + queryString);
        }

        [HttpGet]
        public IActionResult Print(string name, string date, string subject, string set, string tasks)
        {
            var model = new TaskSubmissionModel
            {
                Name = name,
                Date = date,
                Subject = subject,
                SetNumber = set,
                TaskScores = tasks.Split(',').Select(score => int.TryParse(score, out int s) ? (int?)s : null).ToList()
            };

            return View(model);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
