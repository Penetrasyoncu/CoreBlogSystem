using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}