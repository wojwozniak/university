using list05task05.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace list05task05.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Student> Students { get; set; }
    }

}
