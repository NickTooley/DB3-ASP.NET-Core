using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Assignment2.ModelGenTest;
using Assignment2.Models.AccountModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Assignment2.Controllers
{
    public class AccountController : Controller
    {

        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly db3assn2Context _db;
        //private readonly PasswordHasher<IdentityUser> _passwordHasher;

        public AccountController(
            UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            db3assn2Context db)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _db = db;
        }


        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(Login model, string returnUrl = null)
        {
            if (ModelState.IsValid)
            {
                ViewData["ReturnURL"] = returnUrl;

                var result = await _signInManager.PasswordSignInAsync(model.Email,
                                                                     model.Password,
                                                                     model.RememberMe,
                                                                     lockoutOnFailure: false);

                if(result.Succeeded)
                {
                    if (Url.IsLocalUrl(returnUrl)){
                        return Redirect(returnUrl);
                    }else{
                        return RedirectToAction(nameof(HomeController.Index), "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid Login");
                }
            }
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();

            return RedirectToAction(nameof(HomeController.Index), "Home");
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(Registration model)
        {
            if(ModelState.IsValid)
            {
                IdentityUser user = new IdentityUser()
                {
                    Email = model.Email,
                    UserName = model.Email
                };

                var result = await _userManager.CreateAsync(user, model.Password); 

                if(result.Succeeded)
                {
                    var person = new Person();

                    person.Email = model.Email;
                    person.FirstName = model.FirstName;
                    person.LastName = model.LastName;
                    person.Password = model.Password;
                    person.Dob = model.DOB;

                    _db.Person.Add(person);
                    _db.SaveChanges();

                    return RedirectToAction("Login", "Account");
                }
                else
                {
                    foreach(var error in result.Errors)
                    {
                        ModelState.AddModelError(String.Empty, error.Description);
                    }
                }
            }

            return View();
        }
    }
}