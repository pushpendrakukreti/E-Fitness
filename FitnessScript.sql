USE [master]
GO
/****** Object:  Database [efitness]    Script Date: 07-05-2019 19:06:53 ******/
CREATE DATABASE [efitness]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'efitness', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\efitness.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'efitness_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\efitness_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [efitness] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [efitness].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [efitness] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [efitness] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [efitness] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [efitness] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [efitness] SET ARITHABORT OFF 
GO
ALTER DATABASE [efitness] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [efitness] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [efitness] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [efitness] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [efitness] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [efitness] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [efitness] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [efitness] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [efitness] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [efitness] SET  ENABLE_BROKER 
GO
ALTER DATABASE [efitness] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [efitness] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [efitness] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [efitness] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [efitness] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [efitness] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [efitness] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [efitness] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [efitness] SET  MULTI_USER 
GO
ALTER DATABASE [efitness] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [efitness] SET DB_CHAINING OFF 
GO
ALTER DATABASE [efitness] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [efitness] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [efitness] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [efitness] SET QUERY_STORE = OFF
GO
USE [efitness]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [efitness]
GO
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 07-05-2019 19:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLogin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminLogId] [nvarchar](50) NOT NULL,
	[AdminPassword] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 07-05-2019 19:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](20) NOT NULL,
	[Lname] [nvarchar](20) NULL,
	[Date] [date] NULL,
	[Time] [nvarchar](50) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Message] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyExpense]    Script Date: 07-05-2019 19:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyExpense](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseName] [nvarchar](50) NOT NULL,
	[ExpensePrice] [decimal](18, 0) NOT NULL,
	[ExpenseDetail] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 07-05-2019 19:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[ProductAmount] [int] NOT NULL,
	[ProductStatus] [bit] NULL,
	[ProductImage] [nvarchar](100) NULL,
	[SupplierId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07-05-2019 19:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](50) NOT NULL,
	[ProductId] [int] NULL,
	[Phone] [varchar](15) NULL,
	[OrderDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 07-05-2019 19:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleName] [nvarchar](50) NOT NULL,
	[ScheduleImage] [nvarchar](200) NOT NULL,
	[ScheduleTiming] [nvarchar](50) NOT NULL,
	[ScheduleDay] [nvarchar](20) NOT NULL,
	[ScheduleReps] [int] NOT NULL,
	[ScheduleVideos] [nvarchar](300) NOT NULL,
	[ScheduleType] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 07-05-2019 19:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[SupplierAddress] [nvarchar](200) NOT NULL,
	[SupplierPhone] [nvarchar](15) NULL,
	[SupplierEmail] [nvarchar](50) NOT NULL,
	[SupplierPassword] [nvarchar](50) NOT NULL,
	[SupplierDOB] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[TrainerId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerName] [nvarchar](50) NOT NULL,
	[TrainerPhone] [nvarchar](10) NULL,
	[TrainerGender] [nvarchar](15) NULL,
	[TrainerImage] [nvarchar](100) NOT NULL,
	[TrainerEmail] [nvarchar](50) NOT NULL,
	[TrainerPassword] [nvarchar](50) NOT NULL,
	[TrainerAddress] [nvarchar](100) NULL,
	[TrainerDOB] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainer_Test_Audit]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer_Test_Audit](
	[TrainerId] [int] IDENTITY(1,1) NOT NULL,
	[TrainerName] [nvarchar](50) NOT NULL,
	[TrainerGender] [nvarchar](15) NULL,
	[TrainerPhone] [nvarchar](10) NULL,
	[TrainerImage] [nvarchar](100) NOT NULL,
	[TrainerEmail] [nvarchar](50) NOT NULL,
	[TrainerPassword] [nvarchar](50) NOT NULL,
	[Audit_Action] [varchar](100) NULL,
	[Audit_Timestamp] [datetime] NULL,
	[TrainerDOB] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserGender] [nvarchar](15) NULL,
	[UserPhone] [nvarchar](15) NULL,
	[UserImage] [nvarchar](100) NULL,
	[UserWeight] [decimal](18, 0) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserStatus] [bit] NOT NULL,
	[UserDOB] [datetime] NULL,
	[UserHeight] [nvarchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Test_Audit]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Test_Audit](
	[UserName] [nvarchar](50) NOT NULL,
	[UserDOB] [datetime] NULL,
	[UserGender] [nvarchar](15) NULL,
	[UserPhone] [nvarchar](15) NULL,
	[UserImage] [nvarchar](100) NULL,
	[UserWeight] [decimal](18, 0) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserStatus] [bit] NOT NULL,
	[Audit_Action] [varchar](100) NULL,
	[Audit_Timestamp] [datetime] NULL,
	[UserHeight] [decimal](2, 2) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminLogin] ON 

