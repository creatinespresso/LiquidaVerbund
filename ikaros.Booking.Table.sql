USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Booking]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Booking](
	[ID] [uniqueidentifier] NOT NULL,
	[EventID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[OIID] [uniqueidentifier] NOT NULL,
	[Amount] [ikaros].[amount] NOT NULL,
	[VAT] [ikaros].[amount] NOT NULL,
	[RealCosts] [ikaros].[amount] NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[InvoiceID] [uniqueidentifier] NULL,
	[UDF_SAP_BU_DATE_OUT] [datetime] NULL,
	[UDF_SAP_BU_LFDNR_OUT] [numeric](6, 0) NULL,
	[IsDedicated] [ikaros].[boolean] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_Amount]  DEFAULT ((0.0)) FOR [Amount]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_VAT]  DEFAULT ((0)) FOR [VAT]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF__Booking__UDF_SAP__7F7792A0]  DEFAULT ((0)) FOR [UDF_SAP_BU_LFDNR_OUT]
GO
ALTER TABLE [ikaros].[Booking] ADD  CONSTRAINT [DF_Booking_IsDedicated]  DEFAULT ((0)) FOR [IsDedicated]
GO
ALTER TABLE [ikaros].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Account] FOREIGN KEY([AccountID])
REFERENCES [ikaros].[Account] ([ID])
GO
ALTER TABLE [ikaros].[Booking] CHECK CONSTRAINT [FK_Booking_Account]
GO
ALTER TABLE [ikaros].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_ContactBooking] FOREIGN KEY([InvoiceID])
REFERENCES [ikaros].[ContactBooking] ([ID])
GO
ALTER TABLE [ikaros].[Booking] CHECK CONSTRAINT [FK_Booking_ContactBooking]
GO
ALTER TABLE [ikaros].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Event] FOREIGN KEY([EventID])
REFERENCES [ikaros].[Event] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [ikaros].[Booking] CHECK CONSTRAINT [FK_Booking_Event]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether the booking is a dedicated part of a dedicated payment.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Booking', @level2type=N'COLUMN',@level2name=N'IsDedicated'
GO
