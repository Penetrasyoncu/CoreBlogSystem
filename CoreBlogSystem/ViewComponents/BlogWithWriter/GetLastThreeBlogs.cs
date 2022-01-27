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
    public class GetLastThreeBlogs : ViewComponent
    {
        BlogManager bm = new BlogManager(new EfBlogRepository());
        public IViewComponentResult Invoke()
        {
            //Burası Footer' daki 3 Postu Yani Son Olanlarını Getirdiğimiz ViewComponent
            var values = bm.GetLast3Blog();
            return View(values);
        }
    }
}