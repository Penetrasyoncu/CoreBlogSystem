using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Areas.Admin.ViewComponents.Statistic
{
    public class GeneralStatistics : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            BlogManager bm = new BlogManager(new EfBlogRepository());
            ViewBag.AllBlogs = bm.GetList().Count();
            return View();
        }
    }
}