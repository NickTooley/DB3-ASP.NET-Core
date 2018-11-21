using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Performances
    {
        public Performances()
        {
            PerformanceMusic = new HashSet<PerformanceMusic>();
        }

        public int PerformanceId { get; set; }
        public int LocationId { get; set; }

        public Locations Location { get; set; }
        public ICollection<PerformanceMusic> PerformanceMusic { get; set; }
    }
}
