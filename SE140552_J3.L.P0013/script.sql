USE [master]
GO
/****** Object:  Database [DataLabPRJ_1]    Script Date: 4/11/2021 9:37:36 PM ******/
CREATE DATABASE [DataLabPRJ_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataLabPRJ_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DataLabPRJ_1.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DataLabPRJ_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DataLabPRJ_1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DataLabPRJ_1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataLabPRJ_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataLabPRJ_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataLabPRJ_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataLabPRJ_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataLabPRJ_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataLabPRJ_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataLabPRJ_1] SET  MULTI_USER 
GO
ALTER DATABASE [DataLabPRJ_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataLabPRJ_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataLabPRJ_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataLabPRJ_1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DataLabPRJ_1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DataLabPRJ_1]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 4/11/2021 9:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[ID] [varchar](10) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblHistory]    Script Date: 4/11/2021 9:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHistory](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[userID] [varchar](10) NULL,
	[updateDate] [date] NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_tblHistory] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 4/11/2021 9:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](10) NULL,
	[address] [varchar](500) NULL,
	[userPhoneNumber] [varchar](20) NULL,
	[dateOrder] [date] NULL,
	[timeOrder] [time](7) NULL,
	[totalPrice] [float] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 4/11/2021 9:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [varchar](10) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 4/11/2021 9:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ID] [varchar](10) NOT NULL,
	[nameProduct] [nvarchar](100) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[createDate] [date] NOT NULL,
	[lastUpdateDate] [date] NULL,
	[lastUpdateUser] [varchar](10) NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[productStatus] [nvarchar](50) NULL,
	[categoryID] [varchar](10) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/11/2021 9:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [varchar](10) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
	[isAdmin] [bit] NOT NULL,
	[email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([ID], [name]) VALUES (N'D', N'Drink')
INSERT [dbo].[tblCategory] ([ID], [name]) VALUES (N'F', N'Food')
SET IDENTITY_INSERT [dbo].[tblHistory] ON 

INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1, N'ss10', N'se1', CAST(N'2021-01-14' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (2, N'ss11', N'se1', CAST(N'2021-01-14' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (3, N'ss2', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (4, N'ss12', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (5, N'ss4', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (6, N'ss10', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (7, N'ss12', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (8, N'ss8', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (9, N'ss8', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (10, N'ss7', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (11, N'ss3', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (12, N'ss8', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (13, N'ss10', N'se1', CAST(N'2021-01-15' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (159, N'ss12', N'se1', CAST(N'2021-01-19' AS Date), N'Update')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (160, N'ss12', N'se1', CAST(N'2021-01-19' AS Date), N'Update')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (161, N'ss10', N'se1', CAST(N'2021-01-19' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (162, N'ss11', N'se1', CAST(N'2021-01-19' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (163, N'ss12', N'se1', CAST(N'2021-01-19' AS Date), N'Delete')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (164, N'ss12', N'se1', CAST(N'2021-01-19' AS Date), N'Update')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (165, N'ss11', N'se1', CAST(N'2021-01-19' AS Date), N'Update')
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (166, N'ss10', N'se1', CAST(N'2021-01-19' AS Date), N'Update')
SET IDENTITY_INSERT [dbo].[tblHistory] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (5, N'se2', N'Dinh Quoc Dat', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:56:20.2200000' AS Time), 9110000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (6, N'se2', N'asdasd', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:56:47.5130000' AS Time), 9110000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (7, N'se2', N'Dinh Qu?c Ð?t', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:58:37.9500000' AS Time), 9110000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (8, N'se2', N'asdasd', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:59:52.8770000' AS Time), 9110000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (9, N'se2', N'Dinh Qu?c Ð?t', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'22:16:29.0400000' AS Time), 120000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (10, N'se2', N'aqwefqw', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'22:43:41.1470000' AS Time), 10320000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (11, N'se3', N'abc', N'012315112', CAST(N'2021-01-20' AS Date), CAST(N'07:29:48.7100000' AS Time), 200000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (12, N'se2', N'Dinh Quoc Dat', N'0946235300', CAST(N'2021-01-20' AS Date), CAST(N'07:30:30.5400000' AS Time), 8000000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (13, N'se2', N'Dinh Qu?c Ð?t', N'0946235300', CAST(N'2021-01-20' AS Date), CAST(N'07:31:44.4670000' AS Time), 1600000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (14, N'se3', N'abc', N'09123123', CAST(N'2021-01-20' AS Date), CAST(N'07:32:16.5800000' AS Time), 1600000)
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (15, N'se2', N'Dinh Qu?c Ð?t', N'0946235300', CAST(N'2021-02-19' AS Date), CAST(N'15:58:30.1070000' AS Time), 800000)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (5, 7, N'ss3', 1, 9110000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (6, 8, N'ss3', 1, 9110000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (7, 8, N'ss12', 30, 9110000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (8, 8, N'ss8', 1, 9110000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (9, 8, N'ss20', 1, 9110000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (10, 9, N'ss3', 2, 120000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (11, 9, N'ss2', 1, 120000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (12, 9, N'ss5', 1, 120000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (13, 10, N'ss2', 1, 10320000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (14, 10, N'ss12', 1, 10320000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (15, 10, N'ss11', 100, 10320000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (16, 11, N'T1', 1, 200000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (17, 12, N'T1', 40, 8000000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (18, 13, N'T1', 8, 1600000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (19, 14, N'T1', 8, 1600000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (20, 15, N'ss65', 4, 800000)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (21, 15, N'ss32', 2, 800000)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss10', N'Bacon', N'https://cutsidedown.com/wp-content/uploads/2018/08/shutterstock_758704648.jpg', N'Thit heo quay', CAST(N'2021-01-12' AS Date), CAST(N'2021-01-19' AS Date), N'se1', 100, 25000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss11', N'Vegetable and Beef', N'https://images.unsplash.com/photo-1574095443374-6748e7dd6c84?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80', N'Rau va thit', CAST(N'2020-01-08' AS Date), CAST(N'2021-01-19' AS Date), N'se1', 100, 100000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss12', N'Hamburger', N'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1202&q=80', N'Banh mi thit', CAST(N'2020-01-08' AS Date), CAST(N'2021-01-19' AS Date), N'se1', 69, 300000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss120', N'Milk white and black', N'https://images.unsplash.com/photo-1509042239860-f550ce710b93?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80', N'Ca phe sua den', CAST(N'2021-01-13' AS Date), CAST(N'2021-01-12' AS Date), N'se1', 44, 200000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss2', N'Combo 1', N'https://images.unsplash.com/photo-1601313816462-fe3cbebf6753?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80', N'Khoai chien', CAST(N'2020-12-12' AS Date), CAST(N'2021-01-18' AS Date), N'se1', 198, 20000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss20', N'BBQ', N'https://images.unsplash.com/photo-1432139509613-5c4255815697?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=632&q=80', N'Thit nuong', CAST(N'2021-01-17' AS Date), CAST(N'2021-01-17' AS Date), N'se1', 19, 50000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss3', N'Sausage', N'https://images.unsplash.com/photo-1533060328534-2db4d2602877?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', N'Khoai tay chien', CAST(N'2020-12-12' AS Date), CAST(N'2021-01-17' AS Date), N'se1', 197, 30000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss300', N'Soup beef', N'https://images.unsplash.com/photo-1534939561126-855b8675edd7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', N'Sup thit', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-12' AS Date), N'se1', 60, 300000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss302', N'Potato Chips', N'https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', N'Khoai tay chien', CAST(N'2021-01-14' AS Date), CAST(N'2021-01-18' AS Date), N'se1', 100, 80000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss31', N'Rice roll', N'https://images.unsplash.com/photo-1534604973900-c43ab4c2e0ab?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1280&q=80', N'Com cuon', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-18' AS Date), N'se1', 30, 300000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss32', N'Combo 2 milk tea', N'https://images.unsplash.com/photo-1522039906375-50d8e4d9550a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=799&q=80', N'2 Tra sua Starbuck', CAST(N'2020-01-08' AS Date), CAST(N'2021-01-19' AS Date), N'se1', 48, 200000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss4', N'Chicken Frie', N'https://images.unsplash.com/photo-1562967914-01efa7e87832?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80', N'Com chien duong chau', CAST(N'2020-12-12' AS Date), CAST(N'2021-01-17' AS Date), N'se1', 200, 40000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss5', N'Pizza', N'https://images.unsplash.com/photo-1574126154517-d1e0d89ef734?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80', N'Pizza', CAST(N'2020-12-12' AS Date), CAST(N'2021-01-14' AS Date), N'se1', 399, 40000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss65', N'Milk tea', N'https://images.unsplash.com/photo-1528740096961-3798add19cb7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', N'Tra sua kem', CAST(N'2020-01-08' AS Date), CAST(N'2021-01-19' AS Date), N'se1', 51, 100000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss7', N'Spaghetti', N'https://images.unsplash.com/photo-1598504775866-e842291dbe10?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', N'Mi y', CAST(N'2020-12-12' AS Date), CAST(N'2021-01-15' AS Date), N'se1', 100, 50000, N'Active', N'F')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss70', N'Matcha', N'https://images.unsplash.com/photo-1546531538-ce46c6fcf046?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=632&q=80', N'Matcha', CAST(N'2021-01-10' AS Date), CAST(N'2021-01-15' AS Date), N'se1', 90, 200000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss8', N'Green Tea', N'https://images.unsplash.com/photo-1498481548071-4d439c62cd6e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=645&q=80', N'Tra xanh', CAST(N'2020-12-13' AS Date), CAST(N'2021-01-15' AS Date), N'se1', 399, 30000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss81', N'Coffe white', N'https://images.unsplash.com/photo-1560684671-785fcf0201d7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', N'Ca phe sua', CAST(N'2020-01-09' AS Date), CAST(N'2021-01-09' AS Date), N'se1', 77, 70000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss88', N'Coffee', N'https://images.unsplash.com/photo-1577805947697-89e18249d767?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=643&q=80', N'Ca phe', CAST(N'2020-01-09' AS Date), CAST(N'2021-01-14' AS Date), N'se1', 46, 50000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss9', N'Starbuck Milk Tea', N'https://images.unsplash.com/photo-1516429943561-f89f04f29aff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80', N'Tra sua Starbuck', CAST(N'2020-01-08' AS Date), CAST(N'2021-01-19' AS Date), N'se1', 33, 50000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss92', N'Milk brown tea', N'https://images.unsplash.com/photo-1596038590958-f2d4f27279c1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80', N'Ca sua nau', CAST(N'2021-01-12' AS Date), CAST(N'2021-01-14' AS Date), N'se1', 99, 120000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss99', N'Coffe dark', N'https://images.unsplash.com/photo-1583183634411-47514a69722c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80', N'Ca phe den', CAST(N'2020-01-09' AS Date), CAST(N'2020-01-09' AS Date), N'se1', 55, 30000, N'Active', N'D')
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'T1', N'test food', N'https://www.bing.com/images/search?q=Caffe+Macchiato&FORM=IRIBIP', N'Ga rannn', CAST(N'2021-01-20' AS Date), CAST(N'2021-01-20' AS Date), N'se1', -7, 200000, N'Active', N'F')
INSERT [dbo].[tblUser] ([ID], [password], [name], [isAdmin], [email]) VALUES (N'se1', N'abc', N'Dinh Quoc Dat', 1, N'dat@gmail.com')
INSERT [dbo].[tblUser] ([ID], [password], [name], [isAdmin], [email]) VALUES (N'se2', N'abc', N'Le Minh Tai', 0, N'tai@gmail.com')
INSERT [dbo].[tblUser] ([ID], [password], [name], [isAdmin], [email]) VALUES (N'se3', N'abc', N'Tran Xuan Dat', 0, N'dattx@gmail.com')
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([ID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblProduct]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([ID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([ID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([ID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblUser] FOREIGN KEY([lastUpdateUser])
REFERENCES [dbo].[tblUser] ([ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblUser]
GO
USE [master]
GO
ALTER DATABASE [DataLabPRJ_1] SET  READ_WRITE 
GO
