/*Bu prosed�rde yapt���m�z bir parametre olu�turmak IDParam ad�nda ve bunu DB' de kar��l�k gelen bir kay�t varsa al�p getirmek

Yani senaryo olarak anlatmam gerekirse; IDParam isminde d��ar�dan �rn; 5 de�eri gelecek ve bu parametre bu 5 de�erini tutacak/ta��yacak.
Sonras�nda Kisiler tablosunda bu 5 var m�? diye select sorgusu ile kontrol edecek. E�er varsa prosed�r �al��m�� olacak ve bu 5 ID' sine 
kar��l�k gelen Ki�i kimse bize onu getirecek.

Store Prosed�rler programc�l�k olaylar�nda �ok i�e yarayan yap�lard�r. Tam kar��l��� SAKLI YORDAM - Saklama Yordam� gibi �evrilir.
Ama�lar� kendilerine verilen emirleri yerine getirip veriyi getirmek. 

*** Biz buradan gidi�/geli�li bir yol yapaca��z �imdi. Yani 5 de�erinde bilgi gelicek. Gidicek Tabloya kontrol edecek var m� yok mu?
Bize ona g�re cevap d�necek. Varsa bilgiyi getirecek yoksa uyar� verecek.

*/
CREATE PROCEDURE SP_BILGILERIGETIR
(
	@IDParam int
)
AS
BEGIN
SELECT * FROM Kisiler WHERE ID = @IDParam
END