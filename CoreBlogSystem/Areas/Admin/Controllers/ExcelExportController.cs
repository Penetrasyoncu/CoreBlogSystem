using ClosedXML.Excel;
using CoreBlogSystem.Areas.Admin.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.IO;

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

                int BlogRowCount = 2;
                foreach (var item in GetBlogList())
                {
                    workSheet.Cell(BlogRowCount, 1).Value = item.ID;
                    workSheet.Cell(BlogRowCount, 2).Value = item.BlogName;
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

        public IActionResult BlogListExcel()
        {

            return View();
        }
    }
}
