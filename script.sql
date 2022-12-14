USE [master]
GO
/****** Object:  Database [Company]    Script Date: 08.11.2022 23:22:05 ******/
CREATE DATABASE [Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Company.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Company_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Company_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Company] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Company].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Company] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Company] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Company] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Company] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Company] SET ARITHABORT OFF 
GO
ALTER DATABASE [Company] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Company] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Company] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Company] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Company] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Company] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Company] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Company] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Company] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Company] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Company] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Company] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Company] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Company] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Company] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Company] SET RECOVERY FULL 
GO
ALTER DATABASE [Company] SET  MULTI_USER 
GO
ALTER DATABASE [Company] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Company] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Company] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Company] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Company] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Company] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Company', N'ON'
GO
ALTER DATABASE [Company] SET QUERY_STORE = OFF
GO
USE [Company]
GO
/****** Object:  UserDefinedFunction [dbo].[getAccruedSalary]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   function [dbo].[getAccruedSalary](@employee int, @year int)
returns decimal(18,2)
begin
return	(select			sum(sal.[salary])
		from			Salary as sal, Employee as emp
		where			sal.[id_employee] = emp.[id] and
						emp.[id] = @employee and
						sal.[year] = @year)
end;
GO
/****** Object:  Table [dbo].[Department]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[surname] [nvarchar](100) NOT NULL,
	[birth_date] [date] NOT NULL,
	[email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[min_salary] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Career]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[id_employee] [int] NOT NULL,
	[id_job] [int] NOT NULL,
	[id_department] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EmployeesDepartments]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[EmployeesDepartments] as
select		emp.[id], emp.[name] as empName, dep.[name] as depName, job.[name] as jobName
from		Employee as emp, Department as dep, Career as car, Job as job
where		car.[id_department] = dep.[id] and
			car.[id_employee] = emp.[id] and
			car.[id_job] = job.[id] and
			car.end_date is null
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_employee] [int] NOT NULL,
	[month] [int] NOT NULL,
	[year] [int] NOT NULL,
	[salary] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [emp_index]    Script Date: 08.11.2022 23:22:06 ******/
CREATE NONCLUSTERED INDEX [emp_index] ON [dbo].[Employee]
(
	[name] ASC,
	[surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_email]    Script Date: 08.11.2022 23:22:06 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_email] ON [dbo].[Employee]
(
	[email] ASC
)
WHERE ([email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Career] ADD  CONSTRAINT [DF_currentDate]  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD  CONSTRAINT [FK_departments] FOREIGN KEY([id_department])
REFERENCES [dbo].[Department] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Career] CHECK CONSTRAINT [FK_departments]
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD  CONSTRAINT [FK_employees] FOREIGN KEY([id_employee])
REFERENCES [dbo].[Employee] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Career] CHECK CONSTRAINT [FK_employees]
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD  CONSTRAINT [FK_jobs] FOREIGN KEY([id_job])
REFERENCES [dbo].[Job] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Career] CHECK CONSTRAINT [FK_jobs]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_employees1] FOREIGN KEY([id_employee])
REFERENCES [dbo].[Employee] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_employees1]
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD CHECK  (([end_date]>'1990-01-01' AND [end_date]<getdate()))
GO
ALTER TABLE [dbo].[Career]  WITH CHECK ADD CHECK  (([start_date]>'1990-01-01' AND [start_date]<getdate()))
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CHECK  (([birth_date]>'1900-01-01' AND [birth_date]<'2005-01-01'))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([month]>(0) AND [month]<(13)))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([month]>(0) AND [month]<(13)))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([month]>(0) AND [month]<(13)))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([month]>(0) AND [month]<(13)))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([year]>(2002) AND [year]<(2016)))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([year]>(2002) AND [year]<(2016)))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([year]>(2002) AND [year]<(2016)))
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD CHECK  (([year]>(2002) AND [year]<(2016)))
GO
/****** Object:  StoredProcedure [dbo].[jobHistory]    Script Date: 08.11.2022 23:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[jobHistory]
	@employee nvarchar(100)
as
select		emp.[id], emp.[name], job.[name] as Position
from		Employee as emp, Career as car, Job as job
where		car.[id_employee] = emp.[id] and
			car.[id_job] = job.[id] and
			emp.[id] = @employee;

GO
USE [master]
GO
ALTER DATABASE [Company] SET  READ_WRITE 
GO
