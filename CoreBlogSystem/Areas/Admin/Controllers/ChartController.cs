using CoreBlogSystem.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace CoreBlogSystem.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ChartController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult CategoryChart()
        {
            List<CategoryClass> list = new List<CategoryClass>();
            list.Add(
                new CategoryClass
                {
                    categoryname = "Yazılım",
                    categorycount = 10
                });

            list.Add(
                new CategoryClass
                {
                    categoryname = "Spor",
                    categorycount = 14
                });

            list.Add(
                new CategoryClass
                {
                    categoryname = "Oyun",
                    categorycount = 15
                });
            return Json(new { jsonlist = list });
        }
    }
}