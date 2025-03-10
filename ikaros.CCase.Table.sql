USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[CCase]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[CCase](
	[ID] [uniqueidentifier] NOT NULL,
	[DebtorID] [uniqueidentifier] NOT NULL,
	[ClientID] [uniqueidentifier] NOT NULL,
	[RefNo] [nvarchar](12) NOT NULL,
	[Subcase] [numeric](2, 0) NOT NULL,
	[RefNoCourt] [nvarchar](19) NULL,
	[ClientCustomerRefNo] [nvarchar](50) NULL,
	[RefNoLawyer] [nvarchar](30) NULL,
	[ClientNo] [numeric](12, 0) NULL,
	[AcceptanceDate] [date] NOT NULL,
	[Memo] [nvarchar](max) NULL,
	[PopUpNote] [nvarchar](max) NULL,
	[Seller] [nvarchar](32) NULL,
	[AccountManagementChargeAmount] [numeric](5, 2) NULL,
	[AccManagementChargeFrom] [nvarchar](4) NULL,
	[AccManagementChargeUpTo] [nvarchar](4) NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Stage] [char](1) NOT NULL,
	[State] [nvarchar](5) NULL,
	[PaymentAllocation] [char](1) NOT NULL,
	[EditingGroup] [char](1) NULL,
	[Cession] [ikaros].[boolean] NOT NULL,
	[CedingDate] [date] NULL,
	[PurchasePrice] [ikaros].[amount] NULL,
	[PurchaseDate] [date] NULL,
	[LitigationCourt] [nvarchar](7) NULL,
	[InstalmentAmount] [numeric](8, 2) NULL,
	[InstalmentFrom] [date] NULL,
	[InstalmentUpTo] [date] NULL,
	[InstalmentNo] [numeric](2, 0) NULL,
	[SupplementarySort] [nvarchar](25) NULL,
	[RefNoOld] [nvarchar](30) NULL,
	[PurchaseClientID] [uniqueidentifier] NULL,
	[PCommContractID] [uniqueidentifier] NOT NULL,
	[CostContractID] [uniqueidentifier] NULL,
	[CorrespondenceContactID] [uniqueidentifier] NULL,
	[ClosingDate] [date] NULL,
	[ArchiveNo] [uniqueidentifier] NULL,
	[ToBeCleared] [char](1) NOT NULL,
	[LimitationDate] [date] NULL,
	[SCHUFAToBeReported] [ikaros].[boolean] NOT NULL,
	[SCHUFASuspended] [ikaros].[boolean] NOT NULL,
	[SCHUFAUpdateCode] [ikaros].[boolean] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[OrderConfirmationDate] [date] NULL,
	[LegalVenueAgreement] [nvarchar](7) NULL,
	[InfoscoreToBeReported] [ikaros].[boolean] NOT NULL,
	[DefaultSummonsBlock] [ikaros].[boolean] NOT NULL,
	[ObjectedAmount] [ikaros].[amount] NULL,
	[SubcaseType] [char](1) NULL,
	[CEGToBeReported] [ikaros].[boolean] NOT NULL,
	[WflContractID] [uniqueidentifier] NULL,
	[NetClientID] [uniqueidentifier] NULL,
	[InFoScoreReportsFrom] [date] NULL,
	[SCHUFAReportsFrom] [date] NULL,
	[CEGReportsFrom] [date] NULL,
	[UDF_Abgabe_AP] [nvarchar](3) NULL,
	[UDF_ABLDATUM] [date] NULL,
	[UDF_BESTELLWEG] [nvarchar](20) NULL,
	[UDF_Delgado] [ikaros].[boolean] NULL,
	[UDF_FORD_HF] [float] NULL,
	[UDF_FORD_KOSTEN] [float] NULL,
	[UDF_FORD_ZINSEN] [float] NULL,
	[UDF_FORDUPDATE] [ikaros].[boolean] NULL,
	[UDF_KundenKST] [nvarchar](20) NULL,
	[UDF_KundenNR] [nvarchar](250) NULL,
	[UDF_KundenSB] [nvarchar](100) NULL,
	[UDF_SAP_AKTE_LFDNR_IN] [numeric](6, 0) NULL,
	[UDF_SAP_GPART] [nvarchar](10) NULL,
	[UDF_SAP_VKONT] [nvarchar](12) NULL,
	[UDF_SAP_ZZAGDAT] [date] NULL,
	[UDF_ZAHLART] [nvarchar](20) NULL,
	[UDF_Zusatz_RG] [nvarchar](200) NULL,
	[UDF_GAS_BUENDEL] [int] NOT NULL,
	[UDF_GAS_FLASCHEN] [int] NOT NULL,
	[UDF_GAS_PALETTEN] [int] NOT NULL,
	[Lock] [ikaros].[boolean] NOT NULL,
	[UDF_Auftragsnummer] [nvarchar](500) NULL,
	[UDF_CCase_Buha_ZNZZ] [nvarchar](10) NULL,
	[DeltavistaPEXToBeReported] [ikaros].[boolean] NOT NULL,
	[DeltavistaPEXSuspended] [ikaros].[boolean] NOT NULL,
	[DeltavistaPEXReportsFrom] [date] NULL,
	[InterestCalculationMethod] [nvarchar](40) NOT NULL,
	[UniqueIdentification] [nvarchar](40) NULL,
	[Consumer] [ikaros].[boolean] NOT NULL,
	[UDF_EPIMP] [nvarchar](36) NULL,
	[UDF_Einmeldesperre] [bit] NULL,
	[AnonymizationDate] [date] NULL,
	[UDF_Import_Guid] [nvarchar](50) NULL,
	[UDF_Praefix_Verwendungszweck] [nvarchar](50) NULL,
	[ArchiveNumber] [nvarchar](12) NULL,
	[UDF_AT_InterestRate] [decimal](2, 2) NULL,
	[UDF_AT_Interest_BaseRate] [decimal](2, 2) NULL,
	[CurrencyID] [uniqueidentifier] NOT NULL,
	[UDF_zusatzdatum] [date] NULL,
	[UDF_zusatztext] [nvarchar](255) NULL,
	[UDF_zusatzdatum2] [date] NULL,
	[ApplicantID] [uniqueidentifier] NULL,
	[UDF_LIQ_GMV_Erzwingen] [bit] NOT NULL,
	[UDF_OLDID] [uniqueidentifier] NULL,
	[UDF_Schuldnerportal_Ratenzahlung_aktiviert] [bit] NOT NULL,
	[CaseProcessingStopReasonId] [uniqueidentifier] NULL,
	[CaseTypeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CCase] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_Subcase]  DEFAULT ((0)) FOR [Subcase]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_AcceptanceDate]  DEFAULT ([ikaros].[Today]()) FOR [AcceptanceDate]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_PaymentAllocation]  DEFAULT ('3') FOR [PaymentAllocation]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_Cession]  DEFAULT ((0)) FOR [Cession]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_ToBeCleared]  DEFAULT ('J') FOR [ToBeCleared]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_SCHUFAToBeReported]  DEFAULT ((0)) FOR [SCHUFAToBeReported]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_SCHUFASuspended]  DEFAULT ((0)) FOR [SCHUFASuspended]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_Ccase_SCHUFAUpdateCode]  DEFAULT ((0)) FOR [SCHUFAUpdateCode]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_InfoscoreToBeReported]  DEFAULT ((0)) FOR [InfoscoreToBeReported]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_DefaultSummonsBlock]  DEFAULT ((0)) FOR [DefaultSummonsBlock]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_Ccase_CEGToBeReported]  DEFAULT ((0)) FOR [CEGToBeReported]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_Delga__79BEB94A]  DEFAULT ((0)) FOR [UDF_Delgado]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_FORD___7AB2DD83]  DEFAULT ((0)) FOR [UDF_FORD_HF]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_FORD___7BA701BC]  DEFAULT ((0)) FOR [UDF_FORD_KOSTEN]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_FORD___7C9B25F5]  DEFAULT ((0)) FOR [UDF_FORD_ZINSEN]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_FORDU__7D8F4A2E]  DEFAULT ((1)) FOR [UDF_FORDUPDATE]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_SAP_A__7E836E67]  DEFAULT ((0)) FOR [UDF_SAP_AKTE_LFDNR_IN]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_GAS_B__5813ACBC]  DEFAULT ((0)) FOR [UDF_GAS_BUENDEL]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_GAS_F__5EC0AA4B]  DEFAULT ((0)) FOR [UDF_GAS_FLASCHEN]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__UDF_GAS_P__619D16F6]  DEFAULT ((0)) FOR [UDF_GAS_PALETTEN]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF__CCase__Lock__4A84A774]  DEFAULT ([ikaros].[GetFalse]()) FOR [Lock]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_DeltavistaPEXToBeReported]  DEFAULT ((0)) FOR [DeltavistaPEXToBeReported]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_DeltavistaPEXSuspended]  DEFAULT ((0)) FOR [DeltavistaPEXSuspended]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_InterestCalculationMethod]  DEFAULT ('GermanLastDay') FOR [InterestCalculationMethod]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_Ccase_Consumer]  DEFAULT ([ikaros].[GetTrue]()) FOR [Consumer]
