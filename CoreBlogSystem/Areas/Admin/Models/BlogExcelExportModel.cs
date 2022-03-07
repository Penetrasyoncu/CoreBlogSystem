using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CoreBlogSystem.Areas.Admin.Models
{
    public class BlogExcelExportModel
    {
        public int ID { get; set; }
        public string BlogName { get; set; }
        public string BlogContent { get; set; }
        public int BlogStatus { get; set; }
        public DateTime BlogCreateDate { get; set; }
        public string BlogUrl { get; set; }
    }
}