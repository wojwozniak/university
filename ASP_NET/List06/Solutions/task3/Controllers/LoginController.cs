using list06task03.Models;
using Microsoft.AspNetCore.Mvc;

namespace list06task03.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            var model = new LoginModel();
            return View(model);
        }

        [HttpPost]
        public IActionResult Index(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                return RedirectToAction("Success");
            }
            return View(model);
        }

        public IActionResult Success()
        {
            return View();
        }
    }
}
