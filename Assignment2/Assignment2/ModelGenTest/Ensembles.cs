using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Ensembles
    {
        public Ensembles()
        {
            EnsembleMusicians = new HashSet<EnsembleMusicians>();
            PerformanceMusic = new HashSet<PerformanceMusic>();
        }

        public int EnsembleId { get; set; }
        public string EnsembleName { get; set; }

        public ICollection<EnsembleMusicians> EnsembleMusicians { get; set; }
        public ICollection<PerformanceMusic> PerformanceMusic { get; set; }
    }
}
