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
        public List<Message2> GetListWithMessageByWriter(int id)
        {
            using (var c = new Context())
            {
                //Burada Alıcısı Olduğumuz Mesajı Listelemek İçin İnclude Metodunu Kullandık. Yani Giriş Yaapan Gelen Mesajları Listelemek İçin
                return c.Message2.Include(x => x.SenderUserIdentity).Where(x => x.ReceiverID == id).ToList();
            }
        }

        public List<Message2> GetSendWithMessageByWriter(int id)
        {
            using (var context = new Context())
            {
                //Burada da Gönderisi Olduğumuz, Yani Gönderdiğimiz Mesajları Listelemek İçin Yazdık Bu Metodu
                return context.Message2.Include(x => x.RecieverUserIdentity).Where(y => y.SenderID == id).ToList();
            }
        }
    }
}