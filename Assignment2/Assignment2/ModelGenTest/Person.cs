using System;
using System.Collections.Generic;

namespace Assignment2.ModelGenTest
{
    public partial class Person
    {
        public Person()
        {
            EnsembleMusicians = new HashSet<EnsembleMusicians>();
            Students = new HashSet<Students>();
            Tutors = new HashSet<Tutors>();
        }

        public int PersonId { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public DateTime Dob { get; set; }

        public ICollection<EnsembleMusicians> EnsembleMusicians { get; set; }
        public ICollection<Students> Students { get; set; }
        public ICollection<Tutors> Tutors { get; set; }
    }
}
