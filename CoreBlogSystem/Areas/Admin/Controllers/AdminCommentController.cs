using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using X.PagedList.Mvc.Core;

namespace CoreBlogSystem.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminCommentController : Controller
    {
        CommentManager commentManager = new CommentManager(new EfCommentRepository());

        public IActionResult Index(int page = 1)
        {
            var comments = commentManager.GetCommentWithBlog().ToPagedList(page, 10);
            return View(comments);
        }

        [HttpGet]
        public IActionResult EditCommentAdmin(int id)
        {
            var comments = commentManager.TGetById(id);
            return View(comments);
        }

        [HttpPost]
        public IActionResult EditCommentAdmin(Comment comment)
        {
            comment.CommentStatus = true;
            comment.CommentDate = System.DateTime.Now;
            
            commentManager.TUpdate(comment);
            return RedirectToAction("Index");
        }
    }
}