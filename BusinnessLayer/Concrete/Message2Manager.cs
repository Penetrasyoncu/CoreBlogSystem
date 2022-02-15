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
    public class Message2Manager : IMessage2Service
    {
        IMessage2Dal _messagedal;

        public Message2Manager(IMessage2Dal messagedal)
        {
            _messagedal = messagedal;
        }

        public List<Message2> GetInboxListByWriter(int id)
        {
            //Burada Alıcı Biz İsek Mesajı Gösterecek. Yani haliyle bize gelen mesajı :-)
            return _messagedal.GetListAll(x => x.ReceiverID == id);
        }

        public void TAdd(Message2 t)
        {
            throw new NotImplementedException();
        }

        public void TDelete(Message2 t)
        {
            throw new NotImplementedException();
        }

        public Message2 TGetById(int id)
        {
            throw new NotImplementedException();
        }

        public List<Message2> TGetList()
        {
            return _messagedal.GetListAll();
        }

        public void TUpdate(Message2 t)
        {
            throw new NotImplementedException();
        }
    }
}