using DataAccessLayer.Concrete;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.ValidationRules
{
    public static class bCounties
    {
        public static County GetById(int id)
        {
            var model = new County();
            using (Context db = new Context())
            {
                model = db.Counties.FirstOrDefault(w => w.Id == id);
            }

            return model;
        }
    }
}