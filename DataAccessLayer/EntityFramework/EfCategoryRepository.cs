using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.Repositories;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.EntityFramework
{
    public class EfCategoryRepository : GenericRepository<Category>, ICategoryDal
    {
        public Category GetCategoryByUrl(string url)
        {
            using (var c = new Context())
            {
                return c.Categories.FirstOrDefault(x=>x.CategorUrl == url);
            }
        }
    }
}