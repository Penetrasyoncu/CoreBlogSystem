using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinnessLayer.Concrete;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Areas.Admin.ViewComponents.Statistic
{
    public class GeneralStatistics : ViewComponent
    {
        public IViewComponentResult Invoke()
        {            
            BlogManager bm = new BlogManager(new EfBlogRepository());
            Context c = new Context();

            //Toplam Blog Sayısını Çektiğimiz Alan ---- Widgets
            ViewBag.AllBlogs = bm.GetList().Count();

            //Toplam Mesaj Sayısını Aldığımız Kısım
            ViewBag.MessageCount = c.Contacts.Count();

            //Toplam Yorum Sayısı
            ViewBag.CommentCount = c.Comments.Count();

            return View();
        }
    }
}