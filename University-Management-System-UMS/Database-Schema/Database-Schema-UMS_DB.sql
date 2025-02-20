USE [master]
GO
/****** Object:  Database [UMS_DB]    Script Date: 8/10/2016 12:09:10 AM ******/
CREATE DATABASE [UMS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UMS_DB', FILENAME = N'D:\New folder (2)\MSSQL11.SQLEXPRESS\MSSQL\DATA\UMS_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UMS_DB_log', FILENAME = N'D:\New folder (2)\MSSQL11.SQLEXPRESS\MSSQL\DATA\UMS_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UMS_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UMS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UMS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UMS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UMS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UMS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UMS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UMS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UMS_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UMS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UMS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UMS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UMS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UMS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UMS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UMS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UMS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UMS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UMS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UMS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UMS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UMS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UMS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UMS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UMS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UMS_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UMS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [UMS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UMS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UMS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UMS_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UMS_DB]
GO
/****** Object:  Table [dbo].[AllocateClassRoom]    Script Date: 8/10/2016 12:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateClassRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[DateFrom] [datetime] NOT NULL,
	[DateTo] [datetime] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_AllocateClassRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignedCourse]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Department_Id] [int] NOT NULL,
	[Teacher_Id] [int] NOT NULL,
	[Course_Id] [int] NOT NULL,
	[Status_Id] [int] NOT NULL,
 CONSTRAINT [PK_AssignedCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [sql_variant] NOT NULL,
	[Description] [text] NOT NULL,
	[Department_Id] [int] NOT NULL,
	[Semester_Id] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](7) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[EnrollDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeTable]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](50) NOT NULL,
	[Point] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_GradeTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Contactno] [varchar](14) NULL,
	[Date] [datetime2](6) NOT NULL,
	[Address] [varchar](50) NULL,
	[Code] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Registrationno] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Contactno] [varchar](20) NOT NULL,
	[Designation_Id] [int] NOT NULL,
	[Department_Id] [int] NOT NULL,
	[CreditToTake] [int] NULL,
	[Creditremain] [sql_variant] NULL,
 CONSTRAINT [PK_Teacher_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[AllocateClassRoomView]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[AllocateClassRoomView]
as
select d.Id as DepartmentId,c.Code as CourseCode,c.Name as CourseName,
r.Name as RoomName,ACR.DateFrom as StartFrom , ACR.DateTo as Endto,ACR.StatusId as StatusId
from  Course as C
left join Department as D 
on c.Department_Id = D.Id
left join AllocateClassRoom as ACR
on C.Id =ACR.CourseId
left join Room as R
on R.id = ACR.Id
where ACR.StatusId is null or ACR.StatusId ='1';


GO
/****** Object:  View [dbo].[AssigendCourseview]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AssigendCourseview]
as
select D.id as DeptId, c.Id as CourseId,C.Code as CourseCode,C.Name As CourseName,s.Name As Semester,T.Name as TeacherName,AC.Status_Id as Status_Id from Course as C
left join Department as D
on 
C.Department_Id= d.Id
left join AssignedCourse as Ac
on
Ac.Course_Id = C.Id
left join Teacher as T
on
Ac.Teacher_Id = T.Id
left join Semester as S
on
C.Semester_Id = S.Id
where ac.Status_Id Is Null or ac.Status_Id =1



GO
/****** Object:  View [dbo].[EnrollCourseView]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EnrollCourseView]
AS
SELECT        C.Name AS CourseName, C.Id AS CourseId, E.StudentId
FROM            dbo.EnrollCourse AS E INNER JOIN
                         dbo.Course AS C ON E.CourseId = C.Id



GO
/****** Object:  View [dbo].[ResultSheetView]    Script Date: 8/10/2016 12:09:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ResultSheetView]
as
SELECT S.id as StudentId ,c.Code as CourseCode, C.Name as CourseName,G.GradeName as Grade FROM EnrollCourse as Ec
left join Student as s
on Ec.StudentId =S.Id
left join Result as R
on R.StudentId  = S.Id
left join Course as c
on
Ec.CourseId= c.id
left join GradeTable as G
on R.GradeId = G.Id

GO
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] ON 

INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [DateFrom], [DateTo], [StatusId]) VALUES (7, 1, 3, 1, 1, CAST(0x00000000011826C0 AS DateTime), CAST(0x0000000001285B30 AS DateTime), 1)
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [DateFrom], [DateTo], [StatusId]) VALUES (9, 1, 3, 2, 1, CAST(0x000000000107AC00 AS DateTime), CAST(0x000000000117E070 AS DateTime), 1)
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [DateFrom], [DateTo], [StatusId]) VALUES (10, 1, 6, 3, 2, CAST(0x0000000000A4CB80 AS DateTime), CAST(0x0000000000B240D0 AS DateTime), 1)
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [DateFrom], [DateTo], [StatusId]) VALUES (11, 1, 10, 4, 4, CAST(0x0000000000B54640 AS DateTime), CAST(0x0000000000C2BB90 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] OFF
SET IDENTITY_INSERT [dbo].[AssignedCourse] ON 

INSERT [dbo].[AssignedCourse] ([Id], [Department_Id], [Teacher_Id], [Course_Id], [Status_Id]) VALUES (57, 1, 1008, 6, 0)
INSERT [dbo].[AssignedCourse] ([Id], [Department_Id], [Teacher_Id], [Course_Id], [Status_Id]) VALUES (58, 1, 1009, 10, 0)
INSERT [dbo].[AssignedCourse] ([Id], [Department_Id], [Teacher_Id], [Course_Id], [Status_Id]) VALUES (59, 1, 1010, 11, 0)
INSERT [dbo].[AssignedCourse] ([Id], [Department_Id], [Teacher_Id], [Course_Id], [Status_Id]) VALUES (60, 1, 1011, 12, 0)
INSERT [dbo].[AssignedCourse] ([Id], [Department_Id], [Teacher_Id], [Course_Id], [Status_Id]) VALUES (61, 1, 1005, 3, 0)
INSERT [dbo].[AssignedCourse] ([Id], [Department_Id], [Teacher_Id], [Course_Id], [Status_Id]) VALUES (62, 1, 1005, 3, 1)
SET IDENTITY_INSERT [dbo].[AssignedCourse] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (3, N'CSE101', N'C Programing', CAST(5.0 AS decimal(18,1)), N'its aprogrmain', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (6, N'CSE102', N'C Programin lab', CAST(0.5 AS decimal(18,1)), N'Its a lab Class', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (10, N'CSE103', N'Algorithm lab', CAST(0.5 AS decimal(18,1)), N'its a lab class', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (11, N'CSE10', N'C Programing lab', CAST(0.5 AS decimal(18,1)), N'its lab class', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (12, N'gfdh', N'dfhg', CAST(0.5 AS decimal(18,1)), N'dfsgfd', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (13, N'Phy-101', N'Fundamental Of Physics', CAST(Convert(text, N'5') AS varchar(1)), N'Theroy', 2, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (14, N'Phy-102', N'Fundamental Of Physics Lab', CAST(Convert(text, N'4') AS varchar(1)), N'Lab Class', 2, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (15, N'CSE201', N'Data Communication & Computer Networking', CAST(Convert(text, N'4.0') AS varchar(3)), N'Theoritical', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (16, N'Phy201', N'Advanced  physics', CAST(Convert(text, N'4.0') AS varchar(3)), N'Theoritical', 2, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (17, N'Phy203', N'Modern physics', CAST(Convert(text, N'4.0') AS varchar(3)), N'Theoritical', 2, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (18, N'CSE203', N'Software Engineering', CAST(Convert(text, N'4.0') AS varchar(3)), N'Theoritical', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (19, N'CSE202', N'Object oriented programming C++', CAST(Convert(text, N'4.0') AS varchar(3)), N'Theoritical', 1, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (21, N'Acce101', N'Organic Chemestry', CAST(Convert(text, N'4.0') AS varchar(3)), N'Thoritical', 7, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (22, N'Acce201', N'In-organic Chemestry', CAST(Convert(text, N'4.0') AS varchar(3)), N'Thoritical', 7, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (23, N'EEE101', N'Fundamental of Circuit', CAST(Convert(text, N'4.0') AS varchar(3)), N'Thoritical', 4, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (24, N'EEE201', N'Digital circuit analysis', CAST(Convert(text, N'4.0') AS varchar(3)), N'Thoritical', 4, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department_Id], [Semester_Id]) VALUES (25, N'MBG101', N'Micro-Bactaria', CAST(Convert(text, N'4.0') AS varchar(3)), N'Theoritical', 10, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([Id], [Name]) VALUES (1, N'Satarday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (4, N'Thuesday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (5, N'Wednesday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (6, N'Thrusday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'Phy', N'Physics')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'BBA', N'Bachelor of Business Adminstration')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (4, N'EEE', N'Electronics and Electrical Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (6, N'ICE', N'Information & communication Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (7, N'ACCE', N'Applied Chemestry & Chemical Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (8, N'FIMS', N'Fisheries & Marine Science')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (9, N'APCE', N'Applied Physics & Communication Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (10, N'MBG', N'Microbiology')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (11, N'A.MATH', N'Applied Mathematics')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Name]) VALUES (1, N'Professor')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (2, N'Ass. Professor')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (3, N'Lecturer')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (4, N'Ass. Lecturer')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([Id], [Name], [Email], [DepartmentId], [CourseId], [StudentId], [EnrollDate]) VALUES (1, N'Rakib', N'rqb.ctg@gmail.com', 1, 3, 1, CAST(0x0000A65C00000000 AS DateTime))
INSERT [dbo].[EnrollCourse] ([Id], [Name], [Email], [DepartmentId], [CourseId], [StudentId], [EnrollDate]) VALUES (2, N'Rakib', N'rqb.ctg@gmail.com', 1, 6, 1, CAST(0x0000A65C00000000 AS DateTime))
INSERT [dbo].[EnrollCourse] ([Id], [Name], [Email], [DepartmentId], [CourseId], [StudentId], [EnrollDate]) VALUES (3, N'Saimun', N'saimun@gmail.com', 2, 13, 7, CAST(0x0000A67B00000000 AS DateTime))
INSERT [dbo].[EnrollCourse] ([Id], [Name], [Email], [DepartmentId], [CourseId], [StudentId], [EnrollDate]) VALUES (4, N'Saimun', N'saimun@gmail.com', 2, 14, 7, CAST(0x0000A67B00000000 AS DateTime))
INSERT [dbo].[EnrollCourse] ([Id], [Name], [Email], [DepartmentId], [CourseId], [StudentId], [EnrollDate]) VALUES (5, N'Minhaj', N'minhaj@gmail.com', 1, 10, 5, CAST(0x0000A5A600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[GradeTable] ON 

INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (1, N'A+', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (2, N'A', CAST(3.75 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (3, N'A-', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (4, N'B+', CAST(3.25 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (5, N'B', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (6, N'B-', CAST(2.75 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (7, N'C+', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (8, N'C', CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (9, N'C-', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (11, N'D+', CAST(1.75 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (12, N'D', CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (13, N'D-', CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[GradeTable] ([Id], [GradeName], [Point]) VALUES (14, N'F', CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[GradeTable] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (7, 1, 3, 1)
INSERT [dbo].[Result] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (8, 5, 10, 3)
INSERT [dbo].[Result] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (9, 7, 13, 1)
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [Name]) VALUES (1, N'Lab-701')
INSERT [dbo].[Room] ([id], [Name]) VALUES (2, N'Lab-702')
INSERT [dbo].[Room] ([id], [Name]) VALUES (3, N'R-501')
INSERT [dbo].[Room] ([id], [Name]) VALUES (4, N'R-502')
INSERT [dbo].[Room] ([id], [Name]) VALUES (5, N'R-102')
INSERT [dbo].[Room] ([id], [Name]) VALUES (6, N'R-103')
INSERT [dbo].[Room] ([id], [Name]) VALUES (7, N'R-201')
INSERT [dbo].[Room] ([id], [Name]) VALUES (8, N'R-202')
INSERT [dbo].[Room] ([id], [Name]) VALUES (9, N'R-301')
INSERT [dbo].[Room] ([id], [Name]) VALUES (10, N'R-302')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [Name]) VALUES (1, N'First Semester')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (2, N'Second Semester')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (3, N'Third Semester')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (4, N'Fourth Semester')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (5, N'Fifth Semester')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (6, N'Sixth Semester')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (7, N'Seventh Semester')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (8, N'Eighth Semester')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [Contactno], [Date], [Address], [Code], [DepartmentId], [Registrationno]) VALUES (1, N'Rakib', N'rqb.ctg@gmail.com', N'01814829883', CAST(0x060000000000983B0B AS DateTime2), N'Chittagong', N'CSE', 1, N'CSE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contactno], [Date], [Address], [Code], [DepartmentId], [Registrationno]) VALUES (5, N'Minhaj', N'minhaj@gmail.com', N'01814-564737', CAST(0x060000000000133C0B AS DateTime2), N'Chittagong', N'CSE', 1, N'CSE-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contactno], [Date], [Address], [Code], [DepartmentId], [Registrationno]) VALUES (7, N'Saimun', N'saimun@gmail.com', N'01814-234156', CAST(0x060000000000D63B0B AS DateTime2), N'Chittagong', N'Phy', 2, N'Phy-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contactno], [Date], [Address], [Code], [DepartmentId], [Registrationno]) VALUES (8, N'Maliha', N'maliha@gmail.com', N'01814-256456', CAST(0x060000000000D63B0B AS DateTime2), N'Chittagong', N'BBA', 3, N'BBA-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contactno], [Date], [Address], [Code], [DepartmentId], [Registrationno]) VALUES (9, N'Mishu', N'mishu@mail.com', N'01814-345267', CAST(0x060000000000D63B0B AS DateTime2), N'Chittagong', N'EEE', 4, N'EEE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contactno], [Date], [Address], [Code], [DepartmentId], [Registrationno]) VALUES (10, N'Mahin', N'mahin@gmail.com', N'0183682902', CAST(0x060000000000D33B0B AS DateTime2), N'Chittagong', N'ACCE', 7, N'ACCE-2016-001')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1005, N'Taybur', N'Chittagong', N'taybur@mail.com', N'01814829883', 1, 1, 45, CAST(Convert(text, N'13.5') AS varchar(4)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1008, N'Rahman', N'Chittagon', N'rahman@mail.com', N'01814829883', 1, 1, 45, CAST(Convert(text, N'44.5') AS varchar(4)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1009, N'Faisal Faruqee', N'Chittagong', N'faisal@uits.com', N'01814-000000', 1, 1, 30, CAST(Convert(text, N'29.5') AS varchar(4)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1010, N'Saimun', N'Chittagong', N'shaonmahajan@gmail.com', N'01814829833', 1, 1, 1, CAST(Convert(text, N'-6.0') AS varchar(4)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1011, N'Rakib', N'Chittagong', N'rqb.tctg@gmail.com', N'01814-000000', 1, 1, 10, CAST(Convert(text, N'-5.5') AS varchar(4)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1012, N'Hero Alom', N'Chittagong', N'hero@mail.com', N'01814-000000', 2, 2, 5, CAST(5.00 AS decimal(18,2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1013, N'Bellal Hossain', N'Khulna', N'bellal@gmail.com', N'0191426278', 2, 2, 15, CAST(Convert(text, N'15') AS varchar(2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1014, N'Javed Hossain', N'Dhaka', N'javed@gmail.com', N'01727289', 1, 1, 15, CAST(Convert(text, N'15') AS varchar(2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1015, N'Kamal uddin', N'Rajshahi', N'kamal@gmail.com', N'018277378', 2, 2, 12, CAST(Convert(text, N'12') AS varchar(2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1016, N'Tanvir Ahmed', N'Dhaka', N'tanvir@gmail.com', N'017288282', 2, 2, 12, CAST(Convert(text, N'12') AS varchar(2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1017, N'Saiful Islam', N'Chittagong', N'saiful@gmail.com', N'0192872634', 4, 4, 12, CAST(Convert(text, N'12') AS varchar(2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1018, N'Nizam Uddin', N'Chittagong', N'nizam@gmail.com', N'015437892', 2, 2, 15, CAST(Convert(text, N'15') AS varchar(2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1019, N'Jasim Uddin', N'Chittagong', N'jasim@gmail.com', N'015437892', 2, 2, 12, CAST(Convert(text, N'12') AS varchar(2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contactno], [Designation_Id], [Department_Id], [CreditToTake], [Creditremain]) VALUES (1020, N'Humaiyun Kabir', N'Comilla', N'Humaiyun@gmail.com', N'01526789645', 1, 1, 20, CAST(Convert(text, N'20') AS varchar(2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course]    Script Date: 8/10/2016 12:09:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course] ON [dbo].[Course]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 8/10/2016 12:09:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course_1] ON [dbo].[Course]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department]    Script Date: 8/10/2016 12:09:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department] ON [dbo].[Department]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student]    Script Date: 8/10/2016 12:09:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student] ON [dbo].[Student]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Course]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Day]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Department]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Room]
GO
ALTER TABLE [dbo].[AssignedCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignedCourse_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AssignedCourse] CHECK CONSTRAINT [FK_AssignedCourse_Course]
GO
ALTER TABLE [dbo].[AssignedCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignedCourse_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AssignedCourse] CHECK CONSTRAINT [FK_AssignedCourse_Department]
GO
ALTER TABLE [dbo].[AssignedCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignedCourse_Department1] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AssignedCourse] CHECK CONSTRAINT [FK_AssignedCourse_Department1]
GO
ALTER TABLE [dbo].[AssignedCourse]  WITH CHECK ADD  CONSTRAINT [FK_AssignedCourse_Teacher] FOREIGN KEY([Teacher_Id])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[AssignedCourse] CHECK CONSTRAINT [FK_AssignedCourse_Teacher]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course1] FOREIGN KEY([Semester_Id])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course1]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Course]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Department]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Student]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Course]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_GradeTable] FOREIGN KEY([GradeId])
REFERENCES [dbo].[GradeTable] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_GradeTable]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([Designation_Id])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 238
               Bottom = 127
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 127
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EnrollCourseView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EnrollCourseView'
GO
USE [master]
GO
ALTER DATABASE [UMS_DB] SET  READ_WRITE 
GO
