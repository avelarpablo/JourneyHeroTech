USE [master]
GO
/****** Object:  Database [Central]    Script Date: 29/1/2022 23:14:06 ******/
CREATE DATABASE [Central]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Central', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Central.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Central_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Central_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Central] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Central].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Central] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Central] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Central] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Central] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Central] SET ARITHABORT OFF 
GO
ALTER DATABASE [Central] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Central] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Central] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Central] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Central] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Central] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Central] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Central] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Central] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Central] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Central] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Central] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Central] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Central] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Central] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Central] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Central] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Central] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Central] SET  MULTI_USER 
GO
ALTER DATABASE [Central] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Central] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Central] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Central] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Central] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Central] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Central] SET QUERY_STORE = OFF
GO
USE [Central]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 29/1/2022 23:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[telefono] [varchar](8) NOT NULL,
	[rating] [decimal](18, 1) NOT NULL,
	[longitud] [decimal](18, 15) NOT NULL,
	[latitud] [decimal](18, 15) NOT NULL,
 CONSTRAINT [PK_Tienda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tienda] ON 

INSERT [dbo].[Tienda] ([id], [nombre], [direccion], [telefono], [rating], [longitud], [latitud]) VALUES (1, N'Tienda A', N'Final 25 calle poniente y 18 avenida sur, Santa Ana', N'24046000', CAST(4.3 AS Decimal(18, 1)), CAST(-89.567454057676930 AS Decimal(18, 15)), CAST(13.984418370280416 AS Decimal(18, 15)))
INSERT [dbo].[Tienda] ([id], [nombre], [direccion], [telefono], [rating], [longitud], [latitud]) VALUES (2, N'Tienda B', N'C. San Antonio Abad #3405, San Salvador', N'25005600', CAST(4.4 AS Decimal(18, 1)), CAST(-89.223410050722820 AS Decimal(18, 15)), CAST(13.718159399060326 AS Decimal(18, 15)))
INSERT [dbo].[Tienda] ([id], [nombre], [direccion], [telefono], [rating], [longitud], [latitud]) VALUES (3, N'Tienda C', N'8° calle poniente y, 5A Avenida Norte Bis 502, San Miguel', N'26232623', CAST(4.1 AS Decimal(18, 1)), CAST(-88.175342984655390 AS Decimal(18, 15)), CAST(13.487219765912258 AS Decimal(18, 15)))
SET IDENTITY_INSERT [dbo].[Tienda] OFF
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTiendasPorCercania]    Script Date: 29/1/2022 23:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerTiendasPorCercania]
	-- Add the parameters for the stored procedure here
	@latitud_cliente decimal(18, 15),
	@longitud_cliente decimal(18, 15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @punto_inicial geography = geography::Point(@latitud_cliente, @longitud_cliente, 4326);

    -- Insert statements for procedure here
	SELECT nombre, direccion, telefono, rating
	FROM Tienda
	WHERE geography::Point([latitud], [longitud], 4326).STDistance(@punto_inicial) IS NOT NULL  
	ORDER BY geography::Point([latitud], [longitud], 4326).STDistance(@punto_inicial);  
END
GO
USE [master]
GO
ALTER DATABASE [Central] SET  READ_WRITE 
GO
