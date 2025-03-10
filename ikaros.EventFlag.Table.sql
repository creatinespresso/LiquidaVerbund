USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[EventFlag]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[EventFlag](
	[ID] [uniqueidentifier] NOT NULL,
	[EventID] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
	[ReferenceID] [uniqueidentifier] NULL,
	[RefNo] [nvarchar](50) NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_EventFlag] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[EventFlag] ADD  CONSTRAINT [DF_EventFlag_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[EventFlag] ADD  CONSTRAINT [DF_EventFlag_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[EventFlag] ADD  CONSTRAINT [DF_EventFlag_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[EventFlag] ADD  CONSTRAINT [DF_EventFlag_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[EventFlag] ADD  CONSTRAINT [DF_EventFlag_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[EventFlag]  WITH CHECK ADD  CONSTRAINT [FK_EventFlag_Event] FOREIGN KEY([EventID])
REFERENCES [ikaros].[Event] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [ikaros].[EventFlag] CHECK CONSTRAINT [FK_EventFlag_Event]
GO
