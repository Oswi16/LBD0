USE [PRACTICA1_JOME]
GO
/****** Object:  User [Mate_13-PC\Mate_13]    Script Date: 31/08/2019 09:50:53 a.m. ******/
DROP USER [Mate_13-PC\Mate_13]
GO
USE [master]
GO
/****** Object:  Database [PRACTICA1_JOME]    Script Date: 31/08/2019 09:50:53 a.m. ******/
DROP DATABASE [PRACTICA1_JOME]
GO
/****** Object:  Database [PRACTICA1_JOME]    Script Date: 31/08/2019 09:50:53 a.m. ******/
CREATE DATABASE [PRACTICA1_JOME]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRACTICA1_JOME', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PRACTICA1_JOME.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRACTICA1_JOME_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PRACTICA1_JOME_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRACTICA1_JOME] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRACTICA1_JOME].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRACTICA1_JOME] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRACTICA1_JOME] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PRACTICA1_JOME] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRACTICA1_JOME] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRACTICA1_JOME] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRACTICA1_JOME] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRACTICA1_JOME] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRACTICA1_JOME] SET  MULTI_USER 
GO
ALTER DATABASE [PRACTICA1_JOME] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRACTICA1_JOME] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRACTICA1_JOME] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRACTICA1_JOME] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PRACTICA1_JOME]
GO
/****** Object:  User [Mate_13-PC\Mate_13]    Script Date: 31/08/2019 09:50:53 a.m. ******/
CREATE USER [Mate_13-PC\Mate_13] FOR LOGIN [Mate_13-PC\Mate_13] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [master]
GO
ALTER DATABASE [PRACTICA1_JOME] SET  READ_WRITE 
GO
