using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Repositories
{
    /*Burası Category Sınıfına Ait CRUD işlemlerinin yapıldığı yer*/
    public class CategoryRepository : ICategoryDal
    {
        /*Burada ICategoryDal İNTERFACE'sinden miras aldığımız tüm void türündeki fonksiyonları implemente ettik.
         * Daha sonrasında Veritabanımıza DataAccessLayer içerisindeki Context sınıfından bağlandığımız için
         o sınıfın türünde c isminde bir değişken oluşturarak new leme işlemi yaptık.
         sonrasında ekleme, silme, güncelleme, id ye göre getirme ve listeleme fonksiyonlarımızı doldurduk.
         böylece bu fonksiyonlar veritabanı işlemlerimizdeki fonksiyonlarımız oldu
        
         Bu yöntem NEW' leme yöntemidir. c isminde tek bir değişken oluşturarak diğer işlemleri hallettik.*/
        Context c = new Context();

        public void AddCategory(Category category)
        {
            c.Add(category);
            c.SaveChanges();
        }

        public void Delete(Category t)
        {
            throw new NotImplementedException();
        }

        public void DeleteCategory(Category category)
        {
            c.Remove(category);
            c.SaveChanges();
        }

        public Category GetById(int id)
        {
            return c.Categories.Find(id);
        }

        public Category GetByID(int id)
        {
            throw new NotImplementedException();
        }

        public List<Category> GetListAll()
        {
            throw new NotImplementedException();
        }

        public void Insert(Category t)
        {
            throw new NotImplementedException();
        }

        public List<Category> ListAllCategory()
        {
            return c.Categories.ToList();
        }

        public void Update(Category t)
        {
            throw new NotImplementedException();
        }

        public void UpdateCategory(Category category)
        {
            c.Update(category);
            c.SaveChanges();
        }
    }
}
