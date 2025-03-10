USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[TranslateAmount]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [ikaros].[TranslateAmount]
(
   @fromCurrencyID UNIQUEIDENTIFIER,
   @toCurrencyID UNIQUEIDENTIFIER,
   @amount [ikaros].[amount],
   @date [date]
)
RETURNS [ikaros].[amount]

AS
BEGIN
	DECLARE @translatedAmount [ikaros].[amount];

	IF (@fromCurrencyID <> @toCurrencyID)
	BEGIN		
		IF EXISTS (SELECT 1 
					FROM ikaros.CurrencyExchangeRate 
					WHERE FromCurrencyID = @fromCurrencyID AND ToCurrencyID = @toCurrencyID AND [Date] = @date)
		BEGIN
			DECLARE @exchangeFactor [numeric](12, 6);
			SET @exchangeFactor = (SELECT ExchangeFactor 
									FROM ikaros.CurrencyExchangeRate 
									WHERE FromCurrencyID = @fromCurrencyID AND ToCurrencyID = @toCurrencyID AND [Date] = @date);

			SET @translatedAmount = ROUND(@amount * @exchangeFactor, 2);
		END
		ELSE
		BEGIN
			DECLARE @defaultFactorFrom [numeric](12, 6);
			SET @defaultFactorFrom = (SELECT DefaultFactor FROM ikaros.Currency WHERE ID = @fromCurrencyID);
			DECLARE @defaultFactorTo [numeric](12, 6);
			SET @defaultFactorTo = (SELECT DefaultFactor FROM ikaros.Currency WHERE ID = @toCurrencyID);

			SET @translatedAmount = ROUND((@amount / @defaultFactorFrom) * @defaultFactorTo, 2);
		END
	END
	ELSE
	BEGIN
		SET @translatedAmount = @amount;
	END

	RETURN @translatedAmount;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rechnet den Betrag in der Quellwährung zu dem übergebenen Datum mit Hilfe des ermittelten Umrechnungsfaktors in die Zielwährung um.' , @level0type=N'SCHEMA',@level0name=N'ikaros', @level1type=N'FUNCTION',@level1name=N'TranslateAmount'
GO
