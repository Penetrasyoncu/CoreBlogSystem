using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    public class CommonController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
