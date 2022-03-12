using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinnessLayer.Concrete;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.ViewComponents.Category
{
    public class CategoryList : ViewComponent
    {
        CategoryManager cm = new CategoryManager(new EfCategoryRepository());

        public IViewComponentResult Invoke()
        {            
            //Burası Kategori Listelerini Getirdiğimiz Alan. İstediğimiz Heryerde Çağırabiliriz
            //ViewBag.CategoryBlogCount = c.Categories.Where(x => x.CategoryID == c.Blogs.Select(i => i.CategoryID).FirstOrDefault()).Select(y => y.Blogs.Count()).FirstOrDefault();            
            var values = cm.GetList();
            return View(values);
        }
    }
}