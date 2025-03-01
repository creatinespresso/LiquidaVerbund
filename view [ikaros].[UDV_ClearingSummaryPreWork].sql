SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   view [ikaros].[UDV_ClearingSummaryPreWork]
as --
  --**************************************************************************************************
  --* Bitte unbedingt beachten!                                                                      *
  --**************************************************************************************************
  --* An dieser View darf unter gar keinen Umständen etwas verändert werden.                         *
  --* Falls nötig, richten Sie sich bitte eigene benutzerdefinierte Views ein (UDVs).                *
  --**************************************************************************************************
select 
   ClearingID,
   DateFrom,
   DateTo,
   StageCategory,
   VATRate,
   ClientNo,
   Client,
   ClientVAT,
   isNull(sum(Payout),0) as PaymentDCAPayout,
   isNull(sum(case when Recipient IN ('I', 'R')
                   then Payment 
                   else 0
              end),0
         ) as PaymentDCAPayment,
   isNull(sum(TaxFreeExpenses),0) as PaymentDCATaxFreeExpenses,
   isNull(sum(TaxableExpenses),0) as PaymentDCATaxableExpenses,
   isNull(sum(TaxableExpensesVAT),0) as PaymentDCATaxableExpensesVAT,
   isNull(sum(Fee),0) as PaymentDCAFee,
   isNull(sum(FeeVAT),0) as PaymentDCAFeeVAT,
   isNull(sum(PCommReceipt),0) as PaymentDCAPComm,
   isNull(sum(PCommReceiptVAT),0) as PaymentDCAPCommVAT,
   isNull(sum(TaxFreeExpenses),0)
        +isNull(sum(TaxableExpenses),0)
        +isNull(sum(TaxableExpensesVAT),0)
        +isNull(sum(Fee),0)
        +isNull(sum(FeeVAT),0)
        +isNull(sum(PCommReceipt),0)
        +isNull(sum(PCommReceiptVAT),0) as PaymentDCADCAClaim,
   isNull(sum(case when Recipient = 'A' 
              then InstalmentPayment 
              else 0
              end),0
         ) as InstalmentPayment,
   Sum(0) as PaymentClientPayout,
   Sum(0) as PaymentClientPayment,
   Sum(0) as PaymentClientTaxFreeExpenses,
   Sum(0) as PaymentClientTaxableExpenses,
   Sum(0) as PaymClientTaxableExpensesVAT,
   Sum(0) as PaymentClientFee,
   Sum(0) as PaymentClientFeeVAT,
   Sum(0) as PaymentClientPComm,
   Sum(0) as PaymentClientPCommVAT,
   Sum(0) as PaymentClientDCAClaim,
   Sum(0) as PaymClientOverpaymentPComm,
   Sum(0) as PaymClientOverpaymentDebtor,
   Sum(0) as CostsPayout,
   Sum(0) as CostsTaxFreeExpExclLitigation,
   Sum(0) as CostsTaxableExpExclLitigation,
   Sum(0) as CostsTaxableExpExclLitigatVAT,
   Sum(0) as CostsFee,
   Sum(0) as CostsFeeVAT,
   Sum(0) as CostsLitigationTaxFreeExpenses,
   Sum(0) as CostsLitigationTaxableExpenses,
   Sum(0) as CostsLitigationTaxableExpVAT,
   CurrencyCode as CurrencyCode
from
   ikaros.UDV_ClearingTPMCase 
where
   Recipient <> 'G'
group by 
   ClearingID,
   DateFrom,
   DateTo,
   CurrencyCode,
   StageCategory,
   VATRate,
   ClientNo,
   Client,
   ClientVAT 
union all
   select 
      ClearingID,
      DateFrom,
      DateTo,
      StageCategory,
      VATRate,
      ClientNo,
      Client,
      ClientVAT,
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      isNull(sum(Payout),0) as PaymentClientPayout,
      isNull(sum(Payment),0),
      isNull(sum(TaxFreeExpenses),0),
      isNull(sum(TaxableExpenses),0),
      isNull(sum(TaxableExpensesVAT),0),
      isNull(sum(Fee),0),
      isNull(sum(FeeVAT),0),
      isNull(sum(PCommReceipt),0),
      isNull(sum(PCommReceiptVAT),0),
      CONVERT(numeric(13,5),-isNull(sum(Payout),0)),
      isNull(sum(OverpaymentPComm),0),
      isNull(sum(OverpaymentDebtor),0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
      Sum(0),
	  CurrencyCode as CurrencyCode
   from
      ikaros.UDV_ClearingTPMCase 
   where
      Recipient = 'G'
   group by 
      ClearingID,
      DateFrom,
      DateTo,
	  CurrencyCode,
      StageCategory,
      VATRate,
      ClientNo,
      Client,
      ClientVAT 
   union all
      select 
         ClearingID,
         DateFrom,
         DateTo,
         StageCategory,
         VATRate,
         ClientNo,
         Client,
         ClientVAT,
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         Sum(0),
         CONVERT(numeric(13,5),Sum(0)),
         Sum(0),
         Sum(0),
         -(sum(TaxFreeExpenses)
          +sum(TaxableExpenses)
          +sum(TaxableExpensesVAT)
          +sum(Fee)
          +sum(FeeVAT)
          +sum(LitigationTaxFreeExpenses)
          +sum(LitigationTaxableExpenses)
          +sum(LitigationTaxableExpensesVAT)) as CostsPayout,
         sum(TaxFreeExpenses) as CostsTaxFreeExpExclLitigation,
         sum(TaxableExpenses) as CostsTaxableExpExclLitigation,
         sum(TaxableExpensesVAT) as CostsTaxableExpExclLitigatVAT,
         sum(Fee) as CostsFee,
         sum(FeeVAT) as CostsFeeVAT,
         sum(LitigationTaxFreeExpenses) as CostsLitigationTaxFreeExpenses,
         sum(LitigationTaxableExpenses) as CostsLitigationTaxableExpenses,
         sum(LitigationTaxableExpensesVAT) as CostsLitigationTaxableExpVAT,
		 Currency as CurrencyCode 
      from
         ikaros.UDV_ClearingCostBurden
      group by 
         ClearingID,
         DateFrom,
         DateTo,
		 Currency,
         StageCategory,
         VATRate,
         ClientNo,
         Client,
         ClientVAT
GO
