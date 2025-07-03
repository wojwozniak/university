using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace list05task02.Models
{
    public class TaskSubmissionModel
    {
        [Required]
        public string Name { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public string Date { get; set; }

        [Required]
        public string Subject { get; set; }

        [Required]
        public string SetNumber { get; set; }

        public List<int?> TaskScores { get; set; } = new List<int?>();
    }
}