using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Repositories
{
    /*İşte burada GENERİC REPOSİTORY yaklaşımının temel mantığını gördük.
      Burda yapmak istediğimiz şey; öyle bir mimari kuralım ki; Nereye ekleme işlemi yaparsak yapalım aşağıdaki fonksiyon çalışsın.
      Nereye silme, güncelleme işlemi yapmak istersek aşağıdaki işlemler çalışsın. Her sınıf için ayrı ayrı ekle sil gibi fonksiyonlar çalıştırmayalım*/
    public class GenericRepository<T> : IGenericDal<T> where T : class
    {
        public void Delete(T t)
        {
            using var c = new Context();
            c.Remove(t);
            c.SaveChanges();
        }

        public T GetByID(int id)
        {
            using var c = new Context();
            return c.Set<T>().Find(id);
        }

        public List<T> GetListAll()
        {
            using var c = new Context();
            return c.Set<T>().ToList();
        }

        public void Insert(T t)
        {
            using var c = new Context();
            c.Add(t);
            c.SaveChanges();
        }

        public List<T> GetListAll(Expression<Func<T, bool>> filter)
        {
            //Burası Listelemek için gelen değere göre listeleyecek.
            using var c = new Context();
            return c.Set<T>().Where(filter).ToList();
        }

        public void Update(T t)
        {
            using var c = new Context();
            c.Update(t);
            c.SaveChanges();
        }
    }
}