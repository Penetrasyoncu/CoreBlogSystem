using BusinnessLayer.Concrete;
using CoreBlogSystem.Models;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Controllers
{
    [AllowAnonymous]
    [ValidateAntiForgeryToken]
    public class ContactController : Controller
    {
        ContactManager cm = new ContactManager(new EfContactRepository());

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Index(Contact p)
        {
            try
            {
                p.ContactDate = DateTime.Now;
                p.ContactStatus = true;
                cm.ContactAdd(p);
                return Json(true);
            }
            catch (System.Exception)
            {
                return Json(false);
            }
        }
    }
}