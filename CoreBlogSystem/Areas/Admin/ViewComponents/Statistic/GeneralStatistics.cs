using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
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

            //Api İle HavaDurumu Çekme İşlemi
            string api = "24082104a78eac501418db4b1c15afc6";
            string connection = "https://api.openweathermap.org/data/2.5/weather?q=istanbul&mode=xml&lang=tr&units=metric&appid=" + api;
            XDocument document = XDocument.Load(connection);
            ViewBag.Temperature = document.Descendants("temperature").ElementAt(0).Attribute("value").Value;

            return View();
        }
    }
}