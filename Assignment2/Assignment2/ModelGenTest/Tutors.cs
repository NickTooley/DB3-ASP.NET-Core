using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Tutors
    {
        public Tutors()
        {
            Classes = new HashSet<Classes>();
            InstrumentTutors = new HashSet<InstrumentTutors>();
            Instruments = new HashSet<Instruments>();
        }

        public int TutorId { get; set; }
        public int PersonId { get; set; }

        public Person Person { get; set; }
        public ICollection<Classes> Classes { get; set; }
        public ICollection<InstrumentTutors> InstrumentTutors { get; set; }
        public ICollection<Instruments> Instruments { get; set; }
    }
}
