SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [ikaros].[BookingWithAccountsInColumns] AS
--
-- ACHTUNG!
--
-- Diese View ist automatisch generiert worden.
-- Sie kann jederzeit überschrieben werden, 
-- daher darf sie nicht verändert werden.

 select Booking.ID AS BookingID, Event.ID AS EventID, Event.Stage AS Stage, Event.VATRate AS VATRate, Event.Variant AS Variant, Event.Recipient AS Recipient, Event.CCaseID AS CCaseID, CCase.RefNo AS RefNo, CCase.ClientCustomerRefNo AS ClientCustomerRefNo, Client.PretaxAttribute AS PretaxAttribute
, case when AccountCode = 'UeberzgSch' then Booking.Amount else 0 end AS 'UeberzgSch'
, case when AccountCode = 'EPEingang' then Booking.Amount else 0 end AS 'EPEingang'
, case when AccountCode = 'EPEingang' then Booking.VAT else 0 end AS 'EPEingangUSt'
, case when AccountCode = 'GlFG' then Booking.Amount else 0 end AS 'GlFG'
, case when AccountCode = 'RAFG' then Booking.Amount else 0 end AS 'RAFG'
, case when AccountCode = 'FORANZ' then Booking.Amount else 0 end AS 'FORANZ'
, case when AccountCode = 'GlRLS' then Booking.Amount else 0 end AS 'GlRLS'
, case when AccountCode = 'GlAuslagen' then Booking.Amount else 0 end AS 'GlAuslagen'
, case when AccountCode = 'GlKosten' then Booking.Amount else 0 end AS 'GlKosten'
, case when AccountCode = 'GlZinsKost' then Booking.Amount else 0 end AS 'GlZinsKost'
, case when AccountCode = 'GlZinsHF' then Booking.Amount else 0 end AS 'GlZinsHF'
, case when AccountCode = 'GlHF' then Booking.Amount else 0 end AS 'GlHF'
, case when AccountCode = 'UeberzgFG' then Booking.Amount else 0 end AS 'UeberzgFG'
, case when AccountCode = 'UeberzgEP' then Booking.Amount else 0 end AS 'UeberzgEP'
, case when AccountCode = 'EB' then Booking.Amount else 0 end AS 'EB'
, case when AccountCode = 'VER' then Booking.Amount else 0 end AS 'VER'
, case when AccountCode = 'FOR' then Booking.Amount else 0 end AS 'FOR'
, case when AccountCode = 'ZNZZ' then Booking.Amount else 0 end AS 'ZNZZ'
, case when AccountCode = 'PARK' then Booking.Amount else 0 end AS 'PARK'
, case when AccountCode = 'UmrechDiff' then Booking.Amount else 0 end AS 'UmrechDiff'
, case when AccountCode = 'RAUebersch' then Booking.Amount else 0 end AS 'RAUebersch'
, case when AccountCode = 'Behoerden' then Booking.Amount else 0 end AS 'Behoerden'
, case when AccountCode = 'GKKLAGE' then Booking.Amount else 0 end AS 'GKKLAGE'
, case when AccountCode = 'GK' then Booking.Amount else 0 end AS 'GK'
, case when AccountCode = 'GKMB' then Booking.Amount else 0 end AS 'GKMB'
, case when AccountCode = 'GKZV' then Booking.Amount else 0 end AS 'GKZV'
, case when AccountCode = 'StfrAusl' then Booking.Amount else 0 end AS 'StfrAusl'
, case when AccountCode = 'GV' then Booking.Amount else 0 end AS 'GV'
, case when AccountCode = 'IAAUSLAND' then Booking.Amount else 0 end AS 'IAAUSLAND'
, case when AccountCode = 'StfrAnz' then Booking.Amount else 0 end AS 'StfrAnz'
, case when AccountCode = 'StpflAusl' then Booking.Amount else 0 end AS 'StpflAusl'
, case when AccountCode = 'StpflAusl' then Booking.VAT else 0 end AS 'StpflAuslUSt'
, case when AccountCode = 'KFK' then Booking.Amount else 0 end AS 'KFK'
, case when AccountCode = 'KFK' then Booking.VAT else 0 end AS 'KFKUSt'
, case when AccountCode = 'IHRZ' then Booking.Amount else 0 end AS 'IHRZ'
, case when AccountCode = 'IHRZ' then Booking.VAT else 0 end AS 'IHRZUSt'
, case when AccountCode = 'Honorar' then Booking.Amount else 0 end AS 'Honorar'
, case when AccountCode = 'Honorar' then Booking.VAT else 0 end AS 'HonorarUSt'
, case when AccountCode = 'PORTO' then Booking.Amount else 0 end AS 'PORTO'
, case when AccountCode = 'PORTO' then Booking.VAT else 0 end AS 'PORTOUSt'
, case when AccountCode = 'HONGER' then Booking.Amount else 0 end AS 'HONGER'
, case when AccountCode = 'HONGER' then Booking.VAT else 0 end AS 'HONGERUSt'
, case when AccountCode = 'IHNEP' then Booking.Amount else 0 end AS 'IHNEP'
, case when AccountCode = 'IHNEP' then Booking.VAT else 0 end AS 'IHNEPUSt'
, case when AccountCode = 'IHDETEKTEI' then Booking.Amount else 0 end AS 'IHDETEKTEI'
, case when AccountCode = 'IHDETEKTEI' then Booking.VAT else 0 end AS 'IHDETEKTEIUSt'
, case when AccountCode = 'IHPOST' then Booking.Amount else 0 end AS 'IHPOST'
, case when AccountCode = 'IHPOST' then Booking.VAT else 0 end AS 'IHPOSTUSt'
, case when AccountCode = 'IHWIRT' then Booking.Amount else 0 end AS 'IHWIRT'
, case when AccountCode = 'IHWIRT' then Booking.VAT else 0 end AS 'IHWIRTUSt'
, case when AccountCode = 'IHAUSLAND' then Booking.Amount else 0 end AS 'IHAUSLAND'
, case when AccountCode = 'IHAUSLAND' then Booking.VAT else 0 end AS 'IHAUSLANDUSt'
, case when AccountCode = 'IHNOTAR' then Booking.Amount else 0 end AS 'IHNOTAR'
, case when AccountCode = 'IHNOTAR' then Booking.VAT else 0 end AS 'IHNOTARUSt'
, case when AccountCode = 'IHSCHUFA' then Booking.Amount else 0 end AS 'IHSCHUFA'
, case when AccountCode = 'IHSCHUFA' then Booking.VAT else 0 end AS 'IHSCHUFAUSt'
, case when AccountCode = 'IHHR' then Booking.Amount else 0 end AS 'IHHR'
, case when AccountCode = 'IHHR' then Booking.VAT else 0 end AS 'IHHRUSt'
, case when AccountCode = 'IHGWA' then Booking.Amount else 0 end AS 'IHGWA'
, case when AccountCode = 'IHGWA' then Booking.VAT else 0 end AS 'IHGWAUSt'
, case when AccountCode = 'IHCRIF' then Booking.Amount else 0 end AS 'IHCRIF'
, case when AccountCode = 'IHCRIF' then Booking.VAT else 0 end AS 'IHCRIFUSt'
, case when AccountCode = 'IHBONI' then Booking.Amount else 0 end AS 'IHBONI'
, case when AccountCode = 'IHBONI' then Booking.VAT else 0 end AS 'IHBONIUSt'
, case when AccountCode = 'IHEMA' then Booking.Amount else 0 end AS 'IHEMA'
, case when AccountCode = 'IHEMA' then Booking.VAT else 0 end AS 'IHEMAUSt'
, case when AccountCode = 'Auskunft' then Booking.Amount else 0 end AS 'Auskunft'
, case when AccountCode = 'Auskunft' then Booking.VAT else 0 end AS 'AuskunftUSt'
, case when AccountCode = 'IHSTP' then Booking.Amount else 0 end AS 'IHSTP'
, case when AccountCode = 'IHSTP' then Booking.VAT else 0 end AS 'IHSTPUSt'
, case when AccountCode = 'IHIADB' then Booking.Amount else 0 end AS 'IHIADB'
, case when AccountCode = 'IHIADB' then Booking.VAT else 0 end AS 'IHIADBUSt'
, case when AccountCode = 'IHBGAUSL' then Booking.Amount else 0 end AS 'IHBGAUSL'
, case when AccountCode = 'IHBGAUSL' then Booking.VAT else 0 end AS 'IHBGAUSLUSt'
, case when AccountCode = 'IHRLS' then Booking.Amount else 0 end AS 'IHRLS'
, case when AccountCode = 'IHRLS' then Booking.VAT else 0 end AS 'IHRLSUSt'
, case when AccountCode = 'IHADR' then Booking.Amount else 0 end AS 'IHADR'
, case when AccountCode = 'IHADR' then Booking.VAT else 0 end AS 'IHADRUSt'
, case when AccountCode = 'StpflAnz' then Booking.Amount else 0 end AS 'StpflAnz'
, case when AccountCode = 'StpflAnz' then Booking.VAT else 0 end AS 'StpflAnzUSt'
, case when AccountCode = 'BehoerdDL' then Booking.Amount else 0 end AS 'BehoerdDL'
, case when AccountCode = 'BehoerdDL' then Booking.VAT else 0 end AS 'BehoerdDLUSt'
, case when AccountCode = 'AuslagenDL' then Booking.Amount else 0 end AS 'AuslagenDL'
, case when AccountCode = 'AuslagenDL' then Booking.VAT else 0 end AS 'AuslagenDLUSt'
, case when AccountCode = 'GVDL' then Booking.Amount else 0 end AS 'GVDL'
, case when AccountCode = 'GVDL' then Booking.VAT else 0 end AS 'GVDLUSt'
, case when AccountCode = 'GKDL' then Booking.Amount else 0 end AS 'GKDL'
, case when AccountCode = 'GKDL' then Booking.VAT else 0 end AS 'GKDLUSt'
, case when AccountCode = 'ProzStfr' then Booking.Amount else 0 end AS 'ProzStfr'
, case when AccountCode = 'RARZ' then Booking.Amount else 0 end AS 'RARZ'
, case when AccountCode = 'RARZ' then Booking.VAT else 0 end AS 'RARZUSt'
, case when AccountCode = 'RAKLAGE' then Booking.Amount else 0 end AS 'RAKLAGE'
, case when AccountCode = 'RAKLAGE' then Booking.VAT else 0 end AS 'RAKLAGEUSt'
, case when AccountCode = 'RAHonorar' then Booking.Amount else 0 end AS 'RAHonorar'
, case when AccountCode = 'RAHonorar' then Booking.VAT else 0 end AS 'RAHonorarUSt'
, case when AccountCode = 'RHR02' then Booking.Amount else 0 end AS 'RHR02'
, case when AccountCode = 'RHR02' then Booking.VAT else 0 end AS 'RHR02USt'
, case when AccountCode = 'RHNEP' then Booking.Amount else 0 end AS 'RHNEP'
, case when AccountCode = 'RHNEP' then Booking.VAT else 0 end AS 'RHNEPUSt'
, case when AccountCode = 'RHSTRAF' then Booking.Amount else 0 end AS 'RHSTRAF'
, case when AccountCode = 'RHSTRAF' then Booking.VAT else 0 end AS 'RHSTRAFUSt'
, case when AccountCode = 'ProzStpfl' then Booking.Amount else 0 end AS 'ProzStpfl'
, case when AccountCode = 'ProzStpfl' then Booking.VAT else 0 end AS 'ProzStpflUSt'
, case when AccountCode = 'GEGRA' then Booking.Amount else 0 end AS 'GEGRA'
, case when AccountCode = 'GEGRA' then Booking.VAT else 0 end AS 'GEGRAUSt'
, case when AccountCode = 'ProzessDL' then Booking.Amount else 0 end AS 'ProzessDL'
, case when AccountCode = 'ProzessDL' then Booking.VAT else 0 end AS 'ProzessDLUSt'
, case when AccountCode = 'EPEingHFZi' then Booking.Amount else 0 end AS 'EPEingHFZi'
, case when AccountCode = 'EPEingHFZi' then Booking.VAT else 0 end AS 'EPEingHFZiUSt'
, case when AccountCode = 'EPEingKost' then Booking.Amount else 0 end AS 'EPEingKost'
, case when AccountCode = 'EPEingKost' then Booking.VAT else 0 end AS 'EPEingKostUSt'
, case when AccountCode = 'EPEingKoZi' then Booking.Amount else 0 end AS 'EPEingKoZi'
, case when AccountCode = 'EPEingKoZi' then Booking.VAT else 0 end AS 'EPEingKoZiUSt'
, case when AccountCode = 'EPEingHF' then Booking.Amount else 0 end AS 'EPEingHF'
, case when AccountCode = 'EPEingHF' then Booking.VAT else 0 end AS 'EPEingHFUSt'
, case when Account.MainAccount = 'IA' then Booking.Amount else 0 end as MainAccountDCATaxFree
, case when Account.MainAccount = 'IH' then Booking.Amount else 0 end as MainAccountDCATaxable
, case when Account.MainAccount = 'IH' then Booking.VAT 	else 0 end as MainAccountDCAVAT
, case when Account.MainAccount = 'RA' then Booking.Amount else 0 end as MainAccountLawyerTaxFree
, case when Account.MainAccount = 'RH' then Booking.Amount else 0 end as MainAccountLawyerTaxable
, case when Account.MainAccount = 'RH' then Booking.VAT 	else 0 end as MainAccountLawyerVAT
, case when Account.MainAccount = 'GL' then Booking.Amount else 0 end as MainAccountClient
 from ikaros.Account
 join ikaros.Booking WITH (INDEX(IDX_Booking_Event)) ON Booking.AccountID=Account.ID
 join ikaros.Event   ON Booking.EventID = Event.ID
 join ikaros.CCase   ON Event.CCaseID = CCase.ID
 join ikaros.Client  ON CCase.ClientID = Client.ContactID
GO
