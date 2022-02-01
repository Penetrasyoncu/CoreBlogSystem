﻿using BusinnessLayer.Abstract;
using DataAccessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.Concrete
{
    public class WriterManager : IWriterService
    {
        IWriterDal _writerdal;

        public WriterManager(IWriterDal writerdal)
        {
            _writerdal = writerdal;
        }
                
        public List<Writer> GetWriterListById(int id)
        {
            //Dashboard' daki Yazar Hakkında Kısmını  Getirmek için kullanıyoruz. Giriş yapan kullanıcının hakkında bilgisi
            return _writerdal.GetListAll(x => x.WriterID == id);
        }

        public void TAdd(Writer t)
        {
            _writerdal.Insert(t);
        }

        public void TDelete(Writer t)
        {
            throw new NotImplementedException();
        }

        public void TUpdate(Writer t)
        {
            throw new NotImplementedException();
        }

        public List<Writer> TGetList()
        {
            throw new NotImplementedException();
        }

        public Writer TGetById(int id)
        {
            return _writerdal.GetByID(id);
        }
    }
}