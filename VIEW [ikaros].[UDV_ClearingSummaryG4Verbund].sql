SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE         VIEW [ikaros].[UDV_ClearingSummaryG4Verbund]
AS 
SELECT 
   ikaros.UDV_ClearingSummaryPreWorkVerbund.ClearingID AS ClearingID, -- Clearing-ID des Verbund-Gläubigers 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.SubClearingID,  -- Clearing-ID der Einzel-Gläubiger 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.MainClientNo, 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.MainClient, 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.SubClientNo, 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.SubClient,
   -- Abrechnungsdaten
   ikaros.Clearing.InvoiceNo,
   ikaros.Clearing.ClearingNo,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.DateFrom,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.DateTo,
   ikaros.ClrGetClearingDate(ClearingID, 'ikaros.ClearingSummary') AS ClearingDate,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.StageCategory,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.VATRate,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.ClientNo,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.Client,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.ClientVAT,
   ikaros.ClearingClientName.ReverseCharge,
   ISNULL(ikaros.ClearingClientName.VATSerialNo,'') AS VATSerialNo,
   CASE WHEN ikaros.ClearingClientName.ReverseCharge = ikaros.GetTrue()
   THEN (SELECT ISNULL(Client.VATSerialNo,'') 
   FROM ikaros.Setting  
   JOIN ikaros.Client ON (Setting.Value = Client.ContactID) 
   WHERE SettingName = 'IKUKontakt') 
   ELSE '' END AS VATSeriaNoIDL,
   -- Gläubigerdaten
   ikaros.ClearingClientName.AddressForm,
   ikaros.ClearingClientName.FirstName,
   ikaros.ClearingClientName.Name1,
   ikaros.ClearingClientName.Name2,
   ikaros.ClearingClientName.Name3,
   ikaros.ClearingClientName.Street,
   ikaros.ClearingClientName.PostalCode,
   ikaros.ClearingClientName.CountryCode,
   ikaros.ClearingClientName.City,
   Country.Designation as Country,
   -- Zahlungen ans IKU
   sum(PaymentDCAPayout) as PaymentDCAPayout,
   sum(PaymentDCAPayment) as PaymentDCAPayment,
   sum(PaymentDCATaxFreeExpenses) as PaymentDCATaxFreeExpenses,
   sum(PaymentDCATaxableExpenses) as PaymentDCATaxableExpenses,
   sum(PaymentDCATaxableExpensesVAT) as PaymentDCATaxableExpensesVAT,
   sum(PaymentDCAFee) as PaymentDCAFee,
   sum(PaymentDCAFeeVAT) as PaymentDCAFeeVAT,
   sum(PaymentDCAPComm) as PaymentDCAPComm,
   sum(PaymentDCAPCommVAT) as PaymentDCAPCommVAT,
   sum(PaymentDCADCAClaim) as PaymentDCADCAClaim,
   sum(InstalmentPayment) as InstalmentPayment,
   -- Zahlungen an Gläubiger
   sum(PaymentClientPayout) as PaymentClientPayout,
   sum(PaymentClientPayment) as PaymentClientPayment,
   sum(PaymentClientTaxFreeExpenses) as PaymentClientTaxFreeExpenses,
   sum(PaymentClientTaxableExpenses) as PaymentClientTaxableExpenses,
   sum(PaymClientTaxableExpensesVAT) as PaymClientTaxableExpensesVAT,
   sum(PaymentClientFee) as PaymentClientFee,
   sum(PaymentClientFeeVAT) as PaymentClientFeeVAT,
   sum(PaymentClientPComm) as PaymentClientPComm,
   sum(PaymentClientPCommVAT) as PaymentClientPCommVAT,
   sum(PaymClientOverpaymentPComm) as PaymClientOverpaymentPComm,
   sum(PaymClientOverpaymentDebtor) as PaymClientOverpaymentDebtor,
   sum(PaymentClientDCAClaim) as PaymentClientDCAClaim,
   -- Kostenbelastungen
   sum(CostsPayout) as CostsPayout,
   sum(CostsTaxFreeExpExclLitigation) as CostsTaxFreeExpExclLitigation,
   sum(CostsTaxableExpExclLitigation) as CostsTaxableExpExclLitigation,
   sum(CostsTaxableExpExclLitigatVAT) as CostsTaxableExpExclLitigatVAT,
   sum(CostsFee) as CostsFee,
   sum(CostsFeeVAT) as CostsFeeVAT,
   sum(CostsLitigationTaxFreeExpenses) as CostsLitigationTaxFreeExpenses,
   sum(CostsLitigationTaxableExpenses) as CostsLitigationTaxableExpenses,
   sum(CostsLitigationTaxableExpVAT) as CostsLitigationTaxableExpVAT,
   -- Ergebnisse für Tabelle AbrErgebnis
   case when sum(PaymentDCAPayout)+sum(PaymentClientPayout) > 0 
        then sum(PaymentDCAPayout)+sum(PaymentClientPayout) 
        else 0.0
   end as TPMPayout,
   case when sum(PaymentDCAPayout)+sum(PaymentClientPayout) < 0 
        then -sum(PaymentDCAPayout) -sum(PaymentClientPayout) 
        else 0.0
   end as TPMInvoice,
   -sum(CostsPayout) as CostBurden,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.CurrencyCode,
   ikaros.Currency.Designation as CurrencyDesignation 
from
   ikaros.UDV_ClearingSummaryPreWorkVerbund
join
   ikaros.Clearing on(ikaros.Clearing.ID = ikaros.UDV_ClearingSummaryPreWorkVerbund.ClearingID) 
join
   ikaros.ClearingClientName on(ikaros.ClearingClientName.ID = ikaros.UDV_ClearingSummaryPreWorkVerbund.ClearingID)
 join
   ikaros.Currency on(ikaros.Currency.Code = ikaros.UDV_ClearingSummaryPreWorkVerbund.CurrencyCode)
left join ikaros.Country ON ClearingClientName.CountryCode = Country.PostCode
group by 
   ikaros.UDV_ClearingSummaryPreWorkVerbund.ClearingID,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.SubClearingID,  -- Clearing-ID der Einzel-Gläubiger 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.MainClientNo, 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.MainClient, 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.SubClientNo, 
	ikaros.UDV_ClearingSummaryPreWorkVerbund.SubClient,
   ikaros.Clearing.InvoiceNo,
   ikaros.Clearing.ClearingNo,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.DateFrom,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.DateTo,
   ikaros.ClrGetClearingDate(ClearingID, 'ikaros.ClearingSummary'),
   ikaros.UDV_ClearingSummaryPreWorkVerbund.CurrencyCode,
   ikaros.Currency.Designation,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.StageCategory,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.VATRate,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.ClientNo,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.Client,
   ikaros.UDV_ClearingSummaryPreWorkVerbund.ClientVAT,
   ikaros.ClearingClientName.ReverseCharge,
   ikaros.ClearingClientName.VATSerialNo,
   ikaros.ClearingClientName.AddressForm,
   ikaros.ClearingClientName.FirstName,
   ikaros.ClearingClientName.Name1,
   ikaros.ClearingClientName.Name2,
   ikaros.ClearingClientName.Name3,
   ikaros.ClearingClientName.Street,
   ikaros.ClearingClientName.PostalCode,
   ikaros.ClearingClientName.CountryCode,
   ikaros.ClearingClientName.City,
   Country.Designation
GO
