SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      VIEW [ikaros].[UDV_ClearingTPMCaseBaseVerbund] 
AS
SELECT 
MainClearing.ID AS ClearingID, -- Clearing-ID des Verbund-Gläubigers 
SubClearing.ID AS SubClearingID,  -- Clearing-ID der Einzel-Gläubiger 
AbrMand.ClientNo AS MainClientNo, 
AbrMand.Matchcode AS MainClient, 
Client.ClientNo AS SubClientNo, 
Contact.Matchcode AS SubClient, 
       ikaros.ClrGetClearingDate(MainClearing.ID, 'ikaros.ClearingTPMCase') AS ClearingDate,
       B.VATRate,
       CASE WHEN ikaros.StageGetBaseStage(B.Stage) = 'Ü'
             THEN
               'Ü'
             ELSE
               'I'
       END AS StageCategory,
       AbrMand.DateFrom AS DateFrom,
       AbrMand.DateTo AS DateTo,
       AbrMand.ClientNo AS ClientNo,
       RTRIM(LTRIM(ISNULL(AbrMand.FirstName,''))) +
       CASE WHEN AbrMand.FirstName IS NOT NULL AND AbrMand.FirstName <> ''
              THEN
                ' '
              ELSE
                ''
        END +
        RTRIM(LTRIM(ISNULL(AbrMand.Name1,''))) + 
        ' ' + 
        RTRIM(LTRIM(ISNULL(AbrMand.Name2,''))) AS Client,
        B.PretaxAttribute AS ClientVAT,
        ikaros.CCase.RefNo,
        ikaros.CCase.ClientCustomerRefNo,
			CONVERT(VARCHAR(50), (SELECT ikaros.GetAnonymizedVarChar(SchuldKontakt.Matchcode, CCase.Lock, SchuldKontakt.Lock))) AS Debtor,
        CASE WHEN B.Variant = 'E'
               THEN
                  SUM(B.MainAccountClient + B.MainAccountDCATaxFree + B.MainAccountDCATaxable + B.MainAccountLawyerTaxFree + B.MainAccountLawyerTaxable - B.UeberzgEP) + 
               CASE WHEN B.PretaxAttribute = 'N'
                      THEN
                        SUM(B.MainAccountDCAVAT + B.MainAccountLawyerVAT)
                      ELSE
                        0
               END
               ELSE
                 SUM(B.GlFG)
        END AS Payment, 
		-- Bei Var. A wird ein anderes Empfängerkennzeichen definiert, um im Report Direktzahlungen von Auszahlungen unterscheiden zu können.
        CASE WHEN B.Variant = 'A'
               THEN 'A'
             ELSE B.Recipient
        END AS Recipient, 
        SUM(B.GlHF) AS PClaim,
        SUM(B.GlZinsKost + B.GlZinsHF) AS Interest,
		SUM(B.GlZinsKost) AS ClientCostInterest,
		SUM(B.GlZinsHF) AS PClaimInterest,
        --SUM(B.GlAuslagen) AS ClientExpenses,
        SUM(B.GlAuslagen + B.GlRLS) AS ClientExpenses,
        SUM(B.GlKosten) AS ClientCosts,
        SUM(B.UeberzgFG) AS OverpaymentTPM,
        SUM(B.MainAccountDCATaxFree + B.MainAccountLawyerTaxFree) AS TaxFreeExpenses,
        --SUM(B.MainAccountDCATaxable + B.MainAccountLawyerTaxable - B.Honorar - B.RAHonorar - B.KFK - B.IHNEP - B.RHNEP- B.RARZ - B.RHR02 - B.RHSTRAF - B.HONGER - B.IHBGAUSL - B.IHBONI - B.IHRZ) AS TaxableExpenses,
		SUM(B.MainAccountDCATaxable + B.MainAccountLawyerTaxable - B.Honorar - B.RAHonorar - B.KFK - B.IHNEP - B.RHNEP- B.RARZ - B.RHR02 - B.RHSTRAF - B.HONGER - B.IHBGAUSL - B.IHRZ) AS TaxableExpenses,
        --SUM(B.MainAccountDCAVAT + B.MainAccountLawyerVAT - B.HonorarUSt - B.RAHonorarUSt - B.KFKUSt - B.IHNEPUSt  - B.RHNEPUSt - B.RARZUSt - B.RHR02USt - B.RHSTRAFUSt - B.HONGERUSt - B.IHBGAUSLUSt - B.IHBONIUSt - B.IHRZUSt) AS TaxableExpensesVAT,
		SUM(B.MainAccountDCAVAT + B.MainAccountLawyerVAT - B.HonorarUSt - B.RAHonorarUSt - B.KFKUSt - B.IHNEPUSt  - B.RHNEPUSt - B.RARZUSt - B.RHR02USt - B.RHSTRAFUSt - B.HONGERUSt - B.IHBGAUSLUSt - B.IHRZUSt) AS TaxableExpensesVAT,
        --SUM(B.Honorar + B.RAHonorar + B.KFK + B.IHNEP + B.RHNEP + B.RARZ + B.RHR02 + B.RHSTRAF + B.HONGER + B.IHBGAUSL + B.IHBONI + B.IHRZ) AS Fee,
		SUM(B.Honorar + B.RAHonorar + B.KFK + B.IHNEP + B.RHNEP + B.RARZ + B.RHR02 + B.RHSTRAF + B.HONGER + B.IHBGAUSL + B.IHRZ) AS Fee,
        --SUM(B.HonorarUSt + B.RAHonorarUSt + B.KFKUSt + B.IHNEPUSt + B.RHNEPUSt + B.RARZUSt + B.RHR02USt + B.RHSTRAFUSt + B.HONGERUSt + B.IHBGAUSLUSt + B.IHBONIUSt + B.IHRZUSt) AS FeeVAT,
		SUM(B.HonorarUSt + B.RAHonorarUSt + B.KFKUSt + B.IHNEPUSt + B.RHNEPUSt + B.RARZUSt + B.RHR02USt + B.RHSTRAFUSt + B.HONGERUSt + B.IHBGAUSLUSt + B.IHRZUSt) AS FeeVAT,
        SUM(B.EPEingang + B.EPEingHF + B.EPEingHFZi + B.EPEingKost + B.EPEingKoZi - Round(B.UeberzgEP/(1 + B.VATRate),2)) AS PCommReceipt,
        SUM(B.EPEingangUSt + B.EPEingHFUSt + B.EPEingHFZiUSt + B.EPEingKostUSt + B.EPEingKoZiUSt - (B.UeberzgEP - Round(B.UeberzgEP/(1 + B.VATRate),2))) AS PCommReceiptVAT,

		SUM(B.EPEingang - Round(B.UeberzgEP/(1 + B.VATRate),2)) AS PCommReceiptOld,
		SUM(B.EPEingangUSt - (B.UeberzgEP - Round(B.UeberzgEP/(1 + B.VATRate),2))) AS PCommReceiptOldVAT,

		SUM(B.EPEingHF) AS PCommPClaimReceipt,
		SUM(B.EPEingHFUSt) AS PCommPClaimReceiptVAT,

		SUM(B.EPEingHFZi) AS PCommPClaimInterestReceipt,
		SUM(B.EPEingHFZiUSt) AS PCommPClaimInterestReceiptVAT,

		SUM(B.EPEingKost) AS PCommCostReceipt,
		SUM(B.EPEingKostUSt) AS PCommCostReceiptVAT,

		SUM(B.EPEingKoZi) AS PCommCostInterestReceipt,
		SUM(B.EPEingKoZiUSt) AS PCommCostInterestReceiptVAT,

        SUM(B.UeberzgSch) AS OverpaymentDebtor,
        SUM(B.UeberzgEP) AS OverpaymentPComm, 

		CCase.Lock AS CaseLock, 
		SchuldKontakt.Lock AS DebtorLock,
		ikaros.Currency.Code AS CurrencyCode,
        ikaros.Currency.Designation AS CurrencyDesignation
		
        FROM
