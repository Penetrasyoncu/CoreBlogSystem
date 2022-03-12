using BusinnessLayer.Concrete;
using CoreBlogSystem.Areas.Admin.Models;
using CoreBlogSystem.Models;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace CoreBlogSystem.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class WriterController : Controller
    {
        WriterManager wm = new WriterManager(new EfWriterRepository());

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult WriterList()
        {
            var jsonList = JsonConvert.SerializeObject(writers);
            return Json(jsonList);
        }

        public IActionResult GetWriterByID(int writerID)
        {
            var findWriter = writers.FirstOrDefault(x => x.Id == writerID);
            var jsonWriter = JsonConvert.SerializeObject(findWriter);
            return Json(jsonWriter);
        }

        public static List<WriterClass> writers = new List<WriterClass>
        {
            new WriterClass
            {
                Id = 1,
                Name = "Yusuf"
            },
            new WriterClass
            {
                Id = 2,
                Name = "İbrahim"
            },
            new WriterClass
            {
                Id = 3,
                Name = "Büşra"
            }
        };        
    }
}