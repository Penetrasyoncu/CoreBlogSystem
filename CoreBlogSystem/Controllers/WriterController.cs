using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using CoreBlogSystem.Models;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using FluentValidation.Results;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Controllers
{
    public class WriterController : Controller
    {
        private readonly SignInManager<AppUser> _signInManager;

        WriterManager wm = new WriterManager(new EfWriterRepository());
        AppUserManager userManager = new AppUserManager(new EfUserRepository());
        Context context = new Context();

        private readonly UserManager<AppUser> _userManager;

        public WriterController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;

        }

        public async Task<IActionResult> Index()
        {
            var usermail = User.Identity.Name;
            ViewBag.v = usermail;
          
            return View();
        }

        //Giriş Yapan yazarın bilgilerini güncelliyoruz. Giriş yapanın ki olacak
        [HttpGet]
        public async Task<IActionResult> WriterEditProfile()
        {
            var enteredUser = await _userManager.FindByNameAsync(User.Identity.Name);
            UserUpdateViewModel model = new UserUpdateViewModel();

            model.MailModel = enteredUser.Email;
            model.NameSurnameModel = enteredUser.NameSurname;
            model.ImageURLModel = enteredUser.ImageURL;
            model.UserNameModel = enteredUser.UserName;

            //Kullanıcı ID' sini getirmek için yapılan işlem
            //var resultsss = await _userManager.GetUserIdAsync(enteredUser);
            //ViewBag.Veri = resultsss;

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> WriterEditProfile(UserUpdateViewModel model)
        {
            var enteredUser = await _userManager.FindByNameAsync(User.Identity.Name);

            enteredUser.Email = model.MailModel;
            enteredUser.NameSurname = model.NameSurnameModel;
            enteredUser.ImageURL = model.ImageURLModel;
            enteredUser.UserName = model.UserNameModel;
            enteredUser.PasswordHash = _userManager.PasswordHasher.HashPassword(enteredUser, model.PasswordModel);

            var result = await _userManager.UpdateAsync(enteredUser);

            return RedirectToAction("Index", "Dashboard");

            //WriterValidator wl = new WriterValidator();
            //ValidationResult result = wl.Validate(p);
            //if (result.IsValid)
            //{
            //    if (string.IsNullOrEmpty(p.WriterImage)) 
            //    {
            //        p.WriterImage = "/CoreBlogTemplate/images/t1.jpg";
            //    }
            //    p.WriterStatus = Helpers.Enums.Status.Aktif;
            //    wm.TUpdate(p);
            //    return RedirectToAction("Index", "Dashboard");
            //}
            //else
            //{
            //    foreach (var item in result.Errors)
            //    {
            //        ModelState.AddModelError(item.PropertyName, item.ErrorMessage);
            //    }
            //}
            //return View();
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

        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Login", "Account");
        }
    }
}