ikaros.BookingWithAccountsInColumns AS B 
JOIN ikaros.Event ON(ikaros.Event.ID = B.EventID) 
JOIN ikaros.EventFlag WITH (INDEX(IDX_EventFlag_ReferenceIDType))
        ON(ikaros.EventFlag.EventID = B.EventID) 
JOIN ikaros.EventTemplate ON EventTemplate.ID = Event.EventTemplateID 
JOIN ikaros.CCase ON(ikaros.CCase.ID = B.CCaseID)
JOIN ikaros.Contact AS SchuldKontakt ON(SchuldKontakt.ID = ikaros.CCase.DebtorID)
JOIN ikaros.Clearing AS SubClearing ON (SubClearing.ID = ikaros.EventFlag.ReferenceID)  -- Clearing des Einzel-Gläubigers
JOIN ikaros.Clearing AS MainClearing -- Clearing des Verbund-Gläubigers 
ON (MainClearing.ClearingRunID = SubClearing.ClearingRunID AND MainClearing.ClientID = SubClearing.ClearingClientID) 
JOIN ikaros.ClearingClientName AS AbrMand ON(AbrMand.ID = MainClearing.ID)  -- Gläubiger-Abrechnungsdaten zum Verbund-Gläubiger 
JOIN ikaros.Client AS Client ON Client.ContactID = SubClearing.ClientID
JOIN ikaros.Contact ON Contact.ID = subClearing.ClientID -- Kontakt zum Einzel-Gläubiger 
JOIN ikaros.Currency ON ikaros.CCase.CurrencyID = Currency.ID
WHERE
  ikaros.EventFlag.Type = 'AbrFG'
  AND NOT EXISTS(SELECT 1
                 FROM ikaros.EventTemplateCategoryAssignment AS VgKatZuord
                 JOIN ikaros.EventTemplateCategory AS VgKat ON VgKatZuord.EventTemplateCategoryID = VgKat.ID
                 WHERE VgKatZuord.EventTemplateID = ikaros.Event.EventTemplateID
                 AND VgKat.Designation = ikaros.SettingGetString('KatZgVorUebernahme', DEFAULT, DEFAULT)
                 )
