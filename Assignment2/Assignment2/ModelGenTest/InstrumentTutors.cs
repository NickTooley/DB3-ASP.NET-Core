using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class InstrumentTutors
    {
        public int TutorId { get; set; }
        public int InstrumentId { get; set; }
        public int SeniorityId { get; set; }

        public Instruments Instrument { get; set; }
        public Seniority Seniority { get; set; }
        public Tutors Tutor { get; set; }
    }
}
