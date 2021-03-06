USE [CoreBlogDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[AboutID] [int] IDENTITY(1,1) NOT NULL,
	[AboutDetails1] [nvarchar](max) NULL,
	[AboutDetails2] [nvarchar](max) NULL,
	[AboutImage1] [nvarchar](max) NULL,
	[AboutImage2] [nvarchar](max) NULL,
	[AboutMapLocation] [nvarchar](max) NULL,
	[AboutStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[AboutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogRatings]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogRatings](
	[BlogRatingID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NOT NULL,
	[BlogTotalScore] [int] NOT NULL,
	[BlogRatingCount] [int] NOT NULL,
	[BlogRateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_BlogRatings] PRIMARY KEY CLUSTERED 
(
	[BlogRatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[BlogTitle] [nvarchar](max) NULL,
	[BlogContent] [nvarchar](max) NULL,
	[BlogThumbnailImage] [nvarchar](max) NULL,
	[BlogImage] [nvarchar](max) NULL,
	[BlogCreateDate] [datetime2](7) NOT NULL,
	[BlogStatus] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[WriterID] [int] NULL,
	[BlogUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[CategoryStatus] [bit] NOT NULL,
	[CategorUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentUserName] [nvarchar](max) NULL,
	[CommentTitle] [nvarchar](max) NULL,
	[CommentContent] [nvarchar](max) NULL,
	[CommentDate] [datetime2](7) NOT NULL,
	[CommentStatus] [bit] NOT NULL,
	[BlogID] [int] NOT NULL,
	[BlogScore] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactUserName] [nvarchar](max) NULL,
	[ContactMail] [nvarchar](max) NULL,
	[ContactSubject] [nvarchar](max) NULL,
	[ContactMessage] [nvarchar](max) NULL,
	[ContactDate] [datetime2](7) NOT NULL,
	[ContactStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counties]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
 CONSTRAINT [PK_Counties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message2]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message2](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NULL,
	[ReceiverID] [int] NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[MessageDetails] [nvarchar](max) NULL,
	[MessageDate] [datetime2](7) NOT NULL,
	[MessageStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Message2] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](max) NULL,
	[Receiver] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[MessageDetails] [nvarchar](max) NULL,
	[MessageDate] [datetime2](7) NOT NULL,
	[MessageStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newsletters]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newsletters](
	[MailID] [int] IDENTITY(1,1) NOT NULL,
	[MailAdress] [nvarchar](max) NULL,
	[MailStatus] [bit] NOT NULL,
	[MailAddDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Newsletters] PRIMARY KEY CLUSTERED 
(
	[MailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationType] [nvarchar](max) NULL,
	[NotificationTypeSymbol] [nvarchar](max) NULL,
	[NotificationDetails] [nvarchar](max) NULL,
	[NotificationDate] [datetime2](7) NOT NULL,
	[NotificationStatus] [bit] NOT NULL,
	[NotificationColor] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 22.02.2022 23:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[WriterID] [int] IDENTITY(1,1) NOT NULL,
	[WriterName] [nvarchar](max) NULL,
	[WriterAbout] [nvarchar](max) NULL,
	[WriterImage] [nvarchar](max) NULL,
	[WriterMail] [nvarchar](max) NULL,
	[WriterPassword] [nvarchar](max) NULL,
	[WriterStatus] [bit] NOT NULL,
	[WriterAddDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Writers] PRIMARY KEY CLUSTERED 
(
	[WriterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211225152006_mig1', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211225170441_mig2', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211225170838_mig3', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220114143544_CitiesCounties', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220114144804_Cities', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220115214500_0044', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220116090905_mig_Writer_blog_relation', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220117122120_mig_add_newsletter', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220119215129_mailBulten', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220130194910_mig_add_score_column', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220130195644_mig_add_score_BlogTatingTable', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220130203951_mig_add_score_BlogRateDate', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220208203538_NotificationTable', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220208211133_natiColorAdd', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220210195459_messageTable', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220214205049_Url', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220215202541_Messages-Relations', N'5.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220219153633_CategoryUrl', N'5.0.13')
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([AboutID], [AboutDetails1], [AboutDetails2], [AboutImage1], [AboutImage2], [AboutMapLocation], [AboutStatus]) VALUES (1, N'Hakkımızda Detay 1', N'Hakkımızda Detay 2', N'Hakkımızda Resim', N'Hakkımızda Resim 2', NULL, N'1')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogRatings] ON 

INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (1, 33, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (2, 9, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (3, 13, 97, 5, CAST(N'2022-02-21T23:22:07.2566667' AS DateTime2))
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (4, 15, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (5, 17, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (6, 18, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (7, 30, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (8, 31, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (9, 34, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (10, 35, 0, 0, NULL)
INSERT [dbo].[BlogRatings] ([BlogRatingID], [BlogID], [BlogTotalScore], [BlogRatingCount], [BlogRateDate]) VALUES (11, 36, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[BlogRatings] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (9, N'C# For Döngüsü', N'İçerik For Döngüsü - Lorem İpsum Dolor, 2 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Bitti', N'Thumbnail', N'/CoreBlogTemplate/images/1.jpg', CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), 1, 1, 1, N'csharp-for-dongusu')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (13, N'C# Do While Döngüsü', N'İçerik For Döngüsü - Lorem İpsum Dolor, 3 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Lorem ipsum dolor', N'Thumbnail', N'/CoreBlogTemplate/images/2.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 1, 1, N'csharp-dowhile-dongusu')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (15, N'C# Do Foreach Döngüsü', N'İçerik For Döngüsü - Lorem İpsum Dolor, 4 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolorasdasdasdasdasdasdasd', N'Thumbnail', N'/CoreBlogTemplate/images/3.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 1, 1, N'csharp-foreach-dongusu')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (17, N'C# Switch Yapısı', N'İçerik For Döngüsü - Lorem İpsum Dolor, 5 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Lorem ipsum dolor', N'Thumbnail', N'/CoreBlogTemplate/images/4.jpg', CAST(N'2022-01-04T00:00:00.0000000' AS DateTime2), 1, 1, 2, N'chsarp/switch-yapisi')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (18, N'God Of War', N'İçerik For Döngüsü - Lorem İpsum Dolor, 6 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Blog Detay sayfasına ulaşınız', N'Thumbnail', N'/CoreBlogTemplate/images/5.jpg', CAST(N'2022-01-04T00:00:00.0000000' AS DateTime2), 1, 2, 2, N'god-of-war')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (30, N'Yazar Panel Blog 1', N'Yazar Panel Blog İçerik For Döngüsü - Lorem İpsum Dolor, 3 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Lorem ipsum dolor', N'Thumbnail', N'/CoreBlogTemplate/images/6.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 4, 1, N'yazar-paneli')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (31, N'Teknoloji Yazısı', N'İçerik For Döngüsü - Lorem İpsum Dolor, 6 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Blog Detay sayfasına ulaşınız', N'Thumbnail', N'/CoreBlogTemplate/images/7.jpg', CAST(N'2022-01-30T15:40:36.0086785' AS DateTime2), 1, 2, 1, N'teknoloji-yazisi')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (33, N'Deneme Trigger', N'İçerik For Döngüsü - Lorem İpsum Dolor, 6 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Blog Detay sayfasına ulaşınız', N'Thumbnail', N'/CoreBlogTemplate/images/7.jpg', CAST(N'2022-01-29T00:00:00.0000000' AS DateTime2), 1, 2, 1, N'trigger-deneme')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (34, N'Donanım Blog Test', N'İçerik For Döngüsü - Lorem İpsum Dolor, 6 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Blog Detay sayfasına ulaşınız', N'/CoreBlogTemplate/images/7.jpg', N'/CoreBlogTemplate/images/7.jpg', CAST(N'2022-02-12T17:33:58.6338886' AS DateTime2), 1, 6, 1, N'blog-donanim')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (35, N'Test Blog', N'İçerik For Döngüsü - Lorem İpsum Dolor, 6 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Blog Detay sayfasına ulaşınız', N'/CoreBlogTemplate/images/8.jpg', N'/CoreBlogTemplate/images/8.jpg', CAST(N'2022-02-13T22:44:12.4376802' AS DateTime2), 1, 5, 1, N'test-blog')
INSERT [dbo].[Blogs] ([BlogID], [BlogTitle], [BlogContent], [BlogThumbnailImage], [BlogImage], [BlogCreateDate], [BlogStatus], [CategoryID], [WriterID], [BlogUrl]) VALUES (36, N'Test Başlık', N'İçerik For Döngüsü - Lorem İpsum Dolor, 6 Bu döngü programlama dilleri arasında mantığı hiç değişmeyen ve hayat kurtaran bir yapıdır. Tüm dillerde öğrenilmesi gereken ilk maddelerdendir. Devamını blog yazımızda okuyabilir ya da youtube kanalımızda izleyebilirsiniz. Blog Detay sayfasına ulaşınız', N'asd', N'asd', CAST(N'2022-02-14T23:56:41.5388929' AS DateTime2), 1, 6, 1, N'test-baslik')
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [CategoryStatus], [CategorUrl]) VALUES (1, N'Yazılım', N'Yazılım Açıklama', 1, N'yazilim')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [CategoryStatus], [CategorUrl]) VALUES (2, N'Teknoloji', N'Açıklama', 1, N'teknoloji')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [CategoryStatus], [CategorUrl]) VALUES (4, N'Tiyatro', N'Tiyatro Açıklama', 1, N'tiyatro')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [CategoryStatus], [CategorUrl]) VALUES (5, N'Oyun', N'Oyun Açıklama', 1, N'oyun')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [CategoryStatus], [CategorUrl]) VALUES (6, N'Donanım', N'Donanım Açıklama', 1, N'donanim')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [CategoryStatus], [CategorUrl]) VALUES (7, N'Güvenlik', N'<p>Hacking işlemlerinin anlatıldığı kategori</p>
', 1, N'guvenlik')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [CategoryStatus], [CategorUrl]) VALUES (8, N'ünal', N'<p>&uuml;nal</p>
', 1, N'unal')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (1, N'ADANA', N'ADANA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (2, N'ADIYAMAN', N'ADIYAMAN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (3, N'AFYONKARAHİSAR', N'AFYONKARAHİSAR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (4, N'AĞRI', N'AĞRI', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (5, N'AKSARAY', N'AKSARAY', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (6, N'AMASYA', N'AMASYA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (7, N'ANKARA', N'ANKARA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (8, N'ANTALYA', N'ANTALYA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (9, N'ARDAHAN', N'ARDAHAN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (10, N'ARTVİN', N'ARTVİN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (11, N'AYDIN', N'AYDIN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (12, N'BALIKESİR', N'BALIKESİR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (13, N'BARTIN', N'BARTIN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (14, N'BATMAN', N'BATMAN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (15, N'BAYBURT', N'BAYBURT', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (16, N'BİLECİK', N'BİLECİK', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (17, N'BİNGÖL', N'BİNGÖL', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (18, N'BİTLİS', N'BİTLİS', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (19, N'BOLU', N'BOLU', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (20, N'BURDUR', N'BURDUR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (21, N'BURSA', N'BURSA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (22, N'ÇANAKKALE', N'ÇANAKKALE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (23, N'ÇANKIRI', N'ÇANKIRI', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (24, N'ÇORUM', N'ÇORUM', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (25, N'DENİZLİ', N'DENİZLİ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (26, N'DİYARBAKIR', N'DİYARBAKIR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (27, N'DÜZCE', N'DÜZCE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (28, N'EDİRNE', N'EDİRNE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (29, N'ELAZIĞ', N'ELAZIĞ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (30, N'ERZİNCAN', N'ERZİNCAN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (31, N'ERZURUM', N'ERZURUM', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (32, N'ESKİŞEHİR', N'ESKİŞEHİR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (33, N'GAZİANTEP', N'GAZİANTEP', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (34, N'GİRESUN', N'GİRESUN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (35, N'GÜMÜŞHANE', N'GÜMÜŞHANE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (36, N'HAKKARİ', N'HAKKARİ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (37, N'HATAY', N'HATAY', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (38, N'IĞDIR', N'IĞDIR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (39, N'ISPARTA', N'ISPARTA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (40, N'İSTANBUL', N'İSTANBUL', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (41, N'İZMİR', N'İZMİR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (42, N'KAHRAMANMARAŞ', N'KAHRAMANMARAŞ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (43, N'KARABÜK', N'KARABÜK', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (44, N'KARAMAN', N'KARAMAN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (45, N'KARS', N'KARS', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (46, N'KASTAMONU', N'KASTAMONU', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (47, N'KAYSERİ', N'KAYSERİ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (48, N'KIRIKKALE', N'KIRIKKALE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (49, N'KIRKLARELİ', N'KIRKLARELİ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (50, N'KIRŞEHİR', N'KIRŞEHİR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (51, N'KİLİS', N'KİLİS', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (52, N'KOCAELİ', N'KOCAELİ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (53, N'KONYA', N'KONYA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (54, N'KÜTAHYA', N'KÜTAHYA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (55, N'MALATYA', N'MALATYA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (56, N'MANİSA', N'MANİSA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (57, N'MARDİN', N'MARDİN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (58, N'MERSİN', N'MERSİN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (59, N'MUĞLA', N'MUĞLA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (60, N'MUŞ', N'MUŞ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (61, N'NEVŞEHİR', N'NEVŞEHİR', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (62, N'NİĞDE', N'NİĞDE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (63, N'ORDU', N'ORDU', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (64, N'OSMANİYE', N'OSMANİYE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (65, N'RİZE', N'RİZE', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (66, N'SAKARYA', N'SAKARYA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (67, N'SAMSUN', N'SAMSUN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (68, N'SİİRT', N'SİİRT', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (69, N'SİNOP', N'SİNOP', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (70, N'SİVAS', N'SİVAS', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (71, N'ŞANLIURFA', N'ŞANLIURFA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (72, N'ŞIRNAK', N'ŞIRNAK', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (73, N'TEKİRDAĞ', N'TEKİRDAĞ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (74, N'TOKAT', N'TOKAT', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (75, N'TRABZON', N'TRABZON', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (76, N'TUNCELİ', N'TUNCELİ', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (77, N'UŞAK', N'UŞAK', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (78, N'VAN', N'VAN', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (79, N'YALOVA', N'YALOVA', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (80, N'YOZGAT', N'YOZGAT', NULL)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayName], [Code]) VALUES (81, N'ZONGULDAK', N'ZONGULDAK', NULL)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (4, N'İbrahim OKUYUCU', N'Teşekkürler', N'Çok Faydalı Bir Yazı Olmuş', CAST(N'2022-01-11T00:00:00.0000000' AS DateTime2), 1, 13, 7)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (6, N'Murat YÜCEDAĞ', N'Başarılar', N'İbrahim Yolun Bahtın Açık Olsun Kutlarım', CAST(N'2022-01-11T00:00:00.0000000' AS DateTime2), 1, 9, 8)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (7, N'Ünal ÇAKIR', N'Developer Olmak', N'Sr. Software Developer oldun kutlarım', CAST(N'2022-01-11T00:00:00.0000000' AS DateTime2), 1, 15, 9)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (13, N'ibrahim okuyucu', N'Test Konu', N'asdasdasdasd', CAST(N'2022-01-18T10:30:15.1727589' AS DateTime2), 1, 13, 10)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (14, N'asd', N'Test Konu', N'asd', CAST(N'2022-01-18T10:30:26.3624574' AS DateTime2), 1, 13, 2)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (15, N'Test Yorum', N'Test Konu', N'Bilmiyorum ki', CAST(N'2022-01-18T10:35:58.2081579' AS DateTime2), 1, 13, 2)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (16, N'Son Yorum', N'Test Konu', N'asdasdasdas', CAST(N'2022-01-18T10:50:29.9607839' AS DateTime2), 1, 13, 3)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (17, N'ibrahim okuyucu', N'Test Konu', N'asdasdasdasd', CAST(N'2022-01-18T10:53:55.1809422' AS DateTime2), 1, 13, 4)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (18, N'Bilinmiez', N'Test Konu Yeni Yorum', N'amannnnnnnnn', CAST(N'2022-01-18T10:54:44.2909923' AS DateTime2), 1, 13, 5)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (19, N'Son Yorum', N'Test Konu 3', N'asdasdasd', CAST(N'2022-01-18T10:56:14.4025879' AS DateTime2), 1, 13, 6)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (20, N'Ramazan Kayar', N'Test Konu Ramazan', N'Ramazan Mesaj', CAST(N'2022-01-18T17:29:04.0828138' AS DateTime2), 1, 13, 7)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (21, N'ibrahim okuyucu', N'Test Konu', N'asdasdasd', CAST(N'2022-01-19T23:20:12.0790826' AS DateTime2), 1, 13, 8)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (22, N'ibrahim okuyucu', N'Test Konu', N'asdasdasd', CAST(N'2022-01-20T09:35:28.3855336' AS DateTime2), 1, 13, 9)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (25, N'İbrahim OKUYUCU', N'Trigger İçerik', N'Trigger Test', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), 1, 13, 11)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (26, N'Murat YÜCEDAĞ', N'Tebrikler', N'Trigger Başarılı', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), 1, 13, 11)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (27, N'İbrahim OKUYUCU', N'Tebrikler', N'Trigger Başarılı', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), 1, 13, 12)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (28, N'Test Yorum', N'Test Konu', N'Test Mesaj', CAST(N'2022-02-21T22:56:15.0942776' AS DateTime2), 1, 13, 0)
INSERT [dbo].[Comments] ([CommentID], [CommentUserName], [CommentTitle], [CommentContent], [CommentDate], [CommentStatus], [BlogID], [BlogScore]) VALUES (29, N'asdasd', N'rameo21', N'rameo21', CAST(N'2022-02-21T23:22:07.0922838' AS DateTime2), 1, 13, 0)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([ContactID], [ContactUserName], [ContactMail], [ContactSubject], [ContactMessage], [ContactDate], [ContactStatus]) VALUES (2, N'İbrahim OKUYUCU', N'ibrahim@kismizamanliblogcu.com', N'Tanışmak', N'Tanışmak İstiyorum', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Contacts] ([ContactID], [ContactUserName], [ContactMail], [ContactSubject], [ContactMessage], [ContactDate], [ContactStatus]) VALUES (3, N'İsmail Melih TAŞ', N'ismail@ismail.com', N'Tanışmak İstiyorum', N'V2 Sisteminiz ile ilgili bilgi almak istiyorum.', CAST(N'2022-01-20T10:32:57.9476324' AS DateTime2), 1)
INSERT [dbo].[Contacts] ([ContactID], [ContactUserName], [ContactMail], [ContactSubject], [ContactMessage], [ContactDate], [ContactStatus]) VALUES (4, N'İbrahim OKUYUCU', N'ibrahim.okuyucu@outlook.com', N'.NET Core MVC Dersleri Hk.', N'Ders Almak İstiyorum', CAST(N'2022-01-20T10:44:35.8554565' AS DateTime2), 1)
INSERT [dbo].[Contacts] ([ContactID], [ContactUserName], [ContactMail], [ContactSubject], [ContactMessage], [ContactDate], [ContactStatus]) VALUES (5, N'İsmail Melih TAŞ', N'ismail@ismail.com', N'Tanışmak İstiyorum', N'asdasdasd', CAST(N'2022-01-29T18:05:10.9874726' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Counties] ON 

INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (1, 1, N'ALADAĞ', N'ALADAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (2, 1, N'CEYHAN', N'CEYHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (3, 1, N'ÇUKUROVA', N'ÇUKUROVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (4, 1, N'FEKE', N'FEKE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (5, 1, N'İMAMOĞLU', N'İMAMOĞLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (6, 1, N'KARAİSALI', N'KARAİSALI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (7, 1, N'KARATAŞ', N'KARATAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (8, 1, N'KOZAN', N'KOZAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (9, 1, N'POZANTI', N'POZANTI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (10, 1, N'SAİMBEYLİ', N'SAİMBEYLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (11, 1, N'SARIÇAM', N'SARIÇAM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (12, 1, N'SEYHAN', N'SEYHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (13, 1, N'TUFANBEYLİ', N'TUFANBEYLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (14, 1, N'YUMURTALIK', N'YUMURTALIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (15, 1, N'YÜREĞİR', N'YÜREĞİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (16, 2, N'BESNİ', N'BESNİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (17, 2, N'ÇELİKHAN', N'ÇELİKHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (18, 2, N'GERGER', N'GERGER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (19, 2, N'GÖLBAŞI', N'GÖLBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (20, 2, N'KAHTA', N'KAHTA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (21, 2, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (22, 2, N'SAMSAT', N'SAMSAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (23, 2, N'SİNCİK', N'SİNCİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (24, 2, N'TUT', N'TUT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (25, 3, N'BAŞMAKÇI', N'BAŞMAKÇI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (26, 3, N'BAYAT', N'BAYAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (27, 3, N'BOLVADİN', N'BOLVADİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (28, 3, N'ÇAY', N'ÇAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (29, 3, N'ÇOBANLAR', N'ÇOBANLAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (30, 3, N'DAZKIRI', N'DAZKIRI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (31, 3, N'DİNAR', N'DİNAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (32, 3, N'EMİRDAĞ', N'EMİRDAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (33, 3, N'EVCİLER', N'EVCİLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (34, 3, N'HOCALAR', N'HOCALAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (35, 3, N'İHSANİYE', N'İHSANİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (36, 3, N'İSCEHİSAR', N'İSCEHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (37, 3, N'KIZILÖREN', N'KIZILÖREN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (38, 3, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (39, 3, N'SANDIKLI', N'SANDIKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (40, 3, N'SİNANPAŞA', N'SİNANPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (41, 3, N'SULTANDAĞI', N'SULTANDAĞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (42, 3, N'ŞUHUT', N'ŞUHUT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (43, 4, N'DİYADİN', N'DİYADİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (44, 4, N'DOĞUBAYAZIT', N'DOĞUBAYAZIT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (45, 4, N'ELEŞKİRT', N'ELEŞKİRT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (46, 4, N'HAMUR', N'HAMUR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (47, 4, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (48, 4, N'PATNOS', N'PATNOS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (49, 4, N'TAŞLIÇAY', N'TAŞLIÇAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (50, 4, N'TUTAK', N'TUTAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (51, 5, N'AĞAÇÖREN', N'AĞAÇÖREN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (52, 5, N'ESKİL', N'ESKİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (53, 5, N'GÜLAĞAÇ', N'GÜLAĞAÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (54, 5, N'GÜZELYURT', N'GÜZELYURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (55, 5, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (56, 5, N'ORTAKÖY', N'ORTAKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (57, 5, N'SARIYAHŞİ', N'SARIYAHŞİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (58, 5, N'SULTANHANI', N'SULTANHANI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (59, 6, N'GÖYNÜCEK', N'GÖYNÜCEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (60, 6, N'GÜMÜŞHACIKÖY', N'GÜMÜŞHACIKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (61, 6, N'HAMAMÖZÜ', N'HAMAMÖZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (62, 6, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (63, 6, N'MERZİFON', N'MERZİFON', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (64, 6, N'SULUOVA', N'SULUOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (65, 6, N'TAŞOVA', N'TAŞOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (66, 7, N'AKYURT', N'AKYURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (67, 7, N'ALTINDAĞ', N'ALTINDAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (68, 7, N'AYAŞ', N'AYAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (69, 7, N'BALA', N'BALA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (70, 7, N'BEYPAZARI', N'BEYPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (71, 7, N'ÇAMLIDERE', N'ÇAMLIDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (72, 7, N'ÇANKAYA', N'ÇANKAYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (73, 7, N'ÇUBUK', N'ÇUBUK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (74, 7, N'ELMADAĞ', N'ELMADAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (75, 7, N'ETİMESGUT', N'ETİMESGUT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (76, 7, N'EVREN', N'EVREN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (77, 7, N'GÖLBAŞI', N'GÖLBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (78, 7, N'GÜDÜL', N'GÜDÜL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (79, 7, N'HAYMANA', N'HAYMANA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (80, 7, N'KAHRAMANKAZAN', N'KAHRAMANKAZAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (81, 7, N'KALECİK', N'KALECİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (82, 7, N'KEÇİÖREN', N'KEÇİÖREN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (83, 7, N'KIZILCAHAMAM', N'KIZILCAHAMAM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (84, 7, N'MAMAK', N'MAMAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (85, 7, N'NALLIHAN', N'NALLIHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (86, 7, N'POLATLI', N'POLATLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (87, 7, N'PURSAKLAR', N'PURSAKLAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (88, 7, N'SİNCAN', N'SİNCAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (89, 7, N'ŞEREFLİKOÇHİSAR', N'ŞEREFLİKOÇHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (90, 7, N'YENİMAHALLE', N'YENİMAHALLE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (91, 8, N'AKSEKİ', N'AKSEKİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (92, 8, N'AKSU', N'AKSU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (93, 8, N'ALANYA', N'ALANYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (94, 8, N'DEMRE', N'DEMRE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (95, 8, N'DÖŞEMEALTI', N'DÖŞEMEALTI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (96, 8, N'ELMALI', N'ELMALI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (97, 8, N'FİNİKE', N'FİNİKE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (98, 8, N'GAZİPAŞA', N'GAZİPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (99, 8, N'GÜNDOĞMUŞ', N'GÜNDOĞMUŞ', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (100, 8, N'İBRADI', N'İBRADI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (101, 8, N'KAŞ', N'KAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (102, 8, N'KEMER', N'KEMER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (103, 8, N'KEPEZ', N'KEPEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (104, 8, N'KONYAALTI', N'KONYAALTI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (105, 8, N'KORKUTELİ', N'KORKUTELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (106, 8, N'KUMLUCA', N'KUMLUCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (107, 8, N'MANAVGAT', N'MANAVGAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (108, 8, N'MURATPAŞA', N'MURATPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (109, 8, N'SERİK', N'SERİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (110, 9, N'ÇILDIR', N'ÇILDIR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (111, 9, N'DAMAL', N'DAMAL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (112, 9, N'GÖLE', N'GÖLE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (113, 9, N'HANAK', N'HANAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (114, 9, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (115, 9, N'POSOF', N'POSOF', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (116, 10, N'ARDANUÇ', N'ARDANUÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (117, 10, N'ARHAVİ', N'ARHAVİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (118, 10, N'BORÇKA', N'BORÇKA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (119, 10, N'HOPA', N'HOPA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (120, 10, N'KEMALPAŞA', N'KEMALPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (121, 10, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (122, 10, N'MURGUL', N'MURGUL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (123, 10, N'ŞAVŞAT', N'ŞAVŞAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (124, 10, N'YUSUFELİ', N'YUSUFELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (125, 11, N'BOZDOĞAN', N'BOZDOĞAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (126, 11, N'BUHARKENT', N'BUHARKENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (127, 11, N'ÇİNE', N'ÇİNE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (128, 11, N'DİDİM', N'DİDİM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (129, 11, N'EFELER', N'EFELER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (130, 11, N'GERMENCİK', N'GERMENCİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (131, 11, N'İNCİRLİOVA', N'İNCİRLİOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (132, 11, N'KARACASU', N'KARACASU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (133, 11, N'KARPUZLU', N'KARPUZLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (134, 11, N'KOÇARLI', N'KOÇARLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (135, 11, N'KÖŞK', N'KÖŞK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (136, 11, N'KUŞADASI', N'KUŞADASI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (137, 11, N'KUYUCAK', N'KUYUCAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (138, 11, N'NAZİLLİ', N'NAZİLLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (139, 11, N'SÖKE', N'SÖKE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (140, 11, N'SULTANHİSAR', N'SULTANHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (141, 11, N'YENİPAZAR', N'YENİPAZAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (142, 12, N'ALTIEYLÜL', N'ALTIEYLÜL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (143, 12, N'AYVALIK', N'AYVALIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (144, 12, N'BALYA', N'BALYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (145, 12, N'BANDIRMA', N'BANDIRMA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (146, 12, N'BİGADİÇ', N'BİGADİÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (147, 12, N'BURHANİYE', N'BURHANİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (148, 12, N'DURSUNBEY', N'DURSUNBEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (149, 12, N'EDREMİT', N'EDREMİT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (150, 12, N'ERDEK', N'ERDEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (151, 12, N'GÖMEÇ', N'GÖMEÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (152, 12, N'GÖNEN', N'GÖNEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (153, 12, N'HAVRAN', N'HAVRAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (154, 12, N'İVRİNDİ', N'İVRİNDİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (155, 12, N'KARESİ', N'KARESİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (156, 12, N'KEPSUT', N'KEPSUT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (157, 12, N'MANYAS', N'MANYAS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (158, 12, N'MARMARA', N'MARMARA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (159, 12, N'SAVAŞTEPE', N'SAVAŞTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (160, 12, N'SINDIRGI', N'SINDIRGI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (161, 12, N'SUSURLUK', N'SUSURLUK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (162, 13, N'AMASRA', N'AMASRA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (163, 13, N'KURUCAŞİLE', N'KURUCAŞİLE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (164, 13, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (165, 13, N'ULUS', N'ULUS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (166, 14, N'BEŞİRİ', N'BEŞİRİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (167, 14, N'GERCÜŞ', N'GERCÜŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (168, 14, N'HASANKEYF', N'HASANKEYF', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (169, 14, N'KOZLUK', N'KOZLUK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (170, 14, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (171, 14, N'SASON', N'SASON', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (172, 15, N'AYDINTEPE', N'AYDINTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (173, 15, N'DEMİRÖZÜ', N'DEMİRÖZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (174, 15, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (175, 16, N'BOZÜYÜK', N'BOZÜYÜK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (176, 16, N'GÖLPAZARI', N'GÖLPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (177, 16, N'İNHİSAR', N'İNHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (178, 16, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (179, 16, N'OSMANELİ', N'OSMANELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (180, 16, N'PAZARYERİ', N'PAZARYERİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (181, 16, N'SÖĞÜT', N'SÖĞÜT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (182, 16, N'YENİPAZAR', N'YENİPAZAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (183, 17, N'ADAKLI', N'ADAKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (184, 17, N'GENÇ', N'GENÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (185, 17, N'KARLIOVA', N'KARLIOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (186, 17, N'KİĞI', N'KİĞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (187, 17, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (188, 17, N'SOLHAN', N'SOLHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (189, 17, N'YAYLADERE', N'YAYLADERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (190, 17, N'YEDİSU', N'YEDİSU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (191, 18, N'ADİLCEVAZ', N'ADİLCEVAZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (192, 18, N'AHLAT', N'AHLAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (193, 18, N'GÜROYMAK', N'GÜROYMAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (194, 18, N'HİZAN', N'HİZAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (195, 18, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (196, 18, N'MUTKİ', N'MUTKİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (197, 18, N'TATVAN', N'TATVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (198, 19, N'DÖRTDİVAN', N'DÖRTDİVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (199, 19, N'GEREDE', N'GEREDE', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (200, 19, N'GÖYNÜK', N'GÖYNÜK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (201, 19, N'KIBRISCIK', N'KIBRISCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (202, 19, N'MENGEN', N'MENGEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (203, 19, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (204, 19, N'MUDURNU', N'MUDURNU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (205, 19, N'SEBEN', N'SEBEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (206, 19, N'YENİÇAĞA', N'YENİÇAĞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (207, 20, N'AĞLASUN', N'AĞLASUN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (208, 20, N'ALTINYAYLA', N'ALTINYAYLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (209, 20, N'BUCAK', N'BUCAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (210, 20, N'ÇAVDIR', N'ÇAVDIR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (211, 20, N'ÇELTİKÇİ', N'ÇELTİKÇİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (212, 20, N'GÖLHİSAR', N'GÖLHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (213, 20, N'KARAMANLI', N'KARAMANLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (214, 20, N'KEMER', N'KEMER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (215, 20, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (216, 20, N'TEFENNİ', N'TEFENNİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (217, 20, N'YEŞİLOVA', N'YEŞİLOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (218, 21, N'BÜYÜKORHAN', N'BÜYÜKORHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (219, 21, N'GEMLİK', N'GEMLİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (220, 21, N'GÜRSU', N'GÜRSU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (221, 21, N'HARMANCIK', N'HARMANCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (222, 21, N'İNEGÖL', N'İNEGÖL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (223, 21, N'İZNİK', N'İZNİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (224, 21, N'KARACABEY', N'KARACABEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (225, 21, N'KELES', N'KELES', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (226, 21, N'KESTEL', N'KESTEL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (227, 21, N'MUDANYA', N'MUDANYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (228, 21, N'MUSTAFAKEMALPAŞA', N'MUSTAFAKEMALPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (229, 21, N'NİLÜFER', N'NİLÜFER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (230, 21, N'ORHANELİ', N'ORHANELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (231, 21, N'ORHANGAZİ', N'ORHANGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (232, 21, N'OSMANGAZİ', N'OSMANGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (233, 21, N'YENİŞEHİR', N'YENİŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (234, 21, N'YILDIRIM', N'YILDIRIM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (235, 22, N'AYVACIK', N'AYVACIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (236, 22, N'BAYRAMİÇ', N'BAYRAMİÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (237, 22, N'BİGA', N'BİGA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (238, 22, N'BOZCAADA', N'BOZCAADA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (239, 22, N'ÇAN', N'ÇAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (240, 22, N'ECEABAT', N'ECEABAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (241, 22, N'EZİNE', N'EZİNE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (242, 22, N'GELİBOLU', N'GELİBOLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (243, 22, N'GÖKÇEADA', N'GÖKÇEADA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (244, 22, N'LAPSEKİ', N'LAPSEKİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (245, 22, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (246, 22, N'YENİCE', N'YENİCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (247, 23, N'ATKARACALAR', N'ATKARACALAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (248, 23, N'BAYRAMÖREN', N'BAYRAMÖREN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (249, 23, N'ÇERKEŞ', N'ÇERKEŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (250, 23, N'ELDİVAN', N'ELDİVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (251, 23, N'ILGAZ', N'ILGAZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (252, 23, N'KIZILIRMAK', N'KIZILIRMAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (253, 23, N'KORGUN', N'KORGUN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (254, 23, N'KURŞUNLU', N'KURŞUNLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (255, 23, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (256, 23, N'ORTA', N'ORTA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (257, 23, N'ŞABANÖZÜ', N'ŞABANÖZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (258, 23, N'YAPRAKLI', N'YAPRAKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (259, 24, N'ALACA', N'ALACA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (260, 24, N'BAYAT', N'BAYAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (261, 24, N'BOĞAZKALE', N'BOĞAZKALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (262, 24, N'DODURGA', N'DODURGA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (263, 24, N'İSKİLİP', N'İSKİLİP', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (264, 24, N'KARGI', N'KARGI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (265, 24, N'LAÇİN', N'LAÇİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (266, 24, N'MECİTÖZÜ', N'MECİTÖZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (267, 24, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (268, 24, N'OĞUZLAR', N'OĞUZLAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (269, 24, N'ORTAKÖY', N'ORTAKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (270, 24, N'OSMANCIK', N'OSMANCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (271, 24, N'SUNGURLU', N'SUNGURLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (272, 24, N'UĞURLUDAĞ', N'UĞURLUDAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (273, 25, N'ACIPAYAM', N'ACIPAYAM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (274, 25, N'BABADAĞ', N'BABADAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (275, 25, N'BAKLAN', N'BAKLAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (276, 25, N'BEKİLLİ', N'BEKİLLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (277, 25, N'BEYAĞAÇ', N'BEYAĞAÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (278, 25, N'BOZKURT', N'BOZKURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (279, 25, N'BULDAN', N'BULDAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (280, 25, N'ÇAL', N'ÇAL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (281, 25, N'ÇAMELİ', N'ÇAMELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (282, 25, N'ÇARDAK', N'ÇARDAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (283, 25, N'ÇİVRİL', N'ÇİVRİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (284, 25, N'GÜNEY', N'GÜNEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (285, 25, N'HONAZ', N'HONAZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (286, 25, N'KALE', N'KALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (287, 25, N'MERKEZEFENDİ', N'MERKEZEFENDİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (288, 25, N'PAMUKKALE', N'PAMUKKALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (289, 25, N'SARAYKÖY', N'SARAYKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (290, 25, N'SERİNHİSAR', N'SERİNHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (291, 25, N'TAVAS', N'TAVAS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (292, 26, N'BAĞLAR', N'BAĞLAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (293, 26, N'BİSMİL', N'BİSMİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (294, 26, N'ÇERMİK', N'ÇERMİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (295, 26, N'ÇINAR', N'ÇINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (296, 26, N'ÇÜNGÜŞ', N'ÇÜNGÜŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (297, 26, N'DİCLE', N'DİCLE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (298, 26, N'EĞİL', N'EĞİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (299, 26, N'ERGANİ', N'ERGANİ', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (300, 26, N'HANİ', N'HANİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (301, 26, N'HAZRO', N'HAZRO', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (302, 26, N'KAYAPINAR', N'KAYAPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (303, 26, N'KOCAKÖY', N'KOCAKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (304, 26, N'KULP', N'KULP', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (305, 26, N'LİCE', N'LİCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (306, 26, N'SİLVAN', N'SİLVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (307, 26, N'SUR', N'SUR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (308, 26, N'YENİŞEHİR', N'YENİŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (309, 27, N'AKÇAKOCA', N'AKÇAKOCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (310, 27, N'CUMAYERİ', N'CUMAYERİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (311, 27, N'ÇİLİMLİ', N'ÇİLİMLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (312, 27, N'GÖLYAKA', N'GÖLYAKA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (313, 27, N'GÜMÜŞOVA', N'GÜMÜŞOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (314, 27, N'KAYNAŞLI', N'KAYNAŞLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (315, 27, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (316, 27, N'YIĞILCA', N'YIĞILCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (317, 28, N'ENEZ', N'ENEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (318, 28, N'HAVSA', N'HAVSA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (319, 28, N'İPSALA', N'İPSALA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (320, 28, N'KEŞAN', N'KEŞAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (321, 28, N'LALAPAŞA', N'LALAPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (322, 28, N'MERİÇ', N'MERİÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (323, 28, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (324, 28, N'SÜLOĞLU', N'SÜLOĞLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (325, 28, N'UZUNKÖPRÜ', N'UZUNKÖPRÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (326, 29, N'AĞIN', N'AĞIN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (327, 29, N'ALACAKAYA', N'ALACAKAYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (328, 29, N'ARICAK', N'ARICAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (329, 29, N'BASKİL', N'BASKİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (330, 29, N'KARAKOÇAN', N'KARAKOÇAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (331, 29, N'KEBAN', N'KEBAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (332, 29, N'KOVANCILAR', N'KOVANCILAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (333, 29, N'MADEN', N'MADEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (334, 29, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (335, 29, N'PALU', N'PALU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (336, 29, N'SİVRİCE', N'SİVRİCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (337, 30, N'ÇAYIRLI', N'ÇAYIRLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (338, 30, N'İLİÇ', N'İLİÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (339, 30, N'KEMAH', N'KEMAH', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (340, 30, N'KEMALİYE', N'KEMALİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (341, 30, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (342, 30, N'OTLUKBELİ', N'OTLUKBELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (343, 30, N'REFAHİYE', N'REFAHİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (344, 30, N'TERCAN', N'TERCAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (345, 30, N'ÜZÜMLÜ', N'ÜZÜMLÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (346, 31, N'AŞKALE', N'AŞKALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (347, 31, N'AZİZİYE', N'AZİZİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (348, 31, N'ÇAT', N'ÇAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (349, 31, N'HINIS', N'HINIS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (350, 31, N'HORASAN', N'HORASAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (351, 31, N'İSPİR', N'İSPİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (352, 31, N'KARAÇOBAN', N'KARAÇOBAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (353, 31, N'KARAYAZI', N'KARAYAZI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (354, 31, N'KÖPRÜKÖY', N'KÖPRÜKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (355, 31, N'NARMAN', N'NARMAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (356, 31, N'OLTU', N'OLTU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (357, 31, N'OLUR', N'OLUR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (358, 31, N'PALANDÖKEN', N'PALANDÖKEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (359, 31, N'PASİNLER', N'PASİNLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (360, 31, N'PAZARYOLU', N'PAZARYOLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (361, 31, N'ŞENKAYA', N'ŞENKAYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (362, 31, N'TEKMAN', N'TEKMAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (363, 31, N'TORTUM', N'TORTUM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (364, 31, N'UZUNDERE', N'UZUNDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (365, 31, N'YAKUTİYE', N'YAKUTİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (366, 32, N'ALPU', N'ALPU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (367, 32, N'BEYLİKOVA', N'BEYLİKOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (368, 32, N'ÇİFTELER', N'ÇİFTELER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (369, 32, N'GÜNYÜZÜ', N'GÜNYÜZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (370, 32, N'HAN', N'HAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (371, 32, N'İNÖNÜ', N'İNÖNÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (372, 32, N'MAHMUDİYE', N'MAHMUDİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (373, 32, N'MİHALGAZİ', N'MİHALGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (374, 32, N'MİHALIÇÇIK', N'MİHALIÇÇIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (375, 32, N'ODUNPAZARI', N'ODUNPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (376, 32, N'SARICAKAYA', N'SARICAKAYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (377, 32, N'SEYİTGAZİ', N'SEYİTGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (378, 32, N'SİVRİHİSAR', N'SİVRİHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (379, 32, N'TEPEBAŞI', N'TEPEBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (380, 33, N'ARABAN', N'ARABAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (381, 33, N'İSLAHİYE', N'İSLAHİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (382, 33, N'KARKAMIŞ', N'KARKAMIŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (383, 33, N'NİZİP', N'NİZİP', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (384, 33, N'NURDAĞI', N'NURDAĞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (385, 33, N'OĞUZELİ', N'OĞUZELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (386, 33, N'ŞAHİNBEY', N'ŞAHİNBEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (387, 33, N'ŞEHİTKAMİL', N'ŞEHİTKAMİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (388, 33, N'YAVUZELİ', N'YAVUZELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (389, 34, N'ALUCRA', N'ALUCRA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (390, 34, N'BULANCAK', N'BULANCAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (391, 34, N'ÇAMOLUK', N'ÇAMOLUK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (392, 34, N'ÇANAKÇI', N'ÇANAKÇI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (393, 34, N'DERELİ', N'DERELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (394, 34, N'DOĞANKENT', N'DOĞANKENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (395, 34, N'ESPİYE', N'ESPİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (396, 34, N'EYNESİL', N'EYNESİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (397, 34, N'GÖRELE', N'GÖRELE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (398, 34, N'GÜCE', N'GÜCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (399, 34, N'KEŞAP', N'KEŞAP', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (400, 34, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (401, 34, N'PİRAZİZ', N'PİRAZİZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (402, 34, N'ŞEBİNKARAHİSAR', N'ŞEBİNKARAHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (403, 34, N'TİREBOLU', N'TİREBOLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (404, 34, N'YAĞLIDERE', N'YAĞLIDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (405, 35, N'KELKİT', N'KELKİT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (406, 35, N'KÖSE', N'KÖSE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (407, 35, N'KÜRTÜN', N'KÜRTÜN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (408, 35, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (409, 35, N'ŞİRAN', N'ŞİRAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (410, 35, N'TORUL', N'TORUL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (411, 36, N'ÇUKURCA', N'ÇUKURCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (412, 36, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (413, 36, N'ŞEMDİNLİ', N'ŞEMDİNLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (414, 36, N'YÜKSEKOVA', N'YÜKSEKOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (415, 37, N'ALTINÖZÜ', N'ALTINÖZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (416, 37, N'ANTAKYA', N'ANTAKYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (417, 37, N'ARSUZ', N'ARSUZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (418, 37, N'BELEN', N'BELEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (419, 37, N'DEFNE', N'DEFNE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (420, 37, N'DÖRTYOL', N'DÖRTYOL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (421, 37, N'ERZİN', N'ERZİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (422, 37, N'HASSA', N'HASSA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (423, 37, N'İSKENDERUN', N'İSKENDERUN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (424, 37, N'KIRIKHAN', N'KIRIKHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (425, 37, N'KUMLU', N'KUMLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (426, 37, N'PAYAS', N'PAYAS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (427, 37, N'REYHANLI', N'REYHANLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (428, 37, N'SAMANDAĞ', N'SAMANDAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (429, 37, N'YAYLADAĞI', N'YAYLADAĞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (430, 38, N'ARALIK', N'ARALIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (431, 38, N'KARAKOYUNLU', N'KARAKOYUNLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (432, 38, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (433, 38, N'TUZLUCA', N'TUZLUCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (434, 39, N'AKSU', N'AKSU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (435, 39, N'ATABEY', N'ATABEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (436, 39, N'EĞİRDİR', N'EĞİRDİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (437, 39, N'GELENDOST', N'GELENDOST', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (438, 39, N'GÖNEN', N'GÖNEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (439, 39, N'KEÇİBORLU', N'KEÇİBORLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (440, 39, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (441, 39, N'SENİRKENT', N'SENİRKENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (442, 39, N'SÜTÇÜLER', N'SÜTÇÜLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (443, 39, N'ŞARKİKARAAĞAÇ', N'ŞARKİKARAAĞAÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (444, 39, N'ULUBORLU', N'ULUBORLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (445, 39, N'YALVAÇ', N'YALVAÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (446, 39, N'YENİŞARBADEMLİ', N'YENİŞARBADEMLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (447, 40, N'ADALAR', N'ADALAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (448, 40, N'ARNAVUTKÖY', N'ARNAVUTKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (449, 40, N'ATAŞEHİR', N'ATAŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (450, 40, N'AVCILAR', N'AVCILAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (451, 40, N'BAĞCILAR', N'BAĞCILAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (452, 40, N'BAHÇELİEVLER', N'BAHÇELİEVLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (453, 40, N'BAKIRKÖY', N'BAKIRKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (454, 40, N'BAŞAKŞEHİR', N'BAŞAKŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (455, 40, N'BAYRAMPAŞA', N'BAYRAMPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (456, 40, N'BEŞİKTAŞ', N'BEŞİKTAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (457, 40, N'BEYKOZ', N'BEYKOZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (458, 40, N'BEYLİKDÜZÜ', N'BEYLİKDÜZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (459, 40, N'BEYOĞLU', N'BEYOĞLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (460, 40, N'BÜYÜKÇEKMECE', N'BÜYÜKÇEKMECE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (461, 40, N'ÇATALCA', N'ÇATALCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (462, 40, N'ÇEKMEKÖY', N'ÇEKMEKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (463, 40, N'ESENLER', N'ESENLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (464, 40, N'ESENYURT', N'ESENYURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (465, 40, N'EYÜPSULTAN', N'EYÜPSULTAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (466, 40, N'FATİH', N'FATİH', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (467, 40, N'GAZİOSMANPAŞA', N'GAZİOSMANPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (468, 40, N'GÜNGÖREN', N'GÜNGÖREN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (469, 40, N'KADIKÖY', N'KADIKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (470, 40, N'KAĞITHANE', N'KAĞITHANE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (471, 40, N'KARTAL', N'KARTAL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (472, 40, N'KÜÇÜKÇEKMECE', N'KÜÇÜKÇEKMECE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (473, 40, N'MALTEPE', N'MALTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (474, 40, N'PENDİK', N'PENDİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (475, 40, N'SANCAKTEPE', N'SANCAKTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (476, 40, N'SARIYER', N'SARIYER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (477, 40, N'SİLİVRİ', N'SİLİVRİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (478, 40, N'SULTANBEYLİ', N'SULTANBEYLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (479, 40, N'SULTANGAZİ', N'SULTANGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (480, 40, N'ŞİLE', N'ŞİLE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (481, 40, N'ŞİŞLİ', N'ŞİŞLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (482, 40, N'TUZLA', N'TUZLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (483, 40, N'ÜMRANİYE', N'ÜMRANİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (484, 40, N'ÜSKÜDAR', N'ÜSKÜDAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (485, 40, N'ZEYTİNBURNU', N'ZEYTİNBURNU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (486, 41, N'ALİAĞA', N'ALİAĞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (487, 41, N'BALÇOVA', N'BALÇOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (488, 41, N'BAYINDIR', N'BAYINDIR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (489, 41, N'BAYRAKLI', N'BAYRAKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (490, 41, N'BERGAMA', N'BERGAMA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (491, 41, N'BEYDAĞ', N'BEYDAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (492, 41, N'BORNOVA', N'BORNOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (493, 41, N'BUCA', N'BUCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (494, 41, N'ÇEŞME', N'ÇEŞME', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (495, 41, N'ÇİĞLİ', N'ÇİĞLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (496, 41, N'DİKİLİ', N'DİKİLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (497, 41, N'FOÇA', N'FOÇA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (498, 41, N'GAZİEMİR', N'GAZİEMİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (499, 41, N'GÜZELBAHÇE', N'GÜZELBAHÇE', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (500, 41, N'KARABAĞLAR', N'KARABAĞLAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (501, 41, N'KARABURUN', N'KARABURUN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (502, 41, N'KARŞIYAKA', N'KARŞIYAKA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (503, 41, N'KEMALPAŞA', N'KEMALPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (504, 41, N'KINIK', N'KINIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (505, 41, N'KİRAZ', N'KİRAZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (506, 41, N'KONAK', N'KONAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (507, 41, N'MENDERES', N'MENDERES', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (508, 41, N'MENEMEN', N'MENEMEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (509, 41, N'NARLIDERE', N'NARLIDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (510, 41, N'ÖDEMİŞ', N'ÖDEMİŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (511, 41, N'SEFERİHİSAR', N'SEFERİHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (512, 41, N'SELÇUK', N'SELÇUK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (513, 41, N'TİRE', N'TİRE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (514, 41, N'TORBALI', N'TORBALI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (515, 41, N'URLA', N'URLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (516, 42, N'AFŞİN', N'AFŞİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (517, 42, N'ANDIRIN', N'ANDIRIN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (518, 42, N'ÇAĞLAYANCERİT', N'ÇAĞLAYANCERİT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (519, 42, N'DULKADİROĞLU', N'DULKADİROĞLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (520, 42, N'EKİNÖZÜ', N'EKİNÖZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (521, 42, N'ELBİSTAN', N'ELBİSTAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (522, 42, N'GÖKSUN', N'GÖKSUN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (523, 42, N'NURHAK', N'NURHAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (524, 42, N'ONİKİŞUBAT', N'ONİKİŞUBAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (525, 42, N'PAZARCIK', N'PAZARCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (526, 42, N'TÜRKOĞLU', N'TÜRKOĞLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (527, 43, N'EFLANİ', N'EFLANİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (528, 43, N'ESKİPAZAR', N'ESKİPAZAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (529, 43, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (530, 43, N'OVACIK', N'OVACIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (531, 43, N'SAFRANBOLU', N'SAFRANBOLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (532, 43, N'YENİCE', N'YENİCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (533, 44, N'AYRANCI', N'AYRANCI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (534, 44, N'BAŞYAYLA', N'BAŞYAYLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (535, 44, N'ERMENEK', N'ERMENEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (536, 44, N'KAZIMKARABEKİR', N'KAZIMKARABEKİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (537, 44, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (538, 44, N'SARIVELİLER', N'SARIVELİLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (539, 45, N'AKYAKA', N'AKYAKA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (540, 45, N'ARPAÇAY', N'ARPAÇAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (541, 45, N'DİGOR', N'DİGOR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (542, 45, N'KAĞIZMAN', N'KAĞIZMAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (543, 45, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (544, 45, N'SARIKAMIŞ', N'SARIKAMIŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (545, 45, N'SELİM', N'SELİM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (546, 45, N'SUSUZ', N'SUSUZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (547, 46, N'ABANA', N'ABANA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (548, 46, N'AĞLI', N'AĞLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (549, 46, N'ARAÇ', N'ARAÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (550, 46, N'AZDAVAY', N'AZDAVAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (551, 46, N'BOZKURT', N'BOZKURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (552, 46, N'CİDE', N'CİDE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (553, 46, N'ÇATALZEYTİN', N'ÇATALZEYTİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (554, 46, N'DADAY', N'DADAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (555, 46, N'DEVREKANİ', N'DEVREKANİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (556, 46, N'DOĞANYURT', N'DOĞANYURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (557, 46, N'HANÖNÜ', N'HANÖNÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (558, 46, N'İHSANGAZİ', N'İHSANGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (559, 46, N'İNEBOLU', N'İNEBOLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (560, 46, N'KÜRE', N'KÜRE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (561, 46, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (562, 46, N'PINARBAŞI', N'PINARBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (563, 46, N'SEYDİLER', N'SEYDİLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (564, 46, N'ŞENPAZAR', N'ŞENPAZAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (565, 46, N'TAŞKÖPRÜ', N'TAŞKÖPRÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (566, 46, N'TOSYA', N'TOSYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (567, 47, N'AKKIŞLA', N'AKKIŞLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (568, 47, N'BÜNYAN', N'BÜNYAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (569, 47, N'DEVELİ', N'DEVELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (570, 47, N'FELAHİYE', N'FELAHİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (571, 47, N'HACILAR', N'HACILAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (572, 47, N'İNCESU', N'İNCESU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (573, 47, N'KOCASİNAN', N'KOCASİNAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (574, 47, N'MELİKGAZİ', N'MELİKGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (575, 47, N'ÖZVATAN', N'ÖZVATAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (576, 47, N'PINARBAŞI', N'PINARBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (577, 47, N'SARIOĞLAN', N'SARIOĞLAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (578, 47, N'SARIZ', N'SARIZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (579, 47, N'TALAS', N'TALAS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (580, 47, N'TOMARZA', N'TOMARZA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (581, 47, N'YAHYALI', N'YAHYALI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (582, 47, N'YEŞİLHİSAR', N'YEŞİLHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (583, 48, N'BAHŞİLİ', N'BAHŞİLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (584, 48, N'BALIŞEYH', N'BALIŞEYH', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (585, 48, N'ÇELEBİ', N'ÇELEBİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (586, 48, N'DELİCE', N'DELİCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (587, 48, N'KARAKEÇİLİ', N'KARAKEÇİLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (588, 48, N'KESKİN', N'KESKİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (589, 48, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (590, 48, N'SULAKYURT', N'SULAKYURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (591, 48, N'YAHŞİHAN', N'YAHŞİHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (592, 49, N'BABAESKİ', N'BABAESKİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (593, 49, N'DEMİRKÖY', N'DEMİRKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (594, 49, N'KOFÇAZ', N'KOFÇAZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (595, 49, N'LÜLEBURGAZ', N'LÜLEBURGAZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (596, 49, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (597, 49, N'PEHLİVANKÖY', N'PEHLİVANKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (598, 49, N'PINARHİSAR', N'PINARHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (599, 49, N'VİZE', N'VİZE', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (600, 50, N'AKÇAKENT', N'AKÇAKENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (601, 50, N'AKPINAR', N'AKPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (602, 50, N'BOZTEPE', N'BOZTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (603, 50, N'ÇİÇEKDAĞI', N'ÇİÇEKDAĞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (604, 50, N'KAMAN', N'KAMAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (605, 50, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (606, 50, N'MUCUR', N'MUCUR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (607, 51, N'ELBEYLİ', N'ELBEYLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (608, 51, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (609, 51, N'MUSABEYLİ', N'MUSABEYLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (610, 51, N'POLATELİ', N'POLATELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (611, 52, N'BAŞİSKELE', N'BAŞİSKELE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (612, 52, N'ÇAYIROVA', N'ÇAYIROVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (613, 52, N'DARICA', N'DARICA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (614, 52, N'DERİNCE', N'DERİNCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (615, 52, N'DİLOVASI', N'DİLOVASI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (616, 52, N'GEBZE', N'GEBZE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (617, 52, N'GÖLCÜK', N'GÖLCÜK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (618, 52, N'İZMİT', N'İZMİT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (619, 52, N'KANDIRA', N'KANDIRA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (620, 52, N'KARAMÜRSEL', N'KARAMÜRSEL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (621, 52, N'KARTEPE', N'KARTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (622, 52, N'KÖRFEZ', N'KÖRFEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (623, 53, N'AHIRLI', N'AHIRLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (624, 53, N'AKÖREN', N'AKÖREN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (625, 53, N'AKŞEHİR', N'AKŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (626, 53, N'ALTINEKİN', N'ALTINEKİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (627, 53, N'BEYŞEHİR', N'BEYŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (628, 53, N'BOZKIR', N'BOZKIR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (629, 53, N'CİHANBEYLİ', N'CİHANBEYLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (630, 53, N'ÇELTİK', N'ÇELTİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (631, 53, N'ÇUMRA', N'ÇUMRA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (632, 53, N'DERBENT', N'DERBENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (633, 53, N'DEREBUCAK', N'DEREBUCAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (634, 53, N'DOĞANHİSAR', N'DOĞANHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (635, 53, N'EMİRGAZİ', N'EMİRGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (636, 53, N'EREĞLİ', N'EREĞLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (637, 53, N'GÜNEYSINIR', N'GÜNEYSINIR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (638, 53, N'HADİM', N'HADİM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (639, 53, N'HALKAPINAR', N'HALKAPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (640, 53, N'HÜYÜK', N'HÜYÜK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (641, 53, N'ILGIN', N'ILGIN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (642, 53, N'KADINHANI', N'KADINHANI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (643, 53, N'KARAPINAR', N'KARAPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (644, 53, N'KARATAY', N'KARATAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (645, 53, N'KULU', N'KULU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (646, 53, N'MERAM', N'MERAM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (647, 53, N'SARAYÖNÜ', N'SARAYÖNÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (648, 53, N'SELÇUKLU', N'SELÇUKLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (649, 53, N'SEYDİŞEHİR', N'SEYDİŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (650, 53, N'TAŞKENT', N'TAŞKENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (651, 53, N'TUZLUKÇU', N'TUZLUKÇU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (652, 53, N'YALIHÜYÜK', N'YALIHÜYÜK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (653, 53, N'YUNAK', N'YUNAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (654, 54, N'ALTINTAŞ', N'ALTINTAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (655, 54, N'ASLANAPA', N'ASLANAPA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (656, 54, N'ÇAVDARHİSAR', N'ÇAVDARHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (657, 54, N'DOMANİÇ', N'DOMANİÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (658, 54, N'DUMLUPINAR', N'DUMLUPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (659, 54, N'EMET', N'EMET', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (660, 54, N'GEDİZ', N'GEDİZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (661, 54, N'HİSARCIK', N'HİSARCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (662, 54, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (663, 54, N'PAZARLAR', N'PAZARLAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (664, 54, N'SİMAV', N'SİMAV', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (665, 54, N'ŞAPHANE', N'ŞAPHANE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (666, 54, N'TAVŞANLI', N'TAVŞANLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (667, 55, N'AKÇADAĞ', N'AKÇADAĞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (668, 55, N'ARAPGİR', N'ARAPGİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (669, 55, N'ARGUVAN', N'ARGUVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (670, 55, N'BATTALGAZİ', N'BATTALGAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (671, 55, N'DARENDE', N'DARENDE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (672, 55, N'DOĞANŞEHİR', N'DOĞANŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (673, 55, N'DOĞANYOL', N'DOĞANYOL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (674, 55, N'HEKİMHAN', N'HEKİMHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (675, 55, N'KALE', N'KALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (676, 55, N'KULUNCAK', N'KULUNCAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (677, 55, N'PÜTÜRGE', N'PÜTÜRGE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (678, 55, N'YAZIHAN', N'YAZIHAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (679, 55, N'YEŞİLYURT', N'YEŞİLYURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (680, 56, N'AHMETLİ', N'AHMETLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (681, 56, N'AKHİSAR', N'AKHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (682, 56, N'ALAŞEHİR', N'ALAŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (683, 56, N'DEMİRCİ', N'DEMİRCİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (684, 56, N'GÖLMARMARA', N'GÖLMARMARA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (685, 56, N'GÖRDES', N'GÖRDES', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (686, 56, N'KIRKAĞAÇ', N'KIRKAĞAÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (687, 56, N'KÖPRÜBAŞI', N'KÖPRÜBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (688, 56, N'KULA', N'KULA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (689, 56, N'SALİHLİ', N'SALİHLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (690, 56, N'SARIGÖL', N'SARIGÖL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (691, 56, N'SARUHANLI', N'SARUHANLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (692, 56, N'SELENDİ', N'SELENDİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (693, 56, N'SOMA', N'SOMA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (694, 56, N'ŞEHZADELER', N'ŞEHZADELER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (695, 56, N'TURGUTLU', N'TURGUTLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (696, 56, N'YUNUSEMRE', N'YUNUSEMRE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (697, 57, N'ARTUKLU', N'ARTUKLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (698, 57, N'DARGEÇİT', N'DARGEÇİT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (699, 57, N'DERİK', N'DERİK', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (700, 57, N'KIZILTEPE', N'KIZILTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (701, 57, N'MAZIDAĞI', N'MAZIDAĞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (702, 57, N'MİDYAT', N'MİDYAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (703, 57, N'NUSAYBİN', N'NUSAYBİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (704, 57, N'ÖMERLİ', N'ÖMERLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (705, 57, N'SAVUR', N'SAVUR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (706, 57, N'YEŞİLLİ', N'YEŞİLLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (707, 58, N'AKDENİZ', N'AKDENİZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (708, 58, N'ANAMUR', N'ANAMUR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (709, 58, N'AYDINCIK', N'AYDINCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (710, 58, N'BOZYAZI', N'BOZYAZI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (711, 58, N'ÇAMLIYAYLA', N'ÇAMLIYAYLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (712, 58, N'ERDEMLİ', N'ERDEMLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (713, 58, N'GÜLNAR', N'GÜLNAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (714, 58, N'MEZİTLİ', N'MEZİTLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (715, 58, N'MUT', N'MUT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (716, 58, N'SİLİFKE', N'SİLİFKE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (717, 58, N'TARSUS', N'TARSUS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (718, 58, N'TOROSLAR', N'TOROSLAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (719, 58, N'YENİŞEHİR', N'YENİŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (720, 59, N'BODRUM', N'BODRUM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (721, 59, N'DALAMAN', N'DALAMAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (722, 59, N'DATÇA', N'DATÇA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (723, 59, N'FETHİYE', N'FETHİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (724, 59, N'KAVAKLIDERE', N'KAVAKLIDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (725, 59, N'KÖYCEĞİZ', N'KÖYCEĞİZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (726, 59, N'MARMARİS', N'MARMARİS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (727, 59, N'MENTEŞE', N'MENTEŞE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (728, 59, N'MİLAS', N'MİLAS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (729, 59, N'ORTACA', N'ORTACA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (730, 59, N'SEYDİKEMER', N'SEYDİKEMER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (731, 59, N'ULA', N'ULA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (732, 59, N'YATAĞAN', N'YATAĞAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (733, 60, N'BULANIK', N'BULANIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (734, 60, N'HASKÖY', N'HASKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (735, 60, N'KORKUT', N'KORKUT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (736, 60, N'MALAZGİRT', N'MALAZGİRT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (737, 60, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (738, 60, N'VARTO', N'VARTO', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (739, 61, N'ACIGÖL', N'ACIGÖL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (740, 61, N'AVANOS', N'AVANOS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (741, 61, N'DERİNKUYU', N'DERİNKUYU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (742, 61, N'GÜLŞEHİR', N'GÜLŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (743, 61, N'HACIBEKTAŞ', N'HACIBEKTAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (744, 61, N'KOZAKLI', N'KOZAKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (745, 61, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (746, 61, N'ÜRGÜP', N'ÜRGÜP', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (747, 62, N'ALTUNHİSAR', N'ALTUNHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (748, 62, N'BOR', N'BOR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (749, 62, N'ÇAMARDI', N'ÇAMARDI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (750, 62, N'ÇİFTLİK', N'ÇİFTLİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (751, 62, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (752, 62, N'ULUKIŞLA', N'ULUKIŞLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (753, 63, N'AKKUŞ', N'AKKUŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (754, 63, N'ALTINORDU', N'ALTINORDU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (755, 63, N'AYBASTI', N'AYBASTI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (756, 63, N'ÇAMAŞ', N'ÇAMAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (757, 63, N'ÇATALPINAR', N'ÇATALPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (758, 63, N'ÇAYBAŞI', N'ÇAYBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (759, 63, N'FATSA', N'FATSA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (760, 63, N'GÖLKÖY', N'GÖLKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (761, 63, N'GÜLYALI', N'GÜLYALI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (762, 63, N'GÜRGENTEPE', N'GÜRGENTEPE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (763, 63, N'İKİZCE', N'İKİZCE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (764, 63, N'KABADÜZ', N'KABADÜZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (765, 63, N'KABATAŞ', N'KABATAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (766, 63, N'KORGAN', N'KORGAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (767, 63, N'KUMRU', N'KUMRU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (768, 63, N'MESUDİYE', N'MESUDİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (769, 63, N'PERŞEMBE', N'PERŞEMBE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (770, 63, N'ULUBEY', N'ULUBEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (771, 63, N'ÜNYE', N'ÜNYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (772, 64, N'BAHÇE', N'BAHÇE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (773, 64, N'DÜZİÇİ', N'DÜZİÇİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (774, 64, N'HASANBEYLİ', N'HASANBEYLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (775, 64, N'KADİRLİ', N'KADİRLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (776, 64, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (777, 64, N'SUMBAS', N'SUMBAS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (778, 64, N'TOPRAKKALE', N'TOPRAKKALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (779, 65, N'ARDEŞEN', N'ARDEŞEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (780, 65, N'ÇAMLIHEMŞİN', N'ÇAMLIHEMŞİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (781, 65, N'ÇAYELİ', N'ÇAYELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (782, 65, N'DEREPAZARI', N'DEREPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (783, 65, N'FINDIKLI', N'FINDIKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (784, 65, N'GÜNEYSU', N'GÜNEYSU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (785, 65, N'HEMŞİN', N'HEMŞİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (786, 65, N'İKİZDERE', N'İKİZDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (787, 65, N'İYİDERE', N'İYİDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (788, 65, N'KALKANDERE', N'KALKANDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (789, 65, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (790, 65, N'PAZAR', N'PAZAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (791, 66, N'ADAPAZARI', N'ADAPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (792, 66, N'AKYAZI', N'AKYAZI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (793, 66, N'ARİFİYE', N'ARİFİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (794, 66, N'ERENLER', N'ERENLER', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (795, 66, N'FERİZLİ', N'FERİZLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (796, 66, N'GEYVE', N'GEYVE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (797, 66, N'HENDEK', N'HENDEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (798, 66, N'KARAPÜRÇEK', N'KARAPÜRÇEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (799, 66, N'KARASU', N'KARASU', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (800, 66, N'KAYNARCA', N'KAYNARCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (801, 66, N'KOCAALİ', N'KOCAALİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (802, 66, N'PAMUKOVA', N'PAMUKOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (803, 66, N'SAPANCA', N'SAPANCA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (804, 66, N'SERDİVAN', N'SERDİVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (805, 66, N'SÖĞÜTLÜ', N'SÖĞÜTLÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (806, 66, N'TARAKLI', N'TARAKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (807, 67, N'19 MAYIS', N'19 MAYIS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (808, 67, N'ALAÇAM', N'ALAÇAM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (809, 67, N'ASARCIK', N'ASARCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (810, 67, N'ATAKUM', N'ATAKUM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (811, 67, N'AYVACIK', N'AYVACIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (812, 67, N'BAFRA', N'BAFRA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (813, 67, N'CANİK', N'CANİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (814, 67, N'ÇARŞAMBA', N'ÇARŞAMBA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (815, 67, N'HAVZA', N'HAVZA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (816, 67, N'İLKADIM', N'İLKADIM', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (817, 67, N'KAVAK', N'KAVAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (818, 67, N'LADİK', N'LADİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (819, 67, N'SALIPAZARI', N'SALIPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (820, 67, N'TEKKEKÖY', N'TEKKEKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (821, 67, N'TERME', N'TERME', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (822, 67, N'VEZİRKÖPRÜ', N'VEZİRKÖPRÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (823, 67, N'YAKAKENT', N'YAKAKENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (824, 68, N'BAYKAN', N'BAYKAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (825, 68, N'ERUH', N'ERUH', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (826, 68, N'KURTALAN', N'KURTALAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (827, 68, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (828, 68, N'PERVARİ', N'PERVARİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (829, 68, N'ŞİRVAN', N'ŞİRVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (830, 68, N'TİLLO', N'TİLLO', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (831, 69, N'AYANCIK', N'AYANCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (832, 69, N'BOYABAT', N'BOYABAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (833, 69, N'DİKMEN', N'DİKMEN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (834, 69, N'DURAĞAN', N'DURAĞAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (835, 69, N'ERFELEK', N'ERFELEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (836, 69, N'GERZE', N'GERZE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (837, 69, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (838, 69, N'SARAYDÜZÜ', N'SARAYDÜZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (839, 69, N'TÜRKELİ', N'TÜRKELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (840, 70, N'AKINCILAR', N'AKINCILAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (841, 70, N'ALTINYAYLA', N'ALTINYAYLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (842, 70, N'DİVRİĞİ', N'DİVRİĞİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (843, 70, N'DOĞANŞAR', N'DOĞANŞAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (844, 70, N'GEMEREK', N'GEMEREK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (845, 70, N'GÖLOVA', N'GÖLOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (846, 70, N'GÜRÜN', N'GÜRÜN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (847, 70, N'HAFİK', N'HAFİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (848, 70, N'İMRANLI', N'İMRANLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (849, 70, N'KANGAL', N'KANGAL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (850, 70, N'KOYULHİSAR', N'KOYULHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (851, 70, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (852, 70, N'SUŞEHRİ', N'SUŞEHRİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (853, 70, N'ŞARKIŞLA', N'ŞARKIŞLA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (854, 70, N'ULAŞ', N'ULAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (855, 70, N'YILDIZELİ', N'YILDIZELİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (856, 70, N'ZARA', N'ZARA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (857, 71, N'AKÇAKALE', N'AKÇAKALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (858, 71, N'BİRECİK', N'BİRECİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (859, 71, N'BOZOVA', N'BOZOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (860, 71, N'CEYLANPINAR', N'CEYLANPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (861, 71, N'EYYÜBİYE', N'EYYÜBİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (862, 71, N'HALFETİ', N'HALFETİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (863, 71, N'HALİLİYE', N'HALİLİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (864, 71, N'HARRAN', N'HARRAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (865, 71, N'HİLVAN', N'HİLVAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (866, 71, N'KARAKÖPRÜ', N'KARAKÖPRÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (867, 71, N'SİVEREK', N'SİVEREK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (868, 71, N'SURUÇ', N'SURUÇ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (869, 71, N'VİRANŞEHİR', N'VİRANŞEHİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (870, 72, N'BEYTÜŞŞEBAP', N'BEYTÜŞŞEBAP', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (871, 72, N'CİZRE', N'CİZRE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (872, 72, N'GÜÇLÜKONAK', N'GÜÇLÜKONAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (873, 72, N'İDİL', N'İDİL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (874, 72, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (875, 72, N'SİLOPİ', N'SİLOPİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (876, 72, N'ULUDERE', N'ULUDERE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (877, 73, N'ÇERKEZKÖY', N'ÇERKEZKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (878, 73, N'ÇORLU', N'ÇORLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (879, 73, N'ERGENE', N'ERGENE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (880, 73, N'HAYRABOLU', N'HAYRABOLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (881, 73, N'KAPAKLI', N'KAPAKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (882, 73, N'MALKARA', N'MALKARA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (883, 73, N'MARMARAEREĞLİSİ', N'MARMARAEREĞLİSİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (884, 73, N'MURATLI', N'MURATLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (885, 73, N'SARAY', N'SARAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (886, 73, N'SÜLEYMANPAŞA', N'SÜLEYMANPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (887, 73, N'ŞARKÖY', N'ŞARKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (888, 74, N'ALMUS', N'ALMUS', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (889, 74, N'ARTOVA', N'ARTOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (890, 74, N'BAŞÇİFTLİK', N'BAŞÇİFTLİK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (891, 74, N'ERBAA', N'ERBAA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (892, 74, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (893, 74, N'NİKSAR', N'NİKSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (894, 74, N'PAZAR', N'PAZAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (895, 74, N'REŞADİYE', N'REŞADİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (896, 74, N'SULUSARAY', N'SULUSARAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (897, 74, N'TURHAL', N'TURHAL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (898, 74, N'YEŞİLYURT', N'YEŞİLYURT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (899, 74, N'ZİLE', N'ZİLE', NULL)
GO
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (900, 75, N'AKÇAABAT', N'AKÇAABAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (901, 75, N'ARAKLI', N'ARAKLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (902, 75, N'ARSİN', N'ARSİN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (903, 75, N'BEŞİKDÜZÜ', N'BEŞİKDÜZÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (904, 75, N'ÇARŞIBAŞI', N'ÇARŞIBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (905, 75, N'ÇAYKARA', N'ÇAYKARA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (906, 75, N'DERNEKPAZARI', N'DERNEKPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (907, 75, N'DÜZKÖY', N'DÜZKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (908, 75, N'HAYRAT', N'HAYRAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (909, 75, N'KÖPRÜBAŞI', N'KÖPRÜBAŞI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (910, 75, N'MAÇKA', N'MAÇKA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (911, 75, N'OF', N'OF', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (912, 75, N'ORTAHİSAR', N'ORTAHİSAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (913, 75, N'SÜRMENE', N'SÜRMENE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (914, 75, N'ŞALPAZARI', N'ŞALPAZARI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (915, 75, N'TONYA', N'TONYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (916, 75, N'VAKFIKEBİR', N'VAKFIKEBİR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (917, 75, N'YOMRA', N'YOMRA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (918, 76, N'ÇEMİŞGEZEK', N'ÇEMİŞGEZEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (919, 76, N'HOZAT', N'HOZAT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (920, 76, N'MAZGİRT', N'MAZGİRT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (921, 76, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (922, 76, N'NAZIMİYE', N'NAZIMİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (923, 76, N'OVACIK', N'OVACIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (924, 76, N'PERTEK', N'PERTEK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (925, 76, N'PÜLÜMÜR', N'PÜLÜMÜR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (926, 77, N'BANAZ', N'BANAZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (927, 77, N'EŞME', N'EŞME', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (928, 77, N'KARAHALLI', N'KARAHALLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (929, 77, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (930, 77, N'SİVASLI', N'SİVASLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (931, 77, N'ULUBEY', N'ULUBEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (932, 78, N'BAHÇESARAY', N'BAHÇESARAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (933, 78, N'BAŞKALE', N'BAŞKALE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (934, 78, N'ÇALDIRAN', N'ÇALDIRAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (935, 78, N'ÇATAK', N'ÇATAK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (936, 78, N'EDREMİT', N'EDREMİT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (937, 78, N'ERCİŞ', N'ERCİŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (938, 78, N'GEVAŞ', N'GEVAŞ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (939, 78, N'GÜRPINAR', N'GÜRPINAR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (940, 78, N'İPEKYOLU', N'İPEKYOLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (941, 78, N'MURADİYE', N'MURADİYE', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (942, 78, N'ÖZALP', N'ÖZALP', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (943, 78, N'SARAY', N'SARAY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (944, 78, N'TUŞBA', N'TUŞBA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (945, 79, N'ALTINOVA', N'ALTINOVA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (946, 79, N'ARMUTLU', N'ARMUTLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (947, 79, N'ÇINARCIK', N'ÇINARCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (948, 79, N'ÇİFTLİKKÖY', N'ÇİFTLİKKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (949, 79, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (950, 79, N'TERMAL', N'TERMAL', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (951, 80, N'AKDAĞMADENİ', N'AKDAĞMADENİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (952, 80, N'AYDINCIK', N'AYDINCIK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (953, 80, N'BOĞAZLIYAN', N'BOĞAZLIYAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (954, 80, N'ÇANDIR', N'ÇANDIR', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (955, 80, N'ÇAYIRALAN', N'ÇAYIRALAN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (956, 80, N'ÇEKEREK', N'ÇEKEREK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (957, 80, N'KADIŞEHRİ', N'KADIŞEHRİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (958, 80, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (959, 80, N'SARAYKENT', N'SARAYKENT', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (960, 80, N'SARIKAYA', N'SARIKAYA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (961, 80, N'SORGUN', N'SORGUN', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (962, 80, N'ŞEFAATLİ', N'ŞEFAATLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (963, 80, N'YENİFAKILI', N'YENİFAKILI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (964, 80, N'YERKÖY', N'YERKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (965, 81, N'ALAPLI', N'ALAPLI', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (966, 81, N'ÇAYCUMA', N'ÇAYCUMA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (967, 81, N'DEVREK', N'DEVREK', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (968, 81, N'EREĞLİ', N'EREĞLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (969, 81, N'GÖKÇEBEY', N'GÖKÇEBEY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (970, 81, N'KİLİMLİ', N'KİLİMLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (971, 81, N'KOZLU', N'KOZLU', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (972, 81, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (973, 7, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (974, 11, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (975, 12, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (976, 21, N'M.KEMALPAŞA', N'M.KEMALPAŞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (977, 26, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (978, 31, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (979, 40, N'ATAKÖY', N'ATAKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (980, 40, N'AYAZAĞA', N'AYAZAĞA', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (981, 40, N'CEVİZLİ', N'CEVİZLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (982, 40, N'EMİNÖNÜ', N'EMİNÖNÜ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (983, 40, N'İKİTELLİ', N'İKİTELLİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (984, 40, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (985, 40, N'ORTAKÖY', N'ORTAKÖY', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (986, 41, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (987, 42, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (988, 55, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (989, 56, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (990, 58, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (991, 59, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (992, 63, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (993, 67, N'GAZİ', N'GAZİ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (994, 71, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (995, 73, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (996, 75, N'MERKEZ', N'MERKEZ', NULL)
INSERT [dbo].[Counties] ([Id], [CityId], [Name], [DisplayName], [Code]) VALUES (997, 78, N'MERKEZ', N'MERKEZ', NULL)
SET IDENTITY_INSERT [dbo].[Counties] OFF
GO
SET IDENTITY_INSERT [dbo].[Message2] ON 

INSERT [dbo].[Message2] ([MessageID], [SenderID], [ReceiverID], [Subject], [MessageDetails], [MessageDate], [MessageStatus]) VALUES (3, 1, 2, N'Seyahat Bloğu Sorunu', N'Mesaj Detayları', CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Message2] ([MessageID], [SenderID], [ReceiverID], [Subject], [MessageDetails], [MessageDate], [MessageStatus]) VALUES (6, 2, 1, N'C# Kod Script', N'Detay Mesaj', CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Message2] ([MessageID], [SenderID], [ReceiverID], [Subject], [MessageDetails], [MessageDate], [MessageStatus]) VALUES (7, 3, 2, N'Tutarlı Veri', N'Tutarlı Veri Mesaj Detayları', CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Message2] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageID], [Sender], [Receiver], [Subject], [MessageDetails], [MessageDate], [MessageStatus]) VALUES (1, N'İbrahim Test Mesajı', N'ibrahim.okuyucu@setup34.com.tr', N'Test Mesajı Merhaba', N'Bu Mesaj Test Mesajıdır', CAST(N'2022-02-10T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Messages] ([MessageID], [Sender], [Receiver], [Subject], [MessageDetails], [MessageDate], [MessageStatus]) VALUES (3, N'Büşra', N'ibrahim.okuyucu@setup34.com.tr', N'Büşra Test', N'Bu Mesaj Test Mesajıdır', CAST(N'2022-02-10T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Newsletters] ON 

INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (1, N'ibrahim.okuyucu@setup34.com.tr', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (2, N'cakirunal28@gmail.com', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (3, N'marakamsaribaglar@gmail.com', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (4, N'siran@siran.com', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (5, N'asdasdasdasd@hotmail.com', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (6, N'siran@siran.com', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (7, N'ibrahimokuyucu@setup34.com.tr', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (8, N'ibrahimokuyucu@setup34.com.tr', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (9, N'siran@siran.com', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (10, N'ibrahimokuyucu@setup34.com.tr', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (11, N'ibrahimokuyucu@setup34.com.tr', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (12, N'siran@siran.com', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (13, N'ibrahimokuyucu@setup34.com.tr', 1, CAST(N'2022-01-20T00:53:28.0828334' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (14, N'siran@siran.com', 1, CAST(N'2022-01-20T09:35:17.0148070' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (15, N'cakirunal28@gmail.com', 1, CAST(N'2022-01-20T10:48:37.7783231' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (16, N'ugur.can@setup34.com.tr', 1, CAST(N'2022-01-20T14:36:21.8215081' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (17, N'ibrahimokuyucu@setup34.com.tr', 1, CAST(N'2022-01-29T19:05:48.4941167' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (18, N'ibrahimokuyucu@setup34.com.tr', 1, CAST(N'2022-01-29T19:05:59.5369965' AS DateTime2))
INSERT [dbo].[Newsletters] ([MailID], [MailAdress], [MailStatus], [MailAddDate]) VALUES (19, N'asdasda@hotmail.com', 1, CAST(N'2022-01-29T23:49:40.6104712' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Newsletters] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotificationID], [NotificationType], [NotificationTypeSymbol], [NotificationDetails], [NotificationDate], [NotificationStatus], [NotificationColor]) VALUES (1, N'BootCamp', N'mdi mdi-calendar', N'.Net Core 5.0 BootCamp Bu Akşam. KAÇIRMA', CAST(N'2022-02-09T00:00:00.0000000' AS DateTime2), 1, N'preview-icon bg-success')
INSERT [dbo].[Notifications] ([NotificationID], [NotificationType], [NotificationTypeSymbol], [NotificationDetails], [NotificationDate], [NotificationStatus], [NotificationColor]) VALUES (6, N'Yazar İmza Günü', N'mdi mdi-settings', N'İmza Günü Bugün Bilgin Olsun', CAST(N'2022-02-09T00:00:00.0000000' AS DateTime2), 1, N'preview-icon bg-warning')
INSERT [dbo].[Notifications] ([NotificationID], [NotificationType], [NotificationTypeSymbol], [NotificationDetails], [NotificationDate], [NotificationStatus], [NotificationColor]) VALUES (8, N'Sistem Bakımı', N'mdi mdi-link-variant', N'Sistem Bakımı Olacaktır.', CAST(N'2022-02-12T00:00:00.0000000' AS DateTime2), 1, N'preview-icon bg-info')
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Writers] ON 

INSERT [dbo].[Writers] ([WriterID], [WriterName], [WriterAbout], [WriterImage], [WriterMail], [WriterPassword], [WriterStatus], [WriterAddDate]) VALUES (1, N'İbrahim OKUYUCU', N'Ben İbrahim OKUYUCU Kastamonu Üniversitesi Cide Rıfat ILGAZ M.Y.O mezunu bir Bilgisayar Programcısıyım. Temelde yazılımcı olmama rağmen mühendislik mezunu olmadığımız için bize üvey evlat muamelesi yapılıyor.', N'/CoreBlogTemplate/images/t1.jpg', N'ibrahim.okuyucu@setup34.com.tr', N'123456aA!', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Writers] ([WriterID], [WriterName], [WriterAbout], [WriterImage], [WriterMail], [WriterPassword], [WriterStatus], [WriterAddDate]) VALUES (2, N'Murat YÜCEDAĞ', N'<p>Fırat &Uuml;niversitesi mezunu bir yazılım m&uuml;hendisi Test Bilgiler Yeni</p>
', NULL, N'murat@murat.com', N'123', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Writers] ([WriterID], [WriterName], [WriterAbout], [WriterImage], [WriterMail], [WriterPassword], [WriterStatus], [WriterAddDate]) VALUES (3, N'Büşra Okuyucu', N'Ben Büşra OKUYUCU, ibrahim'' in eşiyim. Tarih Öğretmeniyim ve atanamadım :-)', N'/CoreBlogTemplate/images/t2.jpg', N'busra@gmail.com', N'Busra67', 1, CAST(N'2022-01-20T23:55:07.5082983' AS DateTime2))
INSERT [dbo].[Writers] ([WriterID], [WriterName], [WriterAbout], [WriterImage], [WriterMail], [WriterPassword], [WriterStatus], [WriterAddDate]) VALUES (4, N'Tolga', N'tolga@tolga.com', N'9e6e53af-1f8d-433a-bb60-6ec39fae60b0.png', N'tolga@tolga.com', N'123aA!', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Writers] OFF
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT ((0)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT ((0)) FOR [WriterID]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [BlogID]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [BlogScore]
GO
ALTER TABLE [dbo].[Newsletters] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [MailAddDate]
GO
ALTER TABLE [dbo].[Writers] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [WriterAddDate]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Categories_CategoryID]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Writers_WriterID] FOREIGN KEY([WriterID])
REFERENCES [dbo].[Writers] ([WriterID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Writers_WriterID]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs_BlogID] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blogs] ([BlogID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs_BlogID]
GO
ALTER TABLE [dbo].[Counties]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Counties_dbo.Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Counties] CHECK CONSTRAINT [FK_dbo.Counties_dbo.Cities_CityId]
GO
ALTER TABLE [dbo].[Message2]  WITH CHECK ADD  CONSTRAINT [FK_Message2_Writers_ReceiverID] FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[Writers] ([WriterID])
GO
ALTER TABLE [dbo].[Message2] CHECK CONSTRAINT [FK_Message2_Writers_ReceiverID]
GO
ALTER TABLE [dbo].[Message2]  WITH CHECK ADD  CONSTRAINT [FK_Message2_Writers_SenderID] FOREIGN KEY([SenderID])
REFERENCES [dbo].[Writers] ([WriterID])
GO
ALTER TABLE [dbo].[Message2] CHECK CONSTRAINT [FK_Message2_Writers_SenderID]
GO
