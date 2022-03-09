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
        private readonly Context _context;
        public GenericRepository(Context context)
        {
            _context = context;
        }

        public void Delete(T t)
        {

            _context.Remove(t);
            _context.SaveChanges();
        }

        public T GetByID(int id)
        {
            return _context.Set<T>().Find(id);
        }

        public List<T> GetListAll()
        {

            return _context.Set<T>().ToList();
        }

        public void Insert(T t)
        {
            _context.Add(t);
            _context.SaveChanges();
        }

        public List<T> GetListAll(Expression<Func<T, bool>> filter)
        {
            //Burası Listelemek için gelen değere göre listeleyecek.            
            return _context.Set<T>().Where(filter).ToList();
        }

        public void Update(T t)
        {
            _context.Update(t);
            _context.SaveChanges();
        }
    }
}