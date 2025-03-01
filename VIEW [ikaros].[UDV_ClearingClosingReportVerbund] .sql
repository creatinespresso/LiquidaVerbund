SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     VIEW [ikaros].[UDV_ClearingClosingReportVerbund] 
AS
	SELECT 
	MainClearing.ID AS ClearingID, -- Clearing-ID des Verbund-Gläubigers 
SubClearing.ID AS SubClearingID,  -- Clearing-ID der Einzel-Gläubiger 
AbrMand.ClientNo AS MainClientNo, 
AbrMand.Matchcode AS MainClient, 
Client.ClientNo AS SubClientNo, 
Contact.Matchcode AS SubClient, 
	
	
	--Clearing.ID AS ClearingID,
		ikaros.ClrGetClearingDate(MainClearing.ID, 'ikaros.ClearingClosingReport') AS ClearingDate,
		CASE WHEN ikaros.StageGetBaseStage(VorgangAbschl.Stage) = 'Ü'
		THEN
			'Ü'
		ELSE
			'I'
		END AS StageCategory,
		AbrMand.DateFrom AS DateFrom,
		AbrMand.DateTo AS DateTo,
		AbrMand.ClientNo AS ClientNo,
		rtrim(ltrim(ISNULL(AbrMand.FirstName,''))) + 
		      CASE WHEN AbrMand.FirstName IS NOT NULL AND AbrMand.FirstName <> ''
		           THEN
		             ' '
		           ELSE
		             ''
		           END +
		           rtrim(ltrim(isnull(AbrMand.Name1,''))) + 
		           ' ' + 
		           rtrim(ltrim(isnull(AbrMand.Name2,''))) AS Client,
		ikaros.CCase.RefNo,
		ikaros.CCase.ClientCustomerRefNo,
		CONVERT(NVARCHAR(50), ikaros.GetAnonymizedVarChar(SchuldKontakt.MatchCode, CCase.Lock, SchuldKontakt.Lock)) AS Debtor,          
		ikaros.CCase.AcceptanceDate,
      ikaros.CaseSumInheritedPClaim(ikaros.CCase.RefNo) AS PClaimAccepted,
      VorgangAbschl.VATRate,
      AbrMand.PretaxAttribute AS ClientVAT,
      ikaros.CaseSumRemainingPClaim(ikaros.CCase.RefNo, DEFAULT) AS PClaimBalance,
      VorgangAbschl.EventDate AS ClosingDate,
      VgVorlageAbschl.EventCode AS ClosingCode,
      VorgangAbschl.Designation AS ClosingDesignation,
		-- Künstliche Sortierung der Abschlüsse
		-- nach 1 - positiv / 2 - negativ / 3 - Übergang ins Ü-Verfahren / 4 - Reaktivierung
      CASE WHEN SUBSTRING(VgVorlageAbschl.EventCode,1,2) = 'IP'
           THEN
             1
           ELSE
           CASE WHEN SUBSTRING(VgVorlageAbschl.EventCode,1,2) = 'IN'
                THEN
                  2
                ELSE
                  CASE WHEN SUBSTRING(VgVorlageAbschl.EventCode,1,2) = 'IÜ'
                       THEN
                         3
                       ELSE
                         4
                       END
                END
            END AS ClosingGroup,
		Currency.Code AS Currency,
		Currency.Designation AS CurrencyDesignation
FROM ikaros.CCase
JOIN ikaros.Currency ON CCase.CurrencyID = Currency.ID
JOIN ikaros.Event AS VorgangAbschl on(VorgangAbschl.CCaseID = ikaros.CCase.ID)
JOIN ikaros.EventTemplate AS VgVorlageAbschl ON(VgVorlageAbschl.ID = VorgangAbschl.EventTemplateID)
JOIN ikaros.EventFlag AS VgFlagAbschl ON(VgFlagAbschl.EventID = VorgangAbschl.ID AND VgFlagAbschl.Type = 'AbrAbschl')
JOIN ikaros.Clearing AS SubClearing ON (SubClearing.ID = VgFlagAbschl.ReferenceID)  -- Clearing des Einzel-Gläubigers
JOIN ikaros.Clearing AS MainClearing -- Clearing des Verbund-Gläubigers 
ON (MainClearing.ClearingRunID = SubClearing.ClearingRunID AND MainClearing.ClientID = SubClearing.ClearingClientID) 
JOIN ikaros.Client AS Client ON Client.ContactID = SubClearing.ClientID
JOIN ikaros.Contact ON Contact.ID = subClearing.ClientID -- Kontakt zum Einzel-Gläubiger 
JOIN ikaros.ClearingRun ON(ikaros.ClearingRun.ID = MainClearing.ClearingRunID)
JOIN ikaros.Contact AS SchuldKontakt ON(SchuldKontakt.ID = ikaros.CCase.DebtorID)
JOIN ikaros.ClearingClientName AS AbrMand ON(AbrMand.ID = MainClearing.ID)  -- Gläubiger-Abrechnungsdaten zum Verbund-Gläubiger

WHERE ikaros.CCase.Subcase = 0
GO