GROUP BY
MainClearing.ID, -- Clearing-ID des Verbund-Gläubigers 
SubClearing.ID,  -- Clearing-ID der Einzel-Gläubiger 
AbrMand.ClientNo, 
AbrMand.Matchcode, 
Client.ClientNo, 
Contact.Matchcode, 


--ikaros.Clearing.ID,
         ikaros.ClrGetClearingDate(MainClearing.ID, 'ikaros.ClearingTPMCase'),
		 ikaros.Currency.Code,
         ikaros.Currency.Designation,
         B.VATRate,
         B.Variant,
         CASE WHEN ikaros.StageGetBaseStage(B.Stage) = 'Ü'
              THEN
                'Ü'
              ELSE
                'I'
         END,
ikaros.CCase.RefNo,
ikaros.CCase.ClientCustomerRefNo,
CASE WHEN B.Variant = 'A'
     THEN
       'A'
     ELSE
       B.Recipient
END,
SchuldKontakt.Matchcode,
AbrMand.ClientNo,
RTRIM(LTRIM(ISNULL(AbrMand.FirstName,''))) + 
CASE WHEN AbrMand.FirstName IS NOT NULL AND AbrMand.FirstName <> ''
     THEN
        ' '
     ELSE
        ''
END + 
RTRIM(LTRIM(ISNULL(AbrMand.Name1,''))) + 
' ' + RTRIM(LTRIM(ISNULL(AbrMand.Name2,''))),
B.PretaxAttribute,
AbrMand.DateFrom,
AbrMand.DateTo,
B.Stage,
B.Recipient,
AbrMand.FirstName,
AbrMand.Name1,
AbrMand.Name2, 
CCase.Lock, 
SchuldKontakt.Lock,
Ccase.PCommContractID,
Event.Stage,
EventTemplate.AccountSymbol,
Client.LegalProceedingsMinimum


--FROM ikaros.BookingWithAccountsInColumns AS B  

--JOIN ikaros.Event ON(ikaros.Event.ID = B.EventID)  

--JOIN ikaros.EventFlag WITH (INDEX(IDX_EventFlag_ReferenceIDType)) 

--ON(ikaros.EventFlag.EventID = B.EventID)  

--JOIN ikaros.Clearing AS SubClearing ON (SubClearing.ID = ikaros.EventFlag.ReferenceID)  -- Clearing des Einzel-Gläubigers 

--JOIN ikaros.Clearing AS MainClearing -- Clearing des Verbund-Gläubigers 

--ON (MainClearing.ClearingRunID = SubClearing.ClearingRunID AND MainClearing.ClientID = SubClearing.ClearingClientID)   

--JOIN ikaros.ClearingClientName AS AbrMand ON (AbrMand.ID = MainClearing.ID)  -- Gläubiger-Abrechnungsdaten zum Verbund-Gläubiger 

--JOIN ikaros.Client ON Client.ContactID = SubClearing.ClientID  -- Einzel-Gläubiger 

--JOIN ikaros.Contact ON Contact.ID = subClearing.ClientID -- Kontakt zum Einzel-Gläubiger 

 
GO
