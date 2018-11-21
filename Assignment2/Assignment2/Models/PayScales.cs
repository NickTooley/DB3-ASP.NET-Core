using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class PayScales
    {
        [Required]
        public int seniorityID { get; set; }

        [Required]
        public int instrumentID { get; set; }

        [Display(Name ="Pay Amount")]
        [Required]
        public double pay { get; set; }
    }
}
