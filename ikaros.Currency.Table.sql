USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Currency]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Currency](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](3) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[DefaultFactor] [numeric](12, 6) NOT NULL,
	[PercentageSurcharge] [numeric](12, 6) NULL,
	[AbsoluteSurcharge] [numeric](16, 2) NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Currency] ADD  CONSTRAINT [DF_Currency_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Currency] ADD  CONSTRAINT [DF_Currency_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Currency] ADD  CONSTRAINT [DF_Currency_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Currency] ADD  CONSTRAINT [DF_Currency_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Currency] ADD  CONSTRAINT [DF_Currency_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Currency]  WITH NOCHECK ADD  CONSTRAINT [CK_Currency_PercentageSurcharge_AbsoluteSurcharge] CHECK  (([PercentageSurcharge] IS NULL AND [AbsoluteSurcharge] IS NOT NULL OR [PercentageSurcharge] IS NOT NULL AND [AbsoluteSurcharge] IS NULL))
GO
ALTER TABLE [ikaros].[Currency] CHECK CONSTRAINT [CK_Currency_PercentageSurcharge_AbsoluteSurcharge]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the currency' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code of the currency' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Designation of the currency' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'Designation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default factor for currency conversion' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'DefaultFactor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Percentage surcharge charged after currency conversion' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'PercentageSurcharge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Absolute surcharge charged after currency conversion' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'AbsoluteSurcharge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The row has been inserted by this user' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Creation date of the row' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'CreationTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user which performed the last update on the row' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'LastUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time of the last update' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'LastUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Currency entry' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Currency'
GO
