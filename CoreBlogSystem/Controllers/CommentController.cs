using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    public class CommentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        //Yorumlar alanı her blog içinde olacağı için PartialView olarak Yorum Viwei oluşturacağız.
        public PartialViewResult PartialAddComment()
        {
            return PartialView();
        }

        public PartialViewResult CommentListByBlog()
        {
            return PartialView();
        }
    }
}