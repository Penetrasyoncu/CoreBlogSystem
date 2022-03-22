using DataAccessLayer.Concrete;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace CoreBlogSystemAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DefaultController : ControllerBase
    {
        //API ile Veri Getirme
        [HttpGet]
        public IActionResult WriterList()
        {
            using var dbContext = new Context();
            var values = dbContext.Writers.ToList();
            return Ok(values);
        }

        //API ile Veri EKleme
        [HttpPost]
        public IActionResult WriterAdd(Writer writer)
        {
            using var dbContext = new Context();
            dbContext.Add(writer);
            dbContext.SaveChanges();
            return Ok();
        }

        //API ile ID' ye Göre Getirme
        [HttpPost("{id}")]
        public IActionResult WriterGet(int id)
        {
            using var dbContext = new Context();
            var writer = dbContext.Writers.Find(id);
            if (writer == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(writer);
            }

        }

        //API ile ID' ye Göre Silme
        [HttpDelete("{id}")]
        public IActionResult WriterDelete(int id)
        {
            using var dbContext = new Context();
            var writer = dbContext.Writers.Find(id);
            if (writer == null)
            {
                return NotFound();
            }
            else
            {
                dbContext.Remove(writer);
                dbContext.SaveChanges();
                return Ok();
            }
        }

        //API ile ID' ye Göre Güncelleme
        [HttpPut]
        public IActionResult WriterUpdate(Writer writer)
        {
            using var context = new Context();
            var writersDb = context.Find<Writer>(writer.WriterID);
            if (writersDb == null)
            {
                return NotFound();
            }
            else
            {
                writersDb.WriterName = writer.WriterName;
                context.Update(writersDb);
                context.SaveChanges();
                return Ok();
            }
        }
    }
}