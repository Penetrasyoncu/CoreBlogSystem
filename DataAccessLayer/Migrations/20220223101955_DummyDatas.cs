using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccessLayer.Migrations
{
    public partial class DummyDatas : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Writers",
                keyColumn: "WriterID",
                keyValue: 5);

            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "CategoryID", "CategorUrl", "CategoryDescription", "CategoryName", "CategoryStatus" },
                values: new object[] { 1, "first-category", "First Category", "First Category", true });

            migrationBuilder.InsertData(
                table: "Writers",
                columns: new[] { "WriterID", "WriterAbout", "WriterAddDate", "WriterImage", "WriterMail", "WriterName", "WriterPassword", "WriterStatus" },
                values: new object[] { 1, "FirstUser", new DateTime(2022, 2, 23, 13, 19, 54, 573, DateTimeKind.Local).AddTicks(3108), "/CoreBlogTemplate/images/t1.jpg", "test@test.com", "Admin", "123", true });

            migrationBuilder.InsertData(
                table: "Blogs",
                columns: new[] { "BlogID", "BlogContent", "BlogCreateDate", "BlogImage", "BlogStatus", "BlogThumbnailImage", "BlogTitle", "BlogUrl", "CategoryID", "WriterID" },
                values: new object[] { 1, "FirsBlogLorem, FirsBlogLorem ,FirsBlogLorem", new DateTime(2022, 2, 23, 13, 19, 54, 577, DateTimeKind.Local).AddTicks(8238), "/CoreBlogTemplate/images/1.jpg", true, "Thumbnail", "FirstBlog", "first-blog", 1, 1 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Blogs",
                keyColumn: "BlogID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "CategoryID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Writers",
                keyColumn: "WriterID",
                keyValue: 1);

            migrationBuilder.InsertData(
                table: "Writers",
                columns: new[] { "WriterID", "WriterAbout", "WriterAddDate", "WriterImage", "WriterMail", "WriterName", "WriterPassword", "WriterStatus" },
                values: new object[] { 5, "Yeni Yazar", new DateTime(2022, 2, 23, 12, 43, 40, 339, DateTimeKind.Local).AddTicks(3277), "/CoreBlogTemplate/images/t1.jpg", "deneme@denem.com", "ugurCan", "123", true });
        }
    }
}
