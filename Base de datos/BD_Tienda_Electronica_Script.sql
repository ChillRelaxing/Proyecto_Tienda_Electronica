USE [master]
GO
/****** Object:  Database [DB_Tienda_Electronica]    Script Date: 02/06/2024 22:43:35 ******/
CREATE DATABASE [DB_Tienda_Electronica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Tienda_Electronica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\DB_Tienda_Electronica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Tienda_Electronica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\DB_Tienda_Electronica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_Tienda_Electronica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Tienda_Electronica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Tienda_Electronica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Tienda_Electronica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Tienda_Electronica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Tienda_Electronica', N'ON'
GO
ALTER DATABASE [DB_Tienda_Electronica] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_Tienda_Electronica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_Tienda_Electronica]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02/06/2024 22:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[ID_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [nvarchar](50) NOT NULL,
	[Descripcion_Categoria] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [nvarchar](100) NOT NULL,
	[Direccion_Cliente] [nvarchar](255) NOT NULL,
	[Telefono_Cliente] [nvarchar](20) NOT NULL,
	[Email_Cliente] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[ID_DetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[SubTotal] [decimal](10, 2) NOT NULL,
	[PrecioUnitario] [money] NOT NULL,
	[ID_Venta] [int] NOT NULL,
	[ID_Producto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID_Inventario] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[ID_Producto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] [nvarchar](100) NOT NULL,
	[Descripcion_Producto] [nvarchar](255) NOT NULL,
	[PrecioUnitario] [money] NOT NULL,
	[ID_Categoria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[ID_Venta] [int] IDENTITY(1,1) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[Total_Venta] [decimal](10, 2) NOT NULL,
	[Descripcion_Venta] [nvarchar](255) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'8.0.5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1c103609-4f0c-49d9-a900-8585efd602a0', N'Usuario_123@gmail.com', N'USUARIO_123@GMAIL.COM', N'Usuario_123@gmail.com', N'USUARIO_123@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAELd32cE1n9cRvZL7C8qF5/PHpcn4t9F5KFz6xcZGzQdieLsHtyiR9bJc0uOa8gc8WA==', N'4KNPRGWN5SAVWCV6X6Q5OPTL7KWRJMYZ', N'7d1cd348-cf8b-48ee-ad31-d5fc1868e4d9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'43d67dfe-c64c-4708-b319-0bbc8888986d', N'Admin123@gmail.com', N'ADMIN123@GMAIL.COM', N'Admin123@gmail.com', N'ADMIN123@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFjbh+TgHOMrd0RJexhcQv4I3tmAPAUGgB0vvHCVYvUtA76usgKJDjMtFwc/yV4p+w==', N'3KMLIEOUHZ4C2X2TI4ZS6GJ2YK2QFKTY', N'7c58c54b-a8e9-4dd6-b691-a13d56ca135a', N'435345345', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8b4155eb-0e08-4f86-9541-8aadef674bc7', N'Usuario123@gmail.com', N'USUARIO123@GMAIL.COM', N'Usuario123@gmail.com', N'USUARIO123@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAELF3HR2+TrQRVwMFN5BvjQIRLHyaEbON6nZdymq/0oEcvbmrwdisLsVzaxew0WYPCg==', N'TZS4B5BOCB2EGU2WLPHBVKX7NOJJ5AZ2', N'b71cb6b9-43a4-4b64-aa05-7c75d0d51b7f', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'43d67dfe-c64c-4708-b319-0bbc8888986d', N'[AspNetUserStore]', N'AuthenticatorKey', N'HT4FI2Q5HXY667DYQ52E4H6HB4JOGPZH')
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([ID_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (1, N'Electrónica', N'Productos electrónicos como televisores, radios, etc.')
INSERT [dbo].[Categoria] ([ID_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (2, N'Ropa', N'Ropa y accesorios')
INSERT [dbo].[Categoria] ([ID_Categoria], [Nombre_Categoria], [Descripcion_Categoria]) VALUES (3, N'Alimentos', N'Productos alimenticios')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (1, N'Cliente Actualizado', N'Direccion Actualizada', N'0987654321', N'clienteactualizado@example.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (2, N'María López', N'Avenida Siempre Viva 456', N'987654321', N'maria.lopez@example.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (3, N'Carlos Sánchez', N'Boulevard de los Sueños 789', N'456123789', N'carlos.sanchez@example.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (17, N'Luis', N'solo camino', N'3543543', N'Luis@gmail.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (18, N'lolo', N'gmail', N'332543', N'lolo@gmail.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (19, N'rrrr', N'rrrr', N'65645777', N'ttttt')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (20, N'rrrr', N'rrrr', N'65645777', N'ttttt')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (21, N'rrrr', N'rrrr', N'65645777', N'ttttt')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (22, N'rrrr', N'rrrr', N'65645777', N'ttttt')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (23, N'rrrr', N'rrrr', N'65645777', N'ttttt')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (24, N'rrrr', N'rrrr', N'65645777', N'ttttt')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (25, N'rrrr', N'rrrr', N'65645777', N'ttttt')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (30, N'Cliente1', N'Direccion1', N'1234567890', N'cliente1@example.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (31, N'rene', N'salida cabal', N'3455766756', N'rene@gmail.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (39, N'leoleo', N'leoleo', N'5453534', N'leoleo@gmail.com')
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre_Cliente], [Direccion_Cliente], [Telefono_Cliente], [Email_Cliente]) VALUES (40, N'salguero', N'salida cal', N'98354678', N'salguero@gmail.com')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (1, 3, CAST(500.00 AS Decimal(10, 2)), 100.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (3, 5, CAST(7.50 AS Decimal(10, 2)), 1.5000, 2, 6)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (4, 25, CAST(56.25 AS Decimal(10, 2)), 100.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (5, 45, CAST(567.00 AS Decimal(10, 2)), 67.0000, 2, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (6, 55, CAST(55.00 AS Decimal(10, 2)), 555.0000, 1, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (7, 3, CAST(90.00 AS Decimal(10, 2)), 30.0000, 1, 4)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (8, 3, CAST(9.00 AS Decimal(10, 2)), 3.0000, 1, 5)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (9, 25, CAST(56.25 AS Decimal(10, 2)), 100.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (10, 5, CAST(25000.00 AS Decimal(10, 2)), 50.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (11, 2, CAST(4000.00 AS Decimal(10, 2)), 20.0000, 2, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (12, 2, CAST(4000.00 AS Decimal(10, 2)), 20.0000, 2, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (13, 2, CAST(10000.00 AS Decimal(10, 2)), 50.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (14, 2, CAST(10000.00 AS Decimal(10, 2)), 50.0000, 1, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (15, 3, CAST(15000.00 AS Decimal(10, 2)), 50.0000, 1, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (16, 2, CAST(6000.00 AS Decimal(10, 2)), 30.0000, 2, 4)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (17, 2, CAST(200.00 AS Decimal(10, 2)), 1.0000, 2, 8)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (18, 3, CAST(22500.00 AS Decimal(10, 2)), 75.0000, 2, 1)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (19, 4, CAST(20000.00 AS Decimal(10, 2)), 50.0000, 1, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (20, 4, CAST(8000.00 AS Decimal(10, 2)), 20.0000, 9, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (21, 5, CAST(25000.00 AS Decimal(10, 2)), 50.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (22, 2, CAST(10000.00 AS Decimal(10, 2)), 50.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (23, 2, CAST(10000.00 AS Decimal(10, 2)), 50.0000, 1, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (24, 3, CAST(6000.00 AS Decimal(10, 2)), 20.0000, 13, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (25, 1, CAST(5000.00 AS Decimal(10, 2)), 50.0000, 13, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (26, 3, CAST(15000.00 AS Decimal(10, 2)), 50.0000, 16, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (27, 4, CAST(12000.00 AS Decimal(10, 2)), 30.0000, 16, 4)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (28, 3, CAST(15000.00 AS Decimal(10, 2)), 50.0000, 16, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (29, 4, CAST(20000.00 AS Decimal(10, 2)), 50.0000, 16, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (30, 11, CAST(0.00 AS Decimal(10, 2)), 0.0000, 2, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (31, 2, CAST(6000.00 AS Decimal(10, 2)), 30.0000, 21, 4)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (32, 4, CAST(1200.00 AS Decimal(10, 2)), 3.0000, 21, 5)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (33, 2, CAST(10000.00 AS Decimal(10, 2)), 50.0000, 17, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (34, 2, CAST(4000.00 AS Decimal(10, 2)), 20.0000, 17, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (35, 1, CAST(2000.00 AS Decimal(10, 2)), 20.0000, 16, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (36, 1, CAST(2000.00 AS Decimal(10, 2)), 20.0000, 18, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (37, 2, CAST(1000.00 AS Decimal(10, 2)), 5.0000, 21, 14)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (38, 2, CAST(10000.00 AS Decimal(10, 2)), 50.0000, 13, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (39, 1, CAST(2000.00 AS Decimal(10, 2)), 20.0000, 17, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (40, 2, CAST(4000.00 AS Decimal(10, 2)), 20.0000, 17, 3)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (41, 2, CAST(0.00 AS Decimal(10, 2)), 0.0000, 21, 2)
INSERT [dbo].[DetalleVenta] ([ID_DetalleVenta], [Cantidad], [SubTotal], [PrecioUnitario], [ID_Venta], [ID_Producto]) VALUES (42, 2, CAST(0.00 AS Decimal(10, 2)), 0.0000, 16, 3)
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad], [FechaRegistro], [ID_Producto]) VALUES (1, 150, CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad], [FechaRegistro], [ID_Producto]) VALUES (2, 100, CAST(N'2024-05-22T22:21:40.683' AS DateTime), 2)
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad], [FechaRegistro], [ID_Producto]) VALUES (3, 200, CAST(N'2024-05-22T22:21:40.683' AS DateTime), 3)
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad], [FechaRegistro], [ID_Producto]) VALUES (4, 150, CAST(N'2024-05-22T22:21:40.683' AS DateTime), 4)
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad], [FechaRegistro], [ID_Producto]) VALUES (5, 500, CAST(N'2024-05-22T22:21:40.683' AS DateTime), 5)
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad], [FechaRegistro], [ID_Producto]) VALUES (6, 300, CAST(N'2024-05-22T22:21:40.683' AS DateTime), 6)
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad], [FechaRegistro], [ID_Producto]) VALUES (10, 23, CAST(N'2024-05-09T23:24:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (1, N'Producto Actualizado', N'Descripción Actualizada', 75.0000, 2)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (2, N'Radio', N'Radio AM/FM', 50.0000, 1)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (3, N'Camisa', N'Camisa de algodón', 20.0000, 2)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (4, N'Pantalones', N'Pantalones de mezclilla', 30.0000, 2)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (5, N'Manzanas', N'Manzanas frescas por kg', 3.0000, 3)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (6, N'Leche', N'Leche en cartón de 1 litro', 1.5000, 3)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (8, N'ggg', N'gggg', 1.0000, 1)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (14, N'LeoExel', N'LeoExel11', 5.0000, 1)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (15, N'LeoExel1', N'LeoExel11', 6.0000, 2)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (16, N'LeoExel', N'LeoExel11', 5.0000, 1)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (17, N'LeoExel1', N'LeoExel11', 6.0000, 2)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (18, N'LeoExel', N'LeoExel11', 5.0000, 1)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (19, N'LeoExel1', N'LeoExel11', 6.0000, 2)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (21, N'LeoExel', N'LeoExel11', 5.0000, 1)
INSERT [dbo].[Producto] ([ID_Producto], [Nombre_Producto], [Descripcion_Producto], [PrecioUnitario], [ID_Categoria]) VALUES (22, N'LeoExel1', N'LeoExel11', 6.0000, 2)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (1, CAST(N'2025-05-13T00:00:00.000' AS DateTime), CAST(55154.00 AS Decimal(10, 2)), N'Venta televisores', 1)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (2, CAST(N'2024-05-22T22:21:34.980' AS DateTime), CAST(107887.00 AS Decimal(10, 2)), N'Venta de prueba 2', 2)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (9, CAST(N'2024-05-16T23:31:00.000' AS DateTime), CAST(55.00 AS Decimal(10, 2)), N'rrr', 3)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (13, CAST(N'2024-05-16T14:51:00.000' AS DateTime), CAST(21000.00 AS Decimal(10, 2)), N'GFDGFDGDFGDFG', 2)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (16, CAST(N'2024-05-16T19:40:00.000' AS DateTime), CAST(64000.00 AS Decimal(10, 2)), N'gfdgfdgdf', 2)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (17, CAST(N'2024-05-17T22:46:00.000' AS DateTime), CAST(20000.00 AS Decimal(10, 2)), N'rrrrr', 1)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (18, CAST(N'2024-05-10T00:43:00.000' AS DateTime), CAST(2000.00 AS Decimal(10, 2)), N'rererer', 2)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (19, CAST(N'2028-05-13T00:00:00.000' AS DateTime), CAST(777.00 AS Decimal(10, 2)), N'Venta de Comida', 3)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (20, CAST(N'2028-05-13T00:00:00.000' AS DateTime), CAST(777.00 AS Decimal(10, 2)), N'Venta de Comida', 3)
INSERT [dbo].[Venta] ([ID_Venta], [FechaVenta], [Total_Venta], [Descripcion_Venta], [ID_Cliente]) VALUES (21, CAST(N'2024-05-04T21:55:00.000' AS DateTime), CAST(8200.00 AS Decimal(10, 2)), N'gggogog', 17)
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 02/06/2024 22:43:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 02/06/2024 22:43:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 02/06/2024 22:43:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 02/06/2024 22:43:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 02/06/2024 22:43:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 02/06/2024 22:43:37 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 02/06/2024 22:43:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Producto] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Producto]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Venta] FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Venta] ([ID_Venta])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Venta]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Producto] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[Categoria] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarTotalVenta]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarTotalVenta]
(
    @ID_Venta INT
)
AS
BEGIN
    DECLARE @Total_Venta DECIMAL(10, 2);

    SELECT @Total_Venta = SUM(SubTotal)
    FROM DetalleVenta
    WHERE ID_Venta = @ID_Venta;

    UPDATE Venta
    SET Total_Venta = @Total_Venta
    WHERE ID_Venta = @ID_Venta;
END;
GO
/****** Object:  StoredProcedure [dbo].[spCategoria_Delete]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCategoria_Delete]
(@ID_Categoria int)
AS
BEGIN
	DELETE FROM Categoria WHERE ID_Categoria = @ID_Categoria
END;
GO
/****** Object:  StoredProcedure [dbo].[spCategoria_GetAll]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCategoria_GetAll]
AS
BEGIN
	SELECT ID_Categoria, Nombre_Categoria, Descripcion_Categoria FROM  Categoria
END;
GO
/****** Object:  StoredProcedure [dbo].[spCategoria_GetById]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCategoria_GetById]
(@ID_Categoria INT)
AS
BEGIN
	SELECT ID_Categoria, Nombre_Categoria, Descripcion_Categoria
	FROM Categoria
    WHERE ID_Categoria = @ID_Categoria
END;
GO
/****** Object:  StoredProcedure [dbo].[spCategoria_Insert]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCategoria_Insert]
(
	@Nombre_Categoria nvarchar(50),
	@Descripcion_Categoria nvarchar(255)
)
AS
BEGIN
	INSERT INTO Categoria 
	VALUES(@Nombre_Categoria, @Descripcion_Categoria)
END;
GO
/****** Object:  StoredProcedure [dbo].[spCategoria_Update]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCategoria_Update]
(
	@Nombre_Categoria nvarchar(50),
	@Descripcion_Categoria nvarchar(255),
	@ID_Categoria int
)
AS
BEGIN
	UPDATE Categoria 
	SET Nombre_Categoria = @Nombre_Categoria,
	Descripcion_Categoria = @Descripcion_Categoria
    WHERE ID_Categoria = @ID_Categoria
END;
GO
/****** Object:  StoredProcedure [dbo].[spCliente_Delete]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCliente_Delete]
(@ID_Cliente INT)
AS
BEGIN
	DELETE FROM Cliente WHERE ID_Cliente = @ID_Cliente
END;
GO
/****** Object:  StoredProcedure [dbo].[spCliente_GetAll]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCliente_GetAll]
AS
BEGIN
	SELECT ID_Cliente, Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente FROM Cliente
END;
GO
/****** Object:  StoredProcedure [dbo].[spCliente_GetByID]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCliente_GetByID]
(@ID_Cliente INT)
AS
BEGIN
	SELECT ID_Cliente, Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente
	FROM Cliente
	WHERE ID_Cliente = @ID_Cliente
END;
GO
/****** Object:  StoredProcedure [dbo].[spCliente_Insert]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCliente_Insert]
(
	@Nombre_Cliente NVARCHAR(100),
	@Direccion_Cliente NVARCHAR(255),
	@Telefono_Cliente NVARCHAR(20),
	@Email_Cliente NVARCHAR(100)
)
AS
BEGIN
	INSERT INTO Cliente (Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente)
	VALUES (@Nombre_Cliente, @Direccion_Cliente, @Telefono_Cliente, @Email_Cliente)
END;
GO
/****** Object:  StoredProcedure [dbo].[spCliente_Update]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCliente_Update]
(
	@ID_Cliente INT,
	@Nombre_Cliente NVARCHAR(100),
	@Direccion_Cliente NVARCHAR(255),
	@Telefono_Cliente NVARCHAR(20),
	@Email_Cliente NVARCHAR(100)
)
AS
BEGIN
	UPDATE Cliente
	SET Nombre_Cliente = @Nombre_Cliente,
		Direccion_Cliente = @Direccion_Cliente,
		Telefono_Cliente = @Telefono_Cliente,
		Email_Cliente = @Email_Cliente
	WHERE ID_Cliente = @ID_Cliente
END;
GO
/****** Object:  StoredProcedure [dbo].[spDetalleVenta_Delete]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDetalleVenta_Delete]
(
    @ID_DetalleVenta INT
)
AS
BEGIN
    DECLARE @ID_Venta INT;

    SELECT @ID_Venta = ID_Venta
    FROM DetalleVenta
    WHERE ID_DetalleVenta = @ID_DetalleVenta;

    DELETE FROM DetalleVenta
    WHERE ID_DetalleVenta = @ID_DetalleVenta;

    -- Actualizar el Total_Venta
    EXEC dbo.spActualizarTotalVenta @ID_Venta;
END;
GO
/****** Object:  StoredProcedure [dbo].[spDetalleVenta_GetAll]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDetalleVenta_GetAll]
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad, DetalleVenta.SubTotal, DetalleVenta.PrecioUnitario,
	       Venta.ID_Venta, Producto.ID_Producto, Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
END;
GO
/****** Object:  StoredProcedure [dbo].[spDetalleVenta_GetByID]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDetalleVenta_GetByID]
(@ID_DetalleVenta INT)
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad, DetalleVenta.SubTotal, DetalleVenta.PrecioUnitario,
	       Venta.ID_Venta, Producto.ID_Producto, Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
	WHERE ID_DetalleVenta = @ID_DetalleVenta
END;
GO
/****** Object:  StoredProcedure [dbo].[spDetalleVenta_GetByIdVenta]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDetalleVenta_GetByIdVenta]
(@ID_Venta INT)
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad, DetalleVenta.SubTotal, DetalleVenta.PrecioUnitario,
	       Venta.ID_Venta, Producto.ID_Producto, Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
	WHERE DetalleVenta.ID_Venta = @ID_Venta
END;
GO
/****** Object:  StoredProcedure [dbo].[spDetalleVenta_Insert]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDetalleVenta_Insert]
(
    @Cantidad INT,
    @SubTotal DECIMAL(18, 2),
    @PrecioUnitario MONEY,
    @ID_Venta INT,
    @ID_Producto INT
)
AS
BEGIN
    INSERT INTO DetalleVenta (Cantidad, SubTotal, PrecioUnitario, ID_Venta, ID_Producto)
    VALUES (@Cantidad, @SubTotal, @PrecioUnitario, @ID_Venta, @ID_Producto);

    -- Actualizar el Total_Venta
    EXEC dbo.spActualizarTotalVenta @ID_Venta;
END;
GO
/****** Object:  StoredProcedure [dbo].[spDetalleVenta_Update]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDetalleVenta_Update]
(
    @ID_DetalleVenta INT,
    @Cantidad INT,
    @SubTotal DECIMAL(18, 2),
    @PrecioUnitario MONEY,
    @ID_Venta INT,
    @ID_Producto INT
)
AS
BEGIN
    UPDATE DetalleVenta
    SET Cantidad = @Cantidad,
        SubTotal = @SubTotal,
        PrecioUnitario = @PrecioUnitario,
        ID_Venta = @ID_Venta,
        ID_Producto = @ID_Producto
    WHERE ID_DetalleVenta = @ID_DetalleVenta;

    -- Actualizar el Total_Venta
    EXEC dbo.spActualizarTotalVenta @ID_Venta;
END;
GO
/****** Object:  StoredProcedure [dbo].[spInventario_Delete]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInventario_Delete]
(@ID_Inventario INT)
AS
BEGIN
	DELETE FROM Inventario WHERE ID_Inventario = @ID_Inventario
END;
GO
/****** Object:  StoredProcedure [dbo].[spInventario_GetAll]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInventario_GetAll]
AS
BEGIN
	SELECT Inventario.ID_Inventario, Inventario.Cantidad, Inventario.FechaRegistro, 
	       Inventario.ID_Producto, Producto.Nombre_Producto
	FROM Inventario
	INNER JOIN Producto ON Inventario.ID_Producto = Producto.ID_Producto
END;
GO
/****** Object:  StoredProcedure [dbo].[spInventario_GetByID]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInventario_GetByID]
(@ID_Inventario INT)
AS
BEGIN
	SELECT Inventario.ID_Inventario, Inventario.Cantidad, Inventario.FechaRegistro, 
	       Inventario.ID_Producto, Producto.Nombre_Producto
	FROM Inventario
	INNER JOIN Producto ON Inventario.ID_Producto = Producto.ID_Producto
	WHERE Inventario.ID_Inventario = @ID_Inventario
END;
GO
/****** Object:  StoredProcedure [dbo].[spInventario_Insert]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInventario_Insert]
(
	@Cantidad INT,
	@FechaRegistro DATETIME,
	@ID_Producto INT
)
AS
BEGIN
	INSERT INTO Inventario (Cantidad, FechaRegistro, ID_Producto)
	VALUES (@Cantidad, @FechaRegistro, @ID_Producto)
END;
GO
/****** Object:  StoredProcedure [dbo].[spInventario_Update]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInventario_Update]
(
	@ID_Inventario INT,
	@Cantidad INT,
	@FechaRegistro DATETIME,
	@ID_Producto INT
)
AS
BEGIN
	UPDATE Inventario
	SET Cantidad = @Cantidad,
		FechaRegistro = @FechaRegistro,
		ID_Producto = @ID_Producto
	WHERE ID_Inventario = @ID_Inventario
END;
GO
/****** Object:  StoredProcedure [dbo].[spProducto_Delete]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProducto_Delete]
(@ID_Producto int)
AS
BEGIN
	DELETE FROM Producto
	WHERE ID_Producto = @ID_Producto
END;
GO
/****** Object:  StoredProcedure [dbo].[spProducto_GetAll]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProducto_GetAll]
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Producto.PrecioUnitario, 
	       Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
END;
GO
/****** Object:  StoredProcedure [dbo].[spProducto_GetByID]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProducto_GetByID]
(@ID_Producto INT)
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Producto.PrecioUnitario,
	       Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
	WHERE ID_Producto = @ID_Producto
END;
GO
/****** Object:  StoredProcedure [dbo].[spProducto_GetByID_Categoria]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProducto_GetByID_Categoria]
(@ID_Categoria INT)
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Producto.PrecioUnitario,
	       Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
	WHERE Producto.ID_Categoria = @ID_Categoria
END;
GO
/****** Object:  StoredProcedure [dbo].[spProducto_Insert]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProducto_Insert]
(
	@Nombre_Producto nvarchar(100),
	@Descripcion_Producto nvarchar(255),
	@PrecioUnitario money,
	@ID_Categoria int
)
AS
BEGIN
	INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, PrecioUnitario, ID_Categoria)
	VALUES(@Nombre_Producto, @Descripcion_Producto, @PrecioUnitario, @ID_Categoria)
END;
GO
/****** Object:  StoredProcedure [dbo].[spProducto_Update]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProducto_Update]
(
	@ID_Producto int,
	@Nombre_Producto nvarchar(100),
	@Descripcion_Producto nvarchar(255),
	@PrecioUnitario money,
	@ID_Categoria int
)
AS
BEGIN
	UPDATE Producto
	SET Nombre_Producto = @Nombre_Producto,
		Descripcion_Producto = @Descripcion_Producto,
		PrecioUnitario = @PrecioUnitario,
		ID_Categoria = @ID_Categoria
	WHERE ID_Producto = @ID_Producto
END;
GO
/****** Object:  StoredProcedure [dbo].[spVenta_Delete]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVenta_Delete]
(@ID_Venta int)
AS
BEGIN
    DELETE FROM Venta WHERE ID_Venta = @ID_Venta
END;
GO
/****** Object:  StoredProcedure [dbo].[spVenta_GetAll]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVenta_GetAll]
AS
BEGIN
    SELECT Venta.ID_Venta, Venta.FechaVenta, Venta.Total_Venta, Venta.Descripcion_Venta, 
           Cliente.ID_Cliente, Cliente.Nombre_Cliente
    FROM Venta
    INNER JOIN Cliente ON Venta.ID_Cliente = Cliente.ID_Cliente
END;
GO
/****** Object:  StoredProcedure [dbo].[spVenta_GetById]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVenta_GetById]
(@ID_Venta INT)
AS
BEGIN
    SELECT Venta.ID_Venta, Venta.FechaVenta, Venta.Total_Venta, Venta.Descripcion_Venta, 
           Cliente.ID_Cliente, Cliente.Nombre_Cliente
    FROM Venta
    INNER JOIN Cliente ON Venta.ID_Cliente = Cliente.ID_Cliente
    WHERE Venta.ID_Venta = @ID_Venta
END;
GO
/****** Object:  StoredProcedure [dbo].[spVenta_Insert]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVenta_Insert]
(
    @FechaVenta datetime,
    @Total_Venta decimal(10,2),
    @Descripcion_Venta nvarchar(255),
    @ID_Cliente int
)
AS
BEGIN
    INSERT INTO Venta (FechaVenta, Total_Venta, Descripcion_Venta, ID_Cliente)
    VALUES(@FechaVenta, @Total_Venta, @Descripcion_Venta, @ID_Cliente)
END;
GO
/****** Object:  StoredProcedure [dbo].[spVenta_Update]    Script Date: 02/06/2024 22:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVenta_Update]
(
    @FechaVenta datetime,
    @Total_Venta decimal(10,2),
    @Descripcion_Venta nvarchar(255),
    @ID_Cliente int,
    @ID_Venta int
)
AS
BEGIN
    UPDATE Venta 
    SET FechaVenta = @FechaVenta,
        Total_Venta = @Total_Venta,
        Descripcion_Venta = @Descripcion_Venta,
        ID_Cliente = @ID_Cliente
    WHERE ID_Venta = @ID_Venta
END;
GO
USE [master]
GO
ALTER DATABASE [DB_Tienda_Electronica] SET  READ_WRITE 
GO
