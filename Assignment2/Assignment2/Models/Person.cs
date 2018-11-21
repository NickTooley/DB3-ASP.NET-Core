using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Person
    {
        public int personID { get; set; }

        [Display(Name = "Email Address")]
        [Required]
        public string email { get; set; }

        [Display(Name = "First Name")]
        [Required]
        public string firstName { get; set; }

        [Display(Name = "Last Name")]
        [Required]
        public string lastName { get; set; }

        public string password { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Date of Birth")]
        [Required]
        public DateTime DOB { get; set; }
    }
}
