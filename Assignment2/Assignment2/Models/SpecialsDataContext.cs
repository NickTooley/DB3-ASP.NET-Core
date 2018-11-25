using Assignment2.ModelGenTest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Assignment2.Models
{
    public class FullEnrollment
    {   
        public string InstrumentName { get; internal set; }
        public int Level { get; internal set; }
        public string Status { get; internal set; }
        public string label { get; internal set; }
    }
    public class SpecialsDataContext
    {
        private readonly db3assn2Context _db;
        public SpecialsDataContext(db3assn2Context db)
        {
            _db = db;
        }
        public List<FullEnrollment> GetSpecials(string email)
        {
            bool isStudent = 0 < _db.Students.Where(s => s.Person.Email.Equals(email)).Count();
            if (isStudent)
            {
                int studentID = _db.Students.Where(s => s.Person.Email.Equals(email)).Single().StudentId;
                var enrollments = _db.Enrollment.Where(e => e.StudentId == studentID);

                List<FullEnrollment> toReturn = new List<FullEnrollment>();

                foreach (var enrollment in enrollments)
                {
                    var instrument = _db.Instruments.Where(i => i.InstrumentId == enrollment.InstrumentId).Single();
                    bool exists = 0 < _db.Classes.Where(c => c.InstrumentId == enrollment.InstrumentId && c.LessonLevel == enrollment.LessonLevel).Count();
                    string status = "";
                    string label = "";
                    if (exists)
                    {
                        var retrievedClass = _db.Classes.Where(c => c.InstrumentId == enrollment.InstrumentId && c.LessonLevel == enrollment.LessonLevel).Single();
                        bool enoughStudents = 2 < _db.ClassList.Where(cl => cl.ClassId == retrievedClass.ClassId).Count();

                        if (enoughStudents)
                        {
                            status = "COMPLETED";
                            label = "label label - success";
                        }
                        else
                        {
                            status = "Not Enough Students";
                            label = "label label-warning";
                        }

                    }
                    else
                    {
                        status = "No Tutors";
                        label = "label label-warning";
                    }
                    toReturn.Add(new FullEnrollment
                    {
                        InstrumentName = instrument.InstrumentName,
                        Level = enrollment.LessonLevel,
                        Status = status,
                        label = label
                    });
                }
                return toReturn;
            }
            else
            {
                return new List<FullEnrollment>();
            }
        }
    }
}
