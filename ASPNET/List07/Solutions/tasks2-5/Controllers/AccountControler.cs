using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;
using System.Linq;
using list07task02.Models;
using Microsoft.AspNetCore.Identity;

namespace list07task02.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string email, string password)
        {
            var user = _context.UserTable.FirstOrDefault(u => u.Email == email);
            if (user != null)
            {
                var passwordRecord = _context.PasswordTable.FirstOrDefault(p => p.UserID == user.UserId);
                if (passwordRecord != null)
                {
                    var hashedPassword = HashPassword(password, passwordRecord.Salt);
                    if (hashedPassword == passwordRecord.PasswordHash)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }

            return View();
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var existingUser = await _context.UserTable
                    .FirstOrDefaultAsync(u => u.Email == model.Email);
                if (existingUser != null)
                {
                    ModelState.AddModelError(string.Empty, "User with this email already exists.");
                    return View(model);
                }

                var user = new User
                {
                    UserName = model.UserName,
                    Email = model.Email
                };
                _context.UserTable.Add(user);
                Console.WriteLine(user.ToString());
                await _context.SaveChangesAsync();

                var salt = GenerateSalt();
                var hashedPassword = HashPassword(model.Password, salt);
                var password = new Password
                {
                    UserID = user.UserId,
                    PasswordHash = hashedPassword,
                    Salt = salt,
                    HashRounds = 10000,
                    PasswordSetDate = DateTime.Now
                };

                _context.PasswordTable.Add(password);
                Console.WriteLine(password.ToString());
                await _context.SaveChangesAsync();

                return RedirectToAction("Login");
            }
            return View(model);
        }

        private string GenerateSalt()
        {
            var rng = new System.Security.Cryptography.RNGCryptoServiceProvider();
            var buffer = new byte[16];
            rng.GetBytes(buffer);
            return Convert.ToBase64String(buffer);
        }

        private string HashPassword(string password, string salt)
        {
            var pbkdf2 = new Rfc2898DeriveBytes(password, Convert.FromBase64String(salt), 10000);
            return Convert.ToBase64String(pbkdf2.GetBytes(256));
        }
    }

}
