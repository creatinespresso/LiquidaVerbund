USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[Client]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[Client](
	[ContactID] [uniqueidentifier] NOT NULL,
	[ClearingGroup] [nvarchar](2) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Clerk] [nvarchar](32) NULL,
	[Seller] [nvarchar](32) NULL,
	[PClaimCode] [nvarchar](5) NULL,
	[PClaimArrearsTerm] [numeric](3, 0) NULL,
	[PClaimConsumerIntRate] [numeric](5, 2) NULL,
	[PClaimConsumerBaseRate] [ikaros].[boolean] NOT NULL,
	[ClientExpenses] [numeric](5, 2) NOT NULL,
	[PaymentAllocation] [char](1) NULL,
	[Cession] [ikaros].[boolean] NOT NULL,
	[AccountManagementCharge] [numeric](5, 2) NULL,
	[AccManagementChargeAccountID] [uniqueidentifier] NOT NULL,
	[PlaintiffRefNoVoucher] [nvarchar](8) NULL,
	[PlaintiffRefNoDTA] [nvarchar](8) NULL,
	[PreTaxAttribute] [char](1) NOT NULL,
	[VATSerialNo] [nvarchar](15) NULL,
	[CostContractID] [uniqueidentifier] NULL,
	[PClaimCompanyIntRate] [numeric](5, 2) NULL,
	[PClaimCompanyBaseRate] [ikaros].[boolean] NOT NULL,
	[StartEventID] [uniqueidentifier] NULL,
	[ClientNo] [numeric](12, 0) NOT NULL,
	[ClientSinceDate] [date] NULL,
	[Charge] [ikaros].[amount] NULL,
	[ChargeDueDate] [date] NULL,
	[LegalProceedingsMinimum] [ikaros].[amount] NULL,
	[PCommContractID] [uniqueidentifier] NOT NULL,
	[ClearingLayoutID] [uniqueidentifier] NOT NULL,
	[ClearingTransfer] [ikaros].[boolean] NOT NULL,
	[ClearingDirectDebit] [ikaros].[boolean] NOT NULL,
	[CancellationNoticeDate] [date] NULL,
	[SCHUFAInitialRegistration] [nvarchar](2) NULL,
	[SCHUFAPerformanceOfTasks] [ikaros].[boolean] NOT NULL,
	[SCHUFACodeWithUpdate] [nvarchar](30) NULL,
	[SCHUFACodeWithoutUpdate] [nvarchar](30) NULL,
	[SCHUFAPasswordWithUpdate] [nvarchar](30) NULL,
	[SCHUFAPasswordWithoutUpdate] [nvarchar](30) NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[UDF_DCANegativeFlatRatePayment] [numeric](5, 2) NULL,
	[UDF_LawyerNegFlatRatePayment] [numeric](5, 2) NULL,
	[ImportSummary] [ikaros].[boolean] NOT NULL,
	[ClrLetterContEvtTemplateID] [uniqueidentifier] NULL,
	[LegalVenue] [nvarchar](7) NULL,
	[SCHUFAToBeReported] [ikaros].[boolean] NOT NULL,
	[SCHUFAToBeReportedImmediately] [ikaros].[boolean] NOT NULL,
	[SCHUFAUpdateCode] [ikaros].[boolean] NOT NULL,
	[DTARefNoAsHeaderRefNo] [ikaros].[boolean] NOT NULL,
	[SCHUFAClientGroupCode] [nvarchar](5) NULL,
	[AutoPaymentReallocation] [ikaros].[boolean] NOT NULL,
	[WflContractID] [uniqueidentifier] NULL,
	[LegalProceedingsWithCreditLaw] [ikaros].[boolean] NOT NULL,
	[BankAccUsageTypeDCATransfer] [uniqueidentifier] NULL,
	[BankAccUsageTypeDCADirectDebit] [uniqueidentifier] NULL,
	[UDF_ABR_FG_AUCH_PDF_EMAIL] [nvarchar](100) NULL,
	[UDF_ABR_FG_DATEI_EMAIL] [nvarchar](100) NULL,
	[UDF_ABR_FG_NUR_PDF_EMAIL] [nvarchar](100) NULL,
	[UDF_ABR_HINWEIS] [nvarchar](2000) NULL,
	[UDF_ABR_KOST_AUCH_PDF_EMAIL] [nvarchar](100) NULL,
	[UDF_ABR_KOST_DATEI_EMAIL] [nvarchar](100) NULL,
	[UDF_ABR_KOST_NUR_PDF_EMAIL] [nvarchar](100) NULL,
	[UDF_ABR_UST_AUCH_PDF_EMAIL] [nvarchar](100) NULL,
	[UDF_ABR_UST_NUR_PDF_EMAIL] [nvarchar](100) NULL,
	[UDF_ABRANSCHREIBEN] [ikaros].[boolean] NULL,
	[UDF_Auslandspartner] [nvarchar](3) NULL,
	[UDF_EC_Lastschrift] [ikaros].[boolean] NULL,
	[UDF_G0011] [ikaros].[boolean] NULL,
	[UDF_G0013] [ikaros].[boolean] NULL,
	[UDF_G01] [ikaros].[boolean] NULL,
	[UDF_G01RE] [ikaros].[boolean] NULL,
	[UDF_G1011] [ikaros].[boolean] NULL,
	[UDF_G1013] [ikaros].[boolean] NULL,
	[UDF_G11RE] [ikaros].[boolean] NULL,
	[UDF_GL_A09_EV] [ikaros].[boolean] NULL,
	[UDF_GL_AbgUEAT] [ikaros].[boolean] NULL,
	[UDF_GL_II19_kleinerHF] [numeric](5, 0) NULL,
	[UDF_GL_R4280] [ikaros].[boolean] NULL,
	[UDF_GL_R4280_WVTage] [numeric](3, 0) NULL,
	[UDF_GL_R4285] [ikaros].[boolean] NULL,
	[UDF_GL_R4285_WVTage] [numeric](3, 0) NULL,
	[UDF_GL_R4290] [ikaros].[boolean] NULL,
	[UDF_GL_R4290_WVTage] [numeric](3, 0) NULL,
	[UDF_GL_R56_Prozent] [numeric](6, 2) NULL,
	[UDF_GL_S41] [ikaros].[boolean] NULL,
	[UDF_GL_UEAT_Anschreiben] [ikaros].[boolean] NULL,
	[UDF_HF_Verrechnen] [ikaros].[boolean] NULL,
	[UDF_IFS_MELDEN] [ikaros].[boolean] NULL,
	[UDF_K16G] [ikaros].[boolean] NULL,
	[UDF_KFK] [ikaros].[boolean] NULL,
	[UDF_Mandant_Abgabe_AP] [nvarchar](3) NULL,
	[UDF_mandant_aktiv] [ikaros].[boolean] NULL,
	[UDF_Mandant_BIC] [nvarchar](11) NULL,
	[UDF_Mandant_IBAN] [nvarchar](34) NULL,
	[UDF_maxraten] [int] NULL,
	[UDF_N01G] [ikaros].[boolean] NULL,
	[UDF_quick_k01] [ikaros].[boolean] NULL,
	[UDF_quick_R02Q] [ikaros].[boolean] NULL,
	[UDF_quick_zinsen] [ikaros].[boolean] NULL,
	[UDF_quickpreis] [numeric](5, 2) NULL,
	[UDF_quickpunkte] [int] NULL,
	[UDF_R09_WV_GL] [ikaros].[boolean] NULL,
	[UDF_RA_Inkasso] [ikaros].[boolean] NULL,
	[UDF_S01_FR_1] [numeric](3, 0) NULL,
	[UDF_S01_FR_2] [numeric](3, 0) NULL,
	[UDF_S01_FR_3] [numeric](3, 0) NULL,
	[UDF_S01_FR_4] [numeric](3, 0) NULL,
	[UDF_S01_FR_5] [numeric](3, 0) NULL,
	[UDF_S01_FR_6] [numeric](3, 0) NULL,
	[UDF_S01_FR_7] [numeric](3, 0) NULL,
	[UDF_S01_HF_1] [numeric](12, 2) NULL,
	[UDF_S01_HF_2] [numeric](12, 2) NULL,
	[UDF_S01_HF_3] [numeric](12, 2) NULL,
	[UDF_S01_HF_4] [numeric](12, 2) NULL,
	[UDF_S01_HF_5] [numeric](12, 2) NULL,
	[UDF_S01_HF_6] [numeric](12, 2) NULL,
	[UDF_S01_HF_7] [numeric](12, 2) NULL,
	[UDF_S01_STANDARD] [ikaros].[boolean] NULL,
	[UDF_S01_WV_1] [nvarchar](5) NULL,
	[UDF_S01_WV_2] [nvarchar](5) NULL,
	[UDF_S01_WV_3] [nvarchar](5) NULL,
	[UDF_S01_WV_4] [nvarchar](5) NULL,
	[UDF_S01_WV_5] [nvarchar](5) NULL,
	[UDF_S01_WV_6] [nvarchar](5) NULL,
	[UDF_S01_WV_7] [nvarchar](5) NULL,
	[UDF_S02_FR_1] [numeric](3, 0) NULL,
	[UDF_S02_FR_2] [numeric](3, 0) NULL,
	[UDF_S02_FR_3] [numeric](3, 0) NULL,
	[UDF_S02_FR_4] [numeric](3, 0) NULL,
	[UDF_S02_FR_5] [numeric](3, 0) NULL,
	[UDF_S02_FR_6] [numeric](3, 0) NULL,
	[UDF_S02_FR_7] [numeric](3, 0) NULL,
	[UDF_S02_HF_1] [numeric](12, 2) NULL,
	[UDF_S02_HF_2] [numeric](12, 2) NULL,
	[UDF_S02_HF_3] [numeric](12, 2) NULL,
	[UDF_S02_HF_4] [numeric](12, 2) NULL,
	[UDF_S02_HF_5] [numeric](12, 2) NULL,
	[UDF_S02_HF_6] [numeric](12, 2) NULL,
	[UDF_S02_HF_7] [numeric](12, 2) NULL,
	[UDF_S02_STANDARD] [ikaros].[boolean] NULL,
	[UDF_S02_WV_1] [nvarchar](5) NULL,
	[UDF_S02_WV_2] [nvarchar](5) NULL,
	[UDF_S02_WV_3] [nvarchar](5) NULL,
	[UDF_S02_WV_4] [nvarchar](5) NULL,
	[UDF_S02_WV_5] [nvarchar](5) NULL,
	[UDF_S02_WV_6] [nvarchar](5) NULL,
	[UDF_S02_WV_7] [nvarchar](5) NULL,
	[UDF_SAP_BUKRS] [nvarchar](4) NULL,
	[UDF_SAP_INKGP] [nvarchar](10) NULL,
	[UDF_SAP_LASTDATE_IN] [date] NULL,
	[UDF_SAP_LASTDATE_OUT] [datetime] NULL,
	[UDF_SAP_LFDNR_IN] [numeric](6, 0) NULL,
	[UDF_SAP_LFDNR_OUT] [numeric](6, 0) NULL,
	[UDF_SAP_MANDT] [nvarchar](3) NULL,
	[UDF_TAGAUSZ] [ikaros].[boolean] NULL,
	[UDF_VWZ_ABRECHNUNG] [nvarchar](100) NULL,
	[UDF_Zusatz_FG] [nvarchar](200) NULL,
	[UDF_Zusatz_KO] [nvarchar](200) NULL,
	[UDF_Zusatz_UST] [nvarchar](200) NULL,
	[UDF_Zusatz_ZF] [nvarchar](200) NULL,
	[UDF_Client_Kreditoren_Konto] [nvarchar](10) NULL,
	[UDF_Client_Debitoren_Konto] [nvarchar](10) NULL,
	[UDF_Client_IH_Konto] [nvarchar](10) NULL,
	[UDF_Client_RH_Konto] [nvarchar](10) NULL,
	[UDF_Client_EP_Konto] [nvarchar](10) NULL,
	[UDF_N01] [ikaros].[boolean] NULL,
	[UDF_ISTAUSLGL] [ikaros].[boolean] NULL,
	[SCHUFAThresholdBalanceIncrease] [numeric](5, 2) NOT NULL,
	[SCHUFAThresholdBalanceDecrease] [numeric](5, 2) NOT NULL,
	[UDF_Client_IA_Konto] [nvarchar](10) NULL,
	[UDF_Client_RA_Konto] [nvarchar](10) NULL,
	[ReverseCharge] [ikaros].[boolean] NOT NULL,
	[UDF_GL_Branche] [nvarchar](10) NULL,
	[UDF_Client_Language] [nvarchar](5) NULL,
	[UDF_Client_Lock_Debtor] [bit] NOT NULL,
	[UDF_Client_UserGroup] [nvarchar](10) NULL,
	[UDF_Monitoring_Start] [ikaros].[boolean] NOT NULL,
	[UDF_Client_BuhaExport] [bit] NOT NULL,
	[UDF_Client_CCaseWeight] [float] NOT NULL,
	[UDF_Client_IKAKO_RVG] [float] NOT NULL,
	[UDF_Client_IKAKO_LIMIT1_VALUE] [float] NOT NULL,
	[UDF_Client_IKAKO_LIMIT1_RVG] [float] NOT NULL,
	[UDF_Client_IKAKO_LIMIT2_VALUE] [float] NOT NULL,
	[UDF_Client_IKAKO_LIMIT2_RVG] [float] NOT NULL,
	[UDF_Client_B2BOnly] [ikaros].[boolean] NULL,
	[ImportConfigurationId] [uniqueidentifier] NULL,
	[SCHUFADeathToBeReported] [ikaros].[boolean] NOT NULL,
	[InterestCalculationMethod] [nvarchar](40) NOT NULL,
	[ClearingSepaDirectDebitMandateID] [uniqueidentifier] NULL,
	[ClearingDirectDebitEBankingVoucherBaseSubType] [nvarchar](20) NULL,
	[UDF_quickanzahl] [int] NULL,
	[UDF_quickdatum] [datetime] NULL,
	[PClaimConsumerBaseRateMultiplier] [numeric](5, 2) NOT NULL,
	[PClaimCompanyBaseRateMultiplier] [numeric](5, 2) NOT NULL,
	[UDF_Client_MB_Decision] [bit] NOT NULL,
	[UDF_Client_MB_Scoring] [bit] NOT NULL,
	[UDF_Client_Business_Score_CutOff] [nvarchar](10) NOT NULL,
	[UDF_Client_Consumer_Score_CutOff] [int] NOT NULL,
	[IgnoreClaimReasonMandatory] [ikaros].[boolean] NOT NULL,
	[PClaimConsumerIntRateJustification] [nvarchar](4000) NULL,
	[VATNoteDocument] [nvarchar](4000) NULL,
	[UDF_Client_Info] [nvarchar](100) NULL,
	[UDF_Client_Orgabeitrag] [numeric](10, 2) NULL,
	[UDF_Client_Betreuung] [nvarchar](2) NULL,
	[UDF_Client_ClearingToEmail_ForeignPayment] [bit] NULL,
	[UDF_Client_ClearingToEmail_Costs] [bit] NULL,
	[UDF_Client_ClearingToEmail_PDF] [bit] NULL,
	[UDF_Client_ClearingToEmail_FilterName] [nvarchar](50) NULL,
	[UDF_Client_Quick] [bit] NOT NULL,
	[UDF_Client_Ausland] [bit] NOT NULL,
	[UDF_Client_SalesDate] [datetime] NULL,
	[ClearingBeforeBookCustomEventCVID] [uniqueidentifier] NULL,
	[ClearingAfterBookCustomEventCVID] [uniqueidentifier] NULL,
	[ClientDomain] [int] NOT NULL,
	[UDF_Client_PS_InfoCount] [int] NULL,
	[UDF_Client_PS_InkassoCount] [int] NULL,
	[UDF_Client_PS_AdressID] [uniqueidentifier] NULL,
	[UDF_Client_PS_AdressIDCount] [int] NULL,
	[UDF_Client_PS_AddressID] [uniqueidentifier] NULL,
	[UDF_Client_Info2] [nvarchar](50) NULL,
	[UDF_Client_GeldwaescheFormular] [bit] NULL,
	[UDF_Inso] [ikaros].[boolean] NULL,
	[UDF_InsoDatum] [datetime] NULL,
	[UDF_GlaeubigerNr_Prod] [nvarchar](10) NULL,
	[UDF_Mahnung_Per_Mail] [int] NOT NULL,
	[UDF_PpAkte] [numeric](5, 2) NOT NULL,
	[UDF_PpMB] [numeric](5, 2) NOT NULL,
	[UDF_Abr_Zusatz_englisch] [ikaros].[boolean] NOT NULL,
	[UDF_Abr_GLRls] [ikaros].[boolean] NULL,
	[UDF_QuickK01_B2B] [numeric](5, 2) NULL,
	[UDF_Abr_GSverrechHF] [ikaros].[boolean] NOT NULL,
	[UDF_Abr_GSverrech] [ikaros].[boolean] NOT NULL,
	[UDF_Abr_FedEx_ABRSammeldeckblatt] [ikaros].[boolean] NOT NULL,
	[UDF_Liquida_AT] [bit] NOT NULL,
	[UDF_ZV_via_LJ] [bit] NOT NULL,
	[UDF_Std_Product] [int] NOT NULL,
	[UDF_ClearingG4PrintCount] [int] NOT NULL,
	[CurrencyID] [uniqueidentifier] NOT NULL,
	[UDF_ZDVUE_deviating_deadline] [int] NOT NULL,
	[UDF_KKI_Import_Payment] [int] NOT NULL,
	[UDF_titelZusatztext] [nvarchar](20) NULL,
	[UDF_titelZusatzdatum] [nvarchar](20) NULL,
	[UDF_KKI_ImportUpload] [bit] NOT NULL,
	[UDF_titelZusatzdatum2] [nvarchar](20) NULL,
	[BlockForClearingTransfer] [ikaros].[boolean] NOT NULL,
	[BlockForClearingDirectDebit] [ikaros].[boolean] NOT NULL,
	[TeamID] [uniqueidentifier] NULL,
	[UDF_Interne_Mandantennummer] [nvarchar](50) NULL,
	[UDF_Externes_Callcenter] [bit] NOT NULL,
	[UDF_CAC_Verst_Erbenermittlung] [bit] NOT NULL,
	[UDF_N01G_ab_HF] [decimal](10, 2) NOT NULL,
	[UDF_PEX_Einmelden] [ikaros].[boolean] NOT NULL,
	[UDF_test_bit] [bit] NOT NULL,
	[UDF_test_bit_2] [bit] NOT NULL,
	[UDF_test_boolean] [ikaros].[boolean] NOT NULL,
	[UDF_Ausland_Laendergruppe] [nvarchar](50) NULL,
	[UDF_Ausland_Vertragspartner] [nvarchar](10) NOT NULL,
	[UDF_Ausland_Automatische_Pauschale] [bit] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_ContactID]  DEFAULT (newid()) FOR [ContactID]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_PClaimConsumerBaseRate]  DEFAULT ((0)) FOR [PClaimConsumerBaseRate]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_ClientExpenses]  DEFAULT ((0)) FOR [ClientExpenses]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_Cession]  DEFAULT ((0)) FOR [Cession]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_PClaimCompanyBaseRate]  DEFAULT ((0)) FOR [PClaimCompanyBaseRate]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_ClearingTransfer]  DEFAULT ((0)) FOR [ClearingTransfer]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_ClearingDirectDebit]  DEFAULT ((0)) FOR [ClearingDirectDebit]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_SCHUFAPerformanceOfTasks]  DEFAULT ((0)) FOR [SCHUFAPerformanceOfTasks]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_ImportSummary]  DEFAULT ((0)) FOR [ImportSummary]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_SCHUFAToBeReported]  DEFAULT ([ikaros].[SettingGetLogic]('MandantSCHUFARelevant',[ikaros].[GetFalse](),DEFAULT)) FOR [SCHUFAToBeReported]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_SCHUFAToBeReportedImmediately]  DEFAULT ([ikaros].[SettingGetLogic]('MandantSCHUFASofortMelden',[ikaros].[GetFalse](),DEFAULT)) FOR [SCHUFAToBeReportedImmediately]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_SCHUFAUpdateCode]  DEFAULT ((0)) FOR [SCHUFAUpdateCode]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_DTARefNoAsHeaderRefNo]  DEFAULT ((0)) FOR [DTARefNoAsHeaderRefNo]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_AutoPaymentReallocation]  DEFAULT ((1)) FOR [AutoPaymentReallocation]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_LegalProceedingsWithCreditLaw]  DEFAULT ((1)) FOR [LegalProceedingsWithCreditLaw]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_ABRA__015FDB12]  DEFAULT ((0)) FOR [UDF_ABRANSCHREIBEN]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_EC_L__0253FF4B]  DEFAULT ((0)) FOR [UDF_EC_Lastschrift]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_G001__03482384]  DEFAULT ((1)) FOR [UDF_G0011]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_G001__043C47BD]  DEFAULT ((1)) FOR [UDF_G0013]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_G01__05306BF6]  DEFAULT ((1)) FOR [UDF_G01]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_G01R__0624902F]  DEFAULT ((1)) FOR [UDF_G01RE]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_G101__0718B468]  DEFAULT ((1)) FOR [UDF_G1011]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_G101__080CD8A1]  DEFAULT ((1)) FOR [UDF_G1013]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_G11R__0900FCDA]  DEFAULT ((1)) FOR [UDF_G11RE]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_A__09F52113]  DEFAULT ((0)) FOR [UDF_GL_A09_EV]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_A__0AE9454C]  DEFAULT ((0)) FOR [UDF_GL_AbgUEAT]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_I__0BDD6985]  DEFAULT ((-1)) FOR [UDF_GL_II19_kleinerHF]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_R__0CD18DBE]  DEFAULT ((0)) FOR [UDF_GL_R4280]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_R__0DC5B1F7]  DEFAULT ((0)) FOR [UDF_GL_R4280_WVTage]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_R__0EB9D630]  DEFAULT ((0)) FOR [UDF_GL_R4285]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_R__0FADFA69]  DEFAULT ((0)) FOR [UDF_GL_R4285_WVTage]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_R__10A21EA2]  DEFAULT ((0)) FOR [UDF_GL_R4290]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_R__119642DB]  DEFAULT ((0)) FOR [UDF_GL_R4290_WVTage]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_R__128A6714]  DEFAULT ((0.0)) FOR [UDF_GL_R56_Prozent]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_S__137E8B4D]  DEFAULT ((0)) FOR [UDF_GL_S41]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_GL_U__1472AF86]  DEFAULT ((0)) FOR [UDF_GL_UEAT_Anschreiben]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_HF_V__1566D3BF]  DEFAULT ((0)) FOR [UDF_HF_Verrechnen]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_IFS___165AF7F8]  DEFAULT ((1)) FOR [UDF_IFS_MELDEN]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_K16G__174F1C31]  DEFAULT ((0)) FOR [UDF_K16G]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_KFK__1843406A]  DEFAULT ((1)) FOR [UDF_KFK]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_mand__193764A3]  DEFAULT ((1)) FOR [UDF_mandant_aktiv]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_maxr__1A2B88DC]  DEFAULT ((0)) FOR [UDF_maxraten]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_N01G__1B1FAD15]  DEFAULT ((1)) FOR [UDF_N01G]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_quic__1C13D14E]  DEFAULT ((0)) FOR [UDF_quick_k01]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_quic__1D07F587]  DEFAULT ((0)) FOR [UDF_quick_R02Q]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_quic__1DFC19C0]  DEFAULT ((0)) FOR [UDF_quick_zinsen]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_quic__1EF03DF9]  DEFAULT ((0)) FOR [UDF_quickpreis]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_quic__1FE46232]  DEFAULT ((0)) FOR [UDF_quickpunkte]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_R09___20D8866B]  DEFAULT ((1)) FOR [UDF_R09_WV_GL]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_RA_I__21CCAAA4]  DEFAULT ((0)) FOR [UDF_RA_Inkasso]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___22C0CEDD]  DEFAULT ((11)) FOR [UDF_S01_FR_1]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___23B4F316]  DEFAULT ((10)) FOR [UDF_S01_FR_2]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___24A9174F]  DEFAULT ((9)) FOR [UDF_S01_FR_3]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___259D3B88]  DEFAULT ((9)) FOR [UDF_S01_FR_4]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___26915FC1]  DEFAULT ((8)) FOR [UDF_S01_FR_5]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___278583FA]  DEFAULT ((7)) FOR [UDF_S01_FR_6]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___2879A833]  DEFAULT ((6)) FOR [UDF_S01_FR_7]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___296DCC6C]  DEFAULT ((30.0)) FOR [UDF_S01_HF_1]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___2A61F0A5]  DEFAULT ((40.0)) FOR [UDF_S01_HF_2]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___2B5614DE]  DEFAULT ((50.0)) FOR [UDF_S01_HF_3]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___2C4A3917]  DEFAULT ((280.0)) FOR [UDF_S01_HF_4]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___2D3E5D50]  DEFAULT ((400.0)) FOR [UDF_S01_HF_5]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___2E328189]  DEFAULT ((700.0)) FOR [UDF_S01_HF_6]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___2F26A5C2]  DEFAULT ((99999999.99)) FOR [UDF_S01_HF_7]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___301AC9FB]  DEFAULT ((1)) FOR [UDF_S01_STANDARD]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___310EEE34]  DEFAULT ('S02') FOR [UDF_S01_WV_1]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___3203126D]  DEFAULT ('S02') FOR [UDF_S01_WV_2]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___32F736A6]  DEFAULT ('S02') FOR [UDF_S01_WV_3]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___33EB5ADF]  DEFAULT ('NEU') FOR [UDF_S01_WV_4]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___34DF7F18]  DEFAULT ('NEU') FOR [UDF_S01_WV_5]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___35D3A351]  DEFAULT ('NEU') FOR [UDF_S01_WV_6]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S01___36C7C78A]  DEFAULT ('NEU') FOR [UDF_S01_WV_7]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___37BBEBC3]  DEFAULT ((10)) FOR [UDF_S02_FR_1]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___38B00FFC]  DEFAULT ((7)) FOR [UDF_S02_FR_2]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___39A43435]  DEFAULT ((6)) FOR [UDF_S02_FR_3]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___3A98586E]  DEFAULT ((6)) FOR [UDF_S02_FR_4]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___3B8C7CA7]  DEFAULT ((6)) FOR [UDF_S02_FR_5]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___3C80A0E0]  DEFAULT ((6)) FOR [UDF_S02_FR_6]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___3D74C519]  DEFAULT ((6)) FOR [UDF_S02_FR_7]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___3E68E952]  DEFAULT ((10.0)) FOR [UDF_S02_HF_1]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___3F5D0D8B]  DEFAULT ((50.0)) FOR [UDF_S02_HF_2]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___405131C4]  DEFAULT ((50.0)) FOR [UDF_S02_HF_3]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___414555FD]  DEFAULT ((160)) FOR [UDF_S02_HF_4]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___42397A36]  DEFAULT ((160)) FOR [UDF_S02_HF_5]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___432D9E6F]  DEFAULT ((160)) FOR [UDF_S02_HF_6]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___4421C2A8]  DEFAULT ((99999999.99)) FOR [UDF_S02_HF_7]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___4515E6E1]  DEFAULT ((1)) FOR [UDF_S02_STANDARD]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___460A0B1A]  DEFAULT ('R02') FOR [UDF_S02_WV_1]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___46FE2F53]  DEFAULT ('NEU') FOR [UDF_S02_WV_2]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___47F2538C]  DEFAULT ('NEU') FOR [UDF_S02_WV_3]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___48E677C5]  DEFAULT ('NEU') FOR [UDF_S02_WV_4]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___49DA9BFE]  DEFAULT ('NEU') FOR [UDF_S02_WV_5]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___4ACEC037]  DEFAULT ('NEU') FOR [UDF_S02_WV_6]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_S02___4BC2E470]  DEFAULT ('NEU') FOR [UDF_S02_WV_7]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_SAP___4CB708A9]  DEFAULT ((0)) FOR [UDF_SAP_LFDNR_IN]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_SAP___4DAB2CE2]  DEFAULT ((0)) FOR [UDF_SAP_LFDNR_OUT]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_TAGA__4E9F511B]  DEFAULT ((0)) FOR [UDF_TAGAUSZ]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_N01__0F63E1A6]  DEFAULT ((1)) FOR [UDF_N01]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_ISTA__105805DF]  DEFAULT ((0)) FOR [UDF_ISTAUSLGL]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_SCHUFAThresholdBalanceIncrease]  DEFAULT ((0)) FOR [SCHUFAThresholdBalanceIncrease]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_SCHUFAThresholdBalanceDecrease]  DEFAULT ((0)) FOR [SCHUFAThresholdBalanceDecrease]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__ReverseC__57A99868]  DEFAULT ((0)) FOR [ReverseCharge]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__39AF212D]  DEFAULT ((0)) FOR [UDF_Client_Lock_Debtor]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Moni__49E588F6]  DEFAULT ((1)) FOR [UDF_Monitoring_Start]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__4AD9AD2F]  DEFAULT ((0)) FOR [UDF_Client_BuhaExport]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__4BCDD168]  DEFAULT ((1.0)) FOR [UDF_Client_CCaseWeight]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__499B7033]  DEFAULT ((1.3)) FOR [UDF_Client_IKAKO_RVG]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__64EE84ED]  DEFAULT ((50.00)) FOR [UDF_Client_IKAKO_LIMIT1_VALUE]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__4A8F946C]  DEFAULT ((1.3)) FOR [UDF_Client_IKAKO_LIMIT1_RVG]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__66D6CD5F]  DEFAULT ((100.00)) FOR [UDF_Client_IKAKO_LIMIT2_VALUE]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__4B83B8A5]  DEFAULT ((1.3)) FOR [UDF_Client_IKAKO_LIMIT2_RVG]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__68BF15D1]  DEFAULT ((0)) FOR [UDF_Client_B2BOnly]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_SCHUFADeathToBeReported]  DEFAULT ([ikaros].[GetFalse]()) FOR [SCHUFADeathToBeReported]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_InterestCalculationMethod]  DEFAULT ('GermanLastDay') FOR [InterestCalculationMethod]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_PClaimConsumerBaseRateMultiplier]  DEFAULT ((1.0)) FOR [PClaimConsumerBaseRateMultiplier]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_PClaimCompanyBaseRateMultiplier]  DEFAULT ((1.0)) FOR [PClaimCompanyBaseRateMultiplier]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((1)) FOR [UDF_Client_MB_Decision]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Client_MB_Scoring]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF__Client__UDF_Clie__6934E274]  DEFAULT ('50') FOR [UDF_Client_Business_Score_CutOff]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((380)) FOR [UDF_Client_Consumer_Score_CutOff]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_IgnoreClaimReasonMandatory]  DEFAULT ((0)) FOR [IgnoreClaimReasonMandatory]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Client_ClearingToEmail_ForeignPayment]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Client_ClearingToEmail_Costs]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Client_ClearingToEmail_PDF]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Client_Quick]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Client_Ausland]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Client_GeldwaescheFormular]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Inso]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Mahnung_Per_Mail]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0.00)) FOR [UDF_PpAkte]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0.00)) FOR [UDF_PpMB]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Abr_Zusatz_englisch]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Abr_GLRls]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_QuickK01_B2B]  DEFAULT ((0.00)) FOR [UDF_QuickK01_B2B]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Abr_GSverrechHF]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((0)) FOR [UDF_Abr_GSverrech]
