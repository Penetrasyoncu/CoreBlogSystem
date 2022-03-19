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
    public class AppUserManager : IUserService
    {
        IUserDal _userDal;

        public AppUserManager(IUserDal userDal)
        {
            _userDal = userDal;
        }

        public void TAdd(AppUser t)
        {
            throw new NotImplementedException();
        }

        public void TDelete(AppUser t)
        {
            throw new NotImplementedException();
        }

        public AppUser TGetById(int id)
        {
            return _userDal.GetByID(id);
        }

        public List<AppUser> TGetList()
        {
            throw new NotImplementedException();
        }

        public void TUpdate(AppUser t)
        {
            _userDal.Update(t);
        }
    }
}