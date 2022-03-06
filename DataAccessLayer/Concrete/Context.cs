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

            modelBuilder.Entity<Writer>().HasData(
                new Writer
                {
                    WriterID = 1,
                    WriterName = "Admin",
                    WriterAbout = "FirstUser",
                    WriterImage = "/CoreBlogTemplate/images/t1.jpg",
                    WriterMail = "test@test.com",
                    WriterPassword = "123",
                    WriterStatus = true,
                    WriterAddDate = DateTime.Now
                });

            modelBuilder.Entity<Blog>().HasData(
                new Blog
                {
                    BlogID = 1,
                    BlogTitle = "FirstBlog",
                    BlogContent = "FirsBlogLorem, FirsBlogLorem ,FirsBlogLorem",
                    BlogThumbnailImage = "Thumbnail",
                    BlogImage = "/CoreBlogTemplate/images/1.jpg",
                    BlogCreateDate = DateTime.Now,
                    BlogStatus = CoreBlogSystem.Helpers.Enums.Status.Aktif,
                    CategoryID = 1,
                    WriterID = 1,
                    BlogUrl = "first-blog"
                });

            modelBuilder.Entity<Category>().HasData(
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "First Category",
                    CategoryDescription = "First Category",
                    CategoryStatus = CoreBlogSystem.Helpers.Enums.Status.Aktif,
                    CategorUrl = "first-category"
                });
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