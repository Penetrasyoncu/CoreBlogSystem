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
using Microsoft.AspNetCore.Identity;
using CoreBlogSystem.Models;
using System.Threading.Tasks;
using Helpers;
using System.IO;

namespace CoreBlogSystem.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> Register(UserSignUpViewModel userSignUpViewModel)
        {
            ReturnValue retVal = new ReturnValue();
            try
            {
                if (ModelState.IsValid)
                {
                    if (userSignUpViewModel.Image != null)
                    {
                        var extention = Path.GetExtension(userSignUpViewModel.Image.FileName);
                        var NewImageName = Guid.NewGuid() + extention;
                        var Location = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/WriterImageFiles/", NewImageName);
                        var Stream = new FileStream(Location, FileMode.Create);
                        userSignUpViewModel.Image.CopyTo(Stream);
                    }
                    
                    if (!Tool.IsValidEmail(userSignUpViewModel.Mail))
                    {
                        retVal.message = "Email Formatı Hatalı";
                        return Json(retVal);
                    }

                    AppUser user = new AppUser()
                    {
                        Email = userSignUpViewModel.Mail,
                        UserName = userSignUpViewModel.UserName,
                        NameSurname = userSignUpViewModel.NameSurname,
                        ImageURL = userSignUpViewModel.Image.ToString()
                    };

                    if (userSignUpViewModel.ConfirmKVKK != true)
                    {
                        ModelState.AddModelError("ConfirmKVKK",
                        "Sayfamıza kayıt olabilmek için gizlilik sözleşmesini kabul etmeniz gerekmektedir.");
                        return Json(userSignUpViewModel);
                    }

                    var result = await _userManager.CreateAsync(user, userSignUpViewModel.Password);
                    if (result.Succeeded)
                    {
                        //return RedirectToAction("Login", "Account");                    
                        retVal.isSuccess = true;
                        retVal.message = user.Email + " " + "Yazar Başarıyla Eklendi";

                        return Json(retVal);
                    }
                    else
                    {
                        foreach (var item in result.Errors)
                        {
                            ModelState.AddModelError("", item.Description);
                        }
                    }
                }
            }
            catch (Exception)
            {
                retVal.message = "Beklenmedik bir hata oluştu";
                return Json(retVal);
            }

            return Json(userSignUpViewModel);
        }

        //---------------------LOGİN İŞLEMLERİ-------------------------

        [HttpGet]
        public IActionResult Login(string returnUrl = null)
        {
            ViewData["returnUrl"] = returnUrl == null ? null : returnUrl;
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> Login(UserSignInViewModel appUser)
        {
            ReturnValue retVal = new ReturnValue();
            try
            {
                if (ModelState.IsValid)
                {
                    var result = await _signInManager.PasswordSignInAsync(appUser.UserName, appUser.Password, true, true);
                    if (result.Succeeded)
                    {
                        retVal.isSuccess = true;
                        retVal.message = "Giriş Başarılı";
                        return Json(retVal);
                    }
                    else
                    {
                        retVal.isSuccess = false;
                        retVal.message = "Hatalı Giriş";
                        return Json(retVal);
                    }
                }
            }
            catch (Exception)
            {
                retVal.message = "Beklenmedik bir hata oluştu";
                return Json(retVal);
            }
            return Json(appUser);
        }

        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Login", "Account");
        }
    }
}