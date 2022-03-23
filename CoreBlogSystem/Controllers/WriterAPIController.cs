using CoreBlogSystem.Helpers;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using static CoreBlogSystem.Helpers.Enums;

namespace CoreBlogSystem.Controllers
{
    public class WriterAPIController : Controller
    {
        //Yazarlar Tablosunu Getirmek İçindi Bu
        public async Task<IActionResult> Index()
        {
            var httpClient = new HttpClient();
            var responseMessage = await httpClient.GetAsync("https://localhost:44336/api/Default");
            var jsonStrging = await responseMessage.Content.ReadAsStringAsync();
            var writerList = JsonConvert.DeserializeObject<List<Class1>>(jsonStrging);

            return View(writerList);
        }

        //Yazarlar Tablosunu Veri Eklemek İçindi Bu
        [HttpGet]
        public IActionResult AddWriterAPI()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddWriterAPI(Class1 writer)
        {
            var httpClient = new HttpClient();
            var jsonWriter = JsonConvert.SerializeObject(writer);
            StringContent content = new StringContent(jsonWriter, Encoding.UTF8, "application/json");
            var responseMessage = await httpClient.PostAsync("https://localhost:44336/api/Default", content);
            if (responseMessage.IsSuccessStatusCode)
            {
                RedirectToAction("Index");
            }
            //writer.WriterStatus = Enums.Status.Aktif;
            //writer.WriterAddDate = DateTime.Now;
            return View(writer);
        }

        //Yazarlar Tablosunu Veri Düzenlemek İçindi Bu        
        [HttpGet]
        public async Task<IActionResult> EditWriterAPI(int id)
        {
            var httpClient = new HttpClient();
            var responseMessage = await httpClient.GetAsync("https://localhost:44336/api/Default/" + id);
            if (responseMessage.IsSuccessStatusCode)
            {
                var jsonStrging = await responseMessage.Content.ReadAsStringAsync();
                var writerList = JsonConvert.DeserializeObject<Class1>(jsonStrging);
                return View(writerList);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> EditWriterAPI(Class1 writer)
        {
            var httpClient = new HttpClient();
            var writerList = JsonConvert.SerializeObject(writer);
            var content = new StringContent(writerList, Encoding.UTF8, "application/json");
            var responseMessage = await httpClient.PutAsync("https://localhost:44336/api/Default/", content);

            if (responseMessage.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            return View(writerList);
        }

        //API İle Veri Silme
        public async Task<IActionResult> DeleteWriterAPI(int id)
        {
            var httpClient = new HttpClient();
            var responseMessage = await httpClient.DeleteAsync("https://localhost:44336/api/Default/" + id);

            if (responseMessage.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            return View();
        }
    }

    public class Class1
    {
        public int WriterID { get; set; }
        public string WriterName { get; set; }
    }
}