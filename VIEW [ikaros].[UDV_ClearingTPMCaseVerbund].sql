    SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        VIEW [ikaros].[UDV_ClearingTPMCaseVerbund]
AS
SELECT 
	ClearingID, -- Clearing-ID des Verbund-Gläubigers 
	SubClearingID,  -- Clearing-ID der Einzel-Gläubiger 
	MainClientNo, 
	MainClient, 
	SubClientNo, 
	SubClient,
	ClearingDate,
	VATRate,
	StageCategory,
	DateFrom,
	DateTo,
	ClientNo,
	Client,
	ClientVAT,
	RefNo,
	ClientCustomerRefNo,
	CONVERT(VARCHAR(50), ikaros.GetAnonymizedVarChar(Debtor, CaseLock, DebtorLock)) AS Debtor,
	Payment, 
	Recipient, 
	PClaim,
	Interest,
	ClientCostInterest,
	PClaimInterest,
	ClientExpenses,
	ClientCosts,
	OverpaymentTPM,
	TaxFreeExpenses,
	TaxableExpenses,
	TaxableExpensesVAT,
	Fee,
	FeeVAT,
	PCommReceipt,
	PCommReceiptVAT,
	OverpaymentDebtor,
	OverpaymentPComm,

	--
	-- Auszahlungsbetrag
	-- FaW 2009-06-25 Zahlungen an den Anwalt - Empfaenger 'R' - müssen wie Zahlungen an das IKU behandelt werden
	 CASE WHEN Recipient IN ('I', 'R') THEN Payment ELSE 0 END AS PaymentDCA,
	-- Andr, 2006-08-09: Auszahlung bestimmen und von ZahlungIKU abziehen:
	CASE WHEN Recipient = 'A' THEN 
	 	Payment 
	ELSE 
	0 
	END AS InstalmentPayment,
	-- Column Payout:
	CASE WHEN Recipient in ('I', 'R') THEN 
		Payment 
	ELSE 
		0 
	END  -- = PaymentDCA
	- (TaxFreeExpenses + TaxableExpenses + TaxableExpensesVAT + Fee + FeeVAT + PCommReceipt + PCommReceiptVAT)
	- CASE WHEN Recipient = 'A' THEN 
		Payment 
	ELSE 
		0 
	END -- = InstalmentPayment
	AS Payout,
	CASE WHEN PClaim = 0 
			AND Interest = 0 
			AND ClientExpenses = 0 
			AND ClientCosts = 0 
			AND OverpaymentTPM = 0 
			AND TaxFreeExpenses = 0 
			AND TaxableExpenses = 0 
			AND Fee = 0 
			AND PCommReceipt = 0 
			AND CASE WHEN Recipient IN ('I', 'R') THEN 
				Payment 
			ELSE 
				0 
			END  
		- (TaxFreeExpenses + TaxableExpenses + TaxableExpensesVAT + Fee + FeeVAT + PCommReceipt + PCommReceiptVAT)
		- CASE WHEN Recipient = 'A' THEN Payment 
		ELSE 
			0 
		END -- = InstalmentPayment
	   -- = Payment
	= 0
	AND CASE WHEN Recipient = 'A' THEN 
	Payment 
	ELSE 
		0 
	END -- = InstalmentPayment 
	= 0 THEN 
		'J' 
	ELSE 
		'N' 
	END as ZeroLine,
	CurrencyCode,
	CurrencyDesignation,

	PCommReceiptOld AS PCommReceiptOldAmount,
	PCommReceiptOldVAT AS PCommReceiptOldAmountVat,

	PCommPClaimReceipt as PCommPClaimAmount,	
	PCommPClaimReceiptVAT as PCommPClaimVat,	
	CASE WHEN PClaim <> 0 THEN ROUND((PCommPClaimReceipt/PClaim)*100 ,2) ELSE 0.00 END AS PCommPClaim,

	PCommCostReceipt as PCommCostAmount,
	PCommCostReceiptVAT as PCommCostVat,
	CASE WHEN ClientCosts <> 0 THEN ROUND((PCommCostReceipt/ClientCosts)*100 ,2) ELSE 0.00 END AS PCommCosts,
	
	PCommPClaimInterestReceipt as PCommPClaimInterestAmount,
	PCommPClaimInterestReceiptVAT as PCommPClaimInterestVat,
	CASE WHEN PClaimInterest <> 0 THEN ROUND((PCommPClaimInterestReceipt/PClaimInterest)*100 ,2) ELSE 0.00 END AS PCommPClaimInterest,

	PCommCostInterestReceipt as PCommClientCostInterestAmount,
	PCommCostInterestReceiptVAT as PCommClientCostInterestVat,
	CASE WHEN ClientCostInterest <> 0 THEN ROUND((PCommCostInterestReceipt/ClientCostInterest)*100 ,2) ELSE 0.00 END AS PCommCostInterest

FROM
  ikaros.UDV_ClearingTPMCaseBaseVerbund
GO
