USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[CaseSumInheritedPClaim]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [ikaros].[CaseSumInheritedPClaim]
(
   @RefNo NVARCHAR(12)
)
RETURNS ikaros.amount
--
-- Achtung!
--
-- Diese Function darf nicht ohne weiteres upgedated werden, 
-- da sie individuell bei den IKAROSsql-Kunden eingerichtet sein kann.
--
-- Liefert die übernommene Hauptforderung zum angegebenen Az. zurück.
--
-- KET, 2005-02-24: User Estimates hinzugefügt
--
-- KET, 2004-12-01: Vorgangsvorlagenkategorie für Zahlungen vor Übernahme per Setting bestimmt
--
-- Schneiders, 2004-08-30: Berechnungsregel geändert:
-- alle Vorgänge mit Variante H und F (also auch HFen und Gutschriften nach Übernahme) 
-- abzgl. Zahlungen vor Übernahme gem. Vorgangsvorlagekat. "ZgVorUebernahme"
AS
begin
   declare @nHF ikaros.amount
   declare @nZgVorUebernahme ikaros.amount
   declare @cKatZgVorUebernahme NVARCHAR(128)

   -- Anspruch an Hauptforderung:
   select
      @nHF = Sum(isnull(ikaros.Booking.Amount,0)) 
   from 
      ikaros.Booking 
   join
      ikaros.Account on ikaros.Account.ID=ikaros.Booking.AccountID
   join
      ikaros.Event on ikaros.Event.ID=ikaros.Booking.EventID
   join
      ikaros.CCase on ikaros.CCase.ID=ikaros.Event.CCaseID
   where
      (ikaros.CCase.RefNo = @RefNo) and -- KET, 2005-02-24
      ikaros.Event.Variant in('H','F') and
      ikaros.Account.AccountCode = 'GlHF'

   -- Setting für Zahlungen vor Übernahme bestimmen (KET, 2004-12-01): 
   set @cKatZgVorUebernahme = ikaros.settingGetString('KatZgVorUebernahme','ZgVorUebernahme','')

   -- Zahlungen vor Übernahme
   select
      @nZgVorUebernahme = sum(isnull(ikaros.Booking.Amount,0)) 
   from
      ikaros.CCase 
   join 
      ikaros.Event on ikaros.Event.CCaseID=ikaros.CCase.ID
   join 
      ikaros.Booking on ikaros.Booking.EventID=ikaros.Event.ID
   join
      ikaros.Account on ikaros.Account.ID=ikaros.Booking.AccountID
   join
      ikaros.EventTemplate on ikaros.EventTemplate.ID=ikaros.Event.EventTemplateID 
   join
      ikaros.EventTemplateCategoryAssignment on ikaros.EventTemplateCategoryAssignment.EventTemplateID=ikaros.EventTemplate.ID
   join 
      ikaros.EventTemplateCategory on ikaros.EventTemplateCategory.ID=ikaros.EventTemplateCategoryAssignment.EventTemplateCategoryID
   where
      (ikaros.CCase.RefNo = @RefNo) and -- KET, 2005-02-24
      ikaros.Event.Variant = 'E' and
      ikaros.Account.AccountCode = 'GlHF' and
      ikaros.EventTemplateCategory.Designation like @cKatZgVorUebernahme+'%'

   return(isnull(@nHF,0) - isnull(@nZgVorUebernahme,0))
end
GO
