USE [IKAINTE]
GO
/****** Object:  Table [ikaros].[EventTemplate]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ikaros].[EventTemplate](
	[ID] [uniqueidentifier] NOT NULL,
	[EventCode] [nvarchar](5) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Variant] [char](1) NOT NULL,
	[LegalSymbol] [nvarchar](2) NOT NULL,
	[AccountSymbol] [nvarchar](2) NOT NULL,
	[PaymentSymbol] [nvarchar](2) NOT NULL,
	[Costs] [ikaros].[amount] NULL,
	[Comment] [nvarchar](max) NULL,
	[MinimumBalance] [ikaros].[amount] NULL,
	[InterestTerm] [numeric](3, 0) NULL,
	[ToBeSaved] [ikaros].[boolean] NOT NULL,
	[EnforceableByLaw] [ikaros].[boolean] NOT NULL,
	[JointAndSeveral] [ikaros].[boolean] NOT NULL,
	[ValueExport] [ikaros].[boolean] NULL,
	[VoucherType] [nvarchar](50) NULL,
	[VoucherData] [ikaros].[boolean] NOT NULL,
	[BatchProcessing] [char](1) NOT NULL,
	[Printer] [nvarchar](255) NULL,
	[AccountID] [uniqueidentifier] NULL,
	[FollowUpCaseStage] [char](1) NULL,
	[ClearingTerm] [numeric](3, 0) NULL,
	[SavingQuery] [ikaros].[boolean] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUser] [nvarchar](128) NOT NULL,
	[FollowUpCaseStageInSubcases] [ikaros].[boolean] NOT NULL,
	[SelectionScript] [nvarchar](max) NULL,
	[PrinterSpoolerID] [uniqueidentifier] NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [nvarchar](128) NOT NULL,
	[Tab] [numeric](1, 0) NOT NULL,
	[ClientTPMAccountID] [uniqueidentifier] NULL,
	[LawyerTPMAccountID] [uniqueidentifier] NULL,
	[AdHoc] [ikaros].[boolean] NOT NULL,
	[AdHocHotKey] [numeric](1, 0) NOT NULL,
	[PrintMacro] [nvarchar](255) NULL,
	[FinancialAccountID] [uniqueidentifier] NULL,
	[InvoiceContactEventTemplateID] [uniqueidentifier] NULL,
	[SaveToDMS] [char](1) NOT NULL,
	[Visible] [char](1) NULL,
	[StandardGeneralSettings] [ikaros].[boolean] NOT NULL,
	[StandardSelectionScript] [ikaros].[boolean] NOT NULL,
	[StandardProgram] [ikaros].[boolean] NOT NULL,
	[StandardDocument] [ikaros].[boolean] NOT NULL,
	[StandardFollowUpDefinition] [ikaros].[boolean] NOT NULL,
	[Program] [nvarchar](max) NULL,
	[LastUpdateSelectionScript] [datetime] NULL,
	[LastUserSelectionScript] [nvarchar](32) NULL,
	[LastUpdateProgram] [datetime] NULL,
	[LastUserProgram] [nvarchar](32) NULL,
	[LastUpdateFollowUpDefinition] [datetime] NULL,
	[LastUserFollowUpDefinition] [nvarchar](32) NULL,
	[SetUpState] [nvarchar](15) NULL,
	[SetUpMemo] [nvarchar](max) NULL,
	[LastUpdateGeneralSettings] [datetime] NULL,
	[LastUserGeneralSettings] [nvarchar](32) NULL,
	[LastUpdateDocument] [datetime] NULL,
	[LastUserDocument] [nvarchar](32) NULL,
	[DisplayMacro] [nvarchar](255) NULL,
	[CostsNet] [char](1) NOT NULL,
	[CostWizard] [ikaros].[boolean] NOT NULL,
	[PClaimWithInterest] [ikaros].[boolean] NULL,
	[ToBeEvaluated] [ikaros].[boolean] NULL,
	[DisplayInterestDefinition] [ikaros].[boolean] NULL,
	[SPTaxation] [char](1) NOT NULL,
	[UDF_EMAIL_BODY] [nvarchar](4000) NULL,
	[UDF_LKINotiz] [ikaros].[boolean] NULL,
	[UDF_SAP_VG_ABSCHLUSS] [nvarchar](50) NOT NULL,
	[UDF_NoChangeDelay] [int] NOT NULL,
	[UDF_ProcessingCosts] [float] NOT NULL,
	[UDF_ProcessingActivity] [float] NOT NULL,
	[DesignationForLegalClaimStatement] [nvarchar](75) NULL,
	[CustomCodeIDProgram] [uniqueidentifier] NULL,
	[CustomCodeIDSelect] [uniqueidentifier] NULL,
	[DisplayCompensationDetails] [ikaros].[boolean] NOT NULL,
	[ClaimReasonMandatory] [ikaros].[boolean] NOT NULL,
	[ClaimReasonEditable] [ikaros].[boolean] NOT NULL,
	[UseCustomCode] [ikaros].[boolean] NOT NULL,
	[InsertedTemplates] [nvarchar](4000) NULL,
	[DeletionConceptId] [uniqueidentifier] NOT NULL,
	[AdHocReadonly] [ikaros].[boolean] NOT NULL,
	[SaveDocumentAs] [nvarchar](10) NOT NULL,
	[PrintDocumentWithoutDisplay] [ikaros].[boolean] NOT NULL,
	[XmlExport] [ikaros].[boolean] NOT NULL,
	[XmlExportWhitelist] [nvarchar](max) NULL,
	[ProtectionLevel] [numeric](4, 0) NULL,
	[DpPurposePattern] [binary](16) NULL,
	[CustomCodeFromDocument] [nvarchar](max) NULL,
	[IsEltRelevant] [ikaros].[boolean] NOT NULL,
	[DesignationTypeInLegalClaimStatement] [char](1) NOT NULL,
	[UDF_KKI_Visibility] [int] NOT NULL,
	[UDF_KKI_Type] [int] NOT NULL,
	[UDF_KKI_Designation] [nvarchar](50) NULL,
	[UDF_KKI_NS_Designation] [nvarchar](50) NULL,
	[SignEltAttachment] [ikaros].[boolean] NOT NULL,
	[CorporateDesignID] [uniqueidentifier] NULL,
	[CorporateDesignTemplateHash] [nvarchar](64) NULL,
 CONSTRAINT [PK_EventTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_InterestTerm]  DEFAULT ((0)) FOR [InterestTerm]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_ToBeSaved]  DEFAULT ([ikaros].[GetFalse]()) FOR [ToBeSaved]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_EnforceableByLaw]  DEFAULT ((1)) FOR [EnforceableByLaw]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_JointAndSeveral]  DEFAULT ((1)) FOR [JointAndSeveral]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_VoucherData]  DEFAULT ((0)) FOR [VoucherData]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_BatchProcessing]  DEFAULT ('M') FOR [BatchProcessing]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_SavingQuery]  DEFAULT ((1)) FOR [SavingQuery]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_LastUser]  DEFAULT (suser_sname()) FOR [LastUser]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_FollowUpCaseStageInSubcases]  DEFAULT ((0)) FOR [FollowUpCaseStageInSubcases]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_Creator]  DEFAULT (suser_sname()) FOR [Creator]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_Tab]  DEFAULT ((1)) FOR [Tab]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_AdHoc]  DEFAULT ((0)) FOR [AdHoc]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_AdHocHotKey]  DEFAULT ((0)) FOR [AdHocHotKey]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_SaveToDMS]  DEFAULT ('I') FOR [SaveToDMS]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_StandardGeneralSettings]  DEFAULT ((0)) FOR [StandardGeneralSettings]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_StandardSelectionScript]  DEFAULT ((0)) FOR [StandardSelectionScript]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_StandardProgram]  DEFAULT ((0)) FOR [StandardProgram]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_StandardDocument]  DEFAULT ((0)) FOR [StandardDocument]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_StandardFollowUpDefinition]  DEFAULT ((0)) FOR [StandardFollowUpDefinition]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_CostsNet]  DEFAULT ('K') FOR [CostsNet]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_CostWizard]  DEFAULT ((0)) FOR [CostWizard]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_PClaimWithInterest]  DEFAULT ((1)) FOR [PClaimWithInterest]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_ToBeEvaluated]  DEFAULT ((0)) FOR [ToBeEvaluated]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_SPTaxation]  DEFAULT ('K') FOR [SPTaxation]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF__EventTemp__UDF_L__517BBDC6]  DEFAULT ((0)) FOR [UDF_LKINotiz]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF__EventTemp__UDF_S__526FE1FF]  DEFAULT ('NEGATIV ERLEDIGT') FOR [UDF_SAP_VG_ABSCHLUSS]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF__EventTemp__UDF_N__08B6E417]  DEFAULT ((10)) FOR [UDF_NoChangeDelay]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF__EventTemp__UDF_P__71346041]  DEFAULT ((0)) FOR [UDF_ProcessingCosts]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF__EventTemp__UDF_P__4DB619DA]  DEFAULT ((2)) FOR [UDF_ProcessingActivity]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_DisplayCompensationDetails]  DEFAULT ((0)) FOR [DisplayCompensationDetails]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_ClaimReasonMandatory]  DEFAULT ((0)) FOR [ClaimReasonMandatory]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_ClaimReasonEditable]  DEFAULT ((0)) FOR [ClaimReasonEditable]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_UseCustomCode]  DEFAULT ([ikaros].[getTrue]()) FOR [UseCustomCode]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_DeletionConceptID]  DEFAULT ('4062d60f-c4fd-4d54-a7dc-62425611f539') FOR [DeletionConceptId]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_AdHocReadonly]  DEFAULT ((0)) FOR [AdHocReadonly]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_SaveDocumentAs]  DEFAULT ('NONE') FOR [SaveDocumentAs]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_PrintDocumentWithoutDisplay]  DEFAULT ([ikaros].[GetFalse]()) FOR [PrintDocumentWithoutDisplay]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_XmlExport]  DEFAULT ([ikaros].[GetFalse]()) FOR [XmlExport]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_IsEltrelevant]  DEFAULT ((0)) FOR [IsEltRelevant]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_DesignationTypeInLegalClaimStatement]  DEFAULT ('E') FOR [DesignationTypeInLegalClaimStatement]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_UDF_KKI_Visibility]  DEFAULT ((0)) FOR [UDF_KKI_Visibility]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_UDF_KKI_Type]  DEFAULT ((0)) FOR [UDF_KKI_Type]
GO
ALTER TABLE [ikaros].[EventTemplate] ADD  CONSTRAINT [DF_EventTemplate_SignEltAttachment]  DEFAULT ((1)) FOR [SignEltAttachment]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_Account] FOREIGN KEY([AccountID])
REFERENCES [ikaros].[Account] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_Account]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_Account1] FOREIGN KEY([ClientTPMAccountID])
REFERENCES [ikaros].[Account] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_Account1]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_Account2] FOREIGN KEY([LawyerTPMAccountID])
REFERENCES [ikaros].[Account] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_Account2]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_ContEvtTemplate] FOREIGN KEY([InvoiceContactEventTemplateID])
REFERENCES [ikaros].[ContEvtTemplate] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_ContEvtTemplate]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_CorporateDesign] FOREIGN KEY([CorporateDesignID])
REFERENCES [ikaros].[CorporateDesign] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_CorporateDesign]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_CustomCode] FOREIGN KEY([CustomCodeIDProgram])
REFERENCES [ikaros].[CustomCode] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_CustomCode]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_CustomCodeSelect] FOREIGN KEY([CustomCodeIDSelect])
REFERENCES [ikaros].[CustomCode] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_CustomCodeSelect]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_DeletionConcept] FOREIGN KEY([DeletionConceptId])
REFERENCES [ikaros].[DeletionConcept] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_DeletionConcept]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_FinancialAccount] FOREIGN KEY([FinancialAccountID])
REFERENCES [ikaros].[FinancialAccount] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_FinancialAccount]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_LookUpCaseStage] FOREIGN KEY([FollowUpCaseStage])
REFERENCES [ikaros].[LookUpCaseStage] ([Value])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_LookUpCaseStage]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_LookUpSetUpState] FOREIGN KEY([SetUpState])
REFERENCES [ikaros].[LookUpSetUpState] ([Value])
ON UPDATE CASCADE
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_LookUpSetUpState]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_PrinterSpooler] FOREIGN KEY([PrinterSpoolerID])
REFERENCES [ikaros].[PrinterSpooler] ([ID])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_PrinterSpooler]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [FK_EventTemplate_ProtectionLevel] FOREIGN KEY([ProtectionLevel])
REFERENCES [ikaros].[DpProtectionLevel] ([Level])
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [FK_EventTemplate_ProtectionLevel]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_AccountSymbol] CHECK  (([AccountSymbol]='-' OR [AccountSymbol]='D' OR [AccountSymbol]='P' OR [AccountSymbol]='E'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_AccountSymbol]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_AdHocHotKey] CHECK  (([AdHocHotKey]=(9) OR [AdHocHotKey]=(8) OR [AdHocHotKey]=(7) OR [AdHocHotKey]=(6) OR [AdHocHotKey]=(5) OR [AdHocHotKey]=(4) OR [AdHocHotKey]=(3) OR [AdHocHotKey]=(2) OR [AdHocHotKey]=(1) OR [AdHocHotKey]=(0)))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_AdHocHotKey]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_BatchProcessing] CHECK  (([BatchProcessing]='B' OR [BatchProcessing]='E' OR [BatchProcessing]='D' OR [BatchProcessing]='A' OR [BatchProcessing]='M'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_BatchProcessing]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_CostsNet] CHECK  (([CostsNet]='K' OR [CostsNet]='N' OR [CostsNet]='B'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_CostsNet]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH NOCHECK ADD  CONSTRAINT [CK_EventTemplate_DesignationTypeInLegalClaimStatement] CHECK  (([DesignationTypeInLegalClaimStatement]='A' OR [DesignationTypeInLegalClaimStatement]='T' OR [DesignationTypeInLegalClaimStatement]='E'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_DesignationTypeInLegalClaimStatement]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_LegalSymbol] CHECK  (([LegalSymbol]='MA' OR [LegalSymbol]='ZH' OR [LegalSymbol]='ZS' OR [LegalSymbol]='TI' OR [LegalSymbol]='HF' OR [LegalSymbol]='ZI' OR [LegalSymbol]='VK' OR [LegalSymbol]='UK' OR [LegalSymbol]='--'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_LegalSymbol]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_PaymentSymbol] CHECK  (([PaymentSymbol]='MA' OR [PaymentSymbol]='SR' OR [PaymentSymbol]='SG' OR [PaymentSymbol]='SI' OR [PaymentSymbol]='IR' OR [PaymentSymbol]='IG' OR [PaymentSymbol]='GI' OR [PaymentSymbol]='--'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_PaymentSymbol]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_SaveDocumentAs] CHECK  (([SaveDocumentAs]='PDF/X' OR [SaveDocumentAs]='PDF/A' OR [SaveDocumentAs]='PDF' OR [SaveDocumentAs]='DOCX' OR [SaveDocumentAs]='NONE'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_SaveDocumentAs]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_SaveToDMS] CHECK  (([SaveToDMS]='N' OR [SaveToDMS]='A' OR [SaveToDMS]='I'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_SaveToDMS]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_SPTaxation] CHECK  (([SPTaxation]='E' OR [SPTaxation]='B' OR [SPTaxation]='K'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_SPTaxation]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_Variant] CHECK  (([Variant]='U' OR [Variant]='V' OR [Variant]='T' OR [Variant]='H' OR [Variant]='F' OR [Variant]='E' OR [Variant]='A'))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_Variant]
GO
ALTER TABLE [ikaros].[EventTemplate]  WITH CHECK ADD  CONSTRAINT [CK_EventTemplate_Visible] CHECK  (([Visible] IS NULL OR ([Visible]='U' OR [Visible]='H' OR [Visible]='A')))
GO
ALTER TABLE [ikaros].[EventTemplate] CHECK CONSTRAINT [CK_EventTemplate_Visible]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Das Feld gibt an, wie der eingegebene Betrag eines auf dieser VgVorlage basierenden Vorgangs interpretiert werden soll: - als Nettobetrag (N) - als Bruttobetrag (B) - keine Interpretation, sondern Bestimmung durch PROSA (K)' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'CostsNet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Das Feld gibt an, ob der Eingabeassistent automatisch nach der Betragseingabe geöffnet werden soll.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'CostWizard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bei einer Vorgangsvorlage der Variante "H" wird hier angegeben, ob bei diesem Vorgang ggf. automatisch eine Zinsdefinition angelegt wird.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'PClaimWithInterest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Muss die Vorgangsvorlage evaluiert werden? Vorgabe "N".' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'ToBeEvaluated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sollen Zinsdefinitionen angezeigt werden?' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'DisplayInterestDefinition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gibt an ob, ein Vorgang zu besteuern ist. "K" entspricht keiner Besteuerung, "B" mit Besteuerung und "E" Entscheidung per Ereignisskript.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'SPTaxation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alternative Bezeichnung für die Forderungsaufstellung' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'DesignationForLegalClaimStatement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Declares if subpage for compensation details should be shown in event window.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'DisplayCompensationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Declares if at least one claim reason must exist.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'ClaimReasonMandatory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Declares if the claim reasons must be editable.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'ClaimReasonEditable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Decides if Custom Code or PROSA should be used.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'UseCustomCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The inserted event templates for an ikaros document.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'InsertedTemplates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gibt an, welches Löschkonzept verwendet werden soll.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'DeletionConceptId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gibt an, ob die Vorgangsvorlage schreibgeschützt ist.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'AdHocReadonly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ExportFormat of the new document. Possible values: DOCX, PDF, PDF/A, PDF/X, NONE' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'SaveDocumentAs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the created document of the eventtemplate is to be printed and not displayed.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'PrintDocumentWithoutDisplay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the program variables should be exported via native XML export.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'XmlExport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Whitelist for the XML export.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'XmlExportWhitelist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Protection level of the metadata entry.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'ProtectionLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referenced purposes of the metadata entry binary coded.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'DpPurposePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The extracted custom code parts from the IKAROS-Tags including the document structure.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'CustomCodeFromDocument'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the event is relevant for the electronical legal transaction.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'IsEltRelevant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifies which designation is used for the legal claim statement.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'DesignationTypeInLegalClaimStatement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores whether ELT attachments must be signed.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'SignEltAttachment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The foreign key to the corporate design table.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'CorporateDesignID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hash value of the word template.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'TABLE',@level1name=N'EventTemplate', @level2type=N'COLUMN',@level2name=N'CorporateDesignTemplateHash'
GO
