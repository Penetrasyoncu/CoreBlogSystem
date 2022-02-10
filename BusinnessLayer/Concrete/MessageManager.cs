using BusinnessLayer.Abstract;
using DataAccessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;

namespace BusinnessLayer.Concrete
{
    public class MessageManager : IMessageService
    {
        IMessageDal _messageDal;

        public MessageManager(IMessageDal messageDal)
        {
            _messageDal = messageDal;
        }

        public List<Message> GetInboxListByWriter(string p)
        {
            //Burada Alıcı Biz İsek Mesajı Gösterecek. Yani haliyle bize gelen mesajı :-)
            return _messageDal.GetListAll(x=>x.Receiver == p);
        }

        public List<Message> TGetList()
        {
            return _messageDal.GetListAll();
        }

        public void TAdd(Message t)
        {
            throw new NotImplementedException();
        }

        public void TDelete(Message t)
        {
            throw new NotImplementedException();
        }

        public Message TGetById(int id)
        {
            throw new NotImplementedException();
        }


        public void TUpdate(Message t)
        {
            throw new NotImplementedException();
        }
    }
}