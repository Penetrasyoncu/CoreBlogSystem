USE [CoreBlogDb]
GO
/****** Object:  StoredProcedure [dbo].[SP_GETBLOGS]    Script Date: 4/30/2022 7:44:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GETBLOGS]
(
	@BlogID varchar(max)
)
AS
BEGIN
SELECT * FROM Blogs WHERE BlogID = @BlogID
END