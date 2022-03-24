using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.Reports
{
    public class ExcelReports<T>
    {
        //Burada Excel Raporu Alabilmek İçin Generic Bir Fonksiyon Oluşturduk.
        //Bu generic yapıda Export fonksiyonunun içerisine Entitylerimizi gönderiyor ve excel çıktısı almasını söylüyoruz.
        public static byte[] Export(List<T> items)
        {
            using (var workBook = new XLWorkbook())
            {
                var workSheet = workBook.Worksheets.Add(typeof(T).Name + " Listesi");

                var props = TypeDescriptor.GetProperties(typeof(T));

                var ct = 1;
                foreach (PropertyDescriptor prop in props)
                    workSheet.Cell(1, ct++).Value = prop.Name;

                var row = 2;
                ct = 1;
                foreach (var item in items)
                {
                    foreach (PropertyDescriptor prop in props)
                        workSheet.Cell(row, ct++).Value = prop.GetValue(item);
                    row++;
                    ct = 1;
                }

                using (var stream = new MemoryStream())
                {
                    workBook.SaveAs(stream);
                    var content = stream.ToArray();
                    return content;
                }
            }
        }
    }
}