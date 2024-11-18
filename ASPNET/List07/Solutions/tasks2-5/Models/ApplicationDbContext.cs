using Microsoft.EntityFrameworkCore;

namespace list07task02.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options):base(options)
        { 
        
        }

        public DbSet<User> UserTable { get; set; }
        public DbSet<Password> PasswordTable { get; set; }
    }
}