INSERT [dbo].[AdminLogin] ([AdminId], [AdminLogId], [AdminPassword]) VALUES (1, N'Priya', N'admin@@123')
INSERT [dbo].[AdminLogin] ([AdminId], [AdminLogId], [AdminPassword]) VALUES (2, N'Pushpendra', N'admin@1')
SET IDENTITY_INSERT [dbo].[AdminLogin] OFF
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([AppointmentId], [FName], [Lname], [Date], [Time], [Phone], [Message]) VALUES (1, N'Aryan', N'Kukreti', CAST(N'2019-05-14' AS Date), N'15:00', N'8285033296', N'Hi i am willing to book an appointment regarding Fitness Guidance')
SET IDENTITY_INSERT [dbo].[Appointment] OFF
SET IDENTITY_INSERT [dbo].[DailyExpense] ON 

INSERT [dbo].[DailyExpense] ([ExpenseId], [ExpenseName], [ExpensePrice], [ExpenseDetail]) VALUES (28, N'Supplement', CAST(2400 AS Decimal(18, 0)), N'Supplements from nature are the best one. Supplements from nature are the best one. Supplements from nature are the best one.')
SET IDENTITY_INSERT [dbo].[DailyExpense] OFF
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([ProductId], [ProductName], [ProductQuantity], [ProductAmount], [ProductStatus], [ProductImage], [SupplierId]) VALUES (1, N'GOLD', 15, 6700, 1, N'20190506224030-banner-3.jpg', NULL)
INSERT [dbo].[Inventory] ([ProductId], [ProductName], [ProductQuantity], [ProductAmount], [ProductStatus], [ProductImage], [SupplierId]) VALUES (3, N'GOLD Premium Gainer', 15, 1500, 1, N'20190507004105-banner-2.jpg', 2)
INSERT [dbo].[Inventory] ([ProductId], [ProductName], [ProductQuantity], [ProductAmount], [ProductStatus], [ProductImage], [SupplierId]) VALUES (4, N'Silver Premium Gainer', 15, 5540, 1, N'20190507005819-banner-11.jpg', 4)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (2, N'GOLD Premium For Gaining', 1, N'8285033296', CAST(N'2019-05-15' AS Date))
INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (5, N'GOLD Premium Gainer', 4, N'8888888888', CAST(N'2019-05-30' AS Date))
INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (6, N'For Gaining Purpose', 3, N'445562555', CAST(N'2019-05-01' AS Date))
INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (8, N'Gold Gainer', 1, N'23453456', CAST(N'2019-05-16' AS Date))
INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (9, N'Body Muscle Up', 4, N'098765765', CAST(N'2019-04-19' AS Date))
INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (13, N'Body Muscle Up', 1, N'98765432', CAST(N'2019-03-15' AS Date))
INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (15, N'For Gaining Purpose', 3, N'1234567', CAST(N'2019-04-18' AS Date))
INSERT [dbo].[Order] ([OrderId], [OrderName], [ProductId], [Phone], [OrderDate]) VALUES (16, N'GOLD Premium Gainer', 1, N'2345678', CAST(N'2019-05-24' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ScheduleId], [ScheduleName], [ScheduleImage], [ScheduleTiming], [ScheduleDay], [ScheduleReps], [ScheduleVideos], [ScheduleType]) VALUES (1, N'Morning Excercise', N'20190503231420-Routine.png', N'22:03', N'WEDNESDAY', 3, N'20190503231420-NGHTMRE-&-Dillon-Francis---Another-Dimension-(Official-Music-Video)---YouTube.mkv', N'ADVANCED')
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierAddress], [SupplierPhone], [SupplierEmail], [SupplierPassword], [SupplierDOB]) VALUES (2, N'Aryan', N'sdfghjhgfd', N'8877548875', N'kukretiaer@gmail.com', N'admin@1', CAST(N'2019-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierAddress], [SupplierPhone], [SupplierEmail], [SupplierPassword], [SupplierDOB]) VALUES (3, N'Aryan', N'sdfghjhgfd', N'8877548875', N'kukretiaer@gmail.com', N'admin@1', CAST(N'2019-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierAddress], [SupplierPhone], [SupplierEmail], [SupplierPassword], [SupplierDOB]) VALUES (4, N'Pushpendra Kukreti', N'Fhjkl6+651', N'8285032965', N'kukretiaryan@gmail.com', N'PoPo', CAST(N'2019-05-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Trainer] ON 

INSERT [dbo].[Trainer] ([TrainerId], [TrainerName], [TrainerPhone], [TrainerGender], [TrainerImage], [TrainerEmail], [TrainerPassword], [TrainerAddress], [TrainerDOB]) VALUES (1, N'Priya Joshi', N'9958749459', N'Female', N'20190501020333-1.jpg', N'priyajoshi.pj.22@gmail.com', N'PRIY1997', N'D-91 Raghubir Nagar', CAST(N'1997-12-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Trainer] ([TrainerId], [TrainerName], [TrainerPhone], [TrainerGender], [TrainerImage], [TrainerEmail], [TrainerPassword], [TrainerAddress], [TrainerDOB]) VALUES (3, N'Pushpendra Kukreti', N'8285033296', N'Male', N'20190501021155-2.jpg', N'kukretiaryan@gmail.com', N'PUSH1997', N'F-112 Karampura', CAST(N'1997-10-11T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Trainer] OFF
SET IDENTITY_INSERT [dbo].[Trainer_Test_Audit] ON 

INSERT [dbo].[Trainer_Test_Audit] ([TrainerId], [TrainerName], [TrainerGender], [TrainerPhone], [TrainerImage], [TrainerEmail], [TrainerPassword], [Audit_Action], [Audit_Timestamp], [TrainerDOB]) VALUES (1, N'Aryan Kukreti', N'Male', N'8855757754', N'20190503183332-Routine.png', N'sas@saxas.com', N'aa', N'Deleted Record -- After Delete Trigger.', CAST(N'2019-05-03T18:49:03.090' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Trainer_Test_Audit] ([TrainerId], [TrainerName], [TrainerGender], [TrainerPhone], [TrainerImage], [TrainerEmail], [TrainerPassword], [Audit_Action], [Audit_Timestamp], [TrainerDOB]) VALUES (2, N'Aryan Kukreti', N'Male', N'8855745575', N'20190503185002-Screenshot-(1).png', N'sas@saxas.com', N'aa', N'Inserted Record -- After Insert Trigger.', CAST(N'2019-05-03T18:50:02.633' AS DateTime), CAST(N'2019-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Trainer_Test_Audit] ([TrainerId], [TrainerName], [TrainerGender], [TrainerPhone], [TrainerImage], [TrainerEmail], [TrainerPassword], [Audit_Action], [Audit_Timestamp], [TrainerDOB]) VALUES (3, N'Aryan Kukreti', N'Male', N'8855745575', N'20190503185002-Screenshot-(1).png', N'sas@saxas.com', N'aa', N'Deleted Record -- After Delete Trigger.', CAST(N'2019-05-03T18:50:17.437' AS DateTime), CAST(N'2019-05-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Trainer_Test_Audit] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [UserGender], [UserPhone], [UserImage], [UserWeight], [UserEmail], [UserPassword], [UserStatus], [UserDOB], [UserHeight]) VALUES (6, N'Aryan', N'Male', N'782824288', N'20190503185911-Routine.png', CAST(65 AS Decimal(18, 0)), N'kukretiaryan@gmail.com', N'admin@1', 1, CAST(N'2019-05-14T00:00:00.000' AS DateTime), N'5.1')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[User_Test_Audit] ([UserName], [UserDOB], [UserGender], [UserPhone], [UserImage], [UserWeight], [UserEmail], [UserPassword], [UserStatus], [Audit_Action], [Audit_Timestamp], [UserHeight]) VALUES (N'Pushpendra Kukreti', CAST(N'2019-05-02T00:00:00.000' AS DateTime), N'Male', N'8855754456', N'20190503182318-22.jpg', CAST(55 AS Decimal(18, 0)), N'kukretiaryan@gmail.com', N'aaaa', 0, N'Inserted Record -- After Insert Trigger.', CAST(N'2019-05-03T18:23:18.560' AS DateTime), NULL)
INSERT [dbo].[User_Test_Audit] ([UserName], [UserDOB], [UserGender], [UserPhone], [UserImage], [UserWeight], [UserEmail], [UserPassword], [UserStatus], [Audit_Action], [Audit_Timestamp], [UserHeight]) VALUES (N'Pushpendra Kukreti', CAST(N'2019-05-02T00:00:00.000' AS DateTime), N'Male', N'8855754456', N'20190503182318-22.jpg', CAST(55 AS Decimal(18, 0)), N'kukretiaryan@gmail.com', N'aaaa', 0, N'Deleted Record -- After Delete Trigger.', CAST(N'2019-05-03T18:51:05.833' AS DateTime), NULL)
INSERT [dbo].[User_Test_Audit] ([UserName], [UserDOB], [UserGender], [UserPhone], [UserImage], [UserWeight], [UserEmail], [UserPassword], [UserStatus], [Audit_Action], [Audit_Timestamp], [UserHeight]) VALUES (N'Pushpendra', CAST(N'2019-05-22T00:00:00.000' AS DateTime), N'Male', N'8855754456', NULL, CAST(66 AS Decimal(18, 0)), N'kukretiaryan@gmail.com', N'1414', 0, N'Deleted Record -- After Delete Trigger.', CAST(N'2019-05-03T18:51:11.743' AS DateTime), NULL)
INSERT [dbo].[User_Test_Audit] ([UserName], [UserDOB], [UserGender], [UserPhone], [UserImage], [UserWeight], [UserEmail], [UserPassword], [UserStatus], [Audit_Action], [Audit_Timestamp], [UserHeight]) VALUES (N'Aryan', CAST(N'2019-05-07T00:00:00.000' AS DateTime), N'Male', N'8285033296', NULL, CAST(65 AS Decimal(18, 0)), N'kukretiaryan@gmail.com', N'PUSH1997', 1, N'Deleted Record -- After Delete Trigger.', CAST(N'2019-05-03T18:51:18.040' AS DateTime), NULL)
INSERT [dbo].[User_Test_Audit] ([UserName], [UserDOB], [UserGender], [UserPhone], [UserImage], [UserWeight], [UserEmail], [UserPassword], [UserStatus], [Audit_Action], [Audit_Timestamp], [UserHeight]) VALUES (N'Aryan Kukreti', CAST(N'2019-05-22T00:00:00.000' AS DateTime), N'Male', N'782824288', N'20190503185911-Routine.png', CAST(55 AS Decimal(18, 0)), N'kukrwe@gmasa.com', N'aaaa', 0, N'Inserted Record -- After Insert Trigger.', CAST(N'2019-05-03T18:59:11.680' AS DateTime), NULL)
INSERT [dbo].[User_Test_Audit] ([UserName], [UserDOB], [UserGender], [UserPhone], [UserImage], [UserWeight], [UserEmail], [UserPassword], [UserStatus], [Audit_Action], [Audit_Timestamp], [UserHeight]) VALUES (N'Aryan', NULL, N'Male', N'8285033296', NULL, CAST(65 AS Decimal(18, 0)), N'kukretiaryan@gmail.com', N'PUSH1997', 1, N'Deleted Record -- After Delete Trigger.', CAST(N'2019-05-03T19:00:23.333' AS DateTime), NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__AdminLog__A8720BB5F273EC67]    Script Date: 07-05-2019 19:06:56 ******/
ALTER TABLE [dbo].[AdminLogin] ADD UNIQUE NONCLUSTERED 
(
	[AdminLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Schedule__5B34F757D7832A28]    Script Date: 07-05-2019 19:06:56 ******/
ALTER TABLE [dbo].[Schedule] ADD UNIQUE NONCLUSTERED 
(
	[ScheduleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Trainer__855F6C89A9D01EF9]    Script Date: 07-05-2019 19:06:56 ******/
ALTER TABLE [dbo].[Trainer] ADD UNIQUE NONCLUSTERED 
(
	[TrainerEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Trainer__F4379D69679CAA42]    Script Date: 07-05-2019 19:06:56 ******/
ALTER TABLE [dbo].[Trainer] ADD UNIQUE NONCLUSTERED 
(
	[TrainerPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT ((0)) FOR [ProductStatus]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [UserStatus]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Inventory] ([ProductId])
GO
/****** Object:  StoredProcedure [dbo].[spAppointment]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAppointment]
    @Action VARCHAR(10),
	@AppointmentId int,
	@FName nvarchar(20),
	@Lname nvarchar(20),
	@Date date,
	@Time nvarchar(50),
	@Phone varchar(15),
	@Message nvarchar(200)

AS
BEGIN
 
      --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT FName, Lname, Date, Time, Phone, Message
            FROM Appointment
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO Appointment(FName, Lname, Date, Time, Phone, Message)
            VALUES (@FName, @Lname, @Date, @Time, @Phone, @Message)
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Appointment
            WHERE AppointmentId = @AppointmentId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckUser]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[spCheckUser]
    @Action varchar(10),
	@username as nvarchar(50),
	@password as nvarchar(50)
as
Begin

--SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT * from AdminLogin
			WHERE AdminLogId=@username and AdminPassword=@password
      END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE AdminLogin
            SET AdminPassword=@password
            WHERE AdminLogId = @username
      END
	
END
GO
/****** Object:  StoredProcedure [dbo].[spDailyExpense]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spDailyExpense]
      @Action VARCHAR(10),
	  @ExpenseId int,
	  @ExpenseName nvarchar(50),
	  @ExpensePrice decimal,
	  @ExpenseDetail nvarchar(200)
AS
BEGIN
 
      --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT ExpenseName, ExpensePrice, ExpenseDetail
            FROM DailyExpense
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO DailyExpense(ExpenseName, ExpensePrice, ExpenseDetail)
            VALUES (@ExpenseName, @ExpensePrice, @ExpenseDetail)
      END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE DailyExpense
            SET ExpenseName=@ExpenseName, ExpensePrice=@ExpensePrice, ExpenseDetail=@ExpenseDetail
            WHERE ExpenseId = @ExpenseId
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM DailyExpense
            WHERE ExpenseId = @ExpenseId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spInventory]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[spInventory]
    @Action VARCHAR(10),
	@ProductId int,
	@ProductName nvarchar(100),
	@ProductQuantity int, 
	@ProductAmount int,
	@ProductStatus bit,
	@SupplierId int,
	@ProductImage nvarchar(100)

AS
BEGIN
 
      --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT ProductName, ProductQuantity, ProductAmount, ProductStatus, ProductImage, Supplier.SupplierEmail
            FROM Inventory inner join Supplier on Inventory.SupplierId=Supplier.SupplierId
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO Inventory(ProductName, ProductQuantity, ProductAmount, ProductStatus, ProductImage, SupplierId)
            VALUES (@ProductName, @ProductQuantity, @ProductAmount, @ProductStatus, @ProductImage, @SupplierId)
      END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE Inventory
            SET ProductName=@ProductName, ProductQuantity=@ProductQuantity, ProductAmount=@ProductAmount, ProductStatus=@ProductStatus, ProductImage=@ProductImage
            WHERE ProductId = @ProductId
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Inventory
            WHERE ProductId = @ProductId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spOrder]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spOrder]
@Action varchar(10),
@OrderId int,
@OrderName nvarchar(50),
@Phone varchar(15),
@ProductId int,
@OrderDate date
AS
BEGIN
	--SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT OrderName, Phone, ProductName,OrderDate
            FROM [Order] inner join Inventory on [Order].ProductId=Inventory.ProductId
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO [Order](OrderName, Phone, ProductId, OrderDate)
            VALUES (@OrderName, @Phone, @ProductId, @OrderDate)
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM [Order]
            WHERE OrderId = @OrderId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spSchedule]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSchedule]
    @Action VARCHAR(10),
	@ScheduleId int,
	@ScheduleName nvarchar(50),
	@ScheduleImage nvarchar(200),
	@ScheduleTiming nvarchar(50),
	@ScheduleDay nvarchar(20),
	@ScheduleReps int,
	@ScheduleVideos nvarchar(300),
	@ScheduleType nvarchar(20)
AS
BEGIN
 
      --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT ScheduleName ,ScheduleImage ,ScheduleTiming ,ScheduleDay, ScheduleReps, ScheduleVideos, ScheduleType
            FROM Schedule
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO Schedule(ScheduleName ,ScheduleImage ,ScheduleTiming ,ScheduleDay, ScheduleReps, ScheduleVideos, ScheduleType)
            VALUES (@ScheduleName ,@ScheduleImage ,@ScheduleTiming ,@ScheduleDay, @ScheduleReps, @ScheduleVideos, @ScheduleType)
      END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE Schedule
            SET ScheduleName=@ScheduleName ,ScheduleImage=@ScheduleImage ,ScheduleTiming=@ScheduleTiming ,ScheduleDay=@ScheduleDay , ScheduleReps=@ScheduleReps , ScheduleVideos=@ScheduleVideos, ScheduleType=@ScheduleType
            WHERE ScheduleId = @ScheduleId
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Schedule
            WHERE ScheduleId = @ScheduleId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spSupplier]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSupplier]
    @Action VARCHAR(10),
    @SupplierId int,
	@SupplierName nvarchar(50),
	@SupplierDOB datetime,
	@SupplierAddress nvarchar(200),
	@SupplierPhone nvarchar(15),
	@SupplierEmail nvarchar(50),
	@SupplierPassword nvarchar(50)
AS
BEGIN
 
      --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT SupplierName, SupplierDOB, SupplierAddress, SupplierPhone, SupplierEmail, SupplierPassword
            FROM Supplier
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO Supplier(SupplierName, SupplierDOB, SupplierAddress, SupplierPhone, SupplierEmail, SupplierPassword)
            VALUES (@SupplierName, @SupplierDOB, @SupplierAddress, @SupplierPhone, @SupplierEmail, @SupplierPassword)
      END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE Supplier
            SET SupplierName=@SupplierName, SupplierDOB=@SupplierDOB, SupplierAddress=@SupplierAddress, SupplierPhone=@SupplierPhone,
				SupplierEmail=@SupplierEmail, SupplierPassword=@SupplierPassword
            WHERE SupplierId = @SupplierId
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Supplier
            WHERE SupplierId = @SupplierId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spSupplierLog]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSupplierLog]
	  @Action varchar(20),
	@SupplierEmail nvarchar(50),
	@SupplierPassword nvarchar(50)
AS
BEGIN
--SELECT LOGIN
	IF @Action ='SELECTLOG'
		BEGIN
            SELECT * from Supplier
			WHERE SupplierEmail=@SupplierEmail and SupplierPassword=@SupplierPassword
      END


	  --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE Supplier
            SET SupplierPassword=@SupplierPassword
            WHERE SupplierEmail = @SupplierEmail
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spTrainer]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[spTrainer]
      @Action VARCHAR(10),
	  @TrainerId int,
	  @TrainerName nvarchar(50),
	  @TrainerDOB datetime,
	  @TrainerGender nvarchar(15),
	  @TrainerPhone nvarchar(10),
	  @TrainerImage nvarchar(100),
	  @TrainerEmail nvarchar(50),
	  @TrainerAddress nvarchar(100),
	  @TrainerPassword nvarchar(50)
AS
BEGIN
 
      --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT TrainerName, TrainerDOB, TrainerEmail, TrainerGender, TrainerPhone, TrainerImage, TrainerAddress
            FROM Trainer
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO Trainer(TrainerName, TrainerDOB, TrainerEmail, TrainerGender, TrainerPhone, TrainerImage,TrainerAddress, TrainerPassword)
            VALUES (@TrainerName, @TrainerDOB, @TrainerEmail, @TrainerGender, @TrainerPhone, @TrainerImage, @TrainerAddress, @TrainerPassword)
      END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE Trainer
            SET TrainerName=@TrainerName, TrainerDOB=@TrainerDOB, TrainerEmail=@TrainerEmail, TrainerGender=@TrainerGender, TrainerPhone=@TrainerPhone, TrainerImage=@TrainerImage, TrainerAddress=@TrainerAddress
            WHERE TrainerId = @TrainerId
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM Trainer
            WHERE TrainerId = @TrainerId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spUser]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[spUser]
      @Action VARCHAR(10),
      @UserId int,
	@UserName nvarchar(50),
	@UserDOB datetime,
	@UserGender nvarchar(15),
	@UserPhone nvarchar(15),
	@UserImage nvarchar(100),
	@UserHeight nvarchar(4),
	@UserWeight decimal,
	@UserEmail nvarchar(50),
	@UserPassword nvarchar(50),
	@UserStatus bit
AS
BEGIN
	
      --SELECT
    IF @Action = 'SELECT'
      BEGIN
            SELECT UserName, UserDOB, UserGender, UserPhone, UserImage, UserHeight,
					UserWeight, UserEmail, UserPassword, UserStatus
            FROM [User]
      END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
            INSERT INTO [User](UserName, UserDOB, UserGender, UserPhone, UserImage, UserHeight,
					UserWeight, UserEmail, UserPassword, UserStatus)
            VALUES (@UserName, @UserDOB, @UserGender, @UserPhone, @UserImage, @UserHeight,
					@UserWeight, @UserEmail, @UserPassword, @UserStatus)
      END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE [User]
            SET UserName=@UserName, UserDOB=@UserDOB, UserGender=@UserGender, UserPhone=@UserPhone,
				UserImage=@UserImage, UserHeight=@UserHeight, UserWeight=@UserWeight, UserEmail=@UserEmail,
				UserPassword=@UserPassword, UserStatus=@UserStatus
            WHERE UserId = @UserId
      END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM [User]
            WHERE UserId = @UserId
      END
END
GO
/****** Object:  StoredProcedure [dbo].[spUserLog]    Script Date: 07-05-2019 19:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





	  CREATE PROCEDURE [dbo].[spUserLog]
	  @Action varchar(20),
	@UserEmail nvarchar(50),
	@UserPassword nvarchar(50)
AS
BEGIN
--SELECT LOGIN
	IF @Action ='SELECTLOG'
		BEGIN
            SELECT * from [User]
			WHERE UserEmail=@UserEmail and UserPassword=@UserPassword
      END


	  --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE [User]
            SET UserPassword=@UserPassword
            WHERE UserEmail = @UserEmail
      END
END
GO
USE [master]
GO
ALTER DATABASE [efitness] SET  READ_WRITE 
GO
