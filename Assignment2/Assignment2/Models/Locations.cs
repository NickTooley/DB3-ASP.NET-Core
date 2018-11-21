using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Locations
    {
        public int locationID { get; set; }
        
        [Display(Name ="Address")]
        [Required]
        public string address { get; set; }

        [Display(Name ="Location Name")]
        [Required]
        public string name { get; set; }

    }
}
