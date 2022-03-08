using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinnessLayer.Concrete;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Areas.Admin.ViewComponents.Statistic
{
    public class AdminStatistics : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}