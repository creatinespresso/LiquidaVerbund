USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[SettingGetString]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ikaros].[SettingGetString]
(
	@aIdent NVARCHAR(30), @aDefault NVARCHAR(128) = '', @aApp NVARCHAR(10) = ''
)
RETURNS NVARCHAR(128)
AS
BEGIN
	DECLARE @nResult AS NVARCHAR(128)
	
	DECLARE @cTmp AS NVARCHAR(128)
	
	SELECT @cTmp = [Value] FROM ikaros.Setting WHERE SettingName = @aIdent AND [Application] = @aApp 
	
	SELECT @nResult = CAST(@cTmp AS NVARCHAR(128))
	
	IF @nResult is null
	BEGIN
		SET @nResult = @aDefault
	END
	
	RETURN @nResult
END

GO
