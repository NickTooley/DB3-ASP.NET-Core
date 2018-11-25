using Assignment2.ModelGenTest;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Enroll
    {
        public List<SelectListItem> Instruments { set; get; }

        public List<SelectListItem> levels { get; set; }

        [Required]
        [Display(Name= "Guardian's First Name")]
        [StringLength(40,ErrorMessage="Guardian's First Name must be less than 40 characters")]
        public string GuardianFirstname { get; set; }

        [Required]
        [Display(Name = "Guardian's Last Name")]
        [StringLength(40, ErrorMessage = "Guardian's Last Name must be less than 40 characters")]
        public string GuardianLastname { get; set; }

        [Required]
        [Display(Name = "Guardian's Phone Number")]
        [StringLength(20, ErrorMessage = "Guardian's Phone must be less than 20 characters")]
        public string GuardianPhone { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Guardian Email Address")]
        public string GuardianEmail { get; set; }

        [Required]
        [Display(Name = "Instrument")]
        public int instrumentID { get; set; }

        [Required]
        [Display(Name ="Hire this instrument ?")]
        public bool instrumentHire { get; set; }

        [Required]
        [Display(Name="Lesson Level")]
        public int LessonLevel { get; set; }
    }
}
