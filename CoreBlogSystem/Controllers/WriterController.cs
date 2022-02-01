using BusinnessLayer.Concrete;
using CoreBlogSystem.Models;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
            return View();
        }

        public IActionResult WriterEditProfile()
        {
            var writerValues = wm.TGetById(1);
            return View(writerValues);
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