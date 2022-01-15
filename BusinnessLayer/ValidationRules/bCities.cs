using DataAccessLayer.Concrete;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinnessLayer.ValidationRules
{
    public static class bCities
    {
        public static List<City> GetAll()
        {
            var model = new List<City>();
            using (Context db = new Context())
            {
                model = db.Cities.OrderBy(w => w.DisplayName).ToList();
            }

            return model;
        }

        public static City GetById(int id)
        {
            var model = new City();
            using (Context db = new Context())
            {
                model = db.Cities.FirstOrDefault(w => w.Id == id);
            }

            return model;
        }

        public static City GetByName(string CityName)
        {
            var model = new City();
            using (Context db = new Context())
            {
                model = db.Cities.FirstOrDefault(w => w.DisplayName.Contains(CityName));
            }

            return model;
        }

        public static List<County> GetCounties(int id)
        {
            var model = new List<County>();
            using (Context db = new Context())
            {
                model = db.Counties.Where(w => w.CityId == id).OrderBy(w => w.DisplayName).ToList();
            }

            return model;
        }
    }
}
