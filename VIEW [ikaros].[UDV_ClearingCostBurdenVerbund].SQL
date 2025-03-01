SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      VIEW [ikaros].[UDV_ClearingCostBurdenVerbund]
AS
SELECT 
MainClearing.ID AS ClearingID, -- Clearing-ID des Verbund-Gläubigers 
SubClearing.ID AS SubClearingID,  -- Clearing-ID der Einzel-Gläubiger 
AbrMand.ClientNo AS MainClientNo, 
AbrMand.Matchcode AS MainClient, 
Client.ClientNo AS SubClientNo, 
Contact.Matchcode AS SubClient, 
--ikaros.Clearing.ID AS ClearingID,
	ikaros.ClrGetClearingDate(MainClearing.ID, 'ikaros.ClearingCostBurden') AS ClearingDate,
	B.VATRate,
	CASE WHEN ikaros.StageGetBaseStage(B.Stage) = 'Ü' THEN
		'Ü'
	ELSE
		'I'
	END AS StageCategory,
	AbrMand.DateFrom AS DateFrom,
	AbrMand.DateTo AS DateTo,
	AbrMand.ClientNo AS ClientNo,
	RTRIM(LTRIM(ISNULL(AbrMand.FirstName,''))) + 
	CASE WHEN AbrMand.FirstName IS NOT NULL AND AbrMand.FirstName <> '' THEN
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
	CONVERT(VARCHAR(50), ikaros.GetAnonymizedVarChar(SchuldKontakt.Matchcode, ikaros.CCase.Lock, SchuldKontakt.Lock)) AS Debtor,
	SUM(B.MainAccountDCATaxFree+B.MainAccountLawyerTaxFree -B.ProzStfr) AS TaxFreeExpenses,
	--SUM(B.MainAccountDCATaxable+B.MainAccountLawyerTaxable -B.Honorar -B.RAHonorar -B.KFK -B.ProzStpfl -B.IHNEP - B.RHNEP - B.RARZ - B.RHR02 - B.RHSTRAF - B.HONGER - B.IHBGAUSL - B.IHBONI - B.IHRZ) AS TaxableExpenses,
	SUM(B.MainAccountDCATaxable+B.MainAccountLawyerTaxable -B.Honorar -B.RAHonorar -B.KFK -B.ProzStpfl -B.IHNEP - B.RHNEP - B.RARZ - B.RHR02 - B.RHSTRAF - B.HONGER - B.IHBGAUSL - B.IHRZ) AS TaxableExpenses,
	--SUM(B.MainAccountDCAVAT+B.MainAccountLawyerVAT -B.HonorarUSt -B.RAHonorarUSt -B.KFKUSt -B.ProzStpflUst - B.IHNEPUSt - B.RHNEPUSt - B.RARZUSt - B.RHR02USt - B.RHSTRAFUSt - B.HONGERUSt - B.IHBGAUSLUSt - B.IHBONIUSt - B.IHRZUSt) AS TaxableExpensesVAT,
	SUM(B.MainAccountDCAVAT+B.MainAccountLawyerVAT -B.HonorarUSt -B.RAHonorarUSt -B.KFKUSt -B.ProzStpflUst - B.IHNEPUSt - B.RHNEPUSt - B.RARZUSt - B.RHR02USt - B.RHSTRAFUSt - B.HONGERUSt - B.IHBGAUSLUSt - B.IHRZUSt) AS TaxableExpensesVAT,
	--SUM(B.Honorar+B.KFK + B.IHNEP + B.RHNEP + B.RARZ + B.RHR02 + B.RHSTRAF + B.HONGER + B.IHBGAUSL + B.IHBONI + B.IHRZ) AS Fee,
	SUM(B.Honorar+B.KFK + B.IHNEP + B.RHNEP + B.RARZ + B.RHR02 + B.RHSTRAF + B.HONGER + B.IHBGAUSL + B.IHRZ) AS Fee,
	--SUM(B.HonorarUSt+B.KFKUSt+ B.IHNEPUSt + B.RHNEPUSt + B.RARZUSt + B.RHR02USt + B.RHSTRAFUSt + B.HONGERUSt + B.IHBGAUSLUSt + B.IHBONIUSt + B.IHRZUSt) AS FeeVAT,
	SUM(B.HonorarUSt+B.KFKUSt+ B.IHNEPUSt + B.RHNEPUSt + B.RARZUSt + B.RHR02USt + B.RHSTRAFUSt + B.HONGERUSt + B.IHBGAUSLUSt + B.IHRZUSt) AS FeeVAT,
	SUM(B.ProzStfr) AS LitigationTaxFreeExpenses,
	SUM(B.ProzStpfl) AS LitigationTaxableExpenses,
	SUM(B.ProzStpflUst) AS LitigationTaxableExpensesVAT,
	--SUM(B.Honorar+B.KFK+ B.IHNEP + B.HONGER + B.IHBGAUSL + B.IHBONI + B.IHRZ) AS DCAFee,
	SUM(B.Honorar+B.KFK+ B.IHNEP + B.HONGER + B.IHBGAUSL + B.IHRZ) AS DCAFee,
	--SUM(B.HonorarUSt+B.KFKUSt+B.IHNEPUSt + B.HONGERUSt + B.IHBGAUSLUSt + B.IHBONIUSt + B.IHRZUSt) AS DCAFeeVAT,
	SUM(B.HonorarUSt+B.KFKUSt+B.IHNEPUSt + B.HONGERUSt + B.IHBGAUSLUSt + B.IHRZUSt) AS DCAFeeVAT,
	SUM(B.RAHonorar +B.RHNEP + B.RARZ + B.RHR02 + B.RHSTRAF) AS LawyerFee,
	SUM(B.RAHonorarUSt +B.RHNEPUSt + B.RARZUSt + B.RHR02USt + B.RHSTRAFUSt) AS LawyerFeeVAT,
	SUM(B.MainAccountDCATaxFree+B.MainAccountDCATaxable+B.MainAccountLawyerTaxFree+B.MainAccountLawyerTaxable) AS Amount,
	SUM(B.MainAccountDCAVAT+B.MainAccountLawyerVAT) AS VAT,
	SUM(B.MainAccountDCATaxFree+B.MainAccountDCATaxable+B.MainAccountLawyerTaxFree+B.MainAccountLawyerTaxable+B.MainAccountDCAVAT+B.MainAccountLawyerVAT) AS TotalAmount,
    Currency.Code as Currency,
	Currency.Designation as CurrencyDesignation
