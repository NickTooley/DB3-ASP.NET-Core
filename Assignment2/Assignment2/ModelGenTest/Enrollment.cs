using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Enrollment
    {
        public int StudentId { get; set; }
        public int InstrumentId { get; set; }
        public int LessonLevel { get; set; }

        public Instruments Instrument { get; set; }
        public Students Student { get; set; }
    }
}
