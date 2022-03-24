using BusinnessLayer.Concrete;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminMessageController : Controller
    {
        Context c = new Context();
        Message2Manager message2Manager = new Message2Manager(new EfMessage2Repository());

        public IActionResult Inbox()
        {
            var userName = User.Identity.Name;
            var userMail = c.Users.Where(x => x.UserName == userName).Select(y => y.Email).FirstOrDefault();
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();

            var values = message2Manager.GetInboxListByWriter(WriterID);
            return View(values);
        }

        public IActionResult Sendbox()
        {
            var userName = User.Identity.Name;
            var userMail = c.Users.Where(x => x.UserName == userName).Select(y => y.Email).FirstOrDefault();
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();

            var values = message2Manager.GetSendboxListByWriter(WriterID);
            return View(values);
        }

        public IActionResult AdminMessageDetails(int id)
        {
            var value = message2Manager.TGetById(id);
            return View(value);
        }

        //Message Gönderme Kısımları
        [HttpGet]
        public async Task<IActionResult> AdminSendMessage()
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
        public IActionResult AdminSendMessage(Message2 message)
        {
            var userName = User.Identity.Name;
            var userMail = c.Users.Where(x => x.UserName == userName).Select(y => y.Email).FirstOrDefault();
            var WriterID = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();

            message.SenderID = WriterID;
            message.MessageStatus = true;
            message.MessageDate = DateTime.Now;
            message2Manager.TAdd(message);

            return RedirectToAction("Sendbox");
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