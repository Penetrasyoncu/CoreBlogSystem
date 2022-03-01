using BusinnessLayer.Concrete;
using CoreBlogSystem.Helpers;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    [ValidateAntiForgeryToken]
    public class CategoryController : Controller
    {
        CategoryManager cm = new CategoryManager(new EfCategoryRepository());

        public IActionResult Index()
        {
            var values = cm.GetList();
            return View(values);
        }

        [HttpGet]
        public IActionResult AddCategory()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddCategory(Category p)
        {
            if (string.IsNullOrEmpty(p.CategorUrl))
            {
                p.CategorUrl = Tool.CreateUrlSlug(p.CategoryName);
            }
            p.CategoryStatus = true;
            cm.TAdd(p);
            return View();
        }
    }
}