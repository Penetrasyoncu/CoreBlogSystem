using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;
using System;

namespace CoreBlogSystem.Controllers
{
    public class RegisterController : Controller
    {
        WriterManager vm = new WriterManager(new EfWriterRepository());

        [HttpGet]
        public IActionResult Index()
        {

            return View();
        }

        [HttpPost]
        public IActionResult Index(Writer p)
        {
            WriterValidator wv = new WriterValidator();
            ValidationResult results = wv.Validate(p);

            if (results.IsValid)
            {
                p.WriterStatus = true;
                p.WriterAbout = "İlk Yazar İbrahim";
                p.WriterAddDate = DateTime.Now;

                vm.WriterAdd(p);
                //RedirectToAction Metodu Adından da anlaşılacağı gibi Action'a Yönlendiriyor.
                //İlk kısım ActionName ikincisi Nerde olduğu Yani Controller Adı
                return RedirectToAction("Index", "Blog");
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