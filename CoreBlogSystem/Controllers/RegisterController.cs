using BusinnessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace CoreBlogSystem.Controllers
{
    public class RegisterController : Controller
    {
        WriterManager vm = new WriterManager(new EfWriterRepository());

        [HttpGet]
        public IActionResult Index()
        {

            return View();
        }

        [HttpPost]
        public IActionResult Index(Writer p)
        {
            p.WriterStatus = true;
            p.WriterAbout = "İlk Yazar İbrahim";

            vm.WriterAdd(p);
            //RedirectToAction Metodu Adından da anlaşılacağı gibi Action'a Yönlendiriyor.
            //İlk kısım ActionName ikincisi Nerde olduğu Yani Controller Adı
            return RedirectToAction("Index","Blog");
        }
    }
}