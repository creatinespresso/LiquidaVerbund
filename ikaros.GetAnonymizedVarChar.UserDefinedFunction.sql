USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[GetAnonymizedVarChar]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ikaros].[GetAnonymizedVarChar](@charValue NVARCHAR(MAX), 
			@caseLock ikaros.BOOLEAN = 1, 
			@debtorLock ikaros.BOOLEAN = 1)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	IF @CaseLock = ikaros.GetTrue() OR @DebtorLock = ikaros.GetTrue() 
	BEGIN
		SET @charValue = '***';
	END;

	RETURN @charValue;
END
GO
