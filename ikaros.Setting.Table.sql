USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Setting]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Setting](
	[ID] [uniqueidentifier] NOT NULL,
	[SettingName] [nvarchar](30) NOT NULL,
	[Value] [nvarchar](500) NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Application] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BasicChangeable] [ikaros].[boolean] NOT NULL,
	[Standard] [bit] NOT NULL,
	[AdditionalData] [nvarchar](max) NULL,
	[Label] [nvarchar](256) NULL,
	[Tooltip] [nvarchar](256) NULL,
	[DataType] [nvarchar](32) NULL,
	[Pattern] [nvarchar](256) NULL,
	[Encryption] [ikaros].[boolean] NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_Application]  DEFAULT ('') FOR [Application]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_BasicChangeable]  DEFAULT ((1)) FOR [BasicChangeable]
GO
ALTER TABLE [ikaros].[Setting] ADD  CONSTRAINT [DF_Setting_Standard]  DEFAULT ((0)) FOR [Standard]
GO
ALTER TABLE [ikaros].[Setting] ADD  DEFAULT ((0)) FOR [Encryption]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the variable' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'SettingName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value of the system variable' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The row has been inserted by this user' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Creation date of the row' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'CreationTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The user which performed the last update on the row' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'LastUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time of the last update' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'LastUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Application'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the variable' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines, whether a setting is one of the standard settings. This is not depending on the value.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Standard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to specify the data type, to restrict the data that can be entered, depending on the data type and to provide additional information, such as service methods for pickers.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'AdditionalData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to the string resource for the label translation in the dialog.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to the string resource for the tooltip translation in the dialog.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Tooltip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The datatype of the setting value.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'DataType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The pattern of the setting value which should be displayed.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to specify if the value of the setting is encrypted.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting', @level2type=N'COLUMN',@level2name=N'Encryption'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System-related settings' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Setting'
GO
