using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Classes
    {
        public Classes()
        {
            ClassList = new HashSet<ClassList>();
        }

        public int ClassId { get; set; }
        public int InstrumentId { get; set; }
        public int TutorId { get; set; }
        public int LessonLevel { get; set; }

        public Instruments Instrument { get; set; }
        public Tutors Tutor { get; set; }
        public ICollection<ClassList> ClassList { get; set; }
    }
}
