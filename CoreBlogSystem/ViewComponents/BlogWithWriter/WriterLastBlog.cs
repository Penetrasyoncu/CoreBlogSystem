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
    public class WriterLastBlog:ViewComponent
    {
        BlogManager bm = new BlogManager(new EfBlogRepository());

        public IViewComponentResult Invoke()
        {
            //Burası Yazarın Diğer Yazıları Kısmı ve Şuan 1 ID' li yazarın yazılarını Getiriyoruz
            var values = bm.GetBlogListByWriter(1);
            return View(values);
        }
    }
}