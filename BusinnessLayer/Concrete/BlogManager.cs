using BusinnessLayer.Abstract;
using DataAccessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.Concrete
{
    public class BlogManager : IBlogService
    {
        IBlogDal _blogDal;

        public BlogManager(IBlogDal blogDal)
        {
            _blogDal = blogDal;
        }

        public void TAdd(Blog t)
        {
            _blogDal.Insert(t);
        }

        public void TDelete(Blog t)
        {
            _blogDal.Delete(t);
        }

        public void TUpdate(Blog t)
        {
            _blogDal.Update(t);
        }

        public List<Blog> GetBlogListWithCategory()
        {
            return _blogDal.GetListWithCategory();
        }

        public Blog GetById(int id)
        {
            return _blogDal.GetByID(id);
        }

        public List<Blog> GetBlogByID(int id)
        {
            return _blogDal.GetListAll(x => x.BlogID == id);
        }
       
        public List<Blog> GetList()
        {
            return _blogDal.GetListAll();
        }

        public List<Blog> GetLast3Blog()
        {
            //Footer' daki 3 Blog'u DB' den Getirdiğimiz Sorgu
            return _blogDal.GetListAll().Take(3).ToList();
        }

        public List<Blog> GetBlogListByWriter(int id)
        {
            //Burası da Yazarın Diğer Yazıları Alanı. Yazar ID' sine göre yazıları getiriyoruz
            return _blogDal.GetListAll(x => x.WriterID == id);
        }

        public List<Blog> GetListCategoryWriter(int id)
        {
            //Yazar Panelinde Kategorilerin Adını Getiriyoruz. O Yazarın Yazı Yazdığı Kategoriyi Yani
            return _blogDal.GetListWithCategoryByWriter(id);
        }
        public List<Blog> GetListBlogCategory(int id)
        {
            //Hangi Kategoride Kaç Yazı Varsa Ona Göre Getirme İşlemi Yapıyoruz.
            return _blogDal.GetListWithCategoryByBlogs(id);
        }

        public List<Blog> TGetList()
        {
            throw new NotImplementedException();
        }

        public Blog TGetById(int id)
        {
            throw new NotImplementedException();
        }

        public List<Blog> GetBlogsByCategoryId(int categoryId)
        {
            return _blogDal.GetListByCategoryId(categoryId);
        }

        public Blog GetBlogByUrl(string blogUrl)
        {
            return _blogDal.GetBlogByUrl(blogUrl);
        }
    }
}