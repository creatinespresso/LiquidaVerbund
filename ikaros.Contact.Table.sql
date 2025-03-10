USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Contact]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Contact](
	[ID] [uniqueidentifier] NOT NULL,
	[Matchcode] [nvarchar](30) NOT NULL,
	[PersonType] [char](1) NOT NULL,
	[LawyerType] [char](1) NULL,
	[AddressForm] [nvarchar](30) NULL,
	[Salutation] [nvarchar](40) NOT NULL,
	[LegalForm] [nvarchar](35) NULL,
	[FirstName] [nvarchar](40) NULL,
	[Name1] [nvarchar](40) NOT NULL,
	[Name2] [nvarchar](40) NULL,
	[Name3] [nvarchar](40) NULL,
	[FAO] [nvarchar](40) NULL,
	[BirthDate] [date] NULL,
	[Memo] [nvarchar](max) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CommercialRegister] [nvarchar](30) NULL,
	[CommercialRegisterNo] [nvarchar](15) NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[AccountsReceivable] [nvarchar](10) NULL,
	[AccountsPayable] [nvarchar](10) NULL,
	[CostCentre] [nvarchar](10) NULL,
	[OIDaysUntilDue] [int] NULL,
	[BirthPlace] [nvarchar](50) NULL,
	[ContactNo] [bigint] IDENTITY(1,1) NOT NULL,
	[UDF_KONTAKT_PROCDATE] [datetime] NULL,
	[Lock] [ikaros].[boolean] NOT NULL,
	[UniqueIdentification] [nvarchar](40) NULL,
	[InAddressSearch] [ikaros].[boolean] NOT NULL,
	[Consumer] [ikaros].[boolean] NOT NULL,
	[SepaCreditorId] [nvarchar](35) NULL,
	[Title] [nvarchar](50) NULL,
	[Language] [nvarchar](10) NULL,
	[ContactRefNoOld] [nvarchar](50) NULL,
	[UDF_StpMonitor] [nvarchar](5) NULL,
	[UDF_StpMonitorId] [uniqueidentifier] NULL,
	[UDF_OLDID] [uniqueidentifier] NULL,
	[NationalityId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_PersonType]  DEFAULT ((0)) FOR [PersonType]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_OIDaysUntilDue]  DEFAULT ((0)) FOR [OIDaysUntilDue]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF__Contact__Lock__4B78CBAD]  DEFAULT ([ikaros].[GetFalse]()) FOR [Lock]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_InAddressSearch]  DEFAULT ((0)) FOR [InAddressSearch]
GO
ALTER TABLE [ikaros].[Contact] ADD  CONSTRAINT [DF_Contact_Consumer]  DEFAULT ([ikaros].[GetTrue]()) FOR [Consumer]
GO
ALTER TABLE [ikaros].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Country] FOREIGN KEY([NationalityId])
REFERENCES [ikaros].[Country] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [ikaros].[Contact] CHECK CONSTRAINT [FK_Contact_Country]
GO
ALTER TABLE [ikaros].[Contact]  WITH CHECK ADD  CONSTRAINT [CK_Contact_LawyerType] CHECK  (([LawyerType]='9' OR [LawyerType]='8' OR [LawyerType]='7' OR [LawyerType]='6' OR [LawyerType]='5' OR [LawyerType]='4' OR [LawyerType]='3' OR [LawyerType]='2' OR [LawyerType]='1'))
GO
ALTER TABLE [ikaros].[Contact] CHECK CONSTRAINT [CK_Contact_LawyerType]
GO
ALTER TABLE [ikaros].[Contact]  WITH CHECK ADD  CONSTRAINT [CK_Contact_PersonType] CHECK  (([PersonType]='5' OR [PersonType]='4' OR [PersonType]='3' OR [PersonType]='2' OR [PersonType]='1' OR [PersonType]='0'))
GO
ALTER TABLE [ikaros].[Contact] CHECK CONSTRAINT [CK_Contact_PersonType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Geburtsort des Schuldners' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'BirthPlace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennzeichnet die Sperrung der Schuldnerbearbeitung.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'Lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'eindeutiges Personenidentifizierungsmerkmal' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'UniqueIdentification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Läuft aktuell eine Adressermittlung für diesen Kontakt?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'InAddressSearch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gibt an, ob es sich um eine Privatperson handelt.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'Consumer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEPA-Gläubiger-ID' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'SepaCreditorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title of a contact' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The language of the contact' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'Language'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contact number of the contact from the legacy EDP system (for data transfers).' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'ContactRefNoOld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nationality of the Contact.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Contact', @level2type=N'COLUMN',@level2name=N'NationalityId'
GO
