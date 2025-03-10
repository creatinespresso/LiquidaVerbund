USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Country]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Country](
	[ISOCode] [nvarchar](2) NOT NULL,
	[PostCode] [nvarchar](3) NOT NULL,
	[Designation] [nvarchar](255) NULL,
	[PostalCodeDirectory] [ikaros].[boolean] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[Grouping] [nvarchar](128) NULL,
	[PostalCodeModule] [nvarchar](1024) NULL,
	[IsoAlpha3Code] [nvarchar](3) NOT NULL,
	[IBANStructure] [nvarchar](50) NULL,
	[PostalCodeStructure] [nvarchar](50) NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[UDF_Zone] [int] NULL,
	[RegionType] [nvarchar](50) NULL,
	[Language] [nvarchar](10) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Country] ADD  CONSTRAINT [DF_Country_PostalCodeDirectory]  DEFAULT ((0)) FOR [PostalCodeDirectory]
GO
ALTER TABLE [ikaros].[Country] ADD  CONSTRAINT [DF_Country_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Country] ADD  CONSTRAINT [DF_Country_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Country] ADD  CONSTRAINT [DF_Country_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Country] ADD  CONSTRAINT [DF_Country_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Country] ADD  CONSTRAINT [DF_Country_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Country] ADD  CONSTRAINT [DF__Country__UDF_Zon__4E602550]  DEFAULT ((5)) FOR [UDF_Zone]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Länderkennung nach ISO-3166-1 ALPHA-2.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'ISOCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zu welcher Gruppe gehört das Land?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'Grouping'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Welches Adressnormierungs-Modul soll genutzt werden? Mögliche Angaben: "KSE PLZDIRECTORY", "ICB:<Assembly-Bezeichner>", "DATABASE", NULL' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'PostalCodeModule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Länderkennung nach ISO-3166-1 ALPHA-3.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'IsoAlpha3Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IBAN structure of the country as a regular expression.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'IBANStructure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Postal code structure of the country as a regular expression.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'PostalCodeStructure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the country' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of the region of the country' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'RegionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The standard language of the specified region.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'Language'
GO
