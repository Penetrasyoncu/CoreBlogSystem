using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Abstract
{
    /*Burada yapmaya çalıştığımız şey sistemi GENERİC bir yapıya sokmak.
     Her sınıf için interface ve repository oluşturacağımıza Repositorylerden gelen entityleri buraya gönderip işlem yaptıracağız.
     Yani hangi sınıftan gelirse gelsin ekleme, silme, güncelleme gibi işlemler yaptırabileceğimiz bir alan olacak burası
     Bunun için de tek bir interface oluşturup fonksiyonlarımızı yazacağız. Aşağıdaki şekilde oluşturmamız yeterli.
     Dedik ki; T değeri alarak entityleri al ve where koşulu ile class lar kullanılabilsin*/
    public interface IGenericDal<T> where T : class
    {
        void Insert(T t);
        void Delete(T t);
        void Update(T t);
        List<T> GetListAll();
        T GetByID(int id);
    }
}