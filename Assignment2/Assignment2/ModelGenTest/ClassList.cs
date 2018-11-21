using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class ClassList
    {
        public int ClassId { get; set; }
        public int StudentId { get; set; }

        public Classes Class { get; set; }
        public Students Student { get; set; }
    }
}