FROM
--	ikaros.BookingWithAccountsInColumns AS B
--JOIN ikaros.EventFlag ON (ikaros.EventFlag.EventID = B.EventID)
--JOIN ikaros.CCase ON (ikaros.CCase.ID = B.CCaseID)
--JOIN ikaros.Currency ON (ikaros.CCase.CurrencyID = Currency.ID)

--JOIN ikaros.Contact AS SchuldKontakt ON (SchuldKontakt.ID = ikaros.CCase.DebtorID)
--JOIN ikaros.Clearing ON (ikaros.Clearing.ID = ikaros.EventFlag.ReferenceID)
--JOIN ikaros.ClearingClientName AS AbrMand ON (AbrMand.ID = ikaros.Clearing.ID)


ikaros.BookingWithAccountsInColumns AS B 
--JOIN ikaros.Event ON(ikaros.Event.ID = B.EventID) 
JOIN ikaros.EventFlag --WITH (INDEX(IDX_EventFlag_ReferenceIDType))
        ON(ikaros.EventFlag.EventID = B.EventID) 
--JOIN ikaros.EventTemplate ON EventTemplate.ID = Event.EventTemplateID 
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
	ikaros.EventFlag.Type = 'AbrKostB'
GROUP BY 
MainClearing.ID, -- Clearing-ID des Verbund-Gläubigers 
SubClearing.ID,  -- Clearing-ID der Einzel-Gläubiger 
AbrMand.ClientNo, 
AbrMand.Matchcode, 
Client.ClientNo, 
Contact.Matchcode, 

--	ikaros.Clearing.ID,
	ikaros.ClrGetClearingDate(MainClearing.ID, 'ikaros.ClearingCostBurden'),
	B.VATRate,
	Currency.Code,
	Currency.Designation,
	CASE WHEN ikaros.StageGetBaseStage(B.Stage) = 'Ü'
		THEN
	   	'Ü'
	  	ELSE
	    	'I'
	END,
	ikaros.CCase.RefNo,
	ikaros.CCase.ClientCustomerRefNo,
	CONVERT(VARCHAR(50), ikaros.GetAnonymizedVarChar(SchuldKontakt.Matchcode, ikaros.CCase.Lock, SchuldKontakt.Lock)),
	AbrMand.ClientNo,
	RTRIM(LTRIM(AbrMand.FirstName)) + 
	CASE WHEN AbrMand.FirstName IS NOT NULL AND AbrMand.FirstName <> '' THEN
		' '
	ELSE
		''
	END + 
	RTRIM(LTRIM(AbrMand.Name1)) + 
	' ' + 
	RTRIM(LTRIM(AbrMand.Name2)),
	B.PretaxAttribute,
	AbrMand.DateFrom,
	AbrMand.DateTo,
	B.Stage,
	AbrMand.FirstName,
	AbrMand.Name1,
	AbrMand.Name2
GO
