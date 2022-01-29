USE [master]
GO
/****** Object:  Database [TiendaC]    Script Date: 29/1/2022 13:53:28 ******/
CREATE DATABASE [TiendaC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TiendaB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TiendaB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TiendaC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TiendaC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaC] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TiendaC] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TiendaC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TiendaC] SET QUERY_STORE = OFF
GO
USE [TiendaC]
GO
/****** Object:  Table [dbo].[Carro]    Script Date: 29/1/2022 13:53:28 ******/
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
/****** Object:  Table [dbo].[Marca]    Script Date: 29/1/2022 13:53:28 ******/
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
/****** Object:  Table [dbo].[Modelo]    Script Date: 29/1/2022 13:53:28 ******/
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
/****** Object:  Table [dbo].[Repuesto]    Script Date: 29/1/2022 13:53:28 ******/
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
/****** Object:  StoredProcedure [dbo].[SolicitarDisponibilidad]    Script Date: 29/1/2022 13:53:28 ******/
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
ALTER DATABASE [TiendaC] SET  READ_WRITE 
GO
