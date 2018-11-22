using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Assignment2.ModelGenTest;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Assignment2.Controllers
{
    
    public class HomeController : Controller
    {
        private readonly db3assn2Context _db;

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
    }
}
