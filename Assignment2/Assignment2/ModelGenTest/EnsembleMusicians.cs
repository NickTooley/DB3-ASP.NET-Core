using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class EnsembleMusicians
    {
        public int EnsembleId { get; set; }
        public int PersonId { get; set; }

        public Ensembles Ensemble { get; set; }
        public Person Person { get; set; }
    }
}
