USE [master]
GO
/****** Object:  Database [TiendaA]    Script Date: 29/1/2022 23:14:35 ******/
CREATE DATABASE [TiendaA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TiendaA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TiendaA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TiendaA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaA] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TiendaA] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TiendaA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TiendaA] SET QUERY_STORE = OFF
GO
USE [TiendaA]
GO
/****** Object:  Table [dbo].[Repuesto]    Script Date: 29/1/2022 23:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuesto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[marca_carro] [varchar](50) NOT NULL,
	[modelo_carro] [varchar](50) NOT NULL,
	[año_carro] [char](4) NOT NULL,
	[nombre_repuesto] [varchar](100) NOT NULL,
	[marca_repuesto] [varchar](50) NOT NULL,
	[precio_repuesto] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Repuesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Repuesto] ON 

INSERT [dbo].[Repuesto] ([id], [marca_carro], [modelo_carro], [año_carro], [nombre_repuesto], [marca_repuesto], [precio_repuesto]) VALUES (2, N'Honda', N'Civic', N'2020', N'Bujías', N'CHAMPION', CAST(11.57 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [marca_carro], [modelo_carro], [año_carro], [nombre_repuesto], [marca_repuesto], [precio_repuesto]) VALUES (3, N'Toyota', N'Corolla', N'2018', N'Bujías', N'NGK', CAST(12.43 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [marca_carro], [modelo_carro], [año_carro], [nombre_repuesto], [marca_repuesto], [precio_repuesto]) VALUES (4, N'Mazda', N'3', N'2012', N'Amortiguadores', N'Fox', CAST(56.85 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [marca_carro], [modelo_carro], [año_carro], [nombre_repuesto], [marca_repuesto], [precio_repuesto]) VALUES (5, N'Toyota', N'Corolla', N'2018', N'Limpiaparabrisas', N'Bosch', CAST(18.20 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [marca_carro], [modelo_carro], [año_carro], [nombre_repuesto], [marca_repuesto], [precio_repuesto]) VALUES (6, N'Honda', N'Civic', N'2020', N'Bujías', N'NGK', CAST(12.43 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Repuesto] OFF
GO
/****** Object:  StoredProcedure [dbo].[SolicitarDisponibilidad]    Script Date: 29/1/2022 23:14:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================
-- Descripción: Proceso para solicitar disponibilidad 
--	de respuestos según parámetros.
-- ===================================================
CREATE PROCEDURE [dbo].[SolicitarDisponibilidad] 
	@marca_carro varchar(50), 
	@modelo_carro varchar(50),
	@año_carro char(4),
	@nombre_repuesto varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM Repuesto Where marca_carro = @marca_carro
		AND modelo_carro = @modelo_carro
		AND año_carro = @año_carro
		AND nombre_repuesto = @nombre_repuesto
	ORDER BY precio_repuesto
END
GO
USE [master]
GO
ALTER DATABASE [TiendaA] SET  READ_WRITE 
GO
