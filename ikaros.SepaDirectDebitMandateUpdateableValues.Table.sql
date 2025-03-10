USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[SepaDirectDebitMandateUpdateableValues]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues](
	[Id] [uniqueidentifier] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[SepaDirectDebitMandateId] [uniqueidentifier] NOT NULL,
	[ReportedToBank] [ikaros].[boolean] NOT NULL,
	[Reference] [nvarchar](35) NOT NULL,
	[SepaCreditorId] [nvarchar](35) NOT NULL,
	[SepaCreditorName] [nvarchar](70) NOT NULL,
	[CCaseEventId] [uniqueidentifier] NULL,
	[ContactEventId] [uniqueidentifier] NULL,
	[TargetIBAN] [nvarchar](34) NOT NULL,
	[TargetBIC] [nvarchar](11) NULL,
 CONSTRAINT [PK_SEPADIRECTDEBITMANDATEUPDATEABLEVALUES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] ADD  CONSTRAINT [DF_SepaDirectDebitMandateUpdateableValues_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] ADD  CONSTRAINT [DF_SepaDirectDebitMandateUpdateableValues_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] ADD  CONSTRAINT [DF_SepaDirectDebitMandateUpdateableValues_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] ADD  CONSTRAINT [DF_SepaDirectDebitMandateUpdateableValues_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] ADD  CONSTRAINT [DF_SepaDirectDebitMandateUpdateableValues_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] ADD  CONSTRAINT [DF_SepaDirectDebitMandateUpdateableValues_ReportedToBank]  DEFAULT ([ikaros].[GetFalse]()) FOR [ReportedToBank]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues]  WITH CHECK ADD  CONSTRAINT [FK_SepaDirectDebitMandateUpdateableValues_ContactEvent] FOREIGN KEY([ContactEventId])
REFERENCES [ikaros].[ContactEvent] ([ID])
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] CHECK CONSTRAINT [FK_SepaDirectDebitMandateUpdateableValues_ContactEvent]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues]  WITH CHECK ADD  CONSTRAINT [FK_SepaDirectDebitMandateUpdateableValues_Event] FOREIGN KEY([CCaseEventId])
REFERENCES [ikaros].[Event] ([ID])
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] CHECK CONSTRAINT [FK_SepaDirectDebitMandateUpdateableValues_Event]
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues]  WITH CHECK ADD  CONSTRAINT [FK_SepaDirectDebitMandateUpdateableValues_SepaDirectDebitMandate] FOREIGN KEY([SepaDirectDebitMandateId])
REFERENCES [ikaros].[SepaDirectDebitMandate] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ikaros].[SepaDirectDebitMandateUpdateableValues] CHECK CONSTRAINT [FK_SepaDirectDebitMandateUpdateableValues_SepaDirectDebitMandate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zu welchem Mandat gehören diese Details' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'SepaDirectDebitMandateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Wurde die Änderung an die Bank gemeldet?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'ReportedToBank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unter welcher Referenz kann auf das Mandat zugegriffen werden?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'Reference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Die dem Zahlungspflichtigen gegenüber verwendete SEPA-Gläubiger-ID.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'SepaCreditorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name des Zahlungsempfängers, der sich ggf. ändern kann und dann an die Bank gemeldet wird.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'SepaCreditorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Aktenvorgang, in dem das Mandat erfasst werden kann.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'CCaseEventId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kontakt, in dem das Mandat erfasst werden kann.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'ContactEventId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IBAN von der eingezogen werden soll' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'TargetIBAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'BIC von der eingezogen werden soll' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues', @level2type=N'COLUMN',@level2name=N'TargetBIC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Historische Werte zu SEPA-Lastschrift-Mandaten' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'SepaDirectDebitMandateUpdateableValues'
GO
