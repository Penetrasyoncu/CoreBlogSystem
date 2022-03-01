using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using System;

namespace CoreBlogSystem.Controllers
{    
    public class NewsletterController : Controller
    {
        NewsletterManager nm = new NewsletterManager(new EfNewsletterRepository());

        [HttpGet]
        public PartialViewResult SubscribeMail()
        {
            return PartialView();
        }
        [HttpPost]
        public JsonResult SubscribeMail(Newsletter p)
        {
            try
            {
                p.MailStatus = true;
                p.MailAddDate = DateTime.Now;
                nm.AddNewsletter(p);
                return Json(true);
            }
            catch (System.Exception)
            {
                return Json(false);
            }
        }
    }
}