GO
ALTER TABLE [ikaros].[CCase] ADD  DEFAULT ((0)) FOR [UDF_Einmeldesperre]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_UDF_LIQ_GMV_Erzwingen]  DEFAULT ((0)) FOR [UDF_LIQ_GMV_Erzwingen]
GO
ALTER TABLE [ikaros].[CCase] ADD  CONSTRAINT [DF_CCase_UDF_Schuldnerportal_Ratenzahlung_aktiviert]  DEFAULT ((1)) FOR [UDF_Schuldnerportal_Ratenzahlung_aktiviert]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_Applicant] FOREIGN KEY([ApplicantID])
REFERENCES [ikaros].[Client] ([ContactID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_Applicant]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_Ccase_CaseProcessingStopReasonId] FOREIGN KEY([CaseProcessingStopReasonId])
REFERENCES [ikaros].[CaseProcessingStopReason] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_Ccase_CaseProcessingStopReasonId]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_Client] FOREIGN KEY([ClientID])
REFERENCES [ikaros].[Client] ([ContactID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_Client]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_Contact] FOREIGN KEY([CorrespondenceContactID])
REFERENCES [ikaros].[Contact] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_Contact]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_Contact1] FOREIGN KEY([PurchaseClientID])
REFERENCES [ikaros].[Contact] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_Contact1]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_CostContract] FOREIGN KEY([CostContractID])
REFERENCES [ikaros].[CostContract] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_CostContract]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [ikaros].[Currency] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_Currency]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_Debtor] FOREIGN KEY([DebtorID])
REFERENCES [ikaros].[Debtor] ([ContactID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_Debtor]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_LookUpCaseStage] FOREIGN KEY([Stage])
REFERENCES [ikaros].[LookUpCaseStage] ([Value])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_LookUpCaseStage]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_LookUpCaseState] FOREIGN KEY([State])
REFERENCES [ikaros].[LookUpCaseState] ([Value])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_LookUpCaseState]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_LookUpCaseType] FOREIGN KEY([CaseTypeId])
REFERENCES [ikaros].[LookUpCaseType] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_LookUpCaseType]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_LookUpEditingGroup] FOREIGN KEY([EditingGroup])
REFERENCES [ikaros].[LookUpEditingGroup] ([Value])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_LookUpEditingGroup]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_PCommContract] FOREIGN KEY([PCommContractID])
REFERENCES [ikaros].[PCommContract] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_PCommContract]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_SubcaseType] FOREIGN KEY([SubcaseType])
REFERENCES [ikaros].[SubcaseType] ([Type])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_SubcaseType]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [FK_CCase_WflContract] FOREIGN KEY([WflContractID])
REFERENCES [ikaros].[WflContract] ([ID])
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [FK_CCase_WflContract]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [CK_CCase_PaymentAllocation] CHECK  (([PaymentAllocation]='D' OR [PaymentAllocation]='C' OR [PaymentAllocation]='B' OR [PaymentAllocation]='A' OR [PaymentAllocation]='V' OR [PaymentAllocation]='3'))
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [CK_CCase_PaymentAllocation]
GO
ALTER TABLE [ikaros].[CCase]  WITH CHECK ADD  CONSTRAINT [CK_CCase_ToBeCleared] CHECK  (([ToBeCleared]='F' OR [ToBeCleared]='N' OR [ToBeCleared]='J'))
GO
ALTER TABLE [ikaros].[CCase] CHECK CONSTRAINT [CK_CCase_ToBeCleared]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennzeichnet, ob die Akte für eine Meldung an CEG mit eingeschlossen werden soll. Default ist "J".' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'CEGToBeReported'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kennzeichnet die Sperrung der Aktenbearbeitung.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'Lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gibt an, ob es sich um eine Akte einer Privatperson handelt.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'Consumer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datum an dem die Akte anonymisiert wurde.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'AnonymizationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains an archive number for the case.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'ArchiveNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the currency of the case' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'CurrencyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the applicant of the case' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'ApplicantID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains the id of caseprocessingstopreason.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'CaseProcessingStopReasonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains the id of type of the case.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'CCase', @level2type=N'COLUMN',@level2name=N'CaseTypeId'
GO
