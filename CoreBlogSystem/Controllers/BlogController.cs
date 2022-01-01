using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    public class BlogController : Controller
    {
        BlogManager BlogManager = new BlogManager( new EfBlogRepository());
        public IActionResult Index()
        {
            var values = BlogManager.GetList();
            return View(values);
        }
    }
}