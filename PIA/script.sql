USE [RestauranteJMG]
GO
/****** Object:  Trigger [TR_ClienteF]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TRIGGER IF EXISTS [dbo].[TR_ClienteF]
GO
/****** Object:  StoredProcedure [dbo].[ProTicket]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[ProTicket]
GO
/****** Object:  StoredProcedure [dbo].[ProMesero]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[ProMesero]
GO
/****** Object:  StoredProcedure [dbo].[ProMesa]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[ProMesa]
GO
/****** Object:  StoredProcedure [dbo].[ProMenu]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[ProMenu]
GO
/****** Object:  StoredProcedure [dbo].[ProCliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[ProCliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VisitasCliente]') AND type in (N'U'))
ALTER TABLE [dbo].[VisitasCliente] DROP CONSTRAINT IF EXISTS [FK__VisitasCl__iIdCl__151B244E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT IF EXISTS [FK_iIdMesa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT IF EXISTS [FK_iIdMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT IF EXISTS [FK_iIdProducto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT IF EXISTS [FK_iIdCliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesero]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesero] DROP CONSTRAINT IF EXISTS [FK_iIdMesaM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesa] DROP CONSTRAINT IF EXISTS [FK_iIdRestaurante]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT IF EXISTS [FK_iIdMesaC]
GO
/****** Object:  Table [dbo].[VisitasCliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[VisitasCliente]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Restaurante]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Pedido]
GO
/****** Object:  View [dbo].[vw_Menu]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP VIEW IF EXISTS [dbo].[vw_Menu]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Menu]
GO
/****** Object:  View [dbo].[vw_Mesa]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP VIEW IF EXISTS [dbo].[vw_Mesa]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesa]
GO
/****** Object:  View [dbo].[vw_Ticket]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP VIEW IF EXISTS [dbo].[vw_Ticket]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Ticket]
GO
/****** Object:  View [dbo].[vw_Mesero]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP VIEW IF EXISTS [dbo].[vw_Mesero]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesero]
GO
/****** Object:  View [dbo].[vw_Cliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP VIEW IF EXISTS [dbo].[vw_Cliente]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cliente]
GO
/****** Object:  UserDefinedFunction [dbo].[BusquedaClientes]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP FUNCTION IF EXISTS [dbo].[BusquedaClientes]
GO
USE [master]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 02/11/2019 03:54:00 p. m. ******/
DROP DATABASE IF EXISTS [RestauranteJMG]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 02/11/2019 03:54:00 p. m. ******/
CREATE DATABASE [RestauranteJMG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestauranteJMG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestauranteJMG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestauranteJMG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestauranteJMG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RestauranteJMG] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestauranteJMG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestauranteJMG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestauranteJMG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestauranteJMG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestauranteJMG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestauranteJMG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestauranteJMG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestauranteJMG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestauranteJMG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestauranteJMG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestauranteJMG] SET  MULTI_USER 
GO
ALTER DATABASE [RestauranteJMG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestauranteJMG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestauranteJMG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestauranteJMG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestauranteJMG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestauranteJMG] SET QUERY_STORE = OFF
GO
USE [RestauranteJMG]
GO
/****** Object:  UserDefinedFunction [dbo].[BusquedaClientes]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[BusquedaClientes]
(@NombreClientes varchar (40))
returns varchar (40)
as begin
declare @busqueda varchar(40)
set @busqueda =(select iIdCliente from cliente where vNombreC = @NombreClientes)
return @busqueda
end
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[iIdCliente] [int] NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[vNombreC] [varchar](30) NULL,
	[vApellidoP] [varchar](30) NOT NULL,
	[vApellidoM] [varchar](30) NOT NULL,
	[NombreCompleto]  AS (((([vNombreC]+' ')+[vApellidoP])+' ')+[vApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[iIdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Cliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Cliente] as
select vNombreC,iIdCliente from Cliente
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesero](
	[iIdMesero] [int] NOT NULL,
	[vNombreM] [varchar](30) NOT NULL,
	[vApellidoPM] [varchar](30) NOT NULL,
	[vApellidoMM] [varchar](30) NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[NombreCompleto]  AS (((([vNombreM]+' ')+[vApellidoPM])+' ')+[vApellidoMM]),
PRIMARY KEY CLUSTERED 
(
	[iIdMesero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Mesero]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Mesero] as
select iIdMesero,vNombreM,iIdMesa from Mesero
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[iIdTicket] [int] NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[iIdMenu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Ticket]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Ticket] as
select iIdTicket,Fecha from Ticket
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[iIdMesa] [int] NOT NULL,
	[iIdRestaurante] [int] NULL,
	[iNumPer] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Mesa]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Mesa] as
select iIdMesa,iIdRestaurante from Mesa
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[iIdProducto] [int] NOT NULL,
	[vNombrePlatillo] [varchar](50) NULL,
	[vDescripcion] [varchar](200) NULL,
	[iPrecio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Menu]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Menu] as
select vNombrePlatillo,vDescripcion,iPrecio from Menu
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[iIdPedido] [int] NOT NULL,
	[iIdCliente] [int] NOT NULL,
	[iIdProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurante](
	[iIdRestaurante] [int] NOT NULL,
	[Ubicacion] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitasCliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitasCliente](
	[iIdCliente] [int] NOT NULL,
	[iNumVisitas] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (1, 1, N'Pedro', N'Ramirez', N'Perez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (2, 2, N'Wynn', N'Messent', N'Snaddon')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (4, 4, N'Nero', N'Moxstead', N'Dolby')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (5, 5, N'Binny', N'Hemphill', N'Aitcheson')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (6, 6, N'Maryellen', N'Jamme', N'Devey')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (7, 7, N'Mario', N'Marrett', N'Marini')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (8, 8, N'Kylila', N'Manns', N'Diplock')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (9, 9, N'Barny', N'Kalvin', N'Dunridge')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (10, 10, N'Hector', N'Ofen', N'Retallick')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (11, 11, N'Corbett', N'Ianniello', N'Sreenan')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (12, 12, N'Neille', N'Mouser', N'Janous')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (13, 13, N'Stanly', N'Heads', N'Lautie')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (16, 2, N'Melina', N'Cantu', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (17, 3, N'Mauricio', N'Camacho', N'Hernandez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (18, 5, N'Denisse', N'Montemayor', N'Aguilar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (19, 6, N'Jon', N'de Leon', N'Montes')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (20, 1, N'Juan', N'Tostado', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (21, 8, N'Paco', N'Tosatdo', N'Maldonado')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (22, 11, N'Astrid', N'Camacho', N'Limon')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (23, 12, N'Adriana', N'Valdez', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (24, 9, N'Oscar', N'Valdez', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (25, 6, N'Jorge', N'Hernandez', N'Garcia')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (26, 7, N'Jose', N'Garcia', N'Gonzales')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (27, 10, N'David', N'Martinez', N'Lopez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (28, 15, N'Diego', N'Ramires', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (29, 4, N'Leonardo', N'Soto', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (30, 12, N'Daniel', N'Sanchez', N'Rodriguez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (31, 3, N'Margarita', N'Gomez', N'Velazco')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (32, 4, N'Yolanda', N'Sotelo', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (33, 5, N'Araceli', N'Ruelas', N'Gomez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (34, 7, N'Gabriela', N'Aguirre', N'Salazar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (35, 10, N'Elizabeth', N'Cervantes', N'Davila')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (36, 15, N'Natalia', N'Garcia', N'Vega')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (37, 12, N'Veronica', N'Gonzales', N'Martinez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (38, 1, N'Alexa', N'Lopez', N'Coronado')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (39, 6, N'Sebastian', N'Betancurt', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (40, 8, N'Fernanda', N'Garcia', N'Vega')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (41, 1, N'Pedro', N'Perez', N'Gonzalez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (42, 1, N'Gustavo', N'Perez', N'Gonzalez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (44, 12, N'Jean', N'Lugo', N'De La Rosa')
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (1, N'Tacos de Trompo', N'Tacos mexicanos de carne de puerco adobada', 50)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (2, N'Mojarra (670-720grs)', N'Mojarra a la diabla o al mojo de ajo acompañada con papas en gajo, ensalada y arroz de la casa', 129)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (3, N'La Rosita(220grs)', N'Pasta acompañada con salmon a la plancha y verduras.', 145)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (4, N'Chamalitas(240grs)', N'Alitas bañadas con salsa de la casa espolvpreadas con cebollin y cacahuate .', 89)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (5, N'Los Esquineros', N'Orden de tacos (3) de carne asada gratinaos con queso manchego y acompañados con papitas galeana.', 105)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (6, N'Las fajas(250grs)', N'Fajitas de Sirloin.', 119)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (7, N'Las fajas(250grs)', N'Fajitas de Pollo.', 99)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (8, N'Chamakidz)(80grs)', N'Fajitas de pescado o nuggets de pollo scompañadas con papas en gajos sazonadas con lemon-papper.', 70)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (9, N'Cocolizos', N'Camarones empanizados con coco, servidos con salsa de tomate, acompañados con arroz y verduras al vapor.', 119)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (10, N'Chamaburger', N'Hamburguesa de camaron con guacamole, tocino, queso manchego, cebolla y pimiento cocido.', 145)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (11, N'Mojarra Chamalera (550-620grs)', N'Mojarra preparada al estilo Chamalero con papas, ensalada y arroz.', 119)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (12, N'Mojarra Chamalera (670-720grs)', N'Mojarra preparada al estilo Chamalero con papas, ensalada y arroz.', 129)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (13, N'Isabela (135grs)', N'Receta original de coctel de camaron con un toquesito picante especial.', 95)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (14, N'Isabelita (80grs)', N'Como la Isabela pero version individual ideal pa`empezar.', 67)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (15, N'Camarones QK (200grs)', N'Camarones sateneados en nuestra salsa de ajillo acompañados con arroz.', 169)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (16, N'Estoyokei (120grs)', N'Lajas de sirloin curtidas en la receta secreta especial de la casa acompañadas con cubitos de aguacate y champiñones', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (17, N'Water Chile green(150grs)', N'Camarones frescos curtidos en limon con 2 aguachiles verde.', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (18, N'Water Chile black(150grs)', N'Camarones frescos curtidos en limon con 2 aguachiles negro.', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (19, N'El pozolon (230grs)', N'Pozole calientito de mariscos(camaron, pulpo, pescado y almeja) acompañado de lechuga, rabano, tostadas y salsa de la casa.', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (20, N'Caldo de Chamama (220grs)', N'Delicioso caldo de pescado, camaron, verduras y arroz.', 99)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (21, N'La ligerita', N'Mezcla de lechuga con camarones bufalo, tomate, pepino y varitas de apio con aderezo blue cheese.', 95)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (22, N'La rogelia (220grs)', N'Pasta fettuccinie con una crema fradevil y camarones salteados .', 109)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (23, N'Lais', N'Filete de pescado a la plancha, acompañado con arroz y verduras al vapor con un toque de mantequilla.', 95)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (24, N'Panchitos', N'Camarones rellenos de queso envueltos en tocino, acompañados con arroz y verduras al vapor.', 129)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (25, N'Los cuates', N'Filete de pescado capeado y camarones al ajillo, acompañado de arroz y verduras al vapor.', 109)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (26, N'La pinky (Tostada)', N'Finas laminas de atun fresco, aguacate, cebolla frita, cilantro y aderezo de chipotle.', 49)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (27, N'La robles (Tostada)', N'Finas laminas de salmon natural fresco sobre una cama de aguacate, tomate y aderezo de chipotle.', 49)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (28, N'La descuidada (Tostada)', N'Tostada de carne, champiñones y cebolla cocida sobre una cama de delicioso queso manchego gratinado.', 49)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (29, N'La tipica (Tostada)', N'Tradicional tostada de ceviche de camaron tomate, cebolla, aguacate y cilantro sobre un aderezo de ajo.', 47)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (30, N'La Don Octavio (Tostada)', N'Tostada de ceviche de pulpo cocido acompañado de jitomate, pepino y aguacate sobre un aderezo de cilantro.', 47)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (31, N'Doña Blanca (Tostada)', N'Tostada de ceviche de pescado sazonada en clamato, tomate, cebolla, aguacate sobre un aderezo de la casa.', 39)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (32, N'Coqueta (Tostada)', N'Tostada de ceviche de pescado, pepino trocitos de mango y un aderezo de la casa.', 39)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (33, N'Gober Precioso (Tacos)', N'Taco de guiso de camaron con queso fundido y chile poblano.', 34)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (34, N'Coca Cola 355ml (Bebidas)', N'Refresco Coca Cola.', 25)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (35, N'Sprite 355ml (Bebidas)', N'Refresco Sprite.', 25)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (1, 1, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (2, 2, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (3, 3, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (4, 4, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (5, 5, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (6, 6, 1)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (7, 7, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (8, 8, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (9, 9, 8)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (10, 10, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (11, 8, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (12, 4, 1)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (13, 1, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (14, 2, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (15, 9, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (16, 5, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (17, 5, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (18, 4, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (19, 7, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (20, 4, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (21, 9, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (22, 5, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (23, 2, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (24, 7, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (25, 10, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (26, 5, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (27, 2, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (28, 8, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (29, 3, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (30, 6, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (31, 1, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (32, 6, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (33, 2, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (34, 5, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (35, 5, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (36, 7, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (37, 1, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (38, 8, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (39, 6, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (40, 3, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (41, 6, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (42, 9, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (43, 7, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (44, 7, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (45, 1, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (46, 10, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (47, 1, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (48, 1, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (49, 8, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (50, 10, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (51, 1, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (52, 2, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (53, 10, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (54, 4, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (55, 3, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (56, 3, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (57, 3, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (58, 2, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (59, 2, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (60, 3, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (61, 5, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (62, 6, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (63, 9, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (64, 3, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (65, 1, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (66, 4, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (67, 10, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (68, 10, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (69, 3, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (70, 3, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (71, 8, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (72, 4, 3)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (73, 8, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (74, 8, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (75, 10, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (76, 5, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (77, 1, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (78, 3, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (79, 4, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (80, 9, 4)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (1, N'Agnese', N'Botterill', N'Berthelet', 7)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (2, N'Xever', N'Brazelton', N'Racine', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (3, N'Sherill', N'Martinot', N'Andress', 8)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (4, N'Pedro', N'Meas', N'Gammage', 1)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (5, N'Rae', N'McDill', N'MacCarrick', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (6, N'Doy', N'Carff', N'Spikeings', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (7, N'Vittorio', N'Mackrill', N'Cheves', 4)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (8, N'Randa', N'Bacher', N'Reaveley', 9)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (9, N'Jervis', N'Bouch', N'Brownett', 14)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (10, N'Bonnibelle', N'MacLeese', N'Angus', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (11, N'Wileen', N'Rothwell', N'Verick', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (12, N'Roland', N'Spreadbury', N'Feldbau', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (13, N'Cornell', N'Beadnall', N'MacCahee', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (14, N'Johnath', N'Beament', N'Daniele', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (15, N'Gery', N'Lerohan', N'Guwer', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (16, N'Ede', N'Torri', N'Maybury', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (17, N'Natal', N'Tothacot', N'Gennerich', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (18, N'Jerald', N'Breyt', N'Probin', 3)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (19, N'Dianemarie', N'Parkes', N'Doy', 6)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (20, N'Rodney', N'Lethbury', N'Burgoyne', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (21, N'Nelia', N'Hatz', N'Gibbons', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (22, N'Nichol', N'Colliford', N'Mowsdill', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (23, N'Kitti', N'Lowndesbrough', N'Adnam', 15)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (24, N'Killy', N'Corcut', N'Bredes', 1)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (25, N'Randie', N'McSporon', N'Rawsthorn', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (26, N'Stella', N'Kohrding', N'Broadfield', 4)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (27, N'Bondon', N'McCrorie', N'Casterot', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (28, N'Beniamino', N'Arno', N'Lowdeane', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (29, N'Inness', N'Bengall', N'Piddle', 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (1, 12, 33)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (2, 26, 10)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (3, 34, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (4, 20, 20)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (6, 7, 29)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (7, 32, 6)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (8, 27, 29)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (9, 2, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (10, 26, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (11, 39, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (12, 26, 33)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (15, 12, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (16, 38, 31)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (17, 4, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (18, 11, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (19, 38, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (21, 40, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (22, 4, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (23, 6, 20)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (24, 41, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (26, 4, 29)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (27, 19, 18)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (28, 37, 30)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (29, 28, 14)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (30, 9, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (31, 32, 31)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (32, 28, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (33, 22, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (34, 32, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (35, 23, 18)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (36, 32, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (37, 5, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (38, 37, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (39, 5, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (40, 12, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (41, 41, 4)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (42, 12, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (43, 31, 29)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (44, 5, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (45, 28, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (47, 37, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (49, 26, 21)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (50, 18, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (51, 35, 34)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (52, 2, 32)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (53, 22, 5)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (54, 40, 30)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (55, 37, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (56, 37, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (57, 40, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (58, 27, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (59, 11, 33)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (60, 5, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (61, 27, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (62, 24, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (63, 19, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (64, 20, 20)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (65, 21, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (66, 12, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (67, 30, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (68, 32, 32)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (69, 20, 14)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (70, 17, 30)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (71, 28, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (72, 1, 21)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (73, 29, 21)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (74, 9, 27)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (75, 9, 6)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (76, 36, 30)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (77, 28, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (78, 37, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (79, 11, 18)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (80, 9, 21)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (81, 29, 26)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (82, 1, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (84, 17, 34)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (85, 22, 33)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (86, 12, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (87, 7, 19)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (88, 37, 21)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (89, 12, 9)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (91, 11, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (92, 29, 14)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (93, 32, 15)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (94, 26, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (95, 26, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (96, 36, 30)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (97, 21, 24)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (98, 32, 24)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (99, 2, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (100, 26, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (102, 2, 32)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (103, 22, 29)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (104, 4, 27)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (105, 35, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (106, 28, 5)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (107, 26, 26)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (108, 13, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (109, 28, 34)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (110, 19, 15)
GO
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (111, 23, 14)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (112, 30, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (113, 29, 14)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (114, 29, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (115, 27, 4)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (116, 21, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (117, 16, 34)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (118, 5, 15)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (119, 22, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (120, 20, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (121, 30, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (122, 37, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (123, 24, 20)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (124, 29, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (125, 24, 33)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (126, 11, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (127, 13, 34)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (128, 8, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (129, 18, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (130, 34, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (131, 4, 30)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (132, 26, 9)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (133, 21, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (134, 13, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (135, 21, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (136, 35, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (137, 26, 21)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (138, 39, 14)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (139, 13, 29)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (140, 13, 24)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (141, 34, 31)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (143, 22, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (144, 42, 9)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (145, 21, 6)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (146, 32, 9)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (147, 36, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (148, 39, 30)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (149, 11, 20)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (150, 30, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (151, 20, 27)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (152, 9, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (153, 40, 9)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (154, 7, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (155, 13, 11)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (156, 35, 10)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (157, 8, 31)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (158, 11, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (159, 34, 10)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (160, 34, 2)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (161, 34, 11)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (162, 17, 7)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (163, 24, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (164, 19, 14)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (165, 5, 7)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (166, 24, 2)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (167, 33, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (168, 21, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (169, 24, 10)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (170, 11, 5)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (171, 33, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (172, 5, 32)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (173, 35, 27)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (174, 13, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (175, 33, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (176, 33, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (177, 2, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (178, 18, 26)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (179, 33, 5)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (180, 10, 3)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (181, 21, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (182, 34, 20)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (183, 16, 27)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (184, 20, 7)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (185, 42, 33)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (186, 9, 7)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (187, 27, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (188, 37, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (189, 6, 20)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (190, 2, 15)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (191, 17, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (193, 39, 5)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (194, 13, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (195, 2, 19)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (196, 40, 8)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (197, 1, 11)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (198, 18, 24)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (199, 23, 26)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (200, 19, 11)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (201, 2, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (202, 32, 10)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (204, 29, 19)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (205, 41, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (207, 26, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (208, 11, 4)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (209, 40, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (210, 31, 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (211, 13, 11)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (212, 33, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (213, 31, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (214, 16, 18)
GO
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (215, 35, 26)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (216, 10, 19)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (217, 12, 11)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (218, 22, 23)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (219, 4, 25)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (220, 23, 13)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (221, 10, 32)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (222, 39, 24)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (223, 32, 31)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (224, 1, 27)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (225, 34, 35)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (226, 22, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (227, 17, 10)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (228, 2, 26)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (229, 23, 5)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (230, 28, 27)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (231, 26, 4)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (233, 22, 7)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (234, 1, 22)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (235, 38, 26)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (236, 29, 13)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (237, 36, 29)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (238, 7, 4)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (239, 1, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (240, 23, 18)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (241, 34, 28)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (242, 37, 31)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (243, 31, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (244, 13, 1)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (245, 11, 6)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (246, 39, 5)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (247, 22, 2)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (248, 29, 11)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (249, 38, 7)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (250, 24, 4)
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (1, N'Garcia')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (2, N'Escobedo')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (3, N'Tepito')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (4, N'Cancun')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (5, N'Colima')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (6, N'San Pedro')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (7, N'Santa Catarina')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (8, N'Morelos')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (9, N'Apodaca')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (10, N'Los Cabos')
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (1, 12, CAST(N'2019-05-30' AS Date), 3)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (2, 15, CAST(N'2019-01-25' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (3, 1, CAST(N'2019-06-19' AS Date), 1)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (4, 8, CAST(N'2019-09-30' AS Date), 9)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (5, 14, CAST(N'2019-07-17' AS Date), 6)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (6, 14, CAST(N'2019-08-16' AS Date), 3)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (7, 6, CAST(N'2019-04-12' AS Date), 35)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (8, 9, CAST(N'2019-06-19' AS Date), 27)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (9, 9, CAST(N'2019-07-11' AS Date), 25)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (10, 4, CAST(N'2019-03-11' AS Date), 25)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (11, 14, CAST(N'2019-04-16' AS Date), 9)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (12, 14, CAST(N'2019-03-10' AS Date), 11)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (13, 10, CAST(N'2019-08-08' AS Date), 20)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (14, 3, CAST(N'2019-03-13' AS Date), 7)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (15, 14, CAST(N'2019-02-07' AS Date), 30)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (16, 12, CAST(N'2019-10-11' AS Date), 14)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (17, 6, CAST(N'2019-04-10' AS Date), 29)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (18, 11, CAST(N'2019-02-03' AS Date), 28)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (19, 5, CAST(N'2019-07-17' AS Date), 17)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (20, 3, CAST(N'2019-10-12' AS Date), 20)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (21, 2, CAST(N'2019-07-07' AS Date), 35)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (22, 7, CAST(N'2019-09-09' AS Date), 11)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (23, 13, CAST(N'2019-09-20' AS Date), 30)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (24, 12, CAST(N'2019-07-19' AS Date), 17)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (25, 15, CAST(N'2019-01-09' AS Date), 19)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (26, 14, CAST(N'2019-10-16' AS Date), 1)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (27, 1, CAST(N'2019-06-01' AS Date), 33)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (28, 3, CAST(N'2019-03-14' AS Date), 2)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (29, 2, CAST(N'2019-05-03' AS Date), 12)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (30, 12, CAST(N'2019-05-18' AS Date), 7)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (31, 5, CAST(N'2019-01-12' AS Date), 30)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (32, 6, CAST(N'2019-09-28' AS Date), 31)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (33, 3, CAST(N'2019-02-20' AS Date), 9)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (34, 12, CAST(N'2019-02-18' AS Date), 15)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (35, 11, CAST(N'2019-05-20' AS Date), 8)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (36, 9, CAST(N'2019-06-29' AS Date), 13)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (37, 12, CAST(N'2019-06-02' AS Date), 31)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (38, 7, CAST(N'2019-08-09' AS Date), 20)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (39, 6, CAST(N'2019-08-26' AS Date), 31)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (40, 14, CAST(N'2019-08-09' AS Date), 35)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (41, 2, CAST(N'2019-10-20' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (42, 2, CAST(N'2019-06-12' AS Date), 27)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (43, 2, CAST(N'2019-06-09' AS Date), 7)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (44, 12, CAST(N'2019-07-18' AS Date), 16)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (45, 7, CAST(N'2019-06-28' AS Date), 13)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (46, 15, CAST(N'2019-09-28' AS Date), 5)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (47, 1, CAST(N'2019-09-02' AS Date), 34)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (48, 2, CAST(N'2019-06-24' AS Date), 29)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (49, 2, CAST(N'2019-04-27' AS Date), 5)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (50, 11, CAST(N'2019-03-23' AS Date), 22)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (51, 9, CAST(N'2019-01-04' AS Date), 33)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (52, 12, CAST(N'2019-07-04' AS Date), 30)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (53, 15, CAST(N'2019-10-08' AS Date), 3)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (54, 15, CAST(N'2019-03-06' AS Date), 8)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (55, 3, CAST(N'2019-10-08' AS Date), 21)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (56, 2, CAST(N'2019-04-13' AS Date), 14)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (57, 1, CAST(N'2019-09-09' AS Date), 9)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (58, 8, CAST(N'2019-04-27' AS Date), 20)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (59, 5, CAST(N'2019-04-25' AS Date), 26)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (60, 12, CAST(N'2019-01-24' AS Date), 23)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (61, 10, CAST(N'2019-05-27' AS Date), 12)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (62, 14, CAST(N'2019-06-14' AS Date), 19)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (63, 2, CAST(N'2019-03-04' AS Date), 32)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (64, 5, CAST(N'2019-01-08' AS Date), 19)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (65, 12, CAST(N'2019-08-15' AS Date), 32)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (66, 5, CAST(N'2019-09-09' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (67, 3, CAST(N'2019-05-31' AS Date), 25)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (68, 4, CAST(N'2019-02-21' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (69, 8, CAST(N'2019-02-05' AS Date), 27)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (70, 6, CAST(N'2019-05-10' AS Date), 15)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (71, 14, CAST(N'2019-07-26' AS Date), 5)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (72, 1, CAST(N'2019-03-31' AS Date), 6)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (73, 11, CAST(N'2019-07-26' AS Date), 9)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (74, 13, CAST(N'2019-02-02' AS Date), 25)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (75, 11, CAST(N'2019-03-29' AS Date), 6)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (76, 9, CAST(N'2019-08-21' AS Date), 8)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (77, 3, CAST(N'2019-05-18' AS Date), 26)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (78, 14, CAST(N'2019-06-01' AS Date), 33)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (79, 1, CAST(N'2019-02-24' AS Date), 6)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (80, 9, CAST(N'2019-08-11' AS Date), 16)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (81, 12, CAST(N'2019-02-07' AS Date), 8)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (82, 11, CAST(N'2019-10-19' AS Date), 17)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (83, 15, CAST(N'2019-02-08' AS Date), 13)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (84, 13, CAST(N'2019-03-24' AS Date), 29)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (85, 2, CAST(N'2019-05-10' AS Date), 34)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (86, 3, CAST(N'2019-03-03' AS Date), 8)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (87, 7, CAST(N'2019-01-29' AS Date), 2)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (88, 2, CAST(N'2019-06-15' AS Date), 33)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (89, 6, CAST(N'2019-03-19' AS Date), 15)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (90, 6, CAST(N'2019-02-15' AS Date), 12)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (91, 14, CAST(N'2019-09-20' AS Date), 9)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (92, 2, CAST(N'2019-04-02' AS Date), 17)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (93, 14, CAST(N'2019-03-24' AS Date), 20)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (94, 5, CAST(N'2019-02-23' AS Date), 32)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (95, 9, CAST(N'2019-03-13' AS Date), 23)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (96, 8, CAST(N'2019-09-22' AS Date), 24)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (97, 15, CAST(N'2019-09-05' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (98, 7, CAST(N'2019-07-09' AS Date), 22)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (99, 1, CAST(N'2019-09-30' AS Date), 21)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (100, 8, CAST(N'2019-05-19' AS Date), 25)
GO
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (101, 7, CAST(N'2019-09-27' AS Date), 32)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (102, 11, CAST(N'2019-04-27' AS Date), 35)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (103, 11, CAST(N'2019-07-24' AS Date), 16)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (104, 9, CAST(N'2019-07-27' AS Date), 24)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (105, 14, CAST(N'2019-09-25' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (106, 9, CAST(N'2019-08-28' AS Date), 14)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (107, 10, CAST(N'2019-03-03' AS Date), 30)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (108, 10, CAST(N'2019-06-26' AS Date), 26)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (109, 1, CAST(N'2019-02-17' AS Date), 26)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (110, 12, CAST(N'2019-10-11' AS Date), 34)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (111, 11, CAST(N'2019-09-20' AS Date), 27)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (112, 15, CAST(N'2019-02-24' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (113, 4, CAST(N'2019-10-01' AS Date), 16)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (114, 1, CAST(N'2019-09-04' AS Date), 26)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (115, 8, CAST(N'2019-02-24' AS Date), 30)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (116, 14, CAST(N'2019-05-10' AS Date), 19)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (117, 10, CAST(N'2019-07-29' AS Date), 27)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (118, 3, CAST(N'2019-03-29' AS Date), 13)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (119, 2, CAST(N'2019-10-17' AS Date), 13)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (120, 1, CAST(N'2019-05-26' AS Date), 24)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (121, 2, CAST(N'2019-05-27' AS Date), 19)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (122, 12, CAST(N'2019-03-18' AS Date), 11)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (123, 13, CAST(N'2019-07-02' AS Date), 2)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (124, 1, CAST(N'2019-05-29' AS Date), 17)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (125, 9, CAST(N'2019-01-07' AS Date), 7)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (126, 6, CAST(N'2019-07-16' AS Date), 30)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (127, 9, CAST(N'2019-01-26' AS Date), 11)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (128, 11, CAST(N'2019-09-22' AS Date), 8)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (129, 11, CAST(N'2019-09-01' AS Date), 2)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (130, 10, CAST(N'2019-10-04' AS Date), 25)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (131, 6, CAST(N'2019-04-05' AS Date), 19)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (132, 2, CAST(N'2019-03-06' AS Date), 16)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (133, 7, CAST(N'2019-09-11' AS Date), 26)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (134, 9, CAST(N'2019-03-19' AS Date), 25)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (135, 9, CAST(N'2019-01-16' AS Date), 10)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (136, 14, CAST(N'2019-04-02' AS Date), 32)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (137, 13, CAST(N'2019-01-02' AS Date), 33)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (138, 14, CAST(N'2019-05-31' AS Date), 18)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (139, 12, CAST(N'2019-07-06' AS Date), 22)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (140, 7, CAST(N'2019-07-30' AS Date), 17)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (141, 1, CAST(N'2019-06-18' AS Date), 14)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (142, 4, CAST(N'2019-09-17' AS Date), 19)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (143, 6, CAST(N'2019-10-20' AS Date), 5)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (144, 5, CAST(N'2019-03-15' AS Date), 18)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (145, 1, CAST(N'2019-05-12' AS Date), 16)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (146, 4, CAST(N'2019-03-10' AS Date), 24)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (147, 6, CAST(N'2019-10-16' AS Date), 29)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (148, 2, CAST(N'2019-01-21' AS Date), 32)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (149, 6, CAST(N'2019-05-07' AS Date), 26)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (150, 5, CAST(N'2019-06-13' AS Date), 20)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (42, 2)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (12, 8)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (26, 12)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (34, 9)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (20, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (7, 4)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (32, 10)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (27, 5)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (2, 9)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (39, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (38, 4)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (4, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (11, 10)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (40, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (6, 2)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (41, 3)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (19, 5)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (37, 10)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (28, 8)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (9, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (22, 10)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (23, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (5, 7)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (31, 4)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (18, 4)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (35, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (24, 7)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (21, 8)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (30, 4)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (17, 5)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (1, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (29, 9)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (36, 4)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (13, 10)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (16, 3)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (8, 2)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (42, 2)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (33, 6)
INSERT [dbo].[VisitasCliente] ([iIdCliente], [iNumVisitas]) VALUES (10, 3)
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesaC] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_iIdMesaC]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_iIdRestaurante] FOREIGN KEY([iIdRestaurante])
REFERENCES [dbo].[Restaurante] ([iIdRestaurante])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_iIdRestaurante]
GO
ALTER TABLE [dbo].[Mesero]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesaM] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
ALTER TABLE [dbo].[Mesero] CHECK CONSTRAINT [FK_iIdMesaM]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_iIdCliente] FOREIGN KEY([iIdCliente])
REFERENCES [dbo].[Cliente] ([iIdCliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_iIdCliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_iIdProducto] FOREIGN KEY([iIdProducto])
REFERENCES [dbo].[Menu] ([iIdProducto])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_iIdProducto]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_iIdMenu] FOREIGN KEY([iIdMenu])
REFERENCES [dbo].[Menu] ([iIdProducto])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_iIdMenu]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesa] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_iIdMesa]
GO
ALTER TABLE [dbo].[VisitasCliente]  WITH CHECK ADD FOREIGN KEY([iIdCliente])
REFERENCES [dbo].[Cliente] ([iIdCliente])
GO
/****** Object:  StoredProcedure [dbo].[ProCliente]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[ProCliente](
@iIdCliente int,@iIdMesa int, @vNombreC varchar (30),@vApellidoP varchar(30),@vApellidoM varchar(30))
as
begin
INSERT INTO Cliente(iIdCliente,iIdMesa,vNombreC,vApellidoP,vApellidoM)
values (@iIdCliente,@iIdMesa,@vNombreC,@vApellidoP,@vApellidoM)
END
GO
/****** Object:  StoredProcedure [dbo].[ProMenu]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure
[dbo].[ProMenu](
@iIdPro int, @vNomPl varchar(50), @vDesc varchar(200),@iPre int)
AS BEGIN
INSERT INTO Menu(iIdProducto,vNombrePlatillo,vDescripcion,iPrecio)
values (@iIdPro,@vNomPl, @vDesc, @iPre)
END
GO
/****** Object:  StoredProcedure [dbo].[ProMesa]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[ProMesa](
@iIdMesa int, @iIdRes int, @iNumP int)
AS BEGIN
INSERT INTO Mesa(iIdMesa,iIdRestaurante,iNumPer)
VALUES (@iIdMesa, @iIdRes, @iNumP)
END
GO
/****** Object:  StoredProcedure [dbo].[ProMesero]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure 
[dbo].[ProMesero](
@iIdM int, @vNomM varchar(30), @vApP varchar(30), @vApM varchar (30), @iIdMesa int)
AS BEGIN
INSERT INTO Mesero(iIdMesero,vNombreM,vApellidoPM,vApellidoMM,iIdMesa)
VALUES (@iIdM, @vNomM, @vApP, @vApM, @iIdMesa)
END
GO
/****** Object:  StoredProcedure [dbo].[ProTicket]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[ProTicket]( 
@iIdT int, @iIdMesa int, @Fecha date, @iIdMenu int)
AS BEGIN
INSERT INTO Ticket(iIdTicket, iIdMesa, Fecha, iIdMenu)
VALUES (@iIdT, @iIdMesa, @Fecha, @iIdMenu)
END
GO
/****** Object:  Trigger [dbo].[TR_ClienteF]    Script Date: 02/11/2019 03:54:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[TR_ClienteF] on [dbo].[Pedido] after INSERT
as 
declare @iIdCl int
select @iIdCl = iIdCLiente from Pedido

declare @VisitasCliente int
select @VisitasCliente = COUNT(iIdCliente) from Pedido where iIdCliente = @iIdCl;
if @VisitasCliente = 1
	insert into VisitasCliente (iIdCliente,iNumVisitas) values (@iIdCl, 1)
else
	update VisitasCliente set iNumVisitas =@VisitasCliente where iIdCliente = @iIdCl
GO
ALTER TABLE [dbo].[Pedido] ENABLE TRIGGER [TR_ClienteF]
GO
USE [master]
GO
ALTER DATABASE [RestauranteJMG] SET  READ_WRITE 
GO
