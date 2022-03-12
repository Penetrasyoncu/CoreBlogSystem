using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using CoreBlogSystem.Models;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Controllers
{
    //Bu Controller içerisindeki action yani sayfaların hepsine yetkisiz erişimi engellemek istiyorsak
    //[Authorize] attributesini Controller seviyesine yani en yukarıya çıkararak yapabiliriz.
    //Böylece aşağısında kalan tüm actionlara yetkisiz erişimi engelleyeceğiz.
    //Kullanıcı bilgileri ile giriş yapmayan kimse aşağıdaki actionlara erişemeyecek.

    [AllowAnonymous]    
    public class WriterController : Controller
    {
        WriterManager wm = new WriterManager(new EfWriterRepository());

        public IActionResult Index()
        {
            var usermail = User.Identity.Name;
            ViewBag.v = usermail;
            return View();
        }

        
        //Giriş Yapan yazarın bilgilerini güncelliyoruz. Giriş yapanın ki olacak
        [HttpGet]
        public IActionResult WriterEditProfile()
        {
            Context c = new Context();
            var userMail = User.Identity.Name;
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();
            var writerValues = wm.TGetById(WriterID);
            return View(writerValues);
        }


        [HttpPost]
        public IActionResult WriterEditProfile(Writer p)
        {
            WriterValidator wl = new WriterValidator();
            ValidationResult result = wl.Validate(p);
            if (result.IsValid)
            {
                if (string.IsNullOrEmpty(p.WriterImage))
                {
                    p.WriterImage = "/CoreBlogTemplate/images/t1.jpg";
                }
                wm.TUpdate(p);
                return RedirectToAction("Index", "Dashboard");
            }
            else
            {
                foreach (var item in result.Errors)
                {
                    ModelState.AddModelError(item.PropertyName, item.ErrorMessage);
                }
            }
            return View();
        }
        //Burası Yeni Yazar Ekleme Kısmı Görseli İle
        [HttpGet]
        public IActionResult WriterAdd()
        {
            return View();
        }

        [HttpPost]
        public IActionResult WriterAdd(AddProfileImage p)
        {
            Writer w = new Writer();
            if (p.WriterImage != null)
            {
                var extention = Path.GetExtension(p.WriterImage.FileName);
                var NewImageName = Guid.NewGuid() + extention;
                var Location = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/WriterImageFiles/", NewImageName);
                var Stream = new FileStream(Location, FileMode.Create);
                p.WriterImage.CopyTo(Stream);
                w.WriterImage = NewImageName;
            }
            w.WriterMail = p.WriterMail;
            w.WriterName = p.WriterName;
            w.WriterPassword = p.WriterPassword;
            w.WriterStatus = Helpers.Enums.Status.Aktif;
            w.WriterAbout = p.WriterAbout;
            w.WriterAddDate = DateTime.Now;

            wm.TAdd(w);
            return RedirectToAction("Index", "Dashboard");
        }

        public PartialViewResult WriterNavbarPartial()
        {
            return PartialView();
        }

        public PartialViewResult WriterFooterPartial()
        {
            return PartialView();
        }
    }
}