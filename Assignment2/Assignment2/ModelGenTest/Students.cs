using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Students
    {
        public Students()
        {
            ClassList = new HashSet<ClassList>();
            InstrumentHire = new HashSet<InstrumentHire>();
        }

        public int StudentId { get; set; }
        public int PersonId { get; set; }

        public Person Person { get; set; }
        public StudentGuardians StudentGuardians { get; set; }
        public ICollection<ClassList> ClassList { get; set; }
        public ICollection<InstrumentHire> InstrumentHire { get; set; }
    }
}
