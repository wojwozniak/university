using System.ComponentModel.DataAnnotations;

namespace list05task03.Models
{
    public class FileUploadModel
    {
        [Required]
        public IFormFile File { get; set; }
    }
}