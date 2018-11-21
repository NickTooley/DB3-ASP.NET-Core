using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Assignment2.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Assignment2.Controllers
{
    public class BlogController : Controller
    {
        private readonly DataContext _db;

        public BlogController(DataContext db)
        {
            _db = db;
        }

        [Route("blog")]
        // GET: /<controller>/
        public IActionResult Index()
        {
            var posts = _db.Posts.Take(5).ToArray();

            ViewBag.stuff = "This will pass to View";
            return View(posts);
        }

        public IActionResult Post(int id=-1)
        {
            
            return View();
        }

        [HttpGet]
        public IActionResult Create()
        {

            return View();
        }

        [HttpPost]
        public IActionResult Create(Post post)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            post.msg2 = "MINE";

            _db.Posts.Add(post);
            _db.SaveChanges();

            return View();
        }
        
    }
}
