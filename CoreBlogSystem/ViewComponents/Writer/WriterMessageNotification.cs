using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.ViewComponents.Writer
{
    public class WriterMessageNotification : ViewComponent
    {        
        //Burası Yazar Panelinde Mesajlaşmayı Göstereceğiz
        public IViewComponentResult Invoke()
        {                        
            return View();
        }
    }
}