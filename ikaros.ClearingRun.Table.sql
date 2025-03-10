USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[ClearingRun]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[ClearingRun](
	[ID] [uniqueidentifier] NOT NULL,
	[ClearingGroup] [nvarchar](2) NULL,
	[EndDate] [date] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[IncludingTPM] [ikaros].[boolean] NULL,
	[IncludingCostBurden] [ikaros].[boolean] NULL,
	[IncludingClosing] [ikaros].[boolean] NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[ClearingRunNumber] [int] NULL,
 CONSTRAINT [PK_ClearingRun] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[ClearingRun] ADD  CONSTRAINT [DF_ClearingRun_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[ClearingRun] ADD  CONSTRAINT [DF_ClearingRun_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[ClearingRun] ADD  CONSTRAINT [DF_ClearingRun_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[ClearingRun] ADD  CONSTRAINT [DF_ClearingRun_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[ClearingRun] ADD  CONSTRAINT [DF_ClearingRun_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Serial number for clearing run' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'ClearingRun', @level2type=N'COLUMN',@level2name=N'ClearingRunNumber'
GO
