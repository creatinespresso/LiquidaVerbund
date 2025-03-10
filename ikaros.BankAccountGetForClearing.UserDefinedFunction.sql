USE [IKAINTE]
GO
/****** Object:  UserDefinedFunction [ikaros].[BankAccountGetForClearing]    Script Date: 01.03.2025 23:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [ikaros].[BankAccountGetForClearing](@CreditorID UNIQUEIDENTIFIER, @Role CHAR(1), @Usage NVARCHAR(2), @EBankingInitiatorOnly ikaros.Boolean, @AccountType NVARCHAR(15) = 'CLASSIC')  
RETURNS UNIQUEIDENTIFIER
AS
-- Liefert, falls vorhanden, die Bankverbindung für eine Abrechnung gemäß folgender Parameter
--   cCreditorID:                  ID des Gläubigers
--   cRole:                  'I':  Initiator      (Auftraggeber)
--                           'R':  Receipient     (Empfänger)
--   cUsage:                 'DD': DirectDebit    (Lastschrift)
--                           'CT': CreditTransfer (Überweisung)
--   bEBankingInitiatorOnly: 'J':  Bankverbindung für Auftraggeber muss als "E-Banking-Auftraggeber" gekennzeichnet sein
--                           'N':  Bankverbindungen brauchen nicht als "E-Banking-Auftraggeber" gekennzeichnet zu sein
BEGIN
	DECLARE @Result UNIQUEIDENTIFIER -- Kennung der gesuchten Bankverbindung
	DECLARE @ContactID UNIQUEIDENTIFIER -- Kennung des Kontakts der Bankverbindung
	DECLARE @UsageType NVARCHAR(30) -- Kontoverwendungsart

	SET @Result = NULL

	IF @Role = 'I' -- Auftraggeberkonto gesucht
	BEGIN
		-- Kontakt der Bankverbindung ist IDL
		SET @ContactID = ikaros.SettingGetString('IKUKontakt','','')

		-- Kontoverwendungsart holen, die beim Gläubiger eingestellt ist
		SELECT	@UsageType = baut.Value
		FROM	ikaros.Client m 
		JOIN	ikaros.BankAccountUsageType baut ON (baut.ID = (CASE WHEN @Usage = 'CT' THEN m.BankAccUsageTypeDCATransfer ELSE m.BankAccUsageTypeDCADirectDebit END))
		WHERE	m.ContactID = @CreditorID

		-- falls eine Kontoverwendungsart beim Gläubiger angegeben ist
		IF (@UsageType IS NOT NULL)
		BEGIN
			-- ..., die zugehörige Bankverbindung des IDLs ermitteln
			SELECT @Result = ikaros.BankAccountGetFirstActiveEBanking(@ContactID, @UsageType, @EBankingInitiatorOnly, @AccountType)
		END
	END	
	ELSE -- Empfängerkonto gesucht
	BEGIN
		-- Es muss kein Auftraggeberkonto sein
		SET @EBankingInitiatorOnly = ikaros.GetFalse()

		-- Kontakt der Bankverbindung ist Gläubiger
		SET @ContactID = @CreditorID
	END 

	-- Falls noch keine Bankverbindung gefunden wurde
	IF (@Result IS NULL)
	BEGIN
		-- Kontoverwendungsart aus den Systemeinstellungen ermitteln        
		SELECT @UsageType = ikaros.SettingGetString(CASE WHEN @Usage = 'CT' THEN 'KontoverwendungsartAbrUeb' ELSE 'KontoverwendungsartAbrLs' END, null, 'Abrechnung')

		-- falls eine Kontoverwendungsart ermittelt werden konnte
		IF (@UsageType IS NOT NULL)
		BEGIN
			-- ..., zugehörige Bankverbindung ermitteln
			SELECT @Result = ikaros.BankAccountGetFirstActiveEBanking(@ContactID, @UsageType, @EBankingInitiatorOnly, @AccountType)
		END

		-- falls immer noch keine Bankverbindung gefunden wurde
		IF (@Result IS NULL)
		BEGIN
			-- ..., die Standard-Bankverbindung ermitteln
			SELECT @UsageType = ikaros.SettingGetString('KontoverwendungsartStandard','Standard','');
			SELECT @Result = ikaros.BankAccountGetFirstActiveEBanking(@ContactID, @UsageType, @EBankingInitiatorOnly, @AccountType)
		END
	END
	 -- Rückgabe der Bankverbindung
	RETURN @Result
END;
GO
