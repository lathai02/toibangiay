USE [master]
GO
/****** Object:  Database [SellShoes]    Script Date: 5/25/2023 10:09:13 PM ******/
CREATE DATABASE [SellShoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SellShoes_data', FILENAME = N'D:\SPRING2023\PRJ301\project\SellShoes_data.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 2048KB )
 LOG ON 
( NAME = N'SellShoes_log', FILENAME = N'D:\SPRING2023\PRJ301\project\SellShoes_log.ldf' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 2048KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SellShoes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SellShoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SellShoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SellShoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SellShoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SellShoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SellShoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [SellShoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SellShoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SellShoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SellShoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SellShoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SellShoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SellShoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SellShoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SellShoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SellShoes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SellShoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SellShoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SellShoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SellShoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SellShoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SellShoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SellShoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SellShoes] SET RECOVERY FULL 
GO
ALTER DATABASE [SellShoes] SET  MULTI_USER 
GO
ALTER DATABASE [SellShoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SellShoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SellShoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SellShoes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SellShoes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SellShoes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SellShoes', N'ON'
GO
ALTER DATABASE [SellShoes] SET QUERY_STORE = OFF
GO
USE [SellShoes]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 5/25/2023 10:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandDetail] [nvarchar](3000) NULL,
	[brandName] [nvarchar](20) NULL,
	[image] [varchar](200) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countTimeAccess]    Script Date: 5/25/2023 10:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countTimeAccess](
	[shoesId] [int] NOT NULL,
	[count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportHistory]    Script Date: 5/25/2023 10:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportHistory](
	[importHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[shoesId] [int] NULL,
	[dateAdd] [date] NULL,
	[timeAdd] [time](7) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_ImportHistory] PRIMARY KEY CLUSTERED 
(
	[importHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shoes]    Script Date: 5/25/2023 10:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoes](
	[shoesId] [int] IDENTITY(1,1) NOT NULL,
	[shoesCode] [varchar](100) NULL,
	[shoesOrigin] [nvarchar](30) NULL,
	[shoesDetail] [nvarchar](500) NULL,
	[shoesName] [nvarchar](100) NULL,
	[shoesColor] [varchar](15) NULL,
	[shoesPrice] [money] NULL,
	[shoesDecription] [nvarchar](200) NULL,
	[shoesImage] [varchar](200) NULL,
	[shoesSize] [float] NULL,
	[shoesStockQuantity] [int] NULL,
	[shoesGender] [bit] NULL,
	[shoesDiscount] [float] NULL,
	[brandId] [int] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_Shoes] PRIMARY KEY CLUSTERED 
(
	[shoesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 5/25/2023 10:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ShopName] [nvarchar](50) NOT NULL,
	[ShopPhoneNumber] [varchar](10) NULL,
	[ShopEmail] [varchar](80) NULL,
	[ShopAddress] [nvarchar](300) NULL,
	[ShopImage] [varchar](500) NULL,
	[ShopDescription] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/25/2023 10:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[userGender] [bit] NULL,
	[userDob] [date] NULL,
	[userEmail] [varchar](80) NULL,
	[userPhoneNumber] [varchar](10) NULL,
	[userAddress] [nvarchar](300) NULL,
	[userAccount] [nvarchar](50) NULL,
	[userPassword] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([brandId], [brandDetail], [brandName], [image]) VALUES (1, N'Nike được biết đến là một trong những tập đoàn lớn, cung cấp rất nhiều món phụ kiện, thời trang, giày dép,... phục vụ cho tập luyện, thi đấu thể thao. Thế nhưng, với những người mới làm quen với thương hiệu giày thể thao Nike thì không biết đây là thương hiệu đến từ nước nào? Nike có tên đầy đủ là Nike, Inc. Vào năm 1964, thì Bill Bowerman và Phil Knight đã cùng nhau đồng sáng lập nên thương hiệu này. Trụ sở chính của Nike được đặt tại Oregon - Mỹ. Cho đến thời điểm hiện tại, thì tại Việt Nam chưa có nhà máy sản xuất nào của Nike được đặt ở đây.', N'Nike', N'5657945.jpg')
INSERT [dbo].[Brand] ([brandId], [brandDetail], [brandName], [image]) VALUES (2, N'thiết kế của adidas dành cho và đồng hành cùng các vận động viên thuộc mọi thể loại. Người sáng tạo, những người thích thay đổi trò chơi. Thách thức quy ước. Phá vỡ các quy tắc và xác định những quy tắc mới. Sau đó phá vỡ chúng một lần nữa. Chúng tôi cung cấp cho các đội và cá nhân quần áo thể thao trước trận đấu. Để luôn tập trung. Chúng tôi thiết kế trang phục thể thao giúp bạn về đích. Để giành chiến thắng trong trận đấu. Chúng tôi hỗ trợ phụ nữ với áo ngực và quần tất được sản xuất có mục đích. Hỗ trợ từ thấp đến cao. Thoải mái tối đa.', N'Adidas', N'315352.jpg')
INSERT [dbo].[Brand] ([brandId], [brandDetail], [brandName], [image]) VALUES (3, N'Vào tháng 5 năm 2015, Vans ra mắt Propeller: A Vans Skateboarding Video, bộ phim ngắn về ván trượt đầu tiên của Vans. Dịp trọng đại này đã đánh dấu giá trị của Vans Pro Skate trên nền thương nghiệp thời trang quốc tế. PROPELLER trở thành một trong những bộ phim trượt băng có thời lượng xem xong nhanh nhất trên iTunes. Vào mùa hè năm 2015, Vans phát hành bộ sưu tập "Young at Heart" của Disney và Vault by Vans x Takashi Murakami. ', N'Vans', N'889590.jpg')
INSERT [dbo].[Brand] ([brandId], [brandDetail], [brandName], [image]) VALUES (8, N'Được thành lập vào năm 1948 tại Đức, PUMA là một trong những thương hiệu thể thao hàng đầu thế giới về thiết kế, phát triển các mặt hàng giày dép, quần áo, phụ kiện. PUMA chuyên sản xuất giày thời trang và giày thể thao dùng trong bóng đá, chạy bộ, giày để tập luyện trong phòng tập, golf và đua xe mô-tô. Thương hiệu hiện phân phối các dòng sản phẩm tại hơn 120 quốc gia và được phân phối tại Việt Nam bởi Maison.', N'Puma', N'logo-thuong-hieu-puma-elle-man-1.jpg')
INSERT [dbo].[Brand] ([brandId], [brandDetail], [brandName], [image]) VALUES (10, N'Chắc hẳn các bạn đã quá quen thuộc với cái tên MLB-Korea, một thương hiệu đình đám lấy cảm hứng từ bộ môn bóng chày nổi tiếng, với vô vàn sản phẩm nổi bật. Điều đó đã làm nên sức hấp dẫn với các bạn trẻ hiện đại, để đến khi nhắc đên thời trang và phụ kiện, sẽ không thể nào không nhắc, nhớ đến nhà MLB. Với các bộ sưu tập đầy cuốn hút và trending, đầy tính lịch lãm, thẩm mỹ nhưng năng động, hiện đại khó lỗi thời. Và để cho tủđồ của bạn trở nên đầy màu sắc, nhiều phụ kiện hơn, hôm nay MLB sẽ giới thiệu đến cho bạn một vài chiếc túi đeo chéo nhẹ nhàng nhưng đầy lôi cuốn.   ', N'Mlb', N'278380285_822075965849597_6344394120697899184_n.jpg')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (27, 1)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (6, 5)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (20, 1)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (32, 1)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (19, 2)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (22, 3)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (16, 2)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (5, 2)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (26, 3)
INSERT [dbo].[countTimeAccess] ([shoesId], [count]) VALUES (3, 4)
GO
SET IDENTITY_INSERT [dbo].[ImportHistory] ON 

INSERT [dbo].[ImportHistory] ([importHistoryId], [shoesId], [dateAdd], [timeAdd], [quantity]) VALUES (6, 3, CAST(N'2023-03-12' AS Date), CAST(N'01:09:00' AS Time), 100)
INSERT [dbo].[ImportHistory] ([importHistoryId], [shoesId], [dateAdd], [timeAdd], [quantity]) VALUES (7, 6, CAST(N'2023-03-16' AS Date), CAST(N'16:05:00' AS Time), 100)
SET IDENTITY_INSERT [dbo].[ImportHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Shoes] ON 

INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (3, N'Adidas_Red_Female_Ultra4d 5.01_45', N'Germany', N'Giày Sneaker Adidas Nam Ultra4d 5.0 ''''Solar Red'''' G58159 - Hàng Chính Hãng', N'Ultra4d 5.01', N'Red', 3200000.0000, N'ĐÔI GIÀY CHẠY BỘ NÂNG ĐỠ VÀ TÂN TIẾN, CÓ SỬ DỤNG SỢI PARLEY OCEAN PLASTIC.', N'g58159-01.webp', 45, 100, 0, 0.5, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (5, N'Nike_Red_Male_Renew Run 3.0_42', N'America', N'Giày Sneaker Nike Nam Renew Run 3.0 "Siren Red" Dc9413-600 - Hàng Chính Hãng', N'Renew Run 3.0', N'Red', 1650000.0000, N'Giày Sneaker Nike Nam Renew Run 3.0 "Siren Red" Dc9413-600 - Hàng Chính Hãng', N'image-1676876364918.webp', 42, 0, 1, 0, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (6, N'Nike_White_Male_Renew Run_42', N'America', N'Giày Sneaker Nike Renew Run ', N'Renew Run', N'White', 1150000.0000, N'Giày Sneaker Nike Renew Run ', N'b82e66f1-a144-4f8f-9ad1-3654543e1518.jpg', 42, 100, 1, 0, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (7, N'Adidas_Galaxy Blue_Male_Ultraboost 22_44', N'Germany', N'Giày Sneaker Adidas Nam Ultraboost 22 "Blue Rush" Gx3061 - Hàng Chính Hãng', N'Ultraboost 22', N'Galaxy Blue', 2250000.0000, N'Giày Sneaker Adidas Nam Ultraboost 22 "Blue Rush" Gx3061 - Hàng Chính Hãng', N'giay-ultraboost-22-mau-xanh-da-t-1667630184890.webp', 44, 0, 1, 0, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (9, N'Nike_White_Male_Lebron 19 Para Hombre Blanco_42', N'America', N'Giày Bóng Rổ Nike Nam - Lebron 19 Para Hombre Blanco "White Red" Cz0203-101 - Hàng Chính Hãng', N'Lebron 19 Para Hombre Blanco', N'White', 3790000.0000, N'Giày Bóng Rổ Nike Nam - Lebron 19 Para Hombre Blanco "White Red" Cz0203-101 - Hàng Chính Hãng', N'image-1671334280342.webp', 42, 0, 1, 0, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (13, N'Adidas_Yellow_Male_Adizero Pro_42', N'Germany', N'Giày Sneaker Adidas Nam Nữ Adizero Pro "Solar Yellow" Fy0101 - Hàng Chính Hãng', N'Adizero Pro', N'Yellow', 1625000.0000, N'Giày Sneaker Adidas Nam Nữ Adizero Pro "Solar Yellow" Fy0101 - Hàng Chính Hãng', N'image-1674527567091.webp', 42, 0, 1, 0, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (14, N'Adidas_Galaxy Blue_Male_Ultraboost 22_45', N'Germany', N'Giày Sneaker Adidas Nam Ultraboost 22 "Blue Rush" Gx3061 - Hàng Chính Hãng', N'Ultraboost 22', N'Galaxy Blue', 2250000.0000, N'Giày Sneaker Adidas Nam Ultraboost 22 "Blue Rush" Gx3061 - Hàng Chính Hãng', N'giay-ultraboost-22-mau-xanh-da-t-1667630184890 (1).webp', 45, 0, 1, 0, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (16, N'Nike_Green_Male_Jordan Why Not Zer0.5_43', N'America', N'Giày Bóng Rổ Nike Nam Jordan Why Not Zer0.5 "Beige Brown" Dc3638-102 - Hàng Chính Hãng', N'Jordan Why Not Zer0.5', N'Green', 2790000.0000, N'Giày Bóng Rổ Nike Nam Jordan Why Not Zer0.5 "Beige Brown" Dc3638-102 - Hàng Chính Hãng', N'image-1671334369463.webp', 43, 0, 1, 0, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (19, N'Adidas_Green_Male_Ultraboost 21_44', N'Germany', N'Giày Sneaker Adidas Nam Ultraboost 21 "Silver Carbon" Fy3952 - Hàng Chính Hãng', N'Ultraboost 21', N'Green', 2190000.0000, N'Giày Sneaker Adidas Nam Ultraboost 21 "Silver Carbon" Fy3952 - Hàng Chính Hãng', N'0a848494-ee07-49d8-aa99-7746d0f9d1e6.webp', 44, 0, 1, 0, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (20, N'Nike_White_Male_Air Zoom Pegasus_45', N'America', N'Giày Sneaker Nike Nam Nữ Air Zoom Pegasus 39 "Silver Platinum" Dh4072-100 - Hàng Chính Hãng', N'Air Zoom Pegasus', N'White', 1990000.0000, N'Giày Sneaker Nike Nam Nữ Air Zoom Pegasus 39 "Silver Platinum" Dh4072-100 - Hàng Chính Hãng', N'image-1678075972642.webp', 45, 0, 1, 0, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (21, N'Nike_Galaxy Blue_Male_Nike Jordan 1 Mid_44', N'America', N'Giày Sneaker Nam Nữ Nike Jordan 1 Mid Bq6931-402 Gs "Signal Blue" - Hàng Chính Hãng', N'Nike Jordan 1 Mid', N'Galaxy Blue', 2650000.0000, N'Giày Sneaker Nam Nữ Nike Jordan 1 Mid Bq6931-402 Gs "Signal Blue" - Hàng Chính Hãng', N'0f7659d9-7477-4fae-8dc0-f4266278284e.webp', 44, 0, 1, 0, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (22, N'Adidas_Red_Male_Adidas Adilette Clogs_44', N'Germany', N'Dép Thời Trang Adidas Adilette Clogs "Vivid Red" Gz5887 - Hàng Chính Hãng', N'Adidas Adilette Clogs', N'Red', 750000.0000, N'Dép Thời Trang Adidas Adilette Clogs "Vivid Red" Gz5887 - Hàng Chính Hãng', N'image-1678878090695.webp', 44, 0, 1, 0, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (23, N'Adidas_White_Male_Ultra4d X Parley_44', N'Germany', N'Giày Sneaker Adidas Nam Ultra4d X Parley "Cream White" Fz0596 - Hàng Chính Hãng', N'Ultra4d X Parley', N'White', 3200000.0000, N'Giày Sneaker Adidas Nam Ultra4d X Parley "Cream White" Fz0596 - Hàng Chính Hãng', N'image-1672927332165.webp', 44, 0, 1, 0, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (24, N'Puma_White_Female_Puma RS-X_41', N'Germany', N'Giày PUMA RS-X Hard Drive ''White Peacoat Red'' 369818-03', N'Puma RS-X', N'White', 1450000.0000, N'Giày PUMA RS-X Hard Drive ''White Peacoat Red'' 369818-03', N's-l1600.webp', 41, 0, 0, 0, 8, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (25, N'Puma_White_Female_Puma RS-X_42', N'Germany', N'Giày PUMA RS-X Hard Drive ''White Peacoat Red'' 369818-03', N'Puma RS-X', N'White', 1450000.0000, N'Giày PUMA RS-X Hard Drive ''White Peacoat Red'' 369818-03', N's-l1600.webp', 42, 0, 0, 0, 8, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (26, N'Mlb_White_Male_Playball Origin Mule New York Yankees_44', N'Korean', N'Giày Sneaker Mlb Nữ Playball Origin Mule New York Yankees 3amuua11n-50whs - Hàng Chính Hãng', N'Playball Origin Mule New York Yankees', N'White', 1450000.0000, N'Giày Sneaker Mlb Nữ Playball Origin Mule New York Yankees 3amuua11n-50whs - Hàng Chính Hãng', N'image-1678767000421.webp', 44, 0, 1, 0.1, 10, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (27, N'Adidas_Galaxy Blue_Male_U_path Run_46', N'Germany', N'Giày Sneaker Adidas Nam U_path Run "Triple Black" G27636 - Hàng Chính Hãng', N'U_path Run', N'Galaxy Blue', 1090000.0000, N'Giày Sneaker Adidas Nam U_path Run "Triple Black" G27636 - Hàng Chính Hãng', N'image-1674733811335.webp', 46, 0, 1, 0.5, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (29, N'Adidas_Grey_Male_Ultraboost 22_46', N'Germany', N'Giày Sneaker Adidas Nam Nữ Ultraboost 22 "Magic Grey" H01170 - Hàng Chính Hãng', N'Ultraboost 22', N'Grey', 2250000.0000, N'Giày Sneaker Adidas Nam Nữ Ultraboost 22 "Magic Grey" H01170 - Hàng Chính Hãng', N'h01170-01-1658635403712.webp', 46, 0, 1, 0.5, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (31, N'Adidas_White_Male_Ultra4dfwd _44', N'Germany', N'Giày Sneaker Adidas Nam Ultra4dfwd "Og" Gz6941 - Hàng Chính Hãng', N'Ultra4dfwd ', N'White', 3200000.0000, N'Giày Sneaker Adidas Nam Ultra4dfwd "Og" Gz6941 - Hàng Chính Hãng', N'image-1671442414757.webp', 44, 0, 1, 0.6, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (32, N'Adidas_Black_Male_Ultraboost 22_43', N'Germany', N'Giày Sneaker Nam Adidas Ultraboost 22 Cold.Rdy "Impact Orange" Gx6689 - Hàng Chính Hãng', N'Ultraboost 22', N'Black', 2450000.0000, N'Giày Sneaker Nam Adidas Ultraboost 22 Cold.Rdy "Impact Orange" Gx6689 - Hàng Chính Hãng', N'image-1678877502716.webp', 43, 0, 1, 0, 2, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (33, N'Nike_Grey_Male_Air Jordan 1 Mid_43', N'America', N'Giày Sneaker Nike Nam Air Jordan 1 Mid "Smoke Grey" 554724-078 - Hàng Chính Hãng', N'Air Jordan 1 Mid', N'Grey', 4850000.0000, N'Giày Sneaker Nike Nam Air Jordan 1 Mid "Smoke Grey" 554724-078 - Hàng Chính Hãng', N'image-1678972541420.webp', 43, 0, 1, 0.1, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (34, N'Nike_Red_Male_ Jordan 1 Mid_45', N'America', N'Giày Sneaker Nam Nữ Nike Jordan 1 Mid 554725-074 Gs "Banned" - Hàng Chính Hãng', N' Jordan 1 Mid', N'Red', 4150000.0000, N'Giày Sneaker Nam Nữ Nike Jordan 1 Mid 554725-074 Gs "Banned" - Hàng Chính Hãng', N'0ee54339-87db-4d3c-9bb5-ef75009527c7.webp', 45, 0, 1, 0.6, 1, 1)
INSERT [dbo].[Shoes] ([shoesId], [shoesCode], [shoesOrigin], [shoesDetail], [shoesName], [shoesColor], [shoesPrice], [shoesDecription], [shoesImage], [shoesSize], [shoesStockQuantity], [shoesGender], [shoesDiscount], [brandId], [userId]) VALUES (35, N'Nike_Red_Female_Jordan 1 High Comfort_42', N'America', N'Giày Sneaker Nam Nike Jordan 1 High Comfort Ct0978-006 "Chile Red" - Hàng Chính Hãng', N'Jordan 1 High Comfort', N'Red', 4000000.0000, N'Giày Sneaker Nam Nike Jordan 1 High Comfort Ct0978-006 "Chile Red" - Hàng Chính Hãng', N'26a8028a-11b8-4124-8e01-b12cc2aebd0e.webp', 42, 0, 0, 0.5, 1, 1)
SET IDENTITY_INSERT [dbo].[Shoes] OFF
GO
INSERT [dbo].[Shop] ([ShopName], [ShopPhoneNumber], [ShopEmail], [ShopAddress], [ShopImage], [ShopDescription]) VALUES (N'Tôi bán giày', N'0966132094', N'leanthai02@gmail.com', N'57 Hàng Bún, Ba Đình, Hà Nội', N'shop.jpg', N'- Chúng tôi thu thập, lưu trữ và xử lý thông tin của bạn cho quá trình mua hàng và cho những thông báo sau này liên quan đến đơn hàng, và để cung cấp dịch vụ, bao gồm một số thông tin cá nhân: danh hiệu, tên, giới tính, ngày sinh, email, địa chỉ, địa chỉ giao hàng, số điện thoại, fax, chi tiết thanh toán, chi tiết thanh toán bằng thẻ hoặc chi tiết tài khoản ngân hàng.- Chúng tôi sẽ dùng thông tin quý khách đã cung cấp để xử lý đơn đặt hàng, cung cấp các dịch vụ và thông tin yêu cầu thông qua website và theo yêu cầu của bạn.- Hơn nữa, chúng tôi sẽ sử dụng các thông tin đó để quản lý tài khoản của bạn; xác minh và thực hiện giao dịch trực tuyến, nhận diện khách vào web, nghiên cứu nhân khẩu học, gửi thông tin bao gồm thông tin sản phẩm và dịch vụ. Nếu quý khách không muốn nhận bất cứ thông tin tiếp thị của chúng tôi thì có thể từ chối bất cứ lúc nào.- Chúng tôi có thể chuyển tên và địa chỉ cho bên thứ ba để họ giao hàng cho bạn (ví dụ cho bên chuyển phát nhanh hoặc nhà cung cấp).- Chi tiết đơn đặt hàng của bạn được chúng tôi lưu giữ nhưng vì lí do bảo mật nên chúng tôi không công khai trực tiếp được. Tuy nhiên, quý khách có thể tiếp cận thông tin bằng cách đăng nhập tài khoản trên web. Tại đây, quý khách sẽ thấy chi tiết đơn đặt hàng của mình, những sản phẩm đã nhận và những sản phẩm đã gửi và chi tiết email, ngân hàng và bản tin mà bạn đặt theo dõi dài hạn.- Quý khách cam kết bảo mật dữ liệu cá nhân và không được phép tiết lộ cho bên thứ ba. Chúng tôi không chịu bất kỳ trách nhiệm nào cho việc dùng sai mật khẩu nếu đây không phải lỗi của chúng tôi.- Chúng tôi có thể dùng thông tin cá nhân của bạn để nghiên cứu thị trường. mọi thông tin chi tiết sẽ được ẩn và chỉ được dùng để thống kê. Quý khách có thể từ chối không tham gia bất cứ lúc nào.')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (1, N'Lê An Thái', 1, CAST(N'2002-11-16' AS Date), N'leanthai02@gmail.com', N'0966132094', N'Thanh Chương, Nghệ An', N'leanthai  ', N'123', 1)
INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (2, N'Nguyễn Minh Kha', 0, CAST(N'2002-12-23' AS Date), N'khakami@gmail.com', N'1122334466', N'Phúc Thọ, Hà Nội', N'khakami', N'456', 0)
INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (3, N'Nguyễn Minh Hưng', 1, CAST(N'2002-02-23' AS Date), N'hungngu@gmail.com', N'6666666666', N'Thạch Thất, Hà Nội', N'hungngu', N'iii', 0)
INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (4, N'Trần Văn Tùng', 0, CAST(N'2002-09-23' AS Date), N'tungngu@gmail.com', N'0000000000', N'Nga Sơn,Thanh Hóa', N'tungngu', N'ppp', 0)
INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (5, N'Nguyễn Minh Dũng', 1, CAST(N'2002-04-08' AS Date), N'dungtroc@gmail.com', N'7777777777', N'Thanh Hóa', N'dungtroc', N'ddd', 0)
INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (6, N'Nguyễn Trọng Tài', 0, CAST(N'2002-09-08' AS Date), N'tai@gmail.com', N'6767676767', N'Hưng Yên', N'taideptrai', N'tai', 0)
INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (8, N'Tạ Đình Tiến', 1, CAST(N'1988-06-14' AS Date), N'tientdph30906@fpt.edu.vn', N'6868686869', N'Gia Lâm, Hà Nội', N'tadinhtien', N'888', 0)
INSERT [dbo].[User] ([userId], [userName], [userGender], [userDob], [userEmail], [userPhoneNumber], [userAddress], [userAccount], [userPassword], [isAdmin]) VALUES (9, N'Trần Khôi Nguyên', 1, CAST(N'2003-06-19' AS Date), N'nguyen@gmail.com', N'114', N'Thanh Xuân, Hà Nội', N'nguyen', N'333', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[countTimeAccess]  WITH CHECK ADD  CONSTRAINT [FK_countTimeAccess_shoesId] FOREIGN KEY([shoesId])
REFERENCES [dbo].[Shoes] ([shoesId])
GO
ALTER TABLE [dbo].[countTimeAccess] CHECK CONSTRAINT [FK_countTimeAccess_shoesId]
GO
ALTER TABLE [dbo].[ImportHistory]  WITH CHECK ADD  CONSTRAINT [FK_ImportHistory_shoesId] FOREIGN KEY([shoesId])
REFERENCES [dbo].[Shoes] ([shoesId])
GO
ALTER TABLE [dbo].[ImportHistory] CHECK CONSTRAINT [FK_ImportHistory_shoesId]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_brandId] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brand] ([brandId])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_brandId]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_userId]
GO
USE [master]
GO
ALTER DATABASE [SellShoes] SET  READ_WRITE 
GO
