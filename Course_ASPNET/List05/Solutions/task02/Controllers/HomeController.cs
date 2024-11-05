using list05task02.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace list05task02.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Start()
        {
            var model = new TaskSubmissionModel
            {
                TaskScores = new List<int?> { null, null, null, null, null, null, null, null, null, null }
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Start(TaskSubmissionModel model)
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
            return Redirect("Home/Print?" + queryString);
        }

        [HttpGet]
        public ActionResult Print(string name, string date, string subject, string set, string tasks)
        {
            var model = new TaskSubmissionModel
            {
                Name = name,
                Date = date,
                Subject = subject,
                SetNumber = set,
                TaskScores = tasks.Split(',')
                                  .Select(score => int.TryParse(score, out int s) ? (int?)s : null)
                                  .ToList()
            };

            return View(model);
        }
    }
}
