USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[GetTrue]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [ikaros].[GetTrue] ()
RETURNS ikaros.Boolean
   AS
BEGIN
   RETURN(1)
END
GO
