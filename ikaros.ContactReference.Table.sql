USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[ContactReference]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[ContactReference](
	[ID] [uniqueidentifier] NOT NULL,
	[ContactReferenceTypeID] [uniqueidentifier] NOT NULL,
	[SourceContactID] [uniqueidentifier] NOT NULL,
	[TargetContactID] [uniqueidentifier] NOT NULL,
	[RefNo] [nvarchar](40) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[ValidTo] [datetime] NULL,
 CONSTRAINT [PK_ContactReference] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[ContactReference] ADD  CONSTRAINT [DF_ContactReference_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[ContactReference] ADD  CONSTRAINT [DF_ContactReference_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[ContactReference] ADD  CONSTRAINT [DF_ContactReference_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[ContactReference] ADD  CONSTRAINT [DF_ContactReference_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[ContactReference] ADD  CONSTRAINT [DF_ContactReference_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[ContactReference]  WITH CHECK ADD  CONSTRAINT [FK_ContactReference_Contact] FOREIGN KEY([SourceContactID])
REFERENCES [ikaros].[Contact] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [ikaros].[ContactReference] CHECK CONSTRAINT [FK_ContactReference_Contact]
GO
ALTER TABLE [ikaros].[ContactReference]  WITH CHECK ADD  CONSTRAINT [FK_ContactReference_Contact1] FOREIGN KEY([TargetContactID])
REFERENCES [ikaros].[Contact] ([ID])
GO
ALTER TABLE [ikaros].[ContactReference] CHECK CONSTRAINT [FK_ContactReference_Contact1]
GO
ALTER TABLE [ikaros].[ContactReference]  WITH CHECK ADD  CONSTRAINT [FK_ContactReference_ContactReferenceType] FOREIGN KEY([ContactReferenceTypeID])
REFERENCES [ikaros].[ContactReferenceType] ([ID])
GO
ALTER TABLE [ikaros].[ContactReference] CHECK CONSTRAINT [FK_ContactReference_ContactReferenceType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Date this contact reference becomes invalid' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'ContactReference', @level2type=N'COLUMN',@level2name=N'ValidTo'
GO
