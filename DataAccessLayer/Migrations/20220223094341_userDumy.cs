using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccessLayer.Migrations
{
    public partial class userDumy : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Writers",
                columns: new[] { "WriterID", "WriterAbout", "WriterAddDate", "WriterImage", "WriterMail", "WriterName", "WriterPassword", "WriterStatus" },
                values: new object[] { 1, "FirstUser", new DateTime(2022, 2, 23, 12, 43, 40, 339, DateTimeKind.Local).AddTicks(3277), "/CoreBlogTemplate/images/t1.jpg", "test@test.com", "Admin", "123", true });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Writers",
                keyColumn: "WriterID",
                keyValue: 5);
        }
    }
}
