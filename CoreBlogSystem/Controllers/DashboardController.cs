using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using DataAccessLayer.Concrete;
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
    public class DashboardController : Controller
    {
        BlogManager bm = new BlogManager(new EfBlogRepository());

        public IActionResult Index()
        {
            //Dashboard' daki Toplam blog sayısını veriyor
            Context context = new Context();
            ViewBag.ToplamBlogSayisi = context.Blogs.Count().ToString();
            //Dashboard' daki Sizin blog sayınız kısmını getiriyor. Burası 1 numaralı yazarın sayısı
            ViewBag.SizinBlogSayisiniz = context.Blogs.Where(x => x.WriterID == 1).Count().ToString();
            //Dashboard' daki Kategori sayınız kısmını getiriyor.
            ViewBag.ToplamKategoriSayisi = context.Categories.Count().ToString();
            return View();
        }
    }
}