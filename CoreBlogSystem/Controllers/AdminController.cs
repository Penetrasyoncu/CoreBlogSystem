using BusinnessLayer.Concrete;
using CoreBlogSystem.Models;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace CoreBlogSystem.Controllers
{    
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        //Burası Admin Panel'in Navbar'ı yani sol kısmı
        public PartialViewResult AdminNavbar()
        {
            return PartialView();
        }
    }
}