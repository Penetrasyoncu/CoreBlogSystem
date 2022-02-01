using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.Abstract
{
    public interface IGenericService<T>
    {
        //Burası Refactoring yaptığımızda oluşturduğumuz kısım. Yani Servislerinde Generic olması için yaptığımız işlemler
        //10 tane ekleme silme güncelleme kodu yazacağımıza 1 yerde yazar orayı kullanırız.
        //public interface IGenericService<T> T dediğimiz sen bir entity yani class al içeriye onu baz alarak işlem yap.

        void TAdd(T t);
        void TDelete(T t);
        void TUpdate(T t);
        List<T> TGetList();
        T TGetById(int id);
    }
}