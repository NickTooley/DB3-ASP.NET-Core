using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class MusicInstruments
    {
        [Required]
        public int musicID { get; set; }

        [Required]
        public int instrumentID { get; set; }
    }
}
