USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Event]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Event](
	[ID] [uniqueidentifier] NOT NULL,
	[FinancialAccountID] [uniqueidentifier] NULL,
	[EventTemplateID] [uniqueidentifier] NOT NULL,
	[CCaseID] [uniqueidentifier] NOT NULL,
	[EventDate] [date] NOT NULL,
	[Variant] [char](1) NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Amount] [ikaros].[amount] NOT NULL,
	[OriginalAmount] [ikaros].[amount] NULL,
	[CostsInterestBearing] [ikaros].[amount] NOT NULL,
	[CostsInterestFree] [ikaros].[amount] NOT NULL,
	[Interest] [ikaros].[amount] NOT NULL,
	[PClaim] [ikaros].[amount] NOT NULL,
	[VoucherDate] [date] NULL,
	[VoucherNo] [nvarchar](50) NULL,
	[EnforceableByLaw] [ikaros].[boolean] NOT NULL,
	[PartialClaim] [ikaros].[amount] NULL,
	[VATRate] [numeric](5, 4) NULL,
	[JointAndSeveral] [ikaros].[boolean] NOT NULL,
	[Stage] [char](1) NOT NULL,
	[VoucherType] [nvarchar](50) NULL,
	[Court] [nvarchar](80) NULL,
	[Recipient] [char](1) NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[DocumentID] [nvarchar](100) NULL,
	[CurrencyConversionDifference] [ikaros].[amount] NULL,
	[CreationTime] [datetime] NOT NULL,
	[AdditionalRefNo] [nvarchar](30) NULL,
	[ClearingDueDate] [date] NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[ContractDate] [date] NULL,
	[EffectiveAnnualInterestRate] [numeric](6, 4) NULL,
	[Visible] [char](1) NOT NULL,
	[InterestClaimFromH46] [ikaros].[amount] NULL,
	[ContractType] [nvarchar](35) NULL,
	[FlatPostalCode] [nvarchar](5) NULL,
	[FlatCity] [nvarchar](27) NULL,
	[WflElementID] [uniqueidentifier] NULL,
	[DateSerialNo] [smallint] NULL,
	[VoucherDateSerialNo] [smallint] NULL,
	[Taxable] [ikaros].[boolean] NOT NULL,
	[BookingPeriod] [nvarchar](10) NULL,
	[UDF_Belegnr2] [nvarchar](255) NULL,
	[UDF_DOCNAME] [nvarchar](100) NULL,
	[UDF_PROCDATE] [datetime] NULL,
	[UDF_SAP_VG_DATE_IN] [date] NULL,
	[UDF_SAP_VG_DATE_OUT] [datetime] NULL,
	[UDF_SAP_VG_INKPS] [numeric](3, 0) NULL,
	[UDF_SAP_VG_LFDNR_IN] [numeric](6, 0) NULL,
	[UDF_SAP_VG_LFDNR_OUT] [numeric](6, 0) NULL,
	[UDF_SAP_VG_MELDEDAT] [date] NULL,
	[UDF_SAP_VG_OPBEL] [nvarchar](12) NULL,
	[UDF_SAP_VG_POSTYP] [nvarchar](1) NULL,
	[UDF_SAP_VG_RUDAT] [date] NULL,
	[UDF_SAP_VG_TXTVW] [nvarchar](80) NULL,
	[UDF_SAP_VG_WAERS] [nvarchar](5) NULL,
	[UDF_SAP_VG_ZZAGDAT] [date] NULL,
	[UDF_SAP_VG_ZZAGGRD] [nvarchar](2) NULL,
	[UDF_SAP_VG_ZZAUGBL] [nvarchar](12) NULL,
	[UDF_SAP_VG_ZZBLART] [nvarchar](2) NULL,
	[UDF_SAP_VG_ZZBUDAT] [date] NULL,
	[UDF_SAP_VG_ZZGBETR] [nvarchar](16) NULL,
	[UDF_SAP_VG_ZZMWSKZ] [nvarchar](2) NULL,
	[UDF_SAP_VG_ZZOPTXT] [nvarchar](50) NULL,
	[UDF_SAP_VG_ZZSALDO] [numeric](12, 2) NULL,
	[UDF_SAP_VG_ZZSCTAX] [nvarchar](16) NULL,
	[UDF_TS_EMAIL] [datetime] NULL,
	[HiddenInLCS] [ikaros].[boolean] NOT NULL,
	[UDF_SAP_VG_ZZ_PAKETID] [nvarchar](30) NULL,
	[UDF_SAP_VG_ZZ_KDCRDAT] [datetime] NULL,
	[UDF_ImportWS_FollowUp_EventCode] [nvarchar](10) NULL,
	[UDF_Event_ImportWS_FollowUp] [bit] NULL,
	[ClearingNo] [nvarchar](12) NULL,
	[UDF_Mahnstufe] [int] NULL,
	[UDF_FOA_HTMLTEXT_MAHNUNG_PER_MAIL] [nvarchar](max) NULL,
	[Currency] [nvarchar](3) NULL,
	[OriginalCurrencyID] [uniqueidentifier] NULL,
	[UDF_epost_steuerdatei] [nvarchar](4000) NULL,
	[UDF_epost_premiumadressid] [char](16) NULL,
	[UDF_DMS_Freigabe] [bit] NULL,
	[UDF_OLDID] [uniqueidentifier] NULL,
	[UDF_Interne_Mandanteninformation1] [nvarchar](50) NULL,
	[UDF_Interne_Mandanteninformation2] [nvarchar](50) NULL,
	[UDF_Interne_Mandanteninformation3] [nvarchar](50) NULL,
	[UDF_Interne_Mandanteninformation4] [numeric](16, 2) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Event_EventIDCCaseID] UNIQUE NONCLUSTERED 
