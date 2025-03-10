USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[CaseSumRemainingPClaim]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [ikaros].[CaseSumRemainingPClaim]
      (@refNo NVARCHAR(12) ,
       @voucherDate DATETIME = null)
RETURNS NUMERIC(10,2)
--
-- Berzosa, 2005-05-18: Neuer Parameter dBelegdatum. Die SQL-Funktion berechnet die Rest-HF bis zu einem übergebenen Belegdatum
--
-- Berzosa, 2003-04-10: Liefert die Rest-Hauptforderung zum angegebenen Az. zurück.
--  Wird für die Standardabschlussmeldung benötigt
--
   AS
begin
   if @voucherDate is null set @voucherDate = GetDate()
   declare @nRestHF NUMERIC(10,2)
  --  
   select @nRestHF = Sum(isnull(ikaros.Booking.Amount,0)
                         *case when ikaros.Event.Variant in('F','H','T') 
                               then 1 
                               else -1
                          end) 
   from ikaros.Booking
   join ikaros.Account on ikaros.Booking.AccountID = ikaros.Account.ID
   join ikaros.Event on ikaros.Booking.EventID = ikaros.Event.ID
   join ikaros.CCase on ikaros.Event.CCaseID = ikaros.CCase.ID
   where ikaros.CCase.RefNo = @refNo 
         and ikaros.Account.AccountCode = 'GLHF' 
         and ikaros.Event.VoucherDate <= @voucherDate
  --
   return(@nRestHF)
end

GO
