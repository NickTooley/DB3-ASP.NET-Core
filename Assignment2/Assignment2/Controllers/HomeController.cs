using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Assignment2.ModelGenTest;
using Assignment2.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Assignment2.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly db3assn2Context _db;
        //private readonly Person user;

        public HomeController(db3assn2Context db)
        {
            _db = db;
        }

        [Authorize]
        // GET: /<controller>/
        public IActionResult Index()
        {
            var person = _db.Person.Where(p => p.Email == User.Identity.Name).Single();
            return View(person);
        }

        [HttpGet]
        public IActionResult Enroll()
        {
            var user = _db.Person.Where(p => p.Email == User.Identity.Name).Single();
            var today = DateTime.Today;
            // Calculate the age.
            var age = today.Year - user.Dob.Year;
            // Go back to the year the person was born in case of a leap year
            if (user.Dob > today.AddYears(-age)) age--;

            var instrumentArr = _db.Instruments;
            List<SelectListItem> levellist = new List<SelectListItem>();
            for(int i = 0; i < 9; i++)
            {
                levellist.Add(new SelectListItem { Text = i.ToString(), Value = i.ToString() });
            }

            List<SelectListItem> newlist = new List<SelectListItem>();

            if (age < 19)
            {
                foreach(var instrument in instrumentArr)
                {
                    decimal costdec = instrument.StudentFee ?? 0;
                    string cost = costdec.ToString("#.##");
                    if (cost.Equals(""))
                    {
                        cost = "Unavailable";
                    }

                    decimal hirecostdec = instrument.HireFee ?? 0;
                    string hirecost = hirecostdec.ToString("#.##");
                    if (hirecost.Equals(""))
                    {
                        hirecost = age.ToString();
                    }


                    newlist.Add(new SelectListItem { Text = instrument.InstrumentName + "      Class Fee: $" + cost + "      Hire Fee: $" + hirecost, Value = instrument.InstrumentId.ToString() });
                }
            }
            else
            {
                foreach (var instrument in instrumentArr)
                {
                    decimal costdec = instrument.OpenFee ?? 0;
                    string cost = costdec.ToString("#.##");
                    if (cost.Equals(""))
                    {
                        cost = "Unavailable";
                    }

                    decimal hirecostdec = instrument.HireFee ?? 0;
                    string hirecost = hirecostdec.ToString("#.##");
                    if (hirecost.Equals(""))
                    {
                        hirecost = age.ToString();
                    }

                    newlist.Add(new SelectListItem { Text = instrument.InstrumentName + "      Class Fee: $" + cost + "      Hire Fee: $" + hirecost, Value=instrument.InstrumentId.ToString() });
                }
            }
            var enrollmodel = new Enroll();
            enrollmodel.Instruments = newlist;
            enrollmodel.levels = levellist;
            return View(enrollmodel);
        }

        [HttpPost]
        public IActionResult Enroll(Enroll model)
        {
            if (ModelState.IsValid)
            {
                

                var user = _db.Person.Where(p => p.Email == User.Identity.Name).Single();
                bool studentExists = 0 < _db.Students.Where(s => s.PersonId == user.PersonId).Count();

                if (!studentExists)
                {
                    var student = new Students();
                    student.PersonId = user.PersonId;

                    _db.Students.Add(student);
                    _db.SaveChanges();
                }

                    var insertedStudent = _db.Students.Where(s => s.PersonId == user.PersonId).Single();
                if (!studentExists)
                {

                    var studentguardian = new StudentGuardians();
                    studentguardian.StudentId = insertedStudent.StudentId;
                    studentguardian.ContactPhone = model.GuardianPhone;
                    studentguardian.Email = model.GuardianEmail;
                    studentguardian.FirstName = model.GuardianFirstname;
                    studentguardian.LastName = model.GuardianLastname;

                    _db.StudentGuardians.Add(studentguardian);
                }
                

                

                var enrollment = new Enrollment();

                enrollment.StudentId = insertedStudent.StudentId;
                enrollment.InstrumentId = model.instrumentID;
                enrollment.LessonLevel = model.LessonLevel;

                _db.Enrollment.Add(enrollment);


                if (model.instrumentHire)
                {
                    var hire = new InstrumentHire();

                    hire.StudentId = insertedStudent.StudentId;
                    hire.InstrumentId = model.instrumentID;

                    _db.InstrumentHire.Add(hire);
                }

                if (!studentExists)
                {
                    if (model.LessonLevel < 4)
                    {
                        var ensemble = new EnsembleMusicians();
                        ensemble.EnsembleId = 0;
                        ensemble.PersonId = user.PersonId;

                        _db.EnsembleMusicians.Add(ensemble);
                    }
                    else if (model.LessonLevel > 6)
                    {
                        var ensemble = new EnsembleMusicians();
                        ensemble.EnsembleId = 2;
                        ensemble.PersonId = user.PersonId;

                        _db.EnsembleMusicians.Add(ensemble);
                    }
                    else
                    {
                        var ensemble = new EnsembleMusicians();
                        ensemble.EnsembleId = 1;
                        ensemble.PersonId = user.PersonId;

                        _db.EnsembleMusicians.Add(ensemble);
                    }
                }

                _db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }   

            return View();
        }

    }
}