(
	[ID] ASC,
	[CCaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_CostsInterestBearing]  DEFAULT ((0)) FOR [CostsInterestBearing]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_CostsInterestFree]  DEFAULT ((0)) FOR [CostsInterestFree]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_Interest]  DEFAULT ((0)) FOR [Interest]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_PClaim]  DEFAULT ((0)) FOR [PClaim]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_EnforceableByLaw]  DEFAULT ((1)) FOR [EnforceableByLaw]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_JointAndSeveral]  DEFAULT ((1)) FOR [JointAndSeveral]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_taxable]  DEFAULT ([ikaros].[GetFalse]()) FOR [Taxable]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF__Event__UDF_SAP_V__53640638]  DEFAULT ((0)) FOR [UDF_SAP_VG_INKPS]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF__Event__UDF_SAP_V__54582A71]  DEFAULT ((0)) FOR [UDF_SAP_VG_LFDNR_IN]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF__Event__UDF_SAP_V__554C4EAA]  DEFAULT ((0)) FOR [UDF_SAP_VG_LFDNR_OUT]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF__Event__UDF_SAP_V__564072E3]  DEFAULT ((0)) FOR [UDF_SAP_VG_ZZSALDO]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF_Event_HiddenInLCS]  DEFAULT ([ikaros].[GetFalse]()) FOR [HiddenInLCS]
GO
ALTER TABLE [ikaros].[Event] ADD  CONSTRAINT [DF__Event__UDF_Event__538EEEC1]  DEFAULT ((0)) FOR [UDF_Event_ImportWS_FollowUp]
GO
ALTER TABLE [ikaros].[Event] ADD  DEFAULT ((0)) FOR [UDF_Mahnstufe]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_BookingPeriod] FOREIGN KEY([BookingPeriod])
REFERENCES [ikaros].[BookingPeriod] ([Designation])
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [FK_Event_BookingPeriod]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_CCase] FOREIGN KEY([CCaseID])
REFERENCES [ikaros].[CCase] ([ID])
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [FK_Event_CCase]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Currency] FOREIGN KEY([OriginalCurrencyID])
REFERENCES [ikaros].[Currency] ([ID])
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [FK_Event_Currency]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventTemplate] FOREIGN KEY([EventTemplateID])
REFERENCES [ikaros].[EventTemplate] ([ID])
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [FK_Event_EventTemplate]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_FinancialAccount] FOREIGN KEY([FinancialAccountID])
REFERENCES [ikaros].[FinancialAccount] ([ID])
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [FK_Event_FinancialAccount]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_LookUpCaseStage] FOREIGN KEY([Stage])
REFERENCES [ikaros].[LookUpCaseStage] ([Value])
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [FK_Event_LookUpCaseStage]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_WflElement] FOREIGN KEY([WflElementID])
REFERENCES [ikaros].[WflElement] ([ID])
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [FK_Event_WflElement]
GO
ALTER TABLE [ikaros].[Event]  WITH CHECK ADD  CONSTRAINT [CK_Event_ID] CHECK  (([ID]<>'00000000-0000-0000-0000-000000000000'))
GO
ALTER TABLE [ikaros].[Event] CHECK CONSTRAINT [CK_Event_ID]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used for voucher types.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'VoucherType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gibt an ob der Vorgang als Dienstleistung zu Versteuern ist.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Taxable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bezeichnung der Buchungsperiode, die dem Vorgang zugeordnet ist.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'BookingPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gibt an, ob ein Vorgang in der FoA unsichtbar sein soll.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'HiddenInLCS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clearing number of the single clearing.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'ClearingNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the original currency of the event' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'OriginalCurrencyID'
GO
