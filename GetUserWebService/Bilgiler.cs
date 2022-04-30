using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GetUserWebService
{
    public class Bilgiler
    {
        /*Burası önemli çünkü DB' den gelen verilerimizi bu sınıf üzerinde tutup kullanıcıya göndereceğiz ya da tutup bir yerlerde göstereceğiz*/
        public int ID { get; set; }
        public string Adi { get; set; }
        public string Soyadi { get; set; }
    }
}