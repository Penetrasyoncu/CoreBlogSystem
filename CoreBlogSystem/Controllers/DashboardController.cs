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
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace CoreBlogSystem.Controllers
{
    [ValidateAntiForgeryToken]
    public class DashboardController : Controller
    {
        BlogManager bm = new BlogManager(new EfBlogRepository());

        public IActionResult Index()
        {
            //Dashboard' daki Toplam blog sayısını veriyor
            Context context = new Context();
            WriterManager wm = new WriterManager(new EfWriterRepository());

            var userMail = User.Identity.Name;
            var WriterID = context.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();
            var GetWriterId = wm.TGetById(WriterID);

            ViewBag.ToplamBlogSayisi = context.Blogs.Count().ToString();
            //Dashboard' daki Sizin blog sayınız kısmını getiriyor. Burası giriş yapan yazar numaralı yazarın sayısı
            ViewBag.SizinBlogSayisiniz = context.Blogs.Where(x => x.WriterID == GetWriterId.WriterID).Count().ToString();
            //Dashboard' daki Kategori sayınız kısmını getiriyor.
            ViewBag.ToplamKategoriSayisi = context.Categories.Count().ToString();
            return View();
        }
    }
}