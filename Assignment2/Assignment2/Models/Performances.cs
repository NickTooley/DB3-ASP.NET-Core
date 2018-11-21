using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Performances
    {
        public int performanceID { get; set; }

        [Required]
        public int locationID { get; set; }

    }
}
