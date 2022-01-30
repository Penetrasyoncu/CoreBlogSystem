using EntityLayer.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Concrete
{
    public class Context : DbContext
    {
        /*Burası Veritabanına bağlandığımız alan. Aşağıdaki bağlantı cümlesi ile veritabanı oluşturuyor ya da bağlanıyoruz*/
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("server=(localdb)\\MSSQLLocalDB;database=CoreBlogDb;integrated security=true;");
        }

        /*Aşağıdaki Tanımladığımız DBSET' ler veritabanına açılacak tablolarımızın isimleri
         Burada DBSET türünde Entity katmanından referans alarak oluşturduğumuz sınıflar veritabanına yukarıdaki
        connectionstringimizi kullanarak açacak tablolarımızı*/

        public DbSet<About> Abouts { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Writer> Writers { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<County> Counties { get; set; }
        public DbSet<Newsletter> Newsletters{ get; set; }
        public DbSet<BlogRating> BlogRatings{ get; set; }
    }
}