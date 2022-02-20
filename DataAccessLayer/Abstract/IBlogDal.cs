using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Abstract
{
    public interface IBlogDal : IGenericDal<Blog>
    {
        //Burası IGenericDal içerisinde ki metodları kullanabilen bir inteface.
        //Yani biz buraya yazacağımız metodlar bloga kategoriye özgü olabilir başka yerlerde çağırabiliriz.
        List<Blog> GetListWithCategory();
        List<Blog> GetListByCategoryId(int categoryId);
        List<Blog> GetListWithCategoryByWriter(int id);
        List<Blog> GetListWithCategoryByBlogs(int id);
        Blog GetBlogByUrl(string url);
    }
}