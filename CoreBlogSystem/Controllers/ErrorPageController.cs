using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace CoreBlogSystem.Controllers
{
    [AllowAnonymous]
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