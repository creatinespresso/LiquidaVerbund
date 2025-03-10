USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[ContactReferenceType]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[ContactReferenceType](
	[ID] [uniqueidentifier] NOT NULL,
	[ContactReferenceGroupID] [uniqueidentifier] NOT NULL,
	[TypeCode] [nvarchar](5) NOT NULL,
	[Designation] [nvarchar](30) NOT NULL,
	[RefNoDesignation] [nvarchar](30) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ContactReferenceType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[ContactReferenceType] ADD  CONSTRAINT [DF_ContactReferenceType_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[ContactReferenceType] ADD  CONSTRAINT [DF_ContactReferenceType_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[ContactReferenceType] ADD  CONSTRAINT [DF_ContactReferenceType_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[ContactReferenceType] ADD  CONSTRAINT [DF_ContactReferenceType_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[ContactReferenceType] ADD  CONSTRAINT [DF_ContactReferenceType_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[ContactReferenceType]  WITH CHECK ADD  CONSTRAINT [FK_ContactReferenceType_ContactReferenceGroup] FOREIGN KEY([ContactReferenceGroupID])
REFERENCES [ikaros].[ContactReferenceGroup] ([ID])
GO
ALTER TABLE [ikaros].[ContactReferenceType] CHECK CONSTRAINT [FK_ContactReferenceType_ContactReferenceGroup]
GO
