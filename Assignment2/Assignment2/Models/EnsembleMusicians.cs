using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class EnsembleMusicians
    {
        [Required]
        public int ensembleID { get; set; }

        [Required]
        public int personID { get; set; }
    }
}
