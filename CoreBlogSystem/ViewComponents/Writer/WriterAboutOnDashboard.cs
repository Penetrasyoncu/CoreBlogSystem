using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinnessLayer.Concrete;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.ViewComponents.Writer
{
    public class WriterAboutOnDashboard : ViewComponent
    {
        WriterManager wm = new WriterManager(new EfWriterRepository());
        Context c = new Context();

        public IViewComponentResult Invoke()
        {
            //Burası Dashboard' da Yazar Hakkında Kısmını Getiriyoruz. Giriş yapan yazarın hakkında           
            var userName = User.Identity.Name;
            var userMail = c.Users.Where(x => x.UserName == userName).Select(y => y.Email).FirstOrDefault();
            var writerId = c.Writers.Where(x => x.WriterMail == userMail).Select(y => y.WriterID).FirstOrDefault();
            var values = wm.GetWriterListById(writerId);
            return View(values);
        }
    }
}