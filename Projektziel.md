# Zusammenfassung: Anpassung des Abrechnungs-Layouts für den Gläubiger Verbund

## Projektziel
Die Anpassung des bestehenden Abrechnungs-Layouts "LIQ S Verrechnung SCV DE" für die Nutzung im Gläubiger Verbund. Dieses Layout dient der vollständigen Sanierung der Fremdgelder, wobei sämtliche Forderungen des Inkassounternehmens gegenüber dem Gläubiger mit den zur Auszahlung vorgesehenen Fremdgeldern verrechnet werden.

## Konzept des Gläubiger Verbunds
Der Abrechnungsverbund ermöglicht es, mehrere Gläubiger zu einer Gruppe zusammenzufassen, die gemeinsam abgerechnet werden. Dabei werden alle Gläubiger eines Verbunds automatisch bei der Abrechnung des Hauptgläubigers (MainClearing) berücksichtigt, während die anderen Gläubiger als Verbundgläubiger (SubClearing) geführt werden.

## Erforderliche Anpassungen
Für alle vier Bestandteile des Abrechnungs-Layouts wurden spezielle "Verbund"-Versionen der Views erstellt:

1. **Fremdgeldabrechnung (Verbund)**
   - View: `UDV_ClearingTPMCaseVerbund`
   - Abhängig von: `UDV_ClearingTPMCaseBaseVerbund`, `BookingWithAccountsInColumns`

2. **Kostenbelastung (Verbund)**
   - View: `UDV_ClearingCostBurdenVerbund`
   - Abhängig von: `BookingWithAccountsInColumns`

3. **Abschluss (Verbund)**
   - View: `UDV_ClearingClosingReportVerbund`
   - Abhängig von: `ClearingClientName`

4. **Zusammenfassung (Verbund)**
   - View: `UDV_ClearingSummaryG4Verbund`
   - Abhängig von: `UDV_ClearingSummaryPreWorkVerbund`, `ClearingClientName`, `Currency`

5. **Deckblatt (Verbund)**
   - View: `UDV_ClearingCoverLetterG4Verbund`
   - Für Deckblätter und Zahlungsträger der Abrechnungen

## Technische Besonderheiten

1. **MainClearing und SubClearing**
   - MainClearing: Bezieht sich auf die Abrechnung des Hauptgläubigers im Verbund
   - SubClearing: Bezieht sich auf die Abrechnungen der einzelnen Mitgliedsgläubiger

2. **View-Struktur**
   - Alle Verbund-Views verwenden JOINs zwischen MainClearing und SubClearing
   - Die Views zeigen sowohl MainClientNo/MainClient als auch SubClientNo/SubClient an
   - In den SELECT-Statements werden beide Clearing-IDs aufgeführt (MainClearing.ID und SubClearing.ID)

3. **Buchungsdaten**
   - Die zentrale View `BookingWithAccountsInColumns` transformiert Buchungsdaten in ein spaltenbasiertes Format
   - Sie enthält spezifische Spalten für jedes Anspruchskonto und Zusammenfassungen nach Kontenart

4. **Gemeinsame Basistabellen**
   - Clearing (für MainClearing und SubClearing)
   - Client
   - Contact
   - CCase
   - Currency
   - Event und EventFlag

## Fazit
Die implementierten Verbund-Views ermöglichen es, Abrechnungen für Gläubigerverbünde zu erstellen, wobei alle Transaktionen der einzelnen Verbundgläubiger zusammengefasst und unter dem Hauptgläubiger abgerechnet werden. Die umfangreiche View-Struktur berücksichtigt dabei sowohl die Anforderungen an die Darstellung in Reports als auch die Notwendigkeit der korrekten Buchung und Verrechnung von Fremdgeldern und Kosten.
