using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.Repositories;
using EntityLayer.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.EntityFramework
{
    public class EfBlogRepository : GenericRepository<Blog>, IBlogDal
    {
        public List<Blog> GetListWithCategory()
        {
            //IBlogDal içerisine yeni bir metod eklediğimiz için burası hata verdi. Dedi ki;
            //Kardeşim sen o interface' ye bir metod tanımladıysan burada onu kullanmak zorundasın.
            //Bizde kızmasın dediğini yaptık. GetListWithCategory Metodunu çağırarak EFCore içerisinde ki Include fonksiyonunu kullandık.
            //Ve Category tablosundan ilişkili Blog' un Katefori ID'si ne ise onu burada getirdik.
            //Bu Olaya Eager Loading Deniyor.

            using (var c = new Context())
            {
                return c.Blogs.Include(x => x.Category).ToList();
            }
        }
    }
}