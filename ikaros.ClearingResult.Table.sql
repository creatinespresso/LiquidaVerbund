USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[ClearingResult]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[ClearingResult](
	[ID] [uniqueidentifier] NOT NULL,
	[ClearingID] [uniqueidentifier] NOT NULL,
	[StageCategory] [char](1) NOT NULL,
	[VATRate] [numeric](5, 4) NOT NULL,
	[CostBurden] [ikaros].[amount] NULL,
	[TPMPayout] [ikaros].[amount] NULL,
	[TPMInvoice] [ikaros].[amount] NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[TaxFreeRevenues] [ikaros].[amount] NULL,
	[TaxableRevenues] [ikaros].[amount] NULL,
	[VATDifference] [ikaros].[amount] NULL,
	[CurrencyID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClearingResult] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[ClearingResult] ADD  CONSTRAINT [DF_ClearingResult_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[ClearingResult] ADD  CONSTRAINT [DF_ClearingResult_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[ClearingResult] ADD  CONSTRAINT [DF_ClearingResult_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[ClearingResult] ADD  CONSTRAINT [DF_ClearingResult_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[ClearingResult] ADD  CONSTRAINT [DF_ClearingResult_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[ClearingResult] ADD  CONSTRAINT [DF_ClearingResult_VATDifference]  DEFAULT ((0)) FOR [VATDifference]
GO
ALTER TABLE [ikaros].[ClearingResult]  WITH CHECK ADD  CONSTRAINT [FK_ClearingResult_Clearing] FOREIGN KEY([ClearingID])
REFERENCES [ikaros].[Clearing] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [ikaros].[ClearingResult] CHECK CONSTRAINT [FK_ClearingResult_Clearing]
GO
ALTER TABLE [ikaros].[ClearingResult]  WITH CHECK ADD  CONSTRAINT [FK_ClearingResult_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [ikaros].[Currency] ([ID])
GO
ALTER TABLE [ikaros].[ClearingResult] CHECK CONSTRAINT [FK_ClearingResult_Currency]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Differenz der MwSt. bei der Ermittlung des Wertes aus dem Nettobetrag.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'ClearingResult', @level2type=N'COLUMN',@level2name=N'VATDifference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the currency for ClearingResult.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'ClearingResult', @level2type=N'COLUMN',@level2name=N'CurrencyID'
GO
