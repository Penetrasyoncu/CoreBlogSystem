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
        private readonly Context _context;
        public EfCategoryRepository(Context context) : base(context)
        {
            _context = context;
        }
        public Category GetCategoryByUrl(string url)
        {
            return _context.Categories.FirstOrDefault(x => x.CategorUrl == url);
        }
    }
}