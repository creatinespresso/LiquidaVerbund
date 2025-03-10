USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Address]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Address](
	[ID] [uniqueidentifier] NOT NULL,
	[ContactID] [uniqueidentifier] NOT NULL,
	[Street] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[POBox] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](4) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[ValidTo] [date] NULL,
	[PostalAddress] [ikaros].[boolean] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[Annex1] [nvarchar](50) NULL,
	[Annex2] [nvarchar](50) NULL,
	[Annex3] [nvarchar](50) NULL,
	[UDF_ADRESSE_PROCDATE] [datetime] NULL,
	[AddrNormRawData] [nvarchar](max) NULL,
	[Validity] [char](1) NOT NULL,
	[Origin] [char](6) NULL,
	[RegionID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_CountryCode]  DEFAULT ([ikaros].[SettingGetString]('Country','D','')) FOR [CountryCode]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_PostalAddress]  DEFAULT ((0)) FOR [PostalAddress]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF__Address__UDF_ADR__78CA9511]  DEFAULT (getdate()) FOR [UDF_ADRESSE_PROCDATE]
GO
ALTER TABLE [ikaros].[Address] ADD  CONSTRAINT [DF_Address_Validity]  DEFAULT ('G') FOR [Validity]
GO
ALTER TABLE [ikaros].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Contact] FOREIGN KEY([ContactID])
REFERENCES [ikaros].[Contact] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [ikaros].[Address] CHECK CONSTRAINT [FK_Address_Contact]
GO
ALTER TABLE [ikaros].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Region] FOREIGN KEY([RegionID])
REFERENCES [ikaros].[Region] ([ID])
GO
ALTER TABLE [ikaros].[Address] CHECK CONSTRAINT [FK_Address_Region]
GO
ALTER TABLE [ikaros].[Address]  WITH CHECK ADD  CONSTRAINT [CK_Address_Origin] CHECK  (([Origin] IS NULL OR [Origin]='SCHUFA'))
GO
ALTER TABLE [ikaros].[Address] CHECK CONSTRAINT [CK_Address_Origin]
GO
ALTER TABLE [ikaros].[Address]  WITH CHECK ADD  CONSTRAINT [CK_Address_Validity] CHECK  (([Validity]='G' OR [Validity]='U' OR [Validity]='Z'))
GO
ALTER TABLE [ikaros].[Address] CHECK CONSTRAINT [CK_Address_Validity]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Notizen' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'AddrNormRawData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Weitere Qualifizierung der Addresse. Mögliche Werte: "G"ültig, "U"ngültig, "Z"weifelhaft.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'Validity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Speichert die Herkunft der Adresse. Wird bislang nur von der SCHUFA-Schnittstelle befüllt.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'Origin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the region of the address' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'RegionID'
GO
