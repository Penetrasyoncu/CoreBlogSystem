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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //Burası 1 tabloda 1'den fazla ilişki kurmak için yaptığımız bir işlem. Mesajlaşma için yaptık.
            // Bir mesaj gönderen hem alıcı hem de gönderici olabilir bundan dolayı bu işlemi yaptık.
            // İlk olarak Message2 sınıfında gönderen kullanıcıyı yazar sınıfında gönderen yazar olarak belirttik
            // Sonra da. yine aynı sınıfta alıcı kısmını yazar sınıfında oluşturduğumuz alıcı yazar olarak belirttik
            // Böylece karşılıklı gönderici ve alıcı olabilecekler.

            modelBuilder.Entity<Message2>()
                .HasOne(x => x.SenderUser)
                .WithMany(y => y.WriterSender)
                .HasForeignKey(z => z.SenderID)
                .OnDelete(DeleteBehavior.ClientSetNull);

            modelBuilder.Entity<Message2>()
                .HasOne(x => x.RecieverUser)
                .WithMany(y => y.WriterReceiver)
                .HasForeignKey(z => z.ReceiverID)
                .OnDelete(DeleteBehavior.ClientSetNull);
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
        public DbSet<Newsletter> Newsletters { get; set; }
        public DbSet<BlogRating> BlogRatings { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Message2> Message2 { get; set; }
    }
}