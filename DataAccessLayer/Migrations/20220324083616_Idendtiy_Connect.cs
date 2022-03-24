using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccessLayer.Migrations
{
    public partial class Idendtiy_Connect : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddForeignKey(
                name: "FK_Message2_AspNetUsers_ReceiverID",
                table: "Message2",
                column: "ReceiverID",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Message2_AspNetUsers_SenderID",
                table: "Message2",
                column: "SenderID",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Message2_AspNetUsers_ReceiverID",
                table: "Message2");

            migrationBuilder.DropForeignKey(
                name: "FK_Message2_AspNetUsers_SenderID",
                table: "Message2");
        }
    }
}
