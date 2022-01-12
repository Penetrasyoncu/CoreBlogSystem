using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    public class BlogController : Controller
    {
        BlogManager bm = new BlogManager( new EfBlogRepository());
        public IActionResult Index()
        {
            var values = bm.GetBlogListWithCategory();
            return View(values);
        }

        public IActionResult BlogReadAll(int id)
        {           
            ViewBag.CommentsValue = id;
            //Dışarıdan Bir ID değişkeni alan bir Action Oluşturduk
            var values = bm.GetBlogByID(id);
            return View(values);
        }
    }
}