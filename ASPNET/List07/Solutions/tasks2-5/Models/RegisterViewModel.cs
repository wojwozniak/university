using System.ComponentModel.DataAnnotations;

namespace list07task02.Models
{
    public class RegisterViewModel
    {
        [Required]
        [StringLength(100, ErrorMessage = "User name can't be longer than 100 characters.")]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

}
