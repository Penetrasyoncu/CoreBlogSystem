/*Bu prosedürde yaptýðýmýz bir parametre oluþturmak IDParam adýnda ve bunu DB' de karþýlýk gelen bir kayýt varsa alýp getirmek

Yani senaryo olarak anlatmam gerekirse; IDParam isminde dýþarýdan örn; 5 deðeri gelecek ve bu parametre bu 5 deðerini tutacak/taþýyacak.
Sonrasýnda Kisiler tablosunda bu 5 var mý? diye select sorgusu ile kontrol edecek. Eðer varsa prosedür çalýþmýþ olacak ve bu 5 ID' sine 
karþýlýk gelen Kiþi kimse bize onu getirecek.

Store Prosedürler programcýlýk olaylarýnda çok iþe yarayan yapýlardýr. Tam karþýlýðý SAKLI YORDAM - Saklama Yordamý gibi çevrilir.
Amaçlarý kendilerine verilen emirleri yerine getirip veriyi getirmek. 

*** Biz buradan gidiþ/geliþli bir yol yapacaðýz þimdi. Yani 5 deðerinde bilgi gelicek. Gidicek Tabloya kontrol edecek var mý yok mu?
Bize ona göre cevap dönecek. Varsa bilgiyi getirecek yoksa uyarý verecek.

*/
CREATE PROCEDURE SP_BILGILERIGETIR
(
	@IDParam int
)
AS
BEGIN
SELECT * FROM Kisiler WHERE ID = @IDParam
END