using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Seniority
    {
        public Seniority()
        {
            InstrumentTutors = new HashSet<InstrumentTutors>();
            PayScales = new HashSet<PayScales>();
        }

        public int SeniorityId { get; set; }
        public string SeniorityName { get; set; }

        public ICollection<InstrumentTutors> InstrumentTutors { get; set; }
        public ICollection<PayScales> PayScales { get; set; }
    }
}
