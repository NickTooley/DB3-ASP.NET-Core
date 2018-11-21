using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Locations
    {
        public Locations()
        {
            Performances = new HashSet<Performances>();
        }

        public int LocationId { get; set; }
        public string Address { get; set; }
        public string Name { get; set; }

        public ICollection<Performances> Performances { get; set; }
    }
}
