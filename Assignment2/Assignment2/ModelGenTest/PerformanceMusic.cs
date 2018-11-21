using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class PerformanceMusic
    {
        public int PerformanceId { get; set; }
        public int MusicId { get; set; }
        public int EnsembleId { get; set; }

        public Ensembles Ensemble { get; set; }
        public Music Music { get; set; }
        public Performances Performance { get; set; }
    }
}
