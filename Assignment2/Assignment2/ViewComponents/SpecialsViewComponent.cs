using Assignment2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.ViewComponents
{
    [ViewComponent]
    public class SpecialsViewComponent : ViewComponent
    {
        private readonly SpecialsDataContext _specials;

        public SpecialsViewComponent(SpecialsDataContext specials)
        {
            _specials = specials;
        }

        public IViewComponentResult Invoke()
        {
            
            var specials = _specials.GetSpecials(User.Identity.Name);
            return View(specials);
        }

    }
}