GO
ALTER TABLE [ikaros].[Client] ADD  DEFAULT ((1)) FOR [UDF_Abr_FedEx_ABRSammeldeckblatt]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_Liquida_AT]  DEFAULT ((0)) FOR [UDF_Liquida_AT]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_ZV_via_LJ]  DEFAULT ((0)) FOR [UDF_ZV_via_LJ]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_Std_Product]  DEFAULT ((0)) FOR [UDF_Std_Product]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_ClearingG4PrintCount]  DEFAULT ((2)) FOR [UDF_ClearingG4PrintCount]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_ZDVUE_deviating_deadline]  DEFAULT ((0)) FOR [UDF_ZDVUE_deviating_deadline]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_KKI_Import_Payment]  DEFAULT ((1)) FOR [UDF_KKI_Import_Payment]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_KKI_ImportUpload]  DEFAULT ((1)) FOR [UDF_KKI_ImportUpload]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_BlockForClearingTransfer]  DEFAULT ((0)) FOR [BlockForClearingTransfer]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_BlockForClearingDirectDebit]  DEFAULT ((0)) FOR [BlockForClearingDirectDebit]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_Externes_Callcenter]  DEFAULT ((0)) FOR [UDF_Externes_Callcenter]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_CAC_Verst_Erbenermittlung]  DEFAULT ((1)) FOR [UDF_CAC_Verst_Erbenermittlung]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_N01G_ab_HF]  DEFAULT ((0)) FOR [UDF_N01G_ab_HF]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_PEX_Einmelden]  DEFAULT ((1)) FOR [UDF_PEX_Einmelden]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_test_bit]  DEFAULT ((1)) FOR [UDF_test_bit]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_test_bit_2]  DEFAULT ((1)) FOR [UDF_test_bit_2]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_test_boolean]  DEFAULT ((1)) FOR [UDF_test_boolean]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_Ausland_Vertragspartner]  DEFAULT ('LIQ_DE') FOR [UDF_Ausland_Vertragspartner]
GO
ALTER TABLE [ikaros].[Client] ADD  CONSTRAINT [DF_Client_UDF_Ausland_Automatische_Pauschale]  DEFAULT ((0)) FOR [UDF_Ausland_Automatische_Pauschale]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Account] FOREIGN KEY([AccManagementChargeAccountID])
REFERENCES [ikaros].[Account] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_Account]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_BankAccountUsageType_DCADirectDebit] FOREIGN KEY([BankAccUsageTypeDCADirectDebit])
REFERENCES [ikaros].[BankAccountUsageType] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_BankAccountUsageType_DCADirectDebit]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_BankAccountUsageType_DCATransfer] FOREIGN KEY([BankAccUsageTypeDCATransfer])
REFERENCES [ikaros].[BankAccountUsageType] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_BankAccountUsageType_DCATransfer]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClearingLayout] FOREIGN KEY([ClearingLayoutID])
REFERENCES [ikaros].[ClearingLayout] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_ClearingLayout]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientDomain] FOREIGN KEY([ClientDomain])
REFERENCES [ikaros].[ClientDomain] ([Value])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_ClientDomain]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Contact] FOREIGN KEY([ContactID])
REFERENCES [ikaros].[Contact] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_Contact]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ContEvtTemplate] FOREIGN KEY([ClrLetterContEvtTemplateID])
REFERENCES [ikaros].[ContEvtTemplate] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_ContEvtTemplate]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_CostContract] FOREIGN KEY([CostContractID])
REFERENCES [ikaros].[CostContract] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_CostContract]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [ikaros].[Currency] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_Currency]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_EBankingVoucherBaseSubType] FOREIGN KEY([ClearingDirectDebitEBankingVoucherBaseSubType])
REFERENCES [ikaros].[EBankingVoucherBaseSubType] ([Matchcode])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_EBankingVoucherBaseSubType]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_EventTemplate] FOREIGN KEY([StartEventID])
REFERENCES [ikaros].[EventTemplate] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_EventTemplate]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ImportConfiguration] FOREIGN KEY([ImportConfigurationId])
REFERENCES [ikaros].[ImportConfiguration] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_ImportConfiguration]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_PCommContract] FOREIGN KEY([PCommContractID])
REFERENCES [ikaros].[PCommContract] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_PCommContract]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_SCHUFAClientGroup] FOREIGN KEY([SCHUFAClientGroupCode])
REFERENCES [ikaros].[SCHUFAClientGroup] ([GroupCode])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_SCHUFAClientGroup]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_SepaDirectDebitMandate] FOREIGN KEY([ClearingSepaDirectDebitMandateID])
REFERENCES [ikaros].[SepaDirectDebitMandate] ([Id])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_SepaDirectDebitMandate]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_TeamID] FOREIGN KEY([TeamID])
REFERENCES [ikaros].[Team] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_TeamID]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_WflContract] FOREIGN KEY([WflContractID])
REFERENCES [ikaros].[WflContract] ([ID])
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [FK_Client_WflContract]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [CK_Client_PaymentAllocation] CHECK  (([PaymentAllocation] IS NULL OR ([PaymentAllocation]='D' OR [PaymentAllocation]='C' OR [PaymentAllocation]='B' OR [PaymentAllocation]='A' OR [PaymentAllocation]='V' OR [PaymentAllocation]='3')))
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [CK_Client_PaymentAllocation]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [CK_Client_PClaimCompanyBaseRateMultiplier] CHECK  (([PClaimCompanyBaseRateMultiplier]>=(0.01) AND [PClaimCompanyBaseRateMultiplier]<=(999.99)))
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [CK_Client_PClaimCompanyBaseRateMultiplier]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [CK_Client_PClaimConsumerBaseRateMultiplier] CHECK  (([PClaimConsumerBaseRateMultiplier]>=(0.01) AND [PClaimConsumerBaseRateMultiplier]<=(999.99)))
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [CK_Client_PClaimConsumerBaseRateMultiplier]
GO
ALTER TABLE [ikaros].[Client]  WITH CHECK ADD  CONSTRAINT [CK_Client_PreTaxAttribute] CHECK  (([PretaxAttribute]='K' OR [PretaxAttribute]='N' OR [PretaxAttribute]='J'))
GO
ALTER TABLE [ikaros].[Client] CHECK CONSTRAINT [CK_Client_PreTaxAttribute]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Soll bei Akten zu diesen Mandanten automatisch bei entsprechenden Ereignissen die Neuverrechnung der Ansprüche durchgeführt werden?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'AutoPaymentReallocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Soll bei der Mahnbescheidsbeantragung ein VKG-Satz für Kredit-Hauptforderungen in die Antragsdatei geschrieben werden?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'LegalProceedingsWithCreditLaw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennung der Kontoverwendungsart für Überweisungen bei der Abrechnung' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'BankAccUsageTypeDCATransfer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennung der Kontoverwendungsart für Lastschriften bei der Abrechnung' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'BankAccUsageTypeDCADirectDebit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Schwellenwert der Saldoerhöhung für periodische Meldungen in Prozent (z.B. 90,20%).' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'SCHUFAThresholdBalanceIncrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Schwellenwert der Saldoverringerung für periodische Meldungen in Prozent (z.B. 90,20%).' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'SCHUFAThresholdBalanceDecrease'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The import configuration for this client.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'ImportConfigurationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Werden für diesen Gläubiger Verstorben-Meldungen (PV) an die SCHUFA übertragen?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'SCHUFADeathToBeReported'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Multiplier for the consumer base rate.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'PClaimConsumerBaseRateMultiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Multiplier for the company base rate.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'PClaimCompanyBaseRateMultiplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Declares if the claim reason mandatory of the event template has to be ignored' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'IgnoreClaimReasonMandatory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Justification of consumer interest rate' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'PClaimConsumerIntRateJustification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Note in documents for deduction of VAT' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'VATNoteDocument'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CustomEvent before clearing book' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'ClearingBeforeBookCustomEventCVID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CustomEvent after clearing book' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'ClearingAfterBookCustomEventCVID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value of assigned client domain.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'ClientDomain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the currency of the client' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'CurrencyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shows if the client is blocked for tpm payout.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'BlockForClearingTransfer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shows if the client is blocked for tpm invoice.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'BlockForClearingDirectDebit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the team assigned to the client.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'TeamID'
GO
