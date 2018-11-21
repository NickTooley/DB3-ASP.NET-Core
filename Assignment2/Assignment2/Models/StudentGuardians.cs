using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class StudentGuardians
    {
        [Required]
        public int studentID { get; set; }

        [Required]
        [Display(Name ="First Name")]
        public string firstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string lastName { get; set; }

        [Required]
        [Display(Name = "Contact Number")]
        public string contactPhone { get; set; }

        [Required]
        [Display(Name = "Email Address")]
        public string email { get; set; }
    }
}
