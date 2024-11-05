using list05task05.Data;
using list05task05.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace list05task05.Controllers
{
    public class StudentsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public StudentsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            Console.WriteLine("Index called.");
            var students = await _context.Students.ToListAsync();
            Console.WriteLine($"Found {students.Count} students.");
            return View(students);
        }

        [HttpGet]
        public IActionResult Create()
        {
            Console.WriteLine("Create called.");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Student student)
        {
            student.Id = 0;
            Console.WriteLine("Create POST called.");
            if (ModelState.IsValid)
            {
                _context.Add(student);
                await _context.SaveChangesAsync();
                Console.WriteLine("Student added.");
                return RedirectToAction(nameof(Index));
            }
            else
            {
                foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
                {
                    Console.WriteLine(error.ErrorMessage);
                }
                Console.WriteLine("Bad model.");
            }
            Console.WriteLine("Create failed.");
            return View(student);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            Console.WriteLine($"Edit called for {id}.");
            var student = await _context.Students.FindAsync(id);
            if (student == null) return NotFound();
            Console.WriteLine($"Editing {student.Name}.");
            return View(student);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, Student student)
        {
            Console.WriteLine($"Edit POST called for {id}.");
            if (id != student.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(student);
                    await _context.SaveChangesAsync();
                    Console.WriteLine("Student updated.");
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!StudentExists(student.Id)) return NotFound();
                    throw;
                }
                return RedirectToAction(nameof(Index));
            }
            else
            {
                foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
                {
                    Console.WriteLine(error.ErrorMessage);
                }
                Console.WriteLine("Bad model.");
            }
            Console.WriteLine("Edit failed.");
            return View(student);
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            Console.WriteLine($"Delete called for {id}.");
            var student = await _context.Students.FindAsync(id);
            if (student == null) return NotFound();
            Console.WriteLine($"Preparing to delete {student.Name}.");
            return View(student);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            Console.WriteLine($"Delete confirmed for {id}.");
            var student = await _context.Students.FindAsync(id);
            if (student is not null)
            {
                _context.Students.Remove(student);
                await _context.SaveChangesAsync();
                Console.WriteLine("Student deleted.");
            }
            else
            {
                Console.WriteLine("Student not found.");
            }
            return RedirectToAction(nameof(Index));
        }

        private bool StudentExists(int id)
        {
            bool exists = _context.Students.Any(e => e.Id == id);
            Console.WriteLine($"Exists check for {id}: {exists}");
            return exists;
        }
    }
}
