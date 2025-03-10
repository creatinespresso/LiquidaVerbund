USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[ClrGetLastClearingDate]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [ikaros].[ClrGetLastClearingDate](@cClearingID UNIQUEIDENTIFIER)
RETURNS DATETIME
-- KET, 2004-07-26: Nur freigegebene Abrechnungen berücksichtigt
--
-- Schneiders, 2003-01-31: Function zur Ermittlung des Von-Datums einer Abrechnung
-- (=Bis-Datum+1 der letzten Abrechnung zu dem Gläubiger)
AS
begin
	declare @cKontakt_ID UNIQUEIDENTIFIER
	declare @dDatumBis DATETIME
	declare @dDatumVon DATETIME
	--
	-- Kontakt_ID des Gläubigers zur Abrechnung ermitteln
	select @cKontakt_ID = ikaros.Clearing.ClientID  
	from ikaros.Clearing 
	where ikaros.Clearing.ID = @cClearingID
	--
	-- Bis-Datum des Abrechnungslaufs zur Abrechnung ermitteln
	select @dDatumBis = ikaros.ClearingRun.EndDate 
	from ikaros.Clearing 
	join ikaros.ClearingRun ON(ikaros.ClearingRun.ID = ikaros.Clearing.ClearingRunID)
	where ikaros.Clearing.ID = @cClearingID
	--
	-- Bis-Datum des letzten Abrechnungslaufs der Abrechnung zum Kontakt ermitteln
	select @dDatumVon = max(ikaros.ClearingRun.EndDate) 
	from ikaros.ClearingRun 
	join ikaros.Clearing ON(ikaros.Clearing.ClearingRunID = ikaros.ClearingRun.ID)
	where
		ikaros.Clearing.ClientID = @cKontakt_ID
	and	ikaros.Clearing.ID <> @cClearingID 
	and	ikaros.Clearing.ApprovalTime IS NOT NULL -- KET, 2004-07-26
	and ikaros.ClearingRun.EndDate < @dDatumBis
	--
	-- einen Tag draufrechnen
	set @dDatumVon = @dDatumVon+1
	--
	return(@dDatumVon)
end

GO
