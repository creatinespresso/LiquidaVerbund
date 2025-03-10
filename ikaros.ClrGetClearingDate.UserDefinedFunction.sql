USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[ClrGetClearingDate]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [ikaros].[ClrGetClearingDate](@ClearingID UNIQUEIDENTIFIER,
                                                  @View NVARCHAR(32))
RETURNS ikaros.date
BEGIN
	DECLARE @ClearingDate ikaros.date
	DECLARE @ClearingDateTo ikaros.date
	DECLARE @AbrBisDatumBuchen ikaros.boolean

	SELECT	@ClearingDateTo = EndDate
	FROM	ikaros.Clearing 
	JOIN	ikaros.ClearingRun ON ikaros.Clearing.ClearingRunID = ikaros.ClearingRun.ID
	WHERE	Clearing.ID = @ClearingID

	SET @AbrBisDatumBuchen = ikaros.settingGetLogic('AbrBisDatumBuchen',ikaros.GetFalse(),'ABRECHNUNG')
	
	IF @AbrBisDatumBuchen = ikaros.GetTrue()
	BEGIN 
		SET @ClearingDate = @ClearingDateTo
	END	
	ELSE
	BEGIN
		SELECT @ClearingDate = 
		CASE @View
		WHEN 'ikaros.ClearingSummary' THEN 
			(SELECT	Clearing.BookingTime
			FROM	ikaros.Clearing 
			WHERE	ID = @ClearingID)
		WHEN 'ikaros.ClearingCoverLetter' THEN 
			(SELECT	Clearing.BookingTime
			FROM	ikaros.Clearing 
			WHERE	ID = @ClearingID)
		WHEN 'ikaros.ClearingCombinedSummary' THEN 
			(SELECT	Clearing.BookingTime
			FROM	ikaros.Clearing 
			WHERE	ID = @ClearingID)
		WHEN 'ikaros.ClearingTPMCase' THEN
			(SELECT	Clearing.TPMClearingTime
			FROM	ikaros.Clearing
			WHERE	ID = @ClearingID)
		WHEN 'ikaros.ClearingCostBurden' THEN
			(SELECT	Clearing.CostBurdenClearingTime
			FROM	ikaros.Clearing 
			WHERE	ID = @ClearingID)
		WHEN 'ikaros.ClearingCostBurdenClosing' THEN
			(SELECT	Clearing.CostBurdenClearingTime
			FROM	ikaros.Clearing 
			WHERE	ID = @ClearingID)
		WHEN 'ikaros.ClearingClosingReport' THEN
			(SELECT	Clearing.ClosingReportingDate
			FROM	ikaros.Clearing 
			WHERE	ID = @ClearingID)
		ELSE
			(SELECT ikaros.Today())
		END
	END
	SET @ClearingDate = IsNull(ikaros.DateTimeToDate(@ClearingDate), ikaros.Today())
	RETURN @ClearingDate
END
GO
