using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class PayScales
    {
        public int SeniorityId { get; set; }
        public int InstrumentId { get; set; }
        public decimal Pay { get; set; }

        public Instruments Instrument { get; set; }
        public Seniority Seniority { get; set; }
    }
}
