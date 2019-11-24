/*  CREATE DATABASE  */
USE [MASTER]
-- TODO : use environmental variables from mssql.env for '/opt/itera/mssql/data' instead of hardcode
CREATE DATABASE [$(DB_NAME)]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'$(DB_NAME)', FILENAME = N'/opt/itera/mssql/data/$(DB_NAME).mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'$(DB_NAME)_log', FILENAME = N'/opt/itera/mssql/data/$(DB_NAME)_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [$(DB_NAME)] SET COMPATIBILITY_LEVEL = 140
GO
ALTER DATABASE [$(DB_NAME)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET ARITHABORT OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [$(DB_NAME)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [$(DB_NAME)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [$(DB_NAME)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET  DISABLE_BROKER 
GO
ALTER DATABASE [$(DB_NAME)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [$(DB_NAME)] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [$(DB_NAME)] SET  READ_WRITE 
GO
ALTER DATABASE [$(DB_NAME)] SET RECOVERY FULL 
GO
ALTER DATABASE [$(DB_NAME)] SET  MULTI_USER 
GO
ALTER DATABASE [$(DB_NAME)] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [$(DB_NAME)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [$(DB_NAME)] SET DELAYED_DURABILITY = DISABLED 
GO
USE [$(DB_NAME)]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [$(DB_NAME)]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [$(DB_NAME)] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
-- ############################### ---

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PokemonTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PokemonTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relationships](
	[TypeA] [int] NOT NULL,
	[TypeB] [int] NOT NULL,
	[Multiplier] [float] NOT NULL,
 CONSTRAINT [PK_Relationships] PRIMARY KEY CLUSTERED 
(
	[TypeA] ASC,
	[TypeB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Relationships]  WITH CHECK ADD  CONSTRAINT [FK_Relationships_PokemonTypes] FOREIGN KEY([TypeA])
REFERENCES [dbo].[PokemonTypes] ([Id])
GO
ALTER TABLE [dbo].[Relationships] CHECK CONSTRAINT [FK_Relationships_PokemonTypes]
GO
ALTER TABLE [dbo].[Relationships]  WITH CHECK ADD  CONSTRAINT [FK_Relationships_PokemonTypes1] FOREIGN KEY([TypeB])
REFERENCES [dbo].[PokemonTypes] ([Id])
GO
ALTER TABLE [dbo].[Relationships] CHECK CONSTRAINT [FK_Relationships_PokemonTypes1]
GO


-- INSERTS
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Normal','#b2956b') -- 1
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Fighting','#fc6668') -- 2
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Flying','#818cc8') -- 3
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Poison','#b964a0') -- 4
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Ground','#e5b36a') -- 5
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Rock','#aaa063') -- 6
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Bug','#96ac3d') -- 7
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Ghost','#826e98') -- 8
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Steel','#8cb4be') -- 9
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Fire','#ff7654') -- 10
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Water','#4fc8d9') -- 11
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Grass','#77c95b') -- 12
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Electric','#ffc60f') -- 13
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Psychic','#ff6189') -- 14
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Ice','#6dddd1') -- 15
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Dragon','#5665aa') -- 16
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Dark','#5a504f') -- 17
INSERT INTO [dbo].PokemonTypes (Name, Color) Values('Fairy','#ff77ab') -- 18

INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 6, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 8, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(1, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 1, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 3, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 4, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 6, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 7, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 8, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 9, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 14, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 15, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 17, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(2, 18, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 2, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 6, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 7, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 12, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 13, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(3, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 4, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 5, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 6, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 8, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 9, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 12, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(4, 18, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 3, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 4, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 6, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 7, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 9, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 10, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 12, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 13, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(5, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 2, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 3, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 5, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 7, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 10, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 15, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(6, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 2, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 3, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 4, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 8, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 10, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 12, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 14, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 17, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(7, 18, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 1, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 8, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 9, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 14, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 17, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(8, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 6, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 10, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 11, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 13, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 15, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(9, 18, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 6, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 7, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 9, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 10, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 11, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 12, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 15, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 16, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(10, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 5, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 6, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 9, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 10, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 11, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 12, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 16, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(11, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 3, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 4, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 5, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 6, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 7, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 10, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 11, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 12, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 16, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(12, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 3, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 5, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 9, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 11, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 12, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 13, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 16, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(13, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 2, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 4, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 14, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 17, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(14, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 3, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 5, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 10, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 11, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 12, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 15, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 16, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(15, 18, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 2, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 16, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 17, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(16, 18, 0.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 2, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 4, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 8, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 9, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 10, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 14, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 16, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 17, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(17, 18, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 1, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 2, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 3, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 4, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 5, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 6, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 7, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 8, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 9, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 10, 0.5)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 11, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 12, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 13, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 14, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 15, 1.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 16, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 17, 2.0)
INSERT INTO [dbo].Relationships(TypeA, TypeB, Multiplier) VALUES(18, 18, 1.0)
