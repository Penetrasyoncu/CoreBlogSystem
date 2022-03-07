using ClosedXML.Excel;
using CoreBlogSystem.Areas.Admin.Models;
using DataAccessLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace CoreBlogSystem.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ExcelExportController : Controller
    {
        public IActionResult ExportStaticExcelBlogList()
        {
            using (var workBook = new XLWorkbook())
            {
                var workSheet = workBook.Worksheets.Add("Blog Listesi");
                workSheet.Cell(1, 1).Value = "Blog ID";
                workSheet.Cell(1, 2).Value = "Blog Adı";
                workSheet.Cell(1, 3).Value = "Blog İçeriği";
                workSheet.Cell(1, 4).Value = "Blog Durumu";
                workSheet.Cell(1, 5).Value = "Blog Oluşturulma Tarihi";
                workSheet.Cell(1, 6).Value = "Blog URL";

                int BlogRowCount = 2;
                foreach (var item in BlogExportExcelDb())
                {
                    workSheet.Cell(BlogRowCount, 1).Value = item.ID;
                    workSheet.Cell(BlogRowCount, 2).Value = item.BlogName;
                    workSheet.Cell(BlogRowCount, 3).Value = item.BlogContent;
                    workSheet.Cell(BlogRowCount, 4).Value = item.BlogStatus;
                    workSheet.Cell(BlogRowCount, 5).Value = item.BlogCreateDate;
                    workSheet.Cell(BlogRowCount, 6).Value = item.BlogUrl;
                    BlogRowCount++;
                }

                using (var stream = new MemoryStream())
                {
                    workBook.SaveAs(stream);
                    var content = stream.ToArray();
                    return File(content, "application / vnd.openxmlformats-officedocument.spreadsheetml.sheet", "BlogListesi.xlsx");
                }
            }
        }

        //Aşağıdaki Fonksiyon Test Amaçlı Kalabilir. DB' den değilde test verileri çekmek için
        public List<BlogExcelExportModel> GetBlogList()
        {
            List<BlogExcelExportModel> bm = new List<BlogExcelExportModel>
            {
                new BlogExcelExportModel {ID = 1, BlogName = "C# Ders"},
                new BlogExcelExportModel {ID = 2, BlogName = "Flutter Ders"},
                new BlogExcelExportModel {ID = 3, BlogName = "Java Ders"}
            };
            return bm;
        }

        public List<BlogExcelExportModel> BlogExportExcelDb()
        {
            List<BlogExcelExportModel> bm = new List<BlogExcelExportModel>();
            using (var c = new Context())
            {
                bm = c.Blogs.Select(x => new BlogExcelExportModel
                {
                    ID = x.BlogID,
                    BlogName = x.BlogTitle,
                    BlogContent = x.BlogContent,
                    BlogStatus = (int)x.BlogStatus,
                    BlogCreateDate = x.BlogCreateDate,
                    BlogUrl = x.BlogUrl
                }).ToList();
            }
            return bm;
        }

        public IActionResult BlogListExcel()
        {
            return View();
        }
    }
}
