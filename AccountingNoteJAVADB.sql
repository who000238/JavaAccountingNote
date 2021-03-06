USE [master]
GO
/****** Object:  Database [AccountingNote]    Script Date: 2022/1/3 下午 01:25:02 ******/
CREATE DATABASE [AccountingNote]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountingNote', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AccountingNote.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccountingNote_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AccountingNote_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AccountingNote] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountingNote].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountingNote] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountingNote] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountingNote] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountingNote] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountingNote] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountingNote] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccountingNote] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountingNote] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountingNote] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountingNote] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountingNote] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountingNote] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountingNote] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountingNote] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountingNote] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AccountingNote] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountingNote] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountingNote] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountingNote] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountingNote] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountingNote] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountingNote] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountingNote] SET RECOVERY FULL 
GO
ALTER DATABASE [AccountingNote] SET  MULTI_USER 
GO
ALTER DATABASE [AccountingNote] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountingNote] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountingNote] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountingNote] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountingNote] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountingNote] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AccountingNote', N'ON'
GO
ALTER DATABASE [AccountingNote] SET QUERY_STORE = OFF
GO
USE [AccountingNote]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 2022/1/3 下午 01:25:03 ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
/****** Object:  Table [dbo].[Accounting]    Script Date: 2022/1/3 下午 01:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userid] [uniqueidentifier] NOT NULL,
	[caption] [nvarchar](100) NULL,
	[amount] [int] NOT NULL,
	[acttype] [int] NOT NULL,
	[createdate] [datetime] NOT NULL,
	[body] [nvarchar](500) NULL,
	[category] [int] NULL,
 CONSTRAINT [PK_Accounting_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryList]    Script Date: 2022/1/3 下午 01:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](20) NOT NULL,
	[createtime] [datetime] NOT NULL,
	[userid] [uniqueidentifier] NOT NULL,
	[categorybody] [nvarchar](50) NULL,
 CONSTRAINT [PK_CategoryList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeleteLog]    Script Date: 2022/1/3 下午 01:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeleteLog](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[managerID] [uniqueidentifier] NOT NULL,
	[managerName] [nvarchar](50) NOT NULL,
	[userID] [uniqueidentifier] NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[editDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2022/1/3 下午 01:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[PWD] [varchar](50) NOT NULL,
	[PWDSalt] [varchar](50) NULL,
	[PWDEncrypt] [varchar](100) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameEncrypt] [varchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[UserLevel] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[MobilePhone] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounting] ON 

INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (37, N'51ad94b6-2e83-4494-bbea-2a69ffdcab77', N'123', 123, 0, CAST(N'2021-10-20T12:09:27.430' AS DateTime), N'112233', 0)
INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (38, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'123', 123, 0, CAST(N'2021-10-28T17:09:33.250' AS DateTime), N'123', 17)
INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (39, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'3333', 123, 0, CAST(N'2021-10-28T17:10:11.470' AS DateTime), N'222222', 17)
INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (40, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'45522452', 457575, 0, CAST(N'2021-10-28T17:11:50.613' AS DateTime), N'12345343554', 17)
INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (42, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'收入 ', 10000, 1, CAST(N'2021-12-24T00:00:00.000' AS DateTime), N'input ', 17)
INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (43, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'get ', 547821, 1, CAST(N'2021-12-24T00:00:00.000' AS DateTime), N'input', 17)
INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (49, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'123', 123, 1, CAST(N'2021-12-30T18:14:15.313' AS DateTime), N'123', 17)
INSERT [dbo].[Accounting] ([ID], [userid], [caption], [amount], [acttype], [createdate], [body], [category]) VALUES (50, N'8c90caa8-033c-413a-bd9d-da67dad2ae36', N'123', 123, 0, CAST(N'2021-12-30T18:28:58.827' AS DateTime), N'123', 53)
SET IDENTITY_INSERT [dbo].[Accounting] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryList] ON 

INSERT [dbo].[CategoryList] ([ID], [categoryname], [createtime], [userid], [categorybody]) VALUES (17, N'不可刪除的分類', CAST(N'2021-12-17T12:53:01.540' AS DateTime), N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'123')
INSERT [dbo].[CategoryList] ([ID], [categoryname], [createtime], [userid], [categorybody]) VALUES (48, N'不可刪除的分類1', CAST(N'2021-12-21T14:25:03.840' AS DateTime), N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'123輸入內容')
INSERT [dbo].[CategoryList] ([ID], [categoryname], [createtime], [userid], [categorybody]) VALUES (53, N'new', CAST(N'2021-12-30T18:28:50.770' AS DateTime), N'8c90caa8-033c-413a-bd9d-da67dad2ae36', N'new')
SET IDENTITY_INSERT [dbo].[CategoryList] OFF
GO
SET IDENTITY_INSERT [dbo].[DeleteLog] ON 

INSERT [dbo].[DeleteLog] ([No], [managerID], [managerName], [userID], [userName], [editDate]) VALUES (10, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'SU', N'9c964753-acb2-48b1-9816-6df3c66bb314', N'suuusu', CAST(N'2021-12-30T16:56:53.270' AS DateTime))
INSERT [dbo].[DeleteLog] ([No], [managerID], [managerName], [userID], [userName], [editDate]) VALUES (11, N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'SU', N'1bc417de-872a-4c2f-a047-17eedb808420', N'SS', CAST(N'2022-01-03T11:04:49.417' AS DateTime))
SET IDENTITY_INSERT [dbo].[DeleteLog] OFF
GO
INSERT [dbo].[UserInfo] ([ID], [Account], [PWD], [PWDSalt], [PWDEncrypt], [Name], [NameEncrypt], [Email], [UserLevel], [CreateDate], [MobilePhone], [EditDate]) VALUES (N'b7e4fffb-be01-4b3d-b79a-608f9f1599fb', N'admin', N'123', NULL, NULL, N'SU', NULL, N'who000238@gmail.com', 0, CAST(N'2021-07-30T14:45:58.353' AS DateTime), N'1000                ', CAST(N'2021-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [Account], [PWD], [PWDSalt], [PWDEncrypt], [Name], [NameEncrypt], [Email], [UserLevel], [CreateDate], [MobilePhone], [EditDate]) VALUES (N'd57464a0-25bf-4083-9544-77a2ebd8d1a2', N'admin3', N'123', NULL, NULL, N'aaa', NULL, N'asd@c', 1, CAST(N'2021-07-31T00:00:00.000' AS DateTime), N'1000                ', CAST(N'2022-01-03T13:24:14.877' AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [Account], [PWD], [PWDSalt], [PWDEncrypt], [Name], [NameEncrypt], [Email], [UserLevel], [CreateDate], [MobilePhone], [EditDate]) VALUES (N'8c90caa8-033c-413a-bd9d-da67dad2ae36', N'admin6', N'12345678', NULL, NULL, N'BBBBB', NULL, N'123@tw', 1, CAST(N'2021-12-30T18:27:50.080' AS DateTime), NULL, CAST(N'2022-01-03T13:11:49.957' AS DateTime))
GO
ALTER TABLE [dbo].[Accounting] ADD  CONSTRAINT [DF_Accounting_CreateDate]  DEFAULT (getdate()) FOR [createdate]
GO
USE [master]
GO
ALTER DATABASE [AccountingNote] SET  READ_WRITE 
GO
