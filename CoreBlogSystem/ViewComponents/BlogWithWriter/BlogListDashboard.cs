using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.ViewComponents.BlogWithWriter
{
    public class BlogListDashboard : ViewComponent
    {
        BlogManager bm = new BlogManager(new EfBlogRepository());
        public IViewComponentResult Invoke()
        {
            //Burası Dashboadarda Son 5 Blog Yazılarını Getirdiğimiz ViewComponent
            var values = bm.GetBlogListWithCategory().Take(5);            
            return View(values);
        }
    }
}