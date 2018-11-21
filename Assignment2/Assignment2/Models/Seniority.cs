using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Seniority
    {
        public int seniorityID { get; set; }

        [Display(Name ="Seniority Name")]
        [Required]
        public string seniorityName { get; set; }
    }
}
