/*Bu trigger BlogRating tablosuna yorum yapýldýðýnda*/
Create Trigger AddBlogInRatingTable
on Blogs
After Insert
As
Declare @ID int
Select @ID = BlogID from inserted
Insert Into BlogRatings (BlogID, BlogTotalScore, BlogRatingCount) Values (@ID, 0, 0)

/*Bu Trigger Ýse Yoruma Puan Verildiyse O Puaný DB' ye Yansýtýr*/
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

/*Burasýda Yorum Güncellendiðinde Tetiklenecek Ýþlemler*/
Create Trigger UpdateRaytings
on Comments 
After update 
As
Declare @Score int
Declare @BlogID int
select @BlogID = BlogID , @Score = BlogScore  from inserted
Update BlogRatings set BlogTotalScore += @Score  Where BlogID = @BlogID