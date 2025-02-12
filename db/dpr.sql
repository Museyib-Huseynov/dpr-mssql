USE [master]
GO
/****** Object:  Database [dpr]    Script Date: 02/02/2025 11:58:53 ******/
CREATE DATABASE [dpr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dpr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dpr.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dpr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dpr_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dpr] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dpr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dpr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dpr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dpr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dpr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dpr] SET ARITHABORT OFF 
GO
ALTER DATABASE [dpr] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dpr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dpr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dpr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dpr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dpr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dpr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dpr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dpr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dpr] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dpr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dpr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dpr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dpr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dpr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dpr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dpr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dpr] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dpr] SET  MULTI_USER 
GO
ALTER DATABASE [dpr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dpr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dpr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dpr] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dpr] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dpr] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dpr] SET QUERY_STORE = ON
GO
ALTER DATABASE [dpr] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dpr]
GO
/****** Object:  Table [dbo].[well_downtime_reasons]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[well_downtime_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[well_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[downtime_category] [nvarchar](255) NULL,
	[production_sub_skins_activity_id] [int] NULL,
	[comments] [nvarchar](max) NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_wellDowntimeReason] UNIQUE NONCLUSTERED 
(
	[well_id] ASC,
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platforms]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platforms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [int] NOT NULL,
	[field_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_platform] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[field_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wells]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wells](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[platform_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_well] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horizons]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horizons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_horizon] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[well_stock_categories]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[well_stock_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_wellStockCategory] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[well_stock_sub_categories]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[well_stock_sub_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_wellStockSubCategory] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[production_well_stock_sub_categories]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[production_well_stock_sub_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_productionWellStockSubCategory] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[production_methods]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[production_methods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_productionMethod] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[production_sub_skins_activities]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[production_sub_skins_activities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[production_sub_skin_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_productionSubSkinsActivity] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[production_sub_skin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_dates]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_dates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[report_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_reportDate] UNIQUE NONCLUSTERED 
(
	[report_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[well_stock]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[well_stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[well_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[well_stock_category_id] [int] NULL,
	[well_stock_sub_category_id] [int] NULL,
	[production_well_stock_sub_category_id] [int] NULL,
	[production_method_id] [int] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_wellStock] UNIQUE NONCLUSTERED 
(
	[well_id] ASC,
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[completions]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[completions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[well_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[horizon_id] [int] NULL,
	[casing] [nvarchar](255) NULL,
	[completion_interval] [nvarchar](255) NULL,
	[tubing1_depth] [nvarchar](255) NULL,
	[tubing1_length] [nvarchar](255) NULL,
	[tubing2_depth] [nvarchar](255) NULL,
	[tubing2_length] [nvarchar](255) NULL,
	[tubing3_depth] [nvarchar](255) NULL,
	[tubing3_length] [nvarchar](255) NULL,
	[packer_depth] [nvarchar](255) NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_completion] UNIQUE NONCLUSTERED 
(
	[well_id] ASC,
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[well_tests]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[well_tests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[well_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[well_test_date] [date] NOT NULL,
	[choke] [nvarchar](255) NULL,
	[pqa] [nvarchar](255) NULL,
	[phf] [nvarchar](255) NULL,
	[pba] [nvarchar](255) NULL,
	[p6x9] [nvarchar](255) NULL,
	[p9x13] [nvarchar](255) NULL,
	[p13x20] [nvarchar](255) NULL,
	[liquid_ton] [float] NULL,
	[total_gas] [float] NULL,
	[gaslift_gas] [float] NULL,
	[reported_water_cut] [float] NULL,
	[water_cut] [float] NULL,
	[mechanical_impurities] [float] NULL,
	[oil_density] [float] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_wellTest] UNIQUE NONCLUSTERED 
(
	[well_id] ASC,
	[well_test_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[daily_well_parameters]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[daily_well_parameters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[well_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[flowmeter] [int] NULL,
	[well_uptime_hours] [float] NULL,
	[choke] [nvarchar](255) NULL,
	[pqa] [nvarchar](255) NULL,
	[phf] [nvarchar](255) NULL,
	[pba] [nvarchar](255) NULL,
	[p6x9] [nvarchar](255) NULL,
	[p9x13] [nvarchar](255) NULL,
	[p13x20] [nvarchar](255) NULL,
	[liquid_ton] [float] NULL,
	[total_gas] [float] NULL,
	[gaslift_gas] [float] NULL,
	[reported_water_cut] [float] NULL,
	[water_cut] [float] NULL,
	[mechanical_impurities] [float] NULL,
	[oil_density] [float] NULL,
	[oil_loss_ton] [float] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_dailyWellParameter] UNIQUE NONCLUSTERED 
(
	[well_id] ASC,
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[complete_table]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[complete_table] AS
SELECT 
    rd.report_date AS report_date,
    p.name AS platform,
    w.name AS well,
    wsc.name AS well_stock_category,
    wssc.name AS well_stock_sub_category,
    pwssc.name AS production_well_stock_sub_category,
    pm.name AS production_method,
    h.name AS horizon,
    dwp.flowmeter AS flowmeter,
    dwp.well_uptime_hours AS well_uptime_hours,
    dwp.choke AS choke,
    dwp.pqa AS Pqa,
    dwp.phf AS Phf,
    dwp.pba AS Pba,
    dwp.p6x9 AS P6x9,
    dwp.p9x13 AS P9x13,
    dwp.p13x20 AS P13x20,
    ROUND(dwp.liquid_ton, 0) AS liquid_ton,
    CASE
        WHEN dwp.oil_density = 0 AND dwp.water_cut = 0 THEN 0
        ELSE ROUND(dwp.liquid_ton * (dwp.water_cut / 100) / (dwp.oil_density * (1 - (dwp.water_cut / 100)) + (dwp.water_cut / 100)), 0)
    END AS water_ton,
    CASE
        WHEN dwp.oil_density = 0 AND dwp.water_cut = 0 THEN 0
        ELSE ROUND(dwp.liquid_ton * dwp.oil_density * (1 - (dwp.water_cut / 100)) / (dwp.oil_density * (1 - (dwp.water_cut / 100)) + (dwp.water_cut / 100)), 0)
    END AS oil_ton,
    ROUND(dwp.total_gas, 0) AS total_gas,
    ROUND(dwp.gaslift_gas, 0) AS gaslift_gas,
    ROUND((wt.total_gas - wt.gaslift_gas) * dwp.well_uptime_hours / 24, 0) AS produced_gas,
    ROUND(dwp.reported_water_cut, 1) AS reported_water_cut,
    ROUND(dwp.water_cut, 1) AS allocated_water_cut,
    ROUND(dwp.mechanical_impurities, 1) AS mechanical_impurities,
    ROUND(dwp.oil_density, 3) AS oil_density,
    ROUND(dwp.oil_loss_ton, 0) AS oil_loss_ton,
    wdr.downtime_category AS donwtime_category,
    pssa.name AS production_skin,
    wdr.comments AS comments
FROM daily_well_parameters dwp
LEFT JOIN well_stock AS ws
    ON dwp.well_id = ws.well_id
    AND ws.report_date_id = (
        SELECT MAX(ws_sub.report_date_id)
        FROM well_stock AS ws_sub
        WHERE ws_sub.well_id = dwp.well_id
        AND ws_sub.report_date_id <= dwp.report_date_id
    )
LEFT JOIN completions AS c
    ON dwp.well_id = c.well_id
    AND c.report_date_id = (
        SELECT MAX(c_sub.report_date_id)
        FROM completions AS c_sub
        WHERE c_sub.well_id = dwp.well_id
        AND c_sub.report_date_id <= dwp.report_date_id
    )
LEFT JOIN well_downtime_reasons AS wdr
    ON dwp.well_id = wdr.well_id
    AND wdr.report_date_id = (
        SELECT MAX(wdr_sub.report_date_id)
        FROM well_downtime_reasons AS wdr_sub
        WHERE wdr_sub.well_id = dwp.well_id
        AND wdr_sub.report_date_id <= dwp.report_date_id
    )
LEFT JOIN well_tests AS wt
    ON dwp.well_id = wt.well_id
    AND wt.report_date_id = (
        SELECT MAX(wt_sub.report_date_id)
        FROM well_tests AS wt_sub
        WHERE wt_sub.well_id = dwp.well_id
        AND wt_sub.report_date_id <= dwp.report_date_id
    )
LEFT JOIN wells AS w
    ON dwp.well_id = w.id
LEFT JOIN platforms AS p
    ON w.platform_id = p.id
LEFT JOIN report_dates AS rd
    ON dwp.report_date_id = rd.id
LEFT JOIN well_stock_categories AS wsc
    ON ws.well_stock_category_id = wsc.id
LEFT JOIN well_stock_sub_categories AS wssc
    ON ws.well_stock_sub_category_id = wssc.id
LEFT JOIN production_well_stock_sub_categories AS pwssc
    ON ws.production_well_stock_sub_category_id = pwssc.id
LEFT JOIN production_methods AS pm
    ON ws.production_method_id = pm.id
LEFT JOIN horizons AS h
    ON c.horizon_id = h.id
LEFT JOIN production_sub_skins_activities AS pssa
    ON wdr.production_sub_skins_activity_id = pssa.id;
GO
/****** Object:  Table [dbo].[daily_operatives]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[daily_operatives](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[field_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[oil_ton] [float] NULL,
	[water_ton] [float] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_dailyOperative] UNIQUE NONCLUSTERED 
(
	[field_id] ASC,
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fields]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fields](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[ogpd_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_field] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[ogpd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flowmeters]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flowmeters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[platform_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[reading1] [int] NULL,
	[reading2] [int] NULL,
	[reading3] [int] NULL,
	[reading4] [int] NULL,
	[calibration_date] [date] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_flowmeter] UNIQUE NONCLUSTERED 
(
	[platform_id] ASC,
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[laboratory_results]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[laboratory_results](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[well_id] [int] NOT NULL,
	[report_date_id] [int] NOT NULL,
	[last_lab_date] [date] NULL,
	[water_cut] [float] NULL,
	[mechanical_impurities] [float] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_laboratoryResult] UNIQUE NONCLUSTERED 
(
	[well_id] ASC,
	[last_lab_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogpd]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogpd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ogpd] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[production_skins]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[production_skins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_productionSkin] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[production_sub_skins]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[production_sub_skins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[production_skin_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_productionSubSkin] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[production_skin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_c_horizonId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_c_horizonId] ON [dbo].[completions]
(
	[horizon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_c_reportDateId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_c_reportDateId] ON [dbo].[completions]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_c_wellId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_c_wellId] ON [dbo].[completions]
(
	[well_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_do_fieldId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_do_fieldId] ON [dbo].[daily_operatives]
(
	[field_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_do_reportDateId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_do_reportDateId] ON [dbo].[daily_operatives]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dwp_reportDateId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_dwp_reportDateId] ON [dbo].[daily_well_parameters]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dwp_wellId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_dwp_wellId] ON [dbo].[daily_well_parameters]
(
	[well_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_f_ogpdId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_f_ogpdId] ON [dbo].[fields]
(
	[ogpd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_f_platformId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_f_platformId] ON [dbo].[flowmeters]
(
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_f_reportDateId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_f_reportDateId] ON [dbo].[flowmeters]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_lr_report_date_id]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_lr_report_date_id] ON [dbo].[laboratory_results]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_lr_wellId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_lr_wellId] ON [dbo].[laboratory_results]
(
	[well_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_p_fieldId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_p_fieldId] ON [dbo].[platforms]
(
	[field_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_pss_productionSkinId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_pss_productionSkinId] ON [dbo].[production_sub_skins]
(
	[production_skin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_pssa_productionSubSkinId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_pssa_productionSubSkinId] ON [dbo].[production_sub_skins_activities]
(
	[production_sub_skin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_wdr_productionSubSkinsActivityId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_wdr_productionSubSkinsActivityId] ON [dbo].[well_downtime_reasons]
(
	[production_sub_skins_activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_wdr_reportDateId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_wdr_reportDateId] ON [dbo].[well_downtime_reasons]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_wdr_wellId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_wdr_wellId] ON [dbo].[well_downtime_reasons]
(
	[well_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ws_productionMethodId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_ws_productionMethodId] ON [dbo].[well_stock]
(
	[production_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ws_productionWellStockSubCategoryId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_ws_productionWellStockSubCategoryId] ON [dbo].[well_stock]
(
	[production_well_stock_sub_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ws_reportDateId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_ws_reportDateId] ON [dbo].[well_stock]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ws_wellId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_ws_wellId] ON [dbo].[well_stock]
(
	[well_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ws_wellStockCategoryId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_ws_wellStockCategoryId] ON [dbo].[well_stock]
(
	[well_stock_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ws_wellStockSubCategoryId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_ws_wellStockSubCategoryId] ON [dbo].[well_stock]
(
	[well_stock_sub_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_wt_reportDateId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_wt_reportDateId] ON [dbo].[well_tests]
(
	[report_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_wt_wellId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_wt_wellId] ON [dbo].[well_tests]
(
	[well_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_w_platformId]    Script Date: 02/02/2025 11:58:54 ******/
