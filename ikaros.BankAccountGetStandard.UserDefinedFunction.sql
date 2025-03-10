USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[BankAccountGetStandard]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [ikaros].[BankAccountGetStandard](@cContactID UNIQUEIDENTIFIER, @AccountType NVARCHAR(15) = 'CLASSIC') 
	RETURNS UNIQUEIDENTIFIER
	AS
	BEGIN
		DECLARE @cResult UNIQUEIDENTIFIER;
		SELECT @cResult = ikaros.BankAccountGetFirstActive(@cContactID,ikaros.SettingGetString('KontoverwendungsartStandard','Standard',DEFAULT),@AccountType);
		RETURN @cResult;
	END;
GO
