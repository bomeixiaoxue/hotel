USE [master]
GO
/****** Object:  Database [hotel]    Script Date: 06/20/2017 13:54:03 ******/
CREATE DATABASE [hotel] ON  PRIMARY 
( NAME = N'hotel', FILENAME = N'D:\development_tools\database\Microsoft SQL Server\MSSQL10_50.LGH\MSSQL\DATA\hotel.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'hotel_log', FILENAME = N'D:\development_tools\database\Microsoft SQL Server\MSSQL10_50.LGH\MSSQL\DATA\hotel_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [hotel] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hotel] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [hotel] SET ANSI_NULLS OFF
GO
ALTER DATABASE [hotel] SET ANSI_PADDING OFF
GO
ALTER DATABASE [hotel] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [hotel] SET ARITHABORT OFF
GO
ALTER DATABASE [hotel] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [hotel] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [hotel] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [hotel] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [hotel] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [hotel] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [hotel] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [hotel] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [hotel] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [hotel] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [hotel] SET  DISABLE_BROKER
GO
ALTER DATABASE [hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [hotel] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [hotel] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [hotel] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [hotel] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [hotel] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [hotel] SET  READ_WRITE
GO
ALTER DATABASE [hotel] SET RECOVERY FULL
GO
ALTER DATABASE [hotel] SET  MULTI_USER
GO
ALTER DATABASE [hotel] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [hotel] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'hotel', N'ON'
GO
USE [hotel]
GO
/****** Object:  Table [dbo].[client]    Script Date: 06/20/2017 13:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[userid] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_client_1] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[client] ([userid], [password], [type]) VALUES (N'0001', N'b59c67bf196a4758191e42f76670ceba', N'用户')
INSERT [dbo].[client] ([userid], [password], [type]) VALUES (N'0002', N'934b535800b1cba8f96a5d72f72f1611', N'用户')
INSERT [dbo].[client] ([userid], [password], [type]) VALUES (N'0003', N'2be9bd7a3434f7038ca27d1918de58bd', N'用户')
INSERT [dbo].[client] ([userid], [password], [type]) VALUES (N'0004', N'dbc4d84bfcfe2284ba11beffb853a8c4', N'用户')
INSERT [dbo].[client] ([userid], [password], [type]) VALUES (N'0005', N'6074c6aa3488f3c2dddff2a7ca821aab', N'用户')
INSERT [dbo].[client] ([userid], [password], [type]) VALUES (N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'管理员')
/****** Object:  Table [dbo].[roomtype]    Script Date: 06/20/2017 13:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomtype](
	[rtypeid] [int] NOT NULL,
	[roomtype] [nvarchar](20) NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_roomtype] PRIMARY KEY CLUSTERED 
(
	[rtypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_roomtype] UNIQUE NONCLUSTERED 
(
	[rtypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[roomtype] ([rtypeid], [roomtype], [price]) VALUES (1, N'单人房       ', 100)
INSERT [dbo].[roomtype] ([rtypeid], [roomtype], [price]) VALUES (2, N'双人房       ', 150)
INSERT [dbo].[roomtype] ([rtypeid], [roomtype], [price]) VALUES (3, N'豪华单人房', 200)
INSERT [dbo].[roomtype] ([rtypeid], [roomtype], [price]) VALUES (4, N'豪华双人房', 250)
INSERT [dbo].[roomtype] ([rtypeid], [roomtype], [price]) VALUES (5, N'三人房', 300)
/****** Object:  Table [dbo].[room]    Script Date: 06/20/2017 13:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[rid] [nvarchar](50) NOT NULL,
	[rprice] [smallmoney] NOT NULL,
	[raddress] [nvarchar](50) NOT NULL,
	[rtypeid] [int] NOT NULL,
	[rstate] [nvarchar](10) NOT NULL,
	[rphone] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_room] UNIQUE NONCLUSTERED 
(
	[rphone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1001', 100.0000, N'一楼', 1, N'可用', N'1001')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1002', 100.0000, N'一楼', 1, N'可用', N'1002')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1003', 100.0000, N'一楼', 1, N'可用', N'1003')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1004', 100.0000, N'一楼', 1, N'可用', N'1004')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1005', 100.0000, N'一楼', 1, N'可用', N'1005')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1006', 100.0000, N'一楼', 1, N'可用', N'1006')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1007', 100.0000, N'一楼', 1, N'可用', N'1007')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1008', 100.0000, N'一楼', 1, N'可用', N'1008')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1009', 100.0000, N'一楼', 1, N'可用', N'1009')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1010', 100.0000, N'一楼', 1, N'可用', N'1010')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'1011', 100.0000, N'一楼', 1, N'可用', N'1011')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2002', 150.0000, N'二楼', 2, N'可用', N'2002')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2003', 150.0000, N'二楼', 2, N'可用', N'2003')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2004', 150.0000, N'二楼', 2, N'可用', N'2004')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2005', 150.0000, N'二楼', 2, N'可用', N'2005')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2006', 150.0000, N'二楼', 2, N'可用', N'2006')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2007', 150.0000, N'二楼', 2, N'可用', N'2007')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2008', 150.0000, N'二楼', 2, N'可用', N'2008')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2009', 150.0000, N'二楼', 2, N'可用', N'2009')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'2010', 150.0000, N'二楼', 2, N'可用', N'2010')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3001', 200.0000, N'三楼', 3, N'可用', N'3001')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3002', 200.0000, N'三楼', 3, N'可用', N'3002')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3003', 200.0000, N'三楼', 3, N'可用', N'3003')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3004', 200.0000, N'三楼', 3, N'可用', N'3004')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3005', 200.0000, N'三楼', 3, N'可用', N'3005')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3006', 200.0000, N'三楼', 3, N'可用', N'3006')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3007', 200.0000, N'三楼', 3, N'可用', N'3007')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'3008', 200.0000, N'三楼', 3, N'可用', N'3008')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'4001', 250.0000, N'四楼', 4, N'可用', N'4001')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'4002', 250.0000, N'四楼', 4, N'可用', N'4002')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'4003', 250.0000, N'四楼', 4, N'可用', N'4003')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'4004', 250.0000, N'四楼', 4, N'可用', N'4004')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'5001', 300.0000, N'五楼', 5, N'可用', N'5001')
INSERT [dbo].[room] ([rid], [rprice], [raddress], [rtypeid], [rstate], [rphone]) VALUES (N'7002', 300.0000, N'七楼', 5, N'可用', N'7002')
/****** Object:  Table [dbo].[userInformation]    Script Date: 06/20/2017 13:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userInformation](
	[userid] [nvarchar](50) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[idCard] [nvarchar](20) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userInformation] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[userInformation] ([userid], [name], [idCard], [phone], [type]) VALUES (N'0001', N'科比1', N'2017001', N'13579246810', N'用户')
INSERT [dbo].[userInformation] ([userid], [name], [idCard], [phone], [type]) VALUES (N'0002', N'科比2', N'2017002', N'13579246811', N'用户')
INSERT [dbo].[userInformation] ([userid], [name], [idCard], [phone], [type]) VALUES (N'0003', N'科比3', N'2017003', N'13579246813', N'用户')
INSERT [dbo].[userInformation] ([userid], [name], [idCard], [phone], [type]) VALUES (N'0004', N'科比4', N'2017004', N'13579246814', N'用户')
INSERT [dbo].[userInformation] ([userid], [name], [idCard], [phone], [type]) VALUES (N'0005', N'科比5', N'2017241', N'13579246810', N'用户')
INSERT [dbo].[userInformation] ([userid], [name], [idCard], [phone], [type]) VALUES (N'admin', N'管理员1', N'1995001', N'13579246814', N'管理员')
/****** Object:  Table [dbo].[orderNum]    Script Date: 06/20/2017 13:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderNum](
	[soleid] [nvarchar](50) NOT NULL,
	[userid] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[rid] [nvarchar](50) NOT NULL,
	[number] [int] NOT NULL,
	[roomType] [nvarchar](50) NOT NULL,
	[intime] [datetime] NOT NULL,
	[outtime] [datetime] NOT NULL,
	[price] [smallmoney] NOT NULL,
	[soledate] [datetime] NOT NULL,
	[state] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[soleid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20150604005', N'0002', N'科比2', N'1001', 1, N'单人房', CAST(0x0000A4AD00DE7920 AS DateTime), CAST(0x0000A4AE00CDFE60 AS DateTime), 100.0000, CAST(0x0000A4AD00D67E8C AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170524005', N'0001', N'科比1', N'1002', 1, N'单人房', CAST(0x0000A78700DE7920 AS DateTime), CAST(0x0000A78A00CDFE60 AS DateTime), 100.0000, CAST(0x0000A78600083D60 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170604002', N'0001', N'科比1', N'1006,1007,4006', 3, N'单人房,单人房,豪华双人房', CAST(0x0000A78800DE7920 AS DateTime), CAST(0x0000A78900CDFE60 AS DateTime), 450.0000, CAST(0x0000A78800AC5EF4 AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170604005', N'0001', N'科比1', N'1001', 1, N'单人房', CAST(0x0000A78800DE7920 AS DateTime), CAST(0x0000A78900CDFE60 AS DateTime), 100.0000, CAST(0x0000A78800D67E8C AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170605001', N'0001', N'科比1', N'1003', 1, N'单人房', CAST(0x0000A78900DE7920 AS DateTime), CAST(0x0000A78A00CDFE60 AS DateTime), 100.0000, CAST(0x0000A789000124F8 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170605005', N'0001', N'科比1', N'4001', 1, N'豪华双人房', CAST(0x0000A78900DE7920 AS DateTime), CAST(0x0000A78A00CDFE60 AS DateTime), 250.0000, CAST(0x0000A78900023F64 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170605007', N'0001', N'科比1', N'1011', 1, N'单人房', CAST(0x0000A79000DE7920 AS DateTime), CAST(0x0000A79400CDFE60 AS DateTime), 400.0000, CAST(0x0000A7890125DB58 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170608001', N'0001', N'科比1', N'4006', 1, N'豪华双人房', CAST(0x0000A78C00DE7920 AS DateTime), CAST(0x0000A78D00CDFE60 AS DateTime), 250.0000, CAST(0x0000A78C00057288 AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609001', N'0001', N'科比1', N'5001', 1, N'三人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 300.0000, CAST(0x0000A78D00028938 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609002', N'0003', N'科比3', N'1002,1003', 2, N'单人房,单人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 200.0000, CAST(0x0000A78D015B81B8 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609003', N'0003', N'科比3', N'3004', 1, N'豪华单人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 200.0000, CAST(0x0000A78D015B8794 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609004', N'0003', N'科比3', N'2004', 1, N'双人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 150.0000, CAST(0x0000A78D015B8E9C AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609005', N'0003', N'科比3', N'7002', 1, N'三人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 300.0000, CAST(0x0000A78D015B95A4 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609006', N'0004', N'科比4', N'2003', 1, N'双人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 150.0000, CAST(0x0000A78D015BC5B0 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609007', N'0004', N'科比4', N'2007', 1, N'双人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 150.0000, CAST(0x0000A78D015BCA60 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170609008', N'0001', N'科比1', N'1006', 1, N'单人房', CAST(0x0000A78D00DE7920 AS DateTime), CAST(0x0000A78E00CDFE60 AS DateTime), 100.0000, CAST(0x0000A78D017BCAF4 AS DateTime), N'结算离店')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170614001', N'0001', N'科比1', N'1005,1006,1007,1008,1009,1010', 6, N'单人房,单人房,单人房,单人房,单人房,单人房', CAST(0x0000A79200DE7920 AS DateTime), CAST(0x0000A79300CDFE60 AS DateTime), 600.0000, CAST(0x0000A79201866888 AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170614002', N'0001', N'科比1', N'1003', 1, N'单人房', CAST(0x0000A79400DE7920 AS DateTime), CAST(0x0000A79500CDFE60 AS DateTime), 100.0000, CAST(0x0000A79201869060 AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170615001', N'0001', N'科比1', N'3005,3006', 2, N'豪华单人房,豪华单人房', CAST(0x0000A79300DE7920 AS DateTime), CAST(0x0000A79400CDFE60 AS DateTime), 400.0000, CAST(0x0000A7930002F88C AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170616001', N'0001', N'科比1', N'1004,1005,1007', 3, N'单人房,单人房,单人房', CAST(0x0000A79400DE7920 AS DateTime), CAST(0x0000A79500CDFE60 AS DateTime), 300.0000, CAST(0x0000A7940101B3E0 AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170616002', N'0002', N'科比2', N'4001', 1, N'豪华双人房', CAST(0x0000A79400DE7920 AS DateTime), CAST(0x0000A79500CDFE60 AS DateTime), 250.0000, CAST(0x0000A794010E14A0 AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170616003', N'0002', N'科比2', N'1009', 1, N'单人房', CAST(0x0000A79400DE7920 AS DateTime), CAST(0x0000A79500CDFE60 AS DateTime), 100.0000, CAST(0x0000A794010F03B0 AS DateTime), N'未支付')
INSERT [dbo].[orderNum] ([soleid], [userid], [name], [rid], [number], [roomType], [intime], [outtime], [price], [soledate], [state]) VALUES (N'20170616004', N'0001', N'科比1', N'4004', 1, N'豪华双人房', CAST(0x0000A79400DE7920 AS DateTime), CAST(0x0000A79500CDFE60 AS DateTime), 250.0000, CAST(0x0000A7940112680C AS DateTime), N'未支付')
/****** Object:  Check [CK_order]    Script Date: 06/20/2017 13:54:03 ******/
ALTER TABLE [dbo].[orderNum]  WITH CHECK ADD  CONSTRAINT [CK_order] CHECK  (([state]='已支付' OR [state]='未支付' OR [state]='结算离店'))
GO
ALTER TABLE [dbo].[orderNum] CHECK CONSTRAINT [CK_order]
GO
/****** Object:  ForeignKey [FK_userInformation_client]    Script Date: 06/20/2017 13:54:03 ******/
ALTER TABLE [dbo].[userInformation]  WITH CHECK ADD  CONSTRAINT [FK_userInformation_client] FOREIGN KEY([userid])
REFERENCES [dbo].[client] ([userid])
GO
ALTER TABLE [dbo].[userInformation] CHECK CONSTRAINT [FK_userInformation_client]
GO
/****** Object:  ForeignKey [FK_order_client]    Script Date: 06/20/2017 13:54:03 ******/
ALTER TABLE [dbo].[orderNum]  WITH CHECK ADD  CONSTRAINT [FK_order_client] FOREIGN KEY([userid])
REFERENCES [dbo].[client] ([userid])
GO
ALTER TABLE [dbo].[orderNum] CHECK CONSTRAINT [FK_order_client]
GO
