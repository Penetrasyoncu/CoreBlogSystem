using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using System;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    [ValidateAntiForgeryToken]
    public class ErrorPageController : Controller
    {
        public IActionResult ErrorName(int code)
        {
            //Buraya ilk olarak 404 hataları olduğunda düşüyor ve standart bir errorpage döndürüyoruz.
            //Startup.cs dosyasında ki komut sayesinde
            return View();
        }
    }
}