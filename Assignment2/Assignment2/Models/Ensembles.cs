using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class Ensembles
    {
        public int ensembleID { get; set; }

        [Required]
        [Display(Name ="Ensemble Name")]
        public string ensembleName { get; set; }
    }
}
