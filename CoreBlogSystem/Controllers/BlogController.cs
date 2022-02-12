using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CoreBlogSystem.Controllers
{
    [AllowAnonymous]
    public class BlogController : Controller
    {
        BlogManager bm = new BlogManager(new EfBlogRepository());
        CategoryManager cm = new CategoryManager(new EfCategoryRepository());
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

        public IActionResult BlogListByWriter()
        {
            //Burası Yazarın Yazdığı Yazılar ve Yazar Panelinde Listeliyoruz
            //Yazarın diğer yazıları dediğimiz blogların ındex sayfasında da aynı yapıyı kullanıyoruz.
            //var values = bm.GetBlogListByWriter(1);
            var values = bm.GetListCategoryWriter(1);
            return View(values);
        }

        public IActionResult BlogListByCategory(int id)
        {
            //Bu Alan Kategoriye Göre Blogları Getiriyor Örn: Oyun Kategorisinde 5 Yazı var onları getiriyor
            var values = bm.GetListBlogCategory(id);  
            //ViewBag.CategorName = values[0].Category.ToString();
            return View(values);
        }

        [HttpGet] 
        public IActionResult BlogAdd()
        {
            //Kategorileri DropDown'a Çektiğimiz Alan            
            List<SelectListItem> categoryValues = (from x in cm.GetList()
                                                   select new SelectListItem
                                                   {
                                                       Text = x.CategoryName,
                                                       Value = x.CategoryID.ToString()
                                                   }).ToList();
            //Burası Yukarıde Çektiğimiz Verileri Front-End Tarafına Taşıyoruz.
            ViewBag.Cv = categoryValues;
            return View();
        }

        [HttpPost]
        public IActionResult BlogAdd(Blog p)
        {
            BlogValidator bv = new BlogValidator();
            ValidationResult results = bv.Validate(p);

            if (results.IsValid)
            {
                p.BlogStatus = true;
                p.BlogCreateDate = DateTime.Now;
                p.WriterID = 1;
                bm.TAdd(p);
                //RedirectToAction Metodu Adından da anlaşılacağı gibi Action'a Yönlendiriyor.
                //İlk kısım ActionName ikincisi Nerde olduğu Yani Controller Adı
                return RedirectToAction("BlogListByWriter", "Blog");
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

        public IActionResult BlogDelete(int id)
        {
            //Blog Silme İşlemi
            var blogValue = bm.GetById(id);
            bm.TDelete(blogValue);
            return RedirectToAction("BlogListByWriter");
        }

        [HttpGet]
        public IActionResult EditBlog(int id)
        {
            var EditBlogValue = bm.GetById(id);
            List<SelectListItem> categoryValues = (from x in cm.GetList()
                                                   select new SelectListItem
                                                   {
                                                       Text = x.CategoryName,
                                                       Value = x.CategoryID.ToString()
                                                   }).ToList();
            //Burası Yukarıde Çektiğimiz Verileri Front-End Tarafına Taşıyoruz.
            ViewBag.Cv = categoryValues;
            return View(EditBlogValue);
        }

        [HttpPost]
        public IActionResult EditBlog(Blog p)
        {
            //Blog Edit/Güncelleme İşlemi
            p.WriterID = 1;
            bm.TUpdate(p);
            return RedirectToAction("BlogListByWriter");
        }
    }
}