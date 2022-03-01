using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using System;

namespace CoreBlogSystem.Controllers
{    
    public class CommentController : Controller
    {
        CommentManager cm = new CommentManager(new EfCommentRepository());

        public IActionResult Index()
        {
            return View();
        }


        [HttpGet]
        //Yorumlar alanı her blog içinde olacağı için PartialView olarak Yorum Viwei oluşturacağız.
        public PartialViewResult PartialAddComment()
        {
            return PartialView();
        }
        //Yukarıda Get ile Partial olarak yorum formunu her blogun altına gönderdik
        //Post Yani burada girilen verileri alıp DB' ye kaydediyoruz.
        [HttpPost]
        public JsonResult PartialAddComment(Comment p)
        {
            try
            {
                p.CommentDate = DateTime.Now;
                p.CommentStatus = true;
                p.BlogID = 13;
                cm.CommentAdd(p);

                return Json(true);

            }
            catch (System.Exception)
            {
                return Json(false);
            }
        }

        public PartialViewResult CommentListByBlog(int id)
        {
            var values = cm.GetList(id);
            return PartialView(values);
        }
    }
}