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
    public class EfMessage2Repository : GenericRepository<Message2>, IMessage2Dal
    {
        private readonly Context _context;
        public EfMessage2Repository(Context context) : base(context)
        {
            _context = context;
        }
        public List<Message2> GetListWithMessageByWriter(int id)
        {
            //Burada Alıcısı Olduğumuz Mesajı Listelemek İçin İnclude Metodunu Kullandık
            return _context.Message2.Include(x => x.SenderUser).Where(x => x.ReceiverID == id).ToList();
        }
    }
}