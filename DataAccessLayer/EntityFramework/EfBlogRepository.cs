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
        private readonly Context _context;

        public EfBlogRepository(Context context) : base(context)
        {
            _context = context;
        }

        public Blog GetBlogByUrl(string url)
        {
            return _context.Blogs.Include(x => x.Category).FirstOrDefault(x => x.BlogUrl == url);
        }

        public List<Blog> GetListByCategoryId(int categoryId)
        {
            return _context.Blogs.Include(x => x.Category).Where(x => x.CategoryID == categoryId).ToList();
        }

        public List<Blog> GetListWithCategory()
        {
            //IBlogDal içerisine yeni bir metod eklediğimiz için burası hata verdi. Dedi ki;
            //Kardeşim sen o interface' ye bir metod tanımladıysan burada onu kullanmak zorundasın.
            //Bizde kızmasın dediğini yaptık. GetListWithCategory Metodunu çağırarak EFCore içerisinde ki Include fonksiyonunu kullandık.
            //Ve Category tablosundan ilişkili Blog' un Katefori ID'si ne ise onu burada getirdik.
            //Bu Olaya Eager Loading Deniyor.            
            return _context.Blogs.Include(x => x.Category).ToList();
        }

        public List<Blog> GetListWithCategoryByBlogs(int id)
        {

            //Burada da o Kategoriye Ait Kaç Yazı Varsa Onları Listeleyeceğiz
            return _context.Blogs.Include(x => x.Category).Where(i => i.CategoryID == id).ToList();

        }

        public List<Blog> GetListWithCategoryByWriter(int id)
        {
            //Yazar Panelinde Kategorilerin Adını Getiriyoruz. O Yazarın Yazı Yazdığı Kategoriyi Yani
            return _context.Blogs.Include(x => x.Category).Where(x => x.WriterID == id).ToList();
        }
    }
}