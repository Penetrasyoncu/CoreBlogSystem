using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Newsletter
    {
        [Key]
        public int MailID { get; set; }
        public string MailAdress { get; set; }
        public bool MailStatus { get; set; }
        public DateTime MailAddDate { get; set; }
    }
}