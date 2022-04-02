using BusinnessLayer.Concrete;
using BusinnessLayer.ValidationRules;
using CoreBlogSystem.Areas.Admin.Models;
using CoreBlogSystem.Helpers;
using CoreBlogSystem.Models;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using FluentValidation.Results;
using Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using X.PagedList;
using X.PagedList.Mvc.Core;


namespace CoreBlogSystem.Areas.Admin.Controllers
{
    [Area("Admin")]    
    public class WriterController : Controller
    {
        WriterManager writerManager = new WriterManager(new EfWriterRepository());

        public IActionResult IndexWriterAdmin(int page = 1)
        {
            var values = writerManager.TGetList().ToPagedList(page, 5);
            return View(values);
        }

        [HttpGet]
        public IActionResult AddWriterAdmin()
        {
            return View(new AddWriterModel());
        }

        [AllowAnonymous]
        [HttpPost]
        public JsonResult AddWriterAdmin(AddWriterModel addWriterModel)
        {
            Writer dbWriter = new Writer();
            ReturnValue retVal = new ReturnValue();

            try
            {
                if (addWriterModel.Image != null)
                {
                    var extention = Path.GetExtension(addWriterModel.Image.FileName);
                    var NewImageName = Guid.NewGuid() + extention;
                    var Location = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/WriterImageFiles/", NewImageName);
                    var Stream = new FileStream(Location, FileMode.Create);
                    addWriterModel.Image.CopyTo(Stream);
                    dbWriter.WriterImage = NewImageName;
                }
                else
                {
                    dbWriter.WriterImage = "/CoreBlogTemplate/images/t1.jpg";
                }

                dbWriter.WriterName = addWriterModel.Name;
                dbWriter.WriterAbout = addWriterModel.About;
                dbWriter.WriterMail = addWriterModel.Email;
                dbWriter.WriterPassword = addWriterModel.Password;
                dbWriter.WriterStatus = Enums.Status.Aktif;
                dbWriter.WriterAddDate = DateTime.Now;

                writerManager.TAdd(dbWriter);

                retVal.isSuccess = true;
                retVal.message = "Yazar Başarıyla Eklendi";
                retVal.data = dbWriter.WriterName;

                return Json(retVal);
            }
            catch (Exception Ex)
            {
                retVal.isSuccess = false;
                retVal.message = Ex.Message;
                return Json(retVal);
            }
        }

        [HttpGet]
        public IActionResult EditWriterAdmin(int id)
        {
            var EditCategoryValue = writerManager.TGetById(id);
            return View(EditCategoryValue);
        }

        [HttpPost]
        public IActionResult EditWriterAdmin(Writer writer)
        {
            writerManager.TUpdate(writer);
            return RedirectToAction("Index");
        }
    }
}