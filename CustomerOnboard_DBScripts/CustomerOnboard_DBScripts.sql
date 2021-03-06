USE [master]
GO
/****** Object:  Database [CustomerOnboard]    Script Date: 2/17/2020 1:04:57 AM ******/
CREATE DATABASE [CustomerOnboard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerOnboard', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CustomerOnboard.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CustomerOnboard_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CustomerOnboard_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CustomerOnboard] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerOnboard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerOnboard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerOnboard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerOnboard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerOnboard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerOnboard] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerOnboard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerOnboard] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerOnboard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerOnboard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerOnboard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerOnboard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerOnboard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerOnboard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerOnboard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerOnboard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerOnboard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerOnboard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerOnboard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerOnboard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerOnboard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerOnboard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerOnboard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerOnboard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerOnboard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerOnboard] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerOnboard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerOnboard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerOnboard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerOnboard] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CustomerOnboard]
GO
/****** Object:  ApplicationRole [iMPACT_PNC_READ]    Script Date: 2/17/2020 1:04:59 AM ******/
/* To avoid disclosure of passwords, the password is generated in script. */
declare @idx as int
declare @randomPwd as nvarchar(64)
declare @rnd as float
select @idx = 0
select @randomPwd = N''
select @rnd = rand((@@CPU_BUSY % 100) + ((@@IDLE % 100) * 100) + 
       (DATEPART(ss, GETDATE()) * 10000) + ((cast(DATEPART(ms, GETDATE()) as int) % 100) * 1000000))
while @idx < 64
begin
   select @randomPwd = @randomPwd + char((cast((@rnd * 83) as int) + 43))
   select @idx = @idx + 1
select @rnd = rand()
end
declare @statement nvarchar(4000)
select @statement = N'CREATE APPLICATION ROLE [iMPACT_PNC_READ] WITH DEFAULT_SCHEMA = [dbo], ' + N'PASSWORD = N' + QUOTENAME(@randomPwd,'''')
EXEC dbo.sp_executesql @statement

GO
/****** Object:  User [tfs]    Script Date: 2/17/2020 1:04:59 AM ******/
CREATE USER [tfs] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 2/17/2020 1:04:59 AM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IRISSOFTWARE\tfsQATest]    Script Date: 2/17/2020 1:04:59 AM ******/
CREATE USER [IRISSOFTWARE\tfsQATest] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IRISSOFTWARE\abhinandan.baheti]    Script Date: 2/17/2020 1:04:59 AM ******/
CREATE USER [IRISSOFTWARE\abhinandan.baheti] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IRIS-CSG-688\kalidutt]    Script Date: 2/17/2020 1:04:59 AM ******/
CREATE USER [IRIS-CSG-688\kalidutt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [tfs]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_owner] ADD MEMBER [IRISSOFTWARE\tfsQATest]
GO
ALTER ROLE [db_owner] ADD MEMBER [IRIS-CSG-688\kalidutt]
GO
/****** Object:  Table [dbo].[CredentialsTable]    Script Date: 2/17/2020 1:04:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialsTable](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CredentialsTable1]    Script Date: 2/17/2020 1:04:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialsTable1](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 2/17/2020 1:04:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[Username] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CredentialsTable] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'admin', N'admin', N'admin', NULL)
GO
INSERT [dbo].[CredentialsTable] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'kali.dutt', N'kali.dutt', N'kali', N'dutt')
GO
INSERT [dbo].[CredentialsTable] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'admin1', N'admin1', N'admin1', N'')
GO
INSERT [dbo].[CredentialsTable] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'kalidutt100', N'kalidutt100', N'Kali100', N'Dutt100')
GO
INSERT [dbo].[CredentialsTable1] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'admin', N'admin', N'admin', NULL)
GO
INSERT [dbo].[CredentialsTable1] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'kali.dutt', N'kali.dutt', N'kali', N'dutt')
GO
INSERT [dbo].[CredentialsTable1] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'admin1', N'admin11', N'admin1', N'')
GO
INSERT [dbo].[CredentialsTable1] ([Username], [Password], [Firstname], [Lastname]) VALUES (N'kalidutt100', N'kalidutt100', N'Kali100', N'Dutt100')
GO
INSERT [dbo].[CustomerDetails] ([Username], [Address]) VALUES (N'admin', N'IRIS, Noida')
GO
INSERT [dbo].[CustomerDetails] ([Username], [Address]) VALUES (N'kali.dutt', N'B3, VasantKunj, New Delhi - 70')
GO
INSERT [dbo].[CustomerDetails] ([Username], [Address]) VALUES (N'admin1', N'Safdarjung Enclave, Delhi')
GO
INSERT [dbo].[CustomerDetails] ([Username], [Address]) VALUES (N'kalidutt100', N'Arjunnagar, Safdarjung Enclave, New Delhi - 110029')
GO
USE [master]
GO
ALTER DATABASE [CustomerOnboard] SET  READ_WRITE 
GO
