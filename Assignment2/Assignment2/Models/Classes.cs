using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Classes
    {
        public int classID { get; set; }

        [Required]
        public int instrumentID { get; set; }

        [Required]
        public int tutorID { get; set; }

        [Required]
        public int lessonLevel { get; set; }

    }
}
