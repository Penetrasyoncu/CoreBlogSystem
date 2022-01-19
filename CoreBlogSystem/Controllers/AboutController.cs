using BusinnessLayer.Concrete;
using CoreBlogSystem.Models;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Controllers
{
    public class AboutController : Controller
    {
        AboutManager abm = new AboutManager(new EfAboutRepository());

        public IActionResult Index()
        {
            var values = abm.GetList();
            return View(values);
        }

        //About Sayfasındaki Sosyal Medya Kısımlarını Partial Şeklinde Böldük
        public PartialViewResult SocialMediaAbout()
        {            
            return PartialView();
        }
    }    
}