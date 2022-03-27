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
    public class CommentManager : ICommentService
    {
        ICommentDal _commentdal;

        public CommentManager(ICommentDal commentdal)
        {
            _commentdal = commentdal;
        }

        public void CommentAdd(Comment comment)
        {
            _commentdal.Insert(comment);
        }

        public List<Comment> GetCommentWithBlog()
        {
            return _commentdal.GetListWithBlog();
        }

        public List<Comment> GetList(int id)
        {
            return _commentdal.GetListAll(x => x.BlogID == id);
        }

        public void TAdd(Comment t)
        {
            throw new NotImplementedException();
        }

        public void TDelete(Comment t)
        {
            throw new NotImplementedException();
        }

        public Comment TGetById(int id)
        {
            return _commentdal.GetByID(id);
        }

        public List<Comment> TGetList()
        {
            throw new NotImplementedException();
        }

        public void TUpdate(Comment t)
        {
            _commentdal.Update(t);
        }
    }
}