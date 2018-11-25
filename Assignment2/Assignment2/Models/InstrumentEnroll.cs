using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class InstrumentEnroll
    {
        public string instrumentName { get; set; }
        public int instrumentID { get; set; }
        public decimal? instrumentCost { get; set; }
        public decimal? instrumentHire { get; set; }
    }
}
