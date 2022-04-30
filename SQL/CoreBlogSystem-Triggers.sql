/*Bu trigger BlogRating tablosuna yorum yap�ld���nda*/
Create Trigger AddBlogInRatingTable
on Blogs
After Insert
As
Declare @ID int
Select @ID = BlogID from inserted
Insert Into BlogRatings (BlogID, BlogTotalScore, BlogRatingCount) Values (@ID, 0, 0)

/*Bu Trigger �se Yoruma Puan Verildiyse O Puan� DB' ye Yans�t�r*/
Create Trigger AddScoreInComment
on Comments
After Insert
As
Declare @ID int
Declare @Score int
Declare @RatingCount int
Select @ID = BlogID, @Score = BlogScore from inserted
update BlogRatings set BlogTotalScore = BlogTotalScore + @Score, BlogRatingCount += 1
where BlogID=@ID

/*Buras�da Yorum G�ncellendi�inde Tetiklenecek ��lemler*/
Create Trigger UpdateRaytings
on Comments 
After update 
As
Declare @Score int
Declare @BlogID int
select @BlogID = BlogID , @Score = BlogScore  from inserted
Update BlogRatings set BlogTotalScore += @Score  Where BlogID = @BlogID