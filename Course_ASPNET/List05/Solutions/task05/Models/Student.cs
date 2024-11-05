using System.ComponentModel.DataAnnotations;

namespace list05task05.Models
{
    public class Student
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Index is required.")]
        [StringLength(6, ErrorMessage = "Index cannot be longer than 6 characters.")]
        public string Index { get; set; }

        [Required(ErrorMessage = "Name is required.")]
        [StringLength(100, ErrorMessage = "Name cannot be longer than 100 characters.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Surname is required.")]
        [StringLength(100, ErrorMessage = "Surname cannot be longer than 100 characters.")]
        public string Surname { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid email address format.")]
        [StringLength(255, ErrorMessage = "Email cannot be longer than 255 characters.")]
        public string Email { get; set; }
    }

}