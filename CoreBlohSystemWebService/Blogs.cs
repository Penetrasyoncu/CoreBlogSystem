using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoreBlogSystemWebService
{
    public class Blogs
    {
        public int BlogID { get; set; }
        public string BlogTitle { get; set; }
        public string BlogContent { get; set; }
        public string BlogImage { get; set; }
        public DateTime BlogCreateDate { get; set; }
        public int BlogStatus { get; set; }
    }
}