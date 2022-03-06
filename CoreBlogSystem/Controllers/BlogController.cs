using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using CoreBlogSystem.Helpers;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using DataAccessLayer.Concrete;
using X.PagedList;
using X.PagedList.Mvc.Core;

namespace CoreBlogSystem.Controllers
{
    [AllowAnonymous]    
    public class BlogController : Controller
    {
        BlogManager bm = new BlogManager(new EfBlogRepository());
        CategoryManager cm = new CategoryManager(new EfCategoryRepository());
        Context c = new Context();
        public IActionResult Index()
        {
            var values = bm.GetBlogListWithCategory();
            return View(values);
        }

        [Route("Blog/{categoryUrl}/{blogUrl}")]
        public IActionResult BlogReadAll(string blogUrl)
        {
            try
            {
                var blog = bm.GetBlogByUrl(blogUrl);
                ViewBag.CommentsValue = blog.BlogID;
                return View(blog);
            }
            catch (Exception)
            {
                throw;
            }
        }

        [Route("Blog/{categoryUrl}")]
        public IActionResult Category(string categoryUrl)
        {
            var category = cm.GetCategoryByUrl(categoryUrl);
            var blogs = bm.GetBlogsByCategoryId(category.CategoryID);
            return View("BlogListByCategory", blogs);
        }

        [Route("Blog/YazarinBloglari")]
        public IActionResult BlogListByWriter(int page = 1)
        {
            //Burası Yazarın Yazdığı Yazılar ve Yazar Panelinde Listeliyoruz
            //Yazarın diğer yazıları dediğimiz blogların ındex sayfasında da aynı yapıyı kullanıyoruz.
            //var values = bm.GetBlogListByWriter(1);            
            var userMail = User.Identity.Name;
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();
            var values = bm.GetListCategoryWriter(WriterID).ToPagedList(page, 5);
            return View(values);
        }

        public IActionResult BlogListByCategory(int id)
        {
            //Bu Alan Kategoriye Göre Blogları Getiriyor Örn: Oyun Kategorisinde 5 Yazı var onları getiriyor
            var values = bm.GetListBlogCategory(id);
            //ViewBag.CategorName = values[0].Category.ToString();
            return View(values);
        }

        [Route("Blog/YeniBlogEkle")]
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

        [Route("Blog/YeniBlogEkle")]
        [HttpPost]
        public IActionResult BlogAdd(Blog p)
        {
            BlogValidator bv = new BlogValidator();
            ValidationResult results = bv.Validate(p);

            var userMail = User.Identity.Name;
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();

            if (results.IsValid)
            {
                p.BlogStatus = Enums.Status.Aktif;
                p.BlogCreateDate = DateTime.Now;
                p.WriterID = WriterID;
                if (string.IsNullOrEmpty(p.BlogUrl))
                {
                    p.BlogUrl = Tool.CreateUrlSlug(p.BlogTitle);
                }
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

        [Route("/Blog/BlogDelete/{id}")]
        public IActionResult BlogDelete(int id)
        {
            //Blog Silme İşlemi
            var blogValue = bm.GetById(id);
            bm.TDelete(blogValue);
            return RedirectToAction("BlogListByWriter");
        }

        [Route("/Blog/EditBlog/{id}")]
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

        [Route("/Blog/EditBlog/{id}")]
        [HttpPost]        
        public IActionResult EditBlog(Blog p)
        {
            //Blog Edit/Güncelleme İşlemi
            var userMail = User.Identity.Name;
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();
            var values = bm.GetListCategoryWriter(WriterID);
            p.BlogCreateDate = DateTime.Parse(DateTime.Now.ToLongDateString());
            p.BlogStatus = Enums.Status.Aktif;
            p.WriterID = WriterID;
            bm.TUpdate(p);
            return RedirectToAction("BlogListByWriter");
        }
    }
}