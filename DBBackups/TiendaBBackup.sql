USE [master]
GO
/****** Object:  Database [TiendaB]    Script Date: 29/1/2022 22:20:10 ******/
CREATE DATABASE [TiendaB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TiendaB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TiendaB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TiendaB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TiendaB] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TiendaB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TiendaB] SET QUERY_STORE = OFF
GO
USE [TiendaB]
GO
/****** Object:  Table [dbo].[Carro]    Script Date: 29/1/2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_modelo] [int] NOT NULL,
	[año] [char](4) NOT NULL,
 CONSTRAINT [PK_Carro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 29/1/2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 29/1/2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repuesto]    Script Date: 29/1/2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuesto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_carro] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Repuesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carro] ON 

INSERT [dbo].[Carro] ([id], [id_modelo], [año]) VALUES (1, 1, N'2020')
INSERT [dbo].[Carro] ([id], [id_modelo], [año]) VALUES (2, 2, N'2018')
INSERT [dbo].[Carro] ([id], [id_modelo], [año]) VALUES (3, 3, N'2012')
SET IDENTITY_INSERT [dbo].[Carro] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([id], [nombre]) VALUES (1, N'Honda')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (2, N'Toyota')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (3, N'Mazda')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (4, N'CHAMPION')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (5, N'NGK')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (6, N'Fox')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (7, N'Bosch')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Modelo] ON 

INSERT [dbo].[Modelo] ([id], [id_marca], [nombre]) VALUES (1, 1, N'Civic')
INSERT [dbo].[Modelo] ([id], [id_marca], [nombre]) VALUES (2, 2, N'Corolla')
INSERT [dbo].[Modelo] ([id], [id_marca], [nombre]) VALUES (3, 3, N'3')
SET IDENTITY_INSERT [dbo].[Modelo] OFF
GO
SET IDENTITY_INSERT [dbo].[Repuesto] ON 

INSERT [dbo].[Repuesto] ([id], [id_marca], [id_carro], [nombre], [precio]) VALUES (1, 4, 1, N'Bujías', CAST(10.35 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [id_marca], [id_carro], [nombre], [precio]) VALUES (2, 5, 2, N'Bujías', CAST(7.65 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [id_marca], [id_carro], [nombre], [precio]) VALUES (3, 6, 2, N'Amortiguadores', CAST(60.89 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [id_marca], [id_carro], [nombre], [precio]) VALUES (4, 7, 3, N'Limpiaparabrisas', CAST(11.75 AS Decimal(18, 2)))
INSERT [dbo].[Repuesto] ([id], [id_marca], [id_carro], [nombre], [precio]) VALUES (5, 5, 1, N'Bujías', CAST(7.65 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Repuesto] OFF
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[Modelo] ([id])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Modelo]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Modelo_Marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [FK_Modelo_Marca]
GO
ALTER TABLE [dbo].[Repuesto]  WITH CHECK ADD  CONSTRAINT [FK_Repuesto_Carro] FOREIGN KEY([id_carro])
REFERENCES [dbo].[Carro] ([id])
GO
ALTER TABLE [dbo].[Repuesto] CHECK CONSTRAINT [FK_Repuesto_Carro]
GO
ALTER TABLE [dbo].[Repuesto]  WITH CHECK ADD  CONSTRAINT [FK_Repuesto_Marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id])
GO
ALTER TABLE [dbo].[Repuesto] CHECK CONSTRAINT [FK_Repuesto_Marca]
GO
/****** Object:  StoredProcedure [dbo].[SolicitarDisponibilidad]    Script Date: 29/1/2022 22:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SolicitarDisponibilidad] 
	-- Add the parameters for the stored procedure here
	@marca_carro varchar(50), 
	@modelo_carro varchar(50),
	@año_carro char(4),
	@nombre_repuesto varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select repuesto.id, carro.marca_carro, carro.modelo_carro, carro.año_carro, repuesto.nombre as nombre_repuesto,
		marca.nombre as marca_repuesto, repuesto.precio as precio_repuesto
	from Repuesto as repuesto
		inner join Marca as marca
		on repuesto.id_marca = marca.id
		inner join (
			select carro.id as id, marca.nombre as marca_carro, modelo.nombre as modelo_carro, carro.año as año_carro
			from Carro as carro
			inner join Modelo as modelo
			on carro.id_modelo = modelo.id
			inner join Marca as marca
			on modelo.id_marca = marca.id
		) as carro
		on repuesto.id_carro = carro.id
	where marca_carro = @marca_carro
		AND modelo_carro = @modelo_carro
		AND año_carro = @año_carro
		AND repuesto.nombre = @nombre_repuesto
	order by repuesto.precio;
END
GO
USE [master]
GO
ALTER DATABASE [TiendaB] SET  READ_WRITE 
GO
