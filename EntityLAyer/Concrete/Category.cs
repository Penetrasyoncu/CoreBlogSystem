using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Category
    {
        //Buraya DB' deki Tablolarımızın Kolonlarını Oluşturacağız.
        //Category Tablonun Adı ----- Aşağıda tanımlayacağımız Property ler ise Sütunlarım olacak.
        /*Aşağıda Tablolar Arası İlişki Yapıyoruz.
         Dedik ki; EntityLayer altındaki Blog sınıfını baz alarak bir liste oluştur.
        Sonra da Categors sınıfına giderek CategoryID ile aynı adı ver ki ilişki doğsun
        Yani Blog sınıfına gittim dedik ki; 
        Category sınıfında ki CategoryID den bir değer daha üret onu da CategoryID ye yapıştır*/

        [Key]
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
        public bool CategoryStatus { get; set; }        
        public string CategorUrl { get; set; }        
        public List<Blog> Blogs { get; set; }
    }
}