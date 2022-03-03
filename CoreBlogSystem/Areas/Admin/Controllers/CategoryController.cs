using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using CoreBlogSystem.Helpers;
using CoreBlogSystem.Models;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using X.PagedList;
using X.PagedList.Mvc.Core;

namespace CoreBlogSystem.Areas.Admin.Controllers
{
    //Area Attribute nu kullanmamızın sebebi; bu controller' ın nerden geldiğini söylemek zorunda olduğumuzdan
    //Yani uygulamanın kafasının karışmaması lazım CategoryController Vitrin kısmında da aynı isimde var karışmasın diye bunu yazdık.
    [Area("Admin")]

    public class CategoryController : Controller
    {
        CategoryManager cm = new CategoryManager(new EfCategoryRepository());
        public IActionResult Index(int page = 1)
        {
            var values = cm.GetList().ToPagedList(page, 3);
            return View(values);
        }


        [HttpGet]
        public IActionResult AddCategoryAdmin()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddCategoryAdmin(Category category)
        {
            CategoryValidator cv = new CategoryValidator();
            ValidationResult results = cv.Validate(category);

            if (results.IsValid)
            {
                category.CategoryStatus = true;
                if (string.IsNullOrEmpty(category.CategorUrl))
                {
                    category.CategorUrl = Tool.CreateUrlSlug(category.CategoryName);
                }
                cm.TAdd(category);                
                return RedirectToAction("Index", "Category");
            }
            else
            {
                foreach (var item in results.Errors)
                {
                    ModelState.AddModelError(item.PropertyName, item.ErrorMessage);
                }
            }
            return View();            
        }
    }
}