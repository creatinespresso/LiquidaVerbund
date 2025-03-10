USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[BankAccount]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[BankAccount](
	[ID] [uniqueidentifier] NOT NULL,
	[ContactID] [uniqueidentifier] NOT NULL,
	[Bank] [nvarchar](150) NULL,
	[AccountHolder] [nvarchar](70) NULL,
	[EBankingInitiator] [ikaros].[boolean] NOT NULL,
	[Annex1] [nvarchar](25) NULL,
	[Annex2] [nvarchar](25) NULL,
	[Annex3] [nvarchar](25) NULL,
	[Memo] [nvarchar](max) NULL,
	[Active] [ikaros].[boolean] NOT NULL,
	[EntrySerialNo] [smallint] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[ValidTo] [date] NULL,
	[AccountNo1] [nvarchar](50) NULL,
	[AccountNo2] [nvarchar](50) NULL,
	[AccountNo3] [nvarchar](50) NULL,
	[BankCode1] [nvarchar](20) NULL,
	[BankCode2] [nvarchar](20) NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
	[DifferentAccountHolderId] [uniqueidentifier] NULL,
	[AccountType] [nvarchar](15) NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_EBankingInitiator]  DEFAULT ([ikaros].[GetFalse]()) FOR [EBankingInitiator]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_Active]  DEFAULT ([ikaros].[GetTrue]()) FOR [Active]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_EntrySerialNo]  DEFAULT ((0)) FOR [EntrySerialNo]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[BankAccount] ADD  CONSTRAINT [DF_BankAccount_AccountType]  DEFAULT ('CLASSIC') FOR [AccountType]
GO
ALTER TABLE [ikaros].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_AccountType] FOREIGN KEY([AccountType])
REFERENCES [ikaros].[BankAccountType] ([AccountType])
GO
ALTER TABLE [ikaros].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_AccountType]
GO
ALTER TABLE [ikaros].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Contact] FOREIGN KEY([ContactID])
REFERENCES [ikaros].[Contact] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [ikaros].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Contact]
GO
ALTER TABLE [ikaros].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Country] FOREIGN KEY([CountryId])
REFERENCES [ikaros].[Country] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [ikaros].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Country]
GO
ALTER TABLE [ikaros].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_DifferentAccountHolderId] FOREIGN KEY([DifferentAccountHolderId])
REFERENCES [ikaros].[Contact] ([ID])
GO
ALTER TABLE [ikaros].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_DifferentAccountHolderId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennung der Bankverbindung' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennung des zugehörigen Kontakts' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'ContactID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name der Bank' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'Bank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kontoinhaber' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'AccountHolder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-Banking-Auftraggeber' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'EBankingInitiator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zusätzliches Feld 1' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'Annex1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zusätzliches Feld 2' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'Annex2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zusätzliches Feld 3' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'Annex3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Notiz' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ist diese Bankverbindung aktiv?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Laufende Nummer' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'EntrySerialNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ersteller' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Erstellt am' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'CreationTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Letzter Benutzer' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'LastUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Letzte Änderung am' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'LastUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bankverbindung ist gültig bis' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'ValidTo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kontonummer 1' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'AccountNo1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kontonummer 2' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'AccountNo2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kontonummer 3' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'AccountNo3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Banknummer 1' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'BankCode1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Banknummer 2' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'BankCode2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennung Land' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'CountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennung abweichender Kontoinhaber' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'DifferentAccountHolderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bankverbindungen' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'BankAccount'
GO
