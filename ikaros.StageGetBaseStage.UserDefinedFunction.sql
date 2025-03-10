USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[StageGetBaseStage]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ikaros].[StageGetBaseStage](@cStage CHAR(1))
RETURNS CHAR(1)
--
-- Gibt das Basisstadium für das übergeben Stadiums zurück.
--
-- WS, 2005-09-20: (Aufg. 31400)
--
AS
begin
   declare @cBasisstadium CHAR(1)
   set @cBasisstadium =(select ikaros.LookUpCaseStage.BasicStage 
						from ikaros.LookUpCaseStage 
						where ikaros.LookUpCaseStage.Value = @cStage)
   return @cBasisstadium
end

GO
