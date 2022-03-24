using BusinnessLayer.Concrete;
using CoreBlogSystem.Models;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Controllers
{
    public class MessageController : Controller
    {
        Context c = new Context();
        Message2Manager message2Manager = new Message2Manager(new EfMessage2Repository());

        public IActionResult Index()
        {
            var userName = User.Identity.Name;
            var userMail = c.Users.Where(x => x.UserName == userName).Select(y => y.Email).FirstOrDefault();
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();

            var values = message2Manager.GetInboxListByWriter(WriterID);
            return View(values);
        }

        public IActionResult MessageDetails(int id)
        {
            var value = message2Manager.TGetById(id);
            return View(value);
        }

        //Message Gönderme Kısımları
        [HttpGet]
        public async Task<IActionResult> SendMessage()
        {
            //KUllanıcıları DropDown'a Çektiğimiz Alan            
            List<SelectListItem> recieverUsers = (from x in await GetUsersAsync()
                                                  select new SelectListItem
                                                  {
                                                      Text = x.Email.ToString(),
                                                      Value = x.Id.ToString()
                                                  }).ToList();
            //Burası Yukarıde Çektiğimiz Verileri Front-End Tarafına Taşıyoruz.
            ViewBag.RecieverUser = recieverUsers;
            return View();
        }

        [HttpPost]
        public IActionResult SendMessage(Message2 message)
        {
            var userName = User.Identity.Name;
            var userMail = c.Users.Where(x => x.UserName == userName).Select(y => y.Email).FirstOrDefault();
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();

            message.MessageStatus = true;
            message.MessageDate = DateTime.Now;
            message2Manager.TAdd(message);

            return RedirectToAction("Index");
        }

        //Burası Giden Kutusu Olarak Düşünebiliriz
        public IActionResult SendBox()
        {
            var userName = User.Identity.Name;
            var userMail = c.Users.Where(x => x.UserName == userName).Select(y => y.Email).FirstOrDefault();
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();

            var values = message2Manager.GetSendboxListByWriter(WriterID);
            return View(values);
        }

        //DB' den Tüm Kullanıcıları Getiren Metod
        public async Task<List<AppUser>> GetUsersAsync()
        {
            using (var context = new Context())
            {
                return await context.Users.ToListAsync();
            }
        }
    }
}