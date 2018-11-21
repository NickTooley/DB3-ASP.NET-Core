using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Instruments
    {
        public int instrumentID { get; set; }

        [Required]
        public int headTutorID { get; set; }

        [Required]
        public int maxClassSize { get; set; }

        [Required]
        public int inventoryNumber { get; set; }

        [Display(Name = "Open Fee")]
        [Required]
        public double openFee { get; set; }

        [Display(Name = "Student Fee")]
        [Required]
        public double studentFee { get; set; }

        [Display(Name = "Hire Fee")]
        [Required]
        public double hireFee { get; set; }
    }
}