CREATE NONCLUSTERED INDEX [IDX_w_platformId] ON [dbo].[wells]
(
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[completions] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[daily_operatives] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[daily_well_parameters] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[flowmeters] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[laboratory_results] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[well_downtime_reasons] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[well_stock] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[well_tests] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[completions]  WITH CHECK ADD  CONSTRAINT [FK_c_horizonId] FOREIGN KEY([horizon_id])
REFERENCES [dbo].[horizons] ([id])
GO
ALTER TABLE [dbo].[completions] CHECK CONSTRAINT [FK_c_horizonId]
GO
ALTER TABLE [dbo].[completions]  WITH CHECK ADD  CONSTRAINT [FK_c_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[completions] CHECK CONSTRAINT [FK_c_reportDateId]
GO
ALTER TABLE [dbo].[completions]  WITH CHECK ADD  CONSTRAINT [FK_c_wellId] FOREIGN KEY([well_id])
REFERENCES [dbo].[wells] ([id])
GO
ALTER TABLE [dbo].[completions] CHECK CONSTRAINT [FK_c_wellId]
GO
ALTER TABLE [dbo].[daily_operatives]  WITH CHECK ADD  CONSTRAINT [FK_do_fieldId] FOREIGN KEY([field_id])
REFERENCES [dbo].[fields] ([id])
GO
ALTER TABLE [dbo].[daily_operatives] CHECK CONSTRAINT [FK_do_fieldId]
GO
ALTER TABLE [dbo].[daily_operatives]  WITH CHECK ADD  CONSTRAINT [FK_do_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[daily_operatives] CHECK CONSTRAINT [FK_do_reportDateId]
GO
ALTER TABLE [dbo].[daily_well_parameters]  WITH CHECK ADD  CONSTRAINT [FK_dwp_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[daily_well_parameters] CHECK CONSTRAINT [FK_dwp_reportDateId]
GO
ALTER TABLE [dbo].[daily_well_parameters]  WITH CHECK ADD  CONSTRAINT [FK_dwp_wellId] FOREIGN KEY([well_id])
REFERENCES [dbo].[wells] ([id])
GO
ALTER TABLE [dbo].[daily_well_parameters] CHECK CONSTRAINT [FK_dwp_wellId]
GO
ALTER TABLE [dbo].[fields]  WITH CHECK ADD  CONSTRAINT [FK_f_ogpdId] FOREIGN KEY([ogpd_id])
REFERENCES [dbo].[ogpd] ([id])
GO
ALTER TABLE [dbo].[fields] CHECK CONSTRAINT [FK_f_ogpdId]
GO
ALTER TABLE [dbo].[flowmeters]  WITH CHECK ADD  CONSTRAINT [FK_f_platformId] FOREIGN KEY([platform_id])
REFERENCES [dbo].[platforms] ([id])
GO
ALTER TABLE [dbo].[flowmeters] CHECK CONSTRAINT [FK_f_platformId]
GO
ALTER TABLE [dbo].[flowmeters]  WITH CHECK ADD  CONSTRAINT [FK_f_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[flowmeters] CHECK CONSTRAINT [FK_f_reportDateId]
GO
ALTER TABLE [dbo].[laboratory_results]  WITH CHECK ADD  CONSTRAINT [FK_lr_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[laboratory_results] CHECK CONSTRAINT [FK_lr_reportDateId]
GO
ALTER TABLE [dbo].[laboratory_results]  WITH CHECK ADD  CONSTRAINT [FK_lr_wellId] FOREIGN KEY([well_id])
REFERENCES [dbo].[wells] ([id])
GO
ALTER TABLE [dbo].[laboratory_results] CHECK CONSTRAINT [FK_lr_wellId]
GO
ALTER TABLE [dbo].[platforms]  WITH CHECK ADD  CONSTRAINT [FK_p_fieldId] FOREIGN KEY([field_id])
REFERENCES [dbo].[fields] ([id])
GO
ALTER TABLE [dbo].[platforms] CHECK CONSTRAINT [FK_p_fieldId]
GO
ALTER TABLE [dbo].[production_sub_skins]  WITH CHECK ADD  CONSTRAINT [FK_pss_productionSkinId] FOREIGN KEY([production_skin_id])
REFERENCES [dbo].[production_skins] ([id])
GO
ALTER TABLE [dbo].[production_sub_skins] CHECK CONSTRAINT [FK_pss_productionSkinId]
GO
ALTER TABLE [dbo].[production_sub_skins_activities]  WITH CHECK ADD  CONSTRAINT [FK_pssa_productionSubSkinId] FOREIGN KEY([production_sub_skin_id])
REFERENCES [dbo].[production_sub_skins] ([id])
GO
ALTER TABLE [dbo].[production_sub_skins_activities] CHECK CONSTRAINT [FK_pssa_productionSubSkinId]
GO
ALTER TABLE [dbo].[well_downtime_reasons]  WITH CHECK ADD  CONSTRAINT [FK_wdr_productionSubSkinsActivityId] FOREIGN KEY([production_sub_skins_activity_id])
REFERENCES [dbo].[production_sub_skins_activities] ([id])
GO
ALTER TABLE [dbo].[well_downtime_reasons] CHECK CONSTRAINT [FK_wdr_productionSubSkinsActivityId]
GO
ALTER TABLE [dbo].[well_downtime_reasons]  WITH CHECK ADD  CONSTRAINT [FK_wdr_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[well_downtime_reasons] CHECK CONSTRAINT [FK_wdr_reportDateId]
GO
ALTER TABLE [dbo].[well_downtime_reasons]  WITH CHECK ADD  CONSTRAINT [FK_wdr_wellId] FOREIGN KEY([well_id])
REFERENCES [dbo].[wells] ([id])
GO
ALTER TABLE [dbo].[well_downtime_reasons] CHECK CONSTRAINT [FK_wdr_wellId]
GO
ALTER TABLE [dbo].[well_stock]  WITH CHECK ADD  CONSTRAINT [FK_ws_productionMethodId] FOREIGN KEY([production_method_id])
REFERENCES [dbo].[production_methods] ([id])
GO
ALTER TABLE [dbo].[well_stock] CHECK CONSTRAINT [FK_ws_productionMethodId]
GO
ALTER TABLE [dbo].[well_stock]  WITH CHECK ADD  CONSTRAINT [FK_ws_productionWellStockSubCategoryId] FOREIGN KEY([production_well_stock_sub_category_id])
REFERENCES [dbo].[production_well_stock_sub_categories] ([id])
GO
ALTER TABLE [dbo].[well_stock] CHECK CONSTRAINT [FK_ws_productionWellStockSubCategoryId]
GO
ALTER TABLE [dbo].[well_stock]  WITH CHECK ADD  CONSTRAINT [FK_ws_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[well_stock] CHECK CONSTRAINT [FK_ws_reportDateId]
GO
ALTER TABLE [dbo].[well_stock]  WITH CHECK ADD  CONSTRAINT [FK_ws_wellId] FOREIGN KEY([well_id])
REFERENCES [dbo].[wells] ([id])
GO
ALTER TABLE [dbo].[well_stock] CHECK CONSTRAINT [FK_ws_wellId]
GO
ALTER TABLE [dbo].[well_stock]  WITH CHECK ADD  CONSTRAINT [FK_ws_wellStockCategoryId] FOREIGN KEY([well_stock_category_id])
REFERENCES [dbo].[well_stock_categories] ([id])
GO
ALTER TABLE [dbo].[well_stock] CHECK CONSTRAINT [FK_ws_wellStockCategoryId]
GO
ALTER TABLE [dbo].[well_stock]  WITH CHECK ADD  CONSTRAINT [FK_ws_wellStockSubCategoryId] FOREIGN KEY([well_stock_sub_category_id])
REFERENCES [dbo].[well_stock_sub_categories] ([id])
GO
ALTER TABLE [dbo].[well_stock] CHECK CONSTRAINT [FK_ws_wellStockSubCategoryId]
GO
ALTER TABLE [dbo].[well_tests]  WITH CHECK ADD  CONSTRAINT [FK_wt_reportDateId] FOREIGN KEY([report_date_id])
REFERENCES [dbo].[report_dates] ([id])
GO
ALTER TABLE [dbo].[well_tests] CHECK CONSTRAINT [FK_wt_reportDateId]
GO
ALTER TABLE [dbo].[well_tests]  WITH CHECK ADD  CONSTRAINT [FK_wt_wellId] FOREIGN KEY([well_id])
REFERENCES [dbo].[wells] ([id])
GO
ALTER TABLE [dbo].[well_tests] CHECK CONSTRAINT [FK_wt_wellId]
GO
ALTER TABLE [dbo].[wells]  WITH CHECK ADD  CONSTRAINT [FK_w_platformId] FOREIGN KEY([platform_id])
REFERENCES [dbo].[platforms] ([id])
GO
ALTER TABLE [dbo].[wells] CHECK CONSTRAINT [FK_w_platformId]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAllEntries]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteAllEntries]
AS
BEGIN
    TRUNCATE TABLE flowmeters;
    TRUNCATE TABLE well_stock;
    TRUNCATE TABLE completions;
    TRUNCATE TABLE well_downtime_reasons;
    TRUNCATE TABLE daily_well_parameters;
    TRUNCATE TABLE well_tests;
    TRUNCATE TABLE laboratory_results;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteEntries]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteEntries]
    @reportDate DATE,
    @platform INT
AS
BEGIN
    DECLARE @reportDateId INT;

    SELECT @reportDateId = rd.id
    FROM report_dates AS rd
    WHERE rd.report_date = @reportDate;

    DELETE flowmeters
    FROM flowmeters
    INNER JOIN platforms ON flowmeters.platform_id = platforms.id
    WHERE report_date_id = @reportDateId AND (platforms.name = @platform OR @platform IS NULL);

    DELETE well_stock
    FROM well_stock
    INNER JOIN wells ON well_stock.well_id = wells.id
    INNER JOIN platforms ON wells.platform_id = platforms.id
    WHERE report_date_id = @reportDateId AND (platforms.name = @platform OR @platform IS NULL);

    DELETE completions
    FROM completions
    INNER JOIN wells ON completions.well_id = wells.id
    INNER JOIN platforms ON wells.platform_id = platforms.id
    WHERE report_date_id = @reportDateId AND (platforms.name = @platform OR @platform IS NULL);

    DELETE well_downtime_reasons
    FROM well_downtime_reasons
    INNER JOIN wells ON well_downtime_reasons.well_id = wells.id
    INNER JOIN platforms ON wells.platform_id = platforms.id
    WHERE report_date_id = @reportDateId AND (platforms.name = @platform OR @platform IS NULL);

    DELETE daily_well_parameters
    FROM daily_well_parameters
    INNER JOIN wells ON daily_well_parameters.well_id = wells.id
    INNER JOIN platforms ON wells.platform_id = platforms.id
    WHERE report_date_id = @reportDateId AND (platforms.name = @platform OR @platform IS NULL);

    DELETE well_tests
    FROM well_tests
    INNER JOIN wells ON well_tests.well_id = wells.id
    INNER JOIN platforms ON wells.platform_id = platforms.id
    WHERE report_date_id = @reportDateId AND (platforms.name = @platform OR @platform IS NULL);

    DELETE laboratory_results
    FROM laboratory_results
    INNER JOIN wells ON laboratory_results.well_id = wells.id
    INNER JOIN platforms ON wells.platform_id = platforms.id
    WHERE report_date_id = @reportDateId AND (platforms.name = @platform OR @platform IS NULL);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteTodayEntries]    Script Date: 02/02/2025 11:58:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTodayEntries]
AS
BEGIN
    DELETE FROM flowmeters WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);
    DELETE FROM well_stock WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);
    DELETE FROM completions WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);
    DELETE FROM well_downtime_reasons WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);
    DELETE FROM daily_well_parameters WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);
    DELETE FROM well_tests WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);
    DELETE FROM laboratory_results WHERE CAST(created_at AS DATE) = CAST(GETDATE() AS DATE);
END;
GO
USE [master]
GO
ALTER DATABASE [dpr] SET  READ_WRITE 
GO
