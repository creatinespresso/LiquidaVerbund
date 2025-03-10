USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Clearing]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Clearing](
	[ID] [uniqueidentifier] NOT NULL,
	[ClearingRunID] [uniqueidentifier] NOT NULL,
	[ClientID] [uniqueidentifier] NOT NULL,
	[TPMClearingTime] [datetime] NULL,
	[CostBurdenClearingTime] [datetime] NULL,
	[ApprovalTime] [datetime] NULL,
	[ClosingReportingDate] [datetime] NULL,
	[InvoiceNo] [nvarchar](12) NULL,
	[OIAllocation] [ikaros].[amount] NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[BookingTime] [datetime] NULL,
	[UDF_clearing_htm_processed] [bit] NOT NULL,
	[ClearingNo] [nvarchar](12) NULL,
	[ClearingClientID] [uniqueidentifier] NOT NULL,
	[ClearingLayoutID] [uniqueidentifier] NOT NULL,
	[ClearingScriptExecutionTime] [datetime] NULL,
	[FaultyReports] [nvarchar](256) NULL,
 CONSTRAINT [PK_Clearing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Clearing] ADD  CONSTRAINT [DF_Clearing_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Clearing] ADD  CONSTRAINT [DF_Clearing_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Clearing] ADD  CONSTRAINT [DF_Clearing_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Clearing] ADD  CONSTRAINT [DF_Clearing_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Clearing] ADD  CONSTRAINT [DF_Clearing_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Clearing] ADD  CONSTRAINT [DF__Clearing__UDF_cl__50728AF4]  DEFAULT ((0)) FOR [UDF_clearing_htm_processed]
GO
ALTER TABLE [ikaros].[Clearing]  WITH CHECK ADD  CONSTRAINT [FK_Clearing_ClearingClient] FOREIGN KEY([ClientID])
REFERENCES [ikaros].[Client] ([ContactID])
GO
ALTER TABLE [ikaros].[Clearing] CHECK CONSTRAINT [FK_Clearing_ClearingClient]
GO
ALTER TABLE [ikaros].[Clearing]  WITH CHECK ADD  CONSTRAINT [FK_Clearing_ClearingRun] FOREIGN KEY([ClearingRunID])
REFERENCES [ikaros].[ClearingRun] ([ID])
GO
ALTER TABLE [ikaros].[Clearing] CHECK CONSTRAINT [FK_Clearing_ClearingRun]
GO
ALTER TABLE [ikaros].[Clearing]  WITH CHECK ADD  CONSTRAINT [FK_Clearing_Client] FOREIGN KEY([ClientID])
REFERENCES [ikaros].[Client] ([ContactID])
GO
ALTER TABLE [ikaros].[Clearing] CHECK CONSTRAINT [FK_Clearing_Client]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clearing number of the collective clearing.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Clearing', @level2type=N'COLUMN',@level2name=N'ClearingNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shows the clearing client id.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Clearing', @level2type=N'COLUMN',@level2name=N'ClearingClientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shows the clearing layout id.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Clearing', @level2type=N'COLUMN',@level2name=N'ClearingLayoutID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains the execution time of the clearing script.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Clearing', @level2type=N'COLUMN',@level2name=N'ClearingScriptExecutionTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Faulty reports of clearing.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Clearing', @level2type=N'COLUMN',@level2name=N'FaultyReports'
GO
