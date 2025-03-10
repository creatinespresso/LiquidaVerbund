USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Account]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Account](
	[ID] [uniqueidentifier] NOT NULL,
	[Designation] [nvarchar](30) NOT NULL,
	[MainAccount] [nvarchar](50) NOT NULL,
	[SerialNo] [numeric](4, 0) NULL,
	[AccountCode] [nvarchar](10) NOT NULL,
	[CaseHistory] [ikaros].[boolean] NOT NULL,
	[ContactHistory] [ikaros].[boolean] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[TPMRecipient] [char](1) NULL,
	[RelevantForRealCosts] [ikaros].[boolean] NOT NULL,
	[AccountServiceID] [uniqueidentifier] NULL,
	[UDF_Acc_BuhaKonto] [nvarchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_CaseHistory]  DEFAULT ((1)) FOR [CaseHistory]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_ContactHistory]  DEFAULT ((1)) FOR [ContactHistory]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Account] ADD  CONSTRAINT [DF_Account_RelevantForRealCosts]  DEFAULT ((0)) FOR [RelevantForRealCosts]
GO
ALTER TABLE [ikaros].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountServiceID] FOREIGN KEY([AccountServiceID])
REFERENCES [ikaros].[Account] ([ID])
GO
ALTER TABLE [ikaros].[Account] CHECK CONSTRAINT [FK_Account_AccountServiceID]
GO
ALTER TABLE [ikaros].[Account]  WITH CHECK ADD  CONSTRAINT [CK_Account_TPMRecipient] CHECK  (([TPMRecipient] IS NULL OR ([TPMRecipient]='R' OR [TPMRecipient]='G' OR [TPMRecipient]='S' OR [TPMRecipient]='I')))
GO
ALTER TABLE [ikaros].[Account] CHECK CONSTRAINT [CK_Account_TPMRecipient]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennung des zugeordneten Kontos für Dienstleistungen' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'AccountServiceID'
GO
