# LiquidaVerbund

Der


Basierend auf den SQL-Views und den Abhängigkeitsinformationen aus den bisherigen Analysen, stelle ich Ihnen im Folgenden eine Übersicht der verwendeten Objekte und deren Abhängigkeiten dar:

## Verwendete Objekte

### Tabellen (USER_TABLE):
- Clearing
- ClearingRun
- ClearingResult
- Client
- Contact
- CCase
- Currency
- Event
- EventFlag
- EventTemplate
- BankAccount
- Address
- Booking
- Account
- Setting
- SepaDirectDebitMandateUpdateableValues
- Country
- ContactReference
- ContactReferenceType

### Views (VIEW):
1. UDV_ClearingSummaryG4Verbund
2. UDV_ClearingCostBurdenVerbund
3. UDV_ClearingClosingReportVerbund
4. UDV_ClearingCoverLetterG4Verbund
5. UDV_ClearingSummaryPreWorkVerbund
6. UDV_ClearingTPMCaseVerbund
7. UDV_ClearingTPMCaseBaseVerbund
8. BookingWithAccountsInColumns
9. ClearingClientName

### Funktionen (SQL_SCALAR_FUNCTION):
- ClrGetClearingDate
- GetAnonymizedVarChar
- StageGetBaseStage
- BankAccountGetStandard
- BankAccountGetForClearing
- GetTrue
- GetFalse
- SettingGetString
- TranslateAmount
- CaseSumInheritedPClaim
- CaseSumRemainingPClaim
- ClrGetLastClearingDate

## Abhängigkeiten zwischen den Views

### UDV_ClearingSummaryG4Verbund
- Direkte Abhängigkeit: UDV_ClearingSummaryPreWorkVerbund
- Indirekt (Level 1): UDV_ClearingCostBurdenVerbund, UDV_ClearingTPMCaseVerbund
- Indirekt (Level 2): BookingWithAccountsInColumns, UDV_ClearingTPMCaseBaseVerbund

### UDV_ClearingCostBurdenVerbund
- Direkte Abhängigkeit: BookingWithAccountsInColumns

### UDV_ClearingTPMCaseVerbund
- Direkte Abhängigkeit: UDV_ClearingTPMCaseBaseVerbund

### UDV_ClearingTPMCaseBaseVerbund
- Direkte Abhängigkeit: BookingWithAccountsInColumns

### UDV_ClearingClosingReportVerbund
- Direkte Abhängigkeit: ClearingClientName

### UDV_ClearingCoverLetterG4Verbund
- Direkte Abhängigkeit: ClearingClientName

## Abhängigkeitshierarchie

Die Hierarchie der View-Abhängigkeiten, von oben (abhängig) nach unten (Basis):

```
UDV_ClearingSummaryG4Verbund
├── UDV_ClearingSummaryPreWorkVerbund
├── UDV_ClearingCostBurdenVerbund
│   └── BookingWithAccountsInColumns
└── UDV_ClearingTPMCaseVerbund
    └── UDV_ClearingTPMCaseBaseVerbund
        └── BookingWithAccountsInColumns

UDV_ClearingClosingReportVerbund
└── ClearingClientName

UDV_ClearingCoverLetterG4Verbund
└── ClearingClientName
```

## Besonderheiten

1. **Basis-Views**: BookingWithAccountsInColumns und ClearingClientName sind grundlegende Views, auf die viele andere Views zugreifen.

2. **Mehrfachabhängigkeiten**: UDV_ClearingSummaryG4Verbund hat die komplexeste Abhängigkeitsstruktur mit Abhängigkeiten über mehrere Ebenen.

3. **Gemeinsame Tabellenbasis**: Fast alle Views greifen letztendlich auf die Tabellen Clearing, Client, CCase und Contact zu.

4. **Funktionen**: Viele Views verwenden gemeinsame Funktionen wie ClrGetClearingDate und GetAnonymizedVarChar für spezifische Datentransformationen.

Diese Darstellung gibt Ihnen einen Überblick über die Struktur und Beziehungen innerhalb Ihres Datenbankschemas für die Verbund-spezifischen Views.





[](http://FID/a9106458-7bac-498e-bc8a-3837cbb5525e)Hier ist eine Übersicht der verwendeten Tabellen und ihrer Funktionen im Zusammenhang mit Abrechnungsverbünden:

### Tabellen und deren Zwecke

1. **Clearing**: Diese Tabelle enthält alle Gläubigerabrechnungen.
2. **ClearingRun**: Sie speichert die Abrechnungsläufe.
3. **Client**: Hier werden gläubigerspezifische Kontaktstammdaten verwaltet.
4. **Contact**: Diese Tabelle hält alle Kontaktdaten.
5. **CCase**: Sie enthält relevante Fälle für die Abrechnungen.
6. **Currency**: Hier werden Währungsinformationen gespeichert.
7. **Event**: Diese Tabelle speichert Ereignisse, die im Abrechnungsprozess relevant sind.
8. **EventTemplate**: Sie enthält Vorlagen für Ereignisse.
9. **BankAccount**: Diese Tabelle enthält Bankkonto-Informationen der Gläubiger.
10. **Address**: Hier werden Adressdaten gespeichert.
11. **Booking**: Diese Tabelle erfasst Buchungen, die für die Abrechnung notwendig sind.
12. **Setting**: Sie enthält Systemeinstellungen für IKAROS und alle Module.
13. **SepaDirectDebitMandateUpdateableValues**: Hier werden aktualisierbare Werte für SEPA-Lastschriftmandate gespeichert.
14. **Country**: Diese Tabelle enthält Länderinformationen.
15. **ContactReference**: Sie verwaltet Referenzen zu Kontakten.
16. **ContactReferenceType**: Hier werden Typen von Kontaktreferenzen gespeichert.

### Verbund bei den Gläubigern

Der **Abrechnungsverbund** ermöglicht es, mehrere Gläubiger zu einer Gruppe zusammenzufassen, die gemeinsam abgerechnet werden. Dies ist besonders nützlich für zusammengehörige Gläubiger (z. B. Filialen und Zentrale), die zwar separat in IKAROS verwaltet werden, aber zentral abgerechnet werden sollen. Jeder Abrechnungsverbund hat einen stellvertretenden Gläubiger (Hauptgläubiger) und kann beliebig viele Mitglieder haben. 

Die wichtigsten Punkte zum Abrechnungsverbund sind:
- Alle Gläubiger im Verbund werden automatisch bei der Abrechnung des Hauptgläubigers berücksichtigt.
- Es ist nicht notwendig, die Abrechnungen für die Verbundgläubiger einzeln durchzuführen.
- Standard-Abrechnungslayouts und Reports sind nicht für die Verwendung mit Abrechnungsverbünden geeignet; individuelle Lösungen müssen entwickelt werden.

Zusammenfassend erleichtert der Abrechnungsverbund die Verwaltung von Gläubigern, die in Gruppen abgerechnet werden, und sorgt für eine zentralisierte Abrechnung, während die einzelnen Gläubiger weiterhin separat bearbeitet werden können.


# IKAROS Abrechnungsverbünde: Datenbankstruktur und Konzeptanalyse

## Grundlegende Konzepte in IKAROS

### Gläubigerräume (ClientDomain)

Gläubigerräume in IKAROS sind Gruppen, die bestimmen, welche Akten und Schuldner ein Benutzer sehen und bearbeiten darf. Sie sind direkt den Schuldnern und Gläubigern zugeordnet, was bedeutet, dass die Auswahl und Anzeige von Akten auf die Benutzer beschränkt wird, die zu den entsprechenden Gläubigerräumen gehören.

Die Zuordnung von Gläubigerräumen erfolgt über Gläubigerraum-Gruppen, die es ermöglichen, mehrere Gläubigerräume zusammenzufassen. So müssen IKAROS-Benutzern nur die Gruppen zugeordnet werden, anstatt jeder Gläubigerraum einzeln bearbeitet werden zu müssen.

### Gläubigerverbünde (ClientGroup)

Gläubigerverbünde in IKAROS sind Gruppen, in denen mehrere Gläubiger zusammengefasst werden, um bestimmte Abrechnungsprozesse zu vereinfachen. Diese Verbünde ermöglichen es, dass alle Gläubiger eines Verbunds gemeinsam abgerechnet werden, wobei die Abrechnungseinstellungen des Hauptgläubigers (primärer Abrechnungsgläubiger) verwendet werden.

Es gibt verschiedene Arten von Gläubigerverbünden, darunter:

1. **Abrechnungsverbund**: Hierbei wird der Hauptgläubiger für die gesamte Abrechnung verwendet. Die Standard-Abrechnungslayouts und Reports sind jedoch nicht für diese Art von Verbund geeignet, da sie nur für die Abrechnung eines einzelnen Gläubigers konzipiert sind. Daher müssen individuelle Lösungen (z.B. eigene Reports oder Views) erstellt werden.

2. **GMV-Verbund**: Wenn ein Gläubiger Mitglied eines GMV-Verbunds ist, wird bei der Erstellung von Mahnbescheids-Anträgen das Feld „Antragsteller" mit dem Hauptgläubiger des GMV-Verbunds gefüllt. Dies bedeutet, dass der Hauptgläubiger anstelle des Aktengläubigers als Antragsteller fungiert.

3. **Reportingverbund**: Im Standard von IKAROS gibt es keine spezifische Funktionalität für Reportingverbünde, jedoch können solche Verbünde in kundenspezifischen Reports oder Programmierungen abgefragt werden.

### Abrechnungsverbund - Details

Ein Abrechnungsverbund in IKAROS besteht aus einem primären Abrechnungsgläubiger und mehreren Verbundgläubigern. Hier sind einige wichtige Punkte zur Durchführung und den Besonderheiten von Abrechnungen in einem Abrechnungsverbund:

1. **Automatische Abrechnung**: Alle Gläubiger eines Verbunds werden automatisch zusammen abgerechnet, wenn der Abrechnungslauf für den primären Abrechnungsgläubiger gestartet wird. Es ist nicht möglich, die Abrechnungen für die Verbundgläubiger einzeln durchzuführen.

2. **Layouts und Reports**: Die Abrechnungslayouts sind in der Regel nicht für die Verwendung in Abrechnungsverbünden konzipiert. Das bedeutet, dass die Standard-Abrechnungslayouts, wie „Einzelbelege" oder „Kombiabrechnung", möglicherweise nicht die gewünschten Ergebnisse liefern, wenn sie in einem Abrechnungsverbund verwendet werden. Individuelle Anpassungen müssen vorgenommen werden, um die spezifischen Anforderungen des Verbunds zu erfüllen.

3. **Buchungseinstellungen**: Beim Buchen entscheidet die Einstellung „Kumulierte Buchung" des Abrechnungsverbunds, ob die Abrechnungen summiert nur beim primären Abrechnungsgläubiger oder individuell bei den betroffenen Gläubigern gebucht werden. Unabhängig von dieser Einstellung erhalten alle Abrechnungen dieselbe Rechnungs- und Abrechnungsnummer.

4. **Ereignisskripte**: Ereignisskripte, die vor und nach dem Buchen ausgeführt werden, wirken sich auf den gesamten Verbund aus und nicht auf einzelne Abrechnungen. Es gibt spezielle Skripte zur Ermittlung von Rechnungs- und Abrechnungsnummern, die ebenfalls nur einmalig für den gesamten Verbund ausgeführt werden.

5. **Einrichtung der Gläubiger**: Um einen Gläubiger in einen Abrechnungsverbund aufzunehmen, muss er lediglich im betreffenden Abrechnungsverbund hinzugefügt werden. Der primäre Abrechnungsgläubiger muss jedoch ordnungsgemäß mit Stammdaten, Abrechnungsgruppe und Abrechnungslayout eingerichtet sein.

## Exkurs: Grundprinzipien von IKAROS und dem Inkassoprozess

### 1. Grundlegende Geschäftsbeziehung im Inkassoprozess

* Der Gläubiger hat eine offene Forderung gegen einen Schuldner.
* Gerät der Schuldner in Zahlungsverzug, kann der Gläubiger ein Inkassounternehmen beauftragen.
* Dies geschieht über einen Dienstleistungsvertrag, der das Inkassounternehmen ermächtigt, die Forderung in dessen Namen geltend zu machen.
* Das Inkassounternehmen tritt gegenüber dem Schuldner mit einer Inkassovollmacht auf.
* Rechtlich bleibt der Gläubiger der Anspruchsinhaber – das Inkassounternehmen handelt nur als Bevollmächtigter.

### 2. Kostenstruktur im Inkassoprozess

* Die Gebühren, die das Inkassounternehmen verlangt, sind gesetzlich geregelt (RVG oder vergleichbare Vorgaben).
* Diese Gebühren gehören zum Verzugsschaden des Gläubigers, da sie durch die verspätete Zahlung des Schuldners entstehen.
* Forderungsbestandteile gegenüber dem Schuldner:
   1. Hauptforderung (ursprüngliche Schuld)
   2. Nebenforderungen (z.B. Mahnkosten, Ermittlungskosten)
   3. Inkassokosten (entstanden durch den Vertrag zwischen Gläubiger und Inkassounternehmen)
* Der Schuldner schuldet diese Beträge weiterhin dem Gläubiger – eine eigene Rechtsbeziehung zwischen Schuldner und Inkassounternehmen besteht nicht.

### 3. Behandlung von Fremdgeldern und Kosten in IKAROS

* Fremdgelder sind alle Beträge, die das Inkassounternehmen im Namen des Gläubigers vereinnahmt.
* Diese Gelder müssen vom Inkassounternehmen treuhänderisch verwaltet und an den Gläubiger weitergeleitet werden.
* Theoretisch müsste das Inkassounternehmen alle Zahlungen 1:1 an den Gläubiger weitergeben – inklusive der Inkassogebühren.
* Praktisch werden jedoch die Inkassogebühren und vorgestreckte Kosten mit den Fremdgeldern verrechnet, bevor der Restbetrag an den Gläubiger ausgezahlt wird.

### 4. Verschiedene Abrechnungsmodelle in IKAROS

#### a) Verrechnungsmethode (Standardfall in IKAROS)
* Das Inkassounternehmen zieht Zahlungen des Schuldners ein.
* Es verrechnet eigene Inkassogebühren und vorgestreckte Kosten mit den eingezogenen Fremdgeldern.
* Der verbleibende Betrag wird an den Gläubiger ausgezahlt.

#### b) Rechnungsmodell (Alternative Methode)
* Das Inkassounternehmen erstellt eine Rechnung an den Gläubiger über alle angefallenen Kosten.
* Parallel wird eine Fremdgeldabrechnung erstellt, in der alle vom Schuldner eingezogenen Beträge aufgelistet sind.
* Der Gläubiger erhält dann die Fremdgelder separat ausgezahlt und zahlt die Inkassogebühren anhand der Rechnung.
* Dieses Modell wird oft verwendet, wenn der Gläubiger eine Debitoren- und Kreditorenbuchhaltung hat und eine strikte Trennung benötigt.

### 5. Fremdgeldverrechnung

Die Einstellung „Fremdgeldverrechnung" bestimmt, ob die Ergebnisse der Abrechnungsbestandteile „Fremdgeldabrechnung" (hier fließen Vorgänge der Varianten „Zahlungseingang" und „Fremdgeldausgang" ein) und „Kostenbelastung" (Vorgänge der Variante „Kostenbelastung") aus derselben Gläubigerabrechnung beim Buchen abrechnungsintern gegeneinander verrechnet werden sollen.

Mögliche Werte für „Fremdgeldverrechnung" sind:
* **„Volle Saldierung"**: Die Beträge aus der Fremdgeldabrechnung und der Kostenbelastungsabrechnung werden in voller Höhe gegeneinander verrechnet. Nur die Differenz wird dem jeweiligen Gläubiger gutgeschrieben oder belastet.
* **„Keine Saldierung"**: Die Beträge aus der Fremdgeldabrechnung und der Kostenbelastungsabrechnung werden nicht gegeneinander verrechnet, sondern werden immer in je einem eigenen Kontaktvorgang gebucht.

## Datenbankobjekte und ihre Bedeutung

### MainClearing und SubClearing

In den Views für Abrechnungsverbünde werden zwei wichtige Begriffe verwendet:

1. **MainClearing (Hauptabrechnung)**: Bezieht sich auf die Abrechnung des primären Abrechnungsgläubigers im Verbund.
2. **SubClearing (Unterabrechnung)**: Bezieht sich auf die Abrechnungen der einzelnen Mitgliedsgläubiger im Verbund.

Diese Unterscheidung ist wichtig für verschiedene Prozesse im System:

* Die Abrechnungs(vorgangs)flags (AbrFG, AbrKostB, AbrAbschl) werden den SubClearingIDs zugeordnet.
* Abrechnungsreports (Listen und Zusammenfassung/Rechnung) bekommen die MainClearingID als Parameter ClearingID übergeben und müssen alle Abrechnungsflags der zugehörigen SubClearingIDs einsammeln.
* Freigaben laufen hingegen über die SubClearingIDs, weshalb in den Freigabeviews die SubClearingID als ClearingID angezeigt werden muss.

### BookingWithAccountsInColumns

Die View "BookingWithAccountsInColumns" ist eine zentrale Komponente der Datenabfrage in IKAROS. Sie transformiert die Buchungsdaten in ein spaltenbasiertes Format, bei dem für jedes Anspruchskonto separate Spalten erzeugt werden. Diese Ansicht enthält:

* **Identifizierende Spalten**: BookingID, EventID, Stage, VATRate, Variant, Recipient, CCaseID, RefNo, etc.
* **Kontenspezifische Spalten**: Für jedes verwendete Anspruchskonto gibt es eine eigene Spalte, die mit CASE WHEN-Abfragen befüllt wird.
* **Hauptkonten-Zusammenfassungen**: Spalten wie MainAccountDCATaxFree, MainAccountDCATaxable, MainAccountDCAVAT gruppieren ähnliche Konten zusammen.

### Clearing-Views

Im Kontext der Abrechnung gibt es verschiedene Views, die unterschiedliche Aspekte des Abrechnungsprozesses abdecken:

1. **ClearingTPMCase**: Diese Views sind für die Fremdgeldabrechnung (TPM = Third Party Money) zuständig und zeigen aktenbezogene Informationen über eingenommene Fremdgelder.

2. **ClearingCostBurden**: Diese Views sind für die Kostenbelastung zuständig und zeigen Kosten, die das Inkassounternehmen im Rahmen des Inkassoprozesses für den Gläubiger vorgestreckt hat.

3. **ClearingSummary**: Diese Views dienen als Datenquelle für die Zusammenfassung der Abrechnung und enthalten auch die Daten für die Rechnung an den Gläubiger.

### Anspruchskonten und Finanzkonten

Im IKAROS-System gibt es eine Unterscheidung zwischen verschiedenen Kontentypen:

1. **Anspruchskonten (Accounts)**: Diese dienen der Anspruchsbuchhaltung und stellen die internen Ansprüche zwischen dem Inkassounternehmen und dem Gläubiger dar. Beispiele für Anspruchskonten sind:
   - UeberzgSch (Überzahlung Schuldner)
   - EPEingang (Erfolgsprovision Eingang)
   - GlFG (Gläubiger Fremdgeld)
   - GlHF (Gläubiger Hauptforderung)
   - HONGER (Honorar Gericht)
   - und viele weitere spezialisierte Konten

2. **Finanzkonten (FinancialAccounts)**: Diese repräsentieren reale Finanz- und interne Verrechnungskonten, deren finanzielle Bewegungen in IKAROS abgebildet werden. Sie haben ein Kürzel, eine Bezeichnung und können einer bestimmten Währung zugeordnet sein. Zudem können sie mit Anspruchskonten verknüpft werden, um ein "hybrides Konto" zu bilden.

### Offene Posten (OIID)

Ein offener Posten (OP) in IKAROS ist ein noch nicht beglichener Anspruch. Jeder offene Posten wird durch eine Kennung (OIID) identifiziert, die bei Zahlungen zur Zuordnung und zum Ausgleich verwendet wird. Besonderheiten:

* Für die Anspruchskonten "GlFG" und "RAFG" wird keine OP-Verwaltung durchgeführt. Stattdessen erhalten alle Buchungen auf diese Konten immer eine leere GUID als OP-ID.
* Offene Posten entstehen durch Rechnungen oder Buchungen und werden in der OP-Übersicht angezeigt.
* Die Verrechnung erfolgt, wenn eine Zahlung eingeht, die den offenen Posten ausgleicht.

## Implementierung von Verbund-Views

Bei der Implementierung von Views für Abrechnungsverbünde müssen folgende Punkte beachtet werden:

1. **JOIN-Struktur**: Sowohl der Clearing-Eintrag des Abrechnungsgläubigers als auch die Clearing-Einträge der Einzelgläubiger müssen durch JOINs verknüpft werden.

2. **Duale IDs im SELECT**: Im SELECT-Teil müssen sowohl die MainClearingID als auch die SubClearingID angezeigt werden, um je nach Bedarf die eine oder andere als "ClearingID" verwenden zu können.

3. **Hierarchische View-Struktur**: Die Views für die Abstimmung (mit ClearingID=SubClearingID) und die Views für die Abrechnungsreports (mit ClearingID=MainClearingID) sollten aufeinander aufbauen.

4. **Minimal-Views für Freigabe**: Es werden spezielle Views benötigt, die nur die Pflichtfelder für die Freigabe enthalten und die SubClearingID als ClearingID anzeigen.

## Zusammenfassung

Die Datenbankstruktur für Abrechnungsverbünde in IKAROS ist komplex und erfordert eine sorgfältige Implementierung, um sowohl die Abrechnung als auch die Freigabe korrekt zu handhaben. Die Unterscheidung zwischen MainClearing und SubClearing sowie die Transformation der Buchungsdaten in ein spaltenorientiertes Format sind dabei zentrale Konzepte. Die verschiedenen Clearing-Views dienen unterschiedlichen Aspekten des Abrechnungsprozesses und müssen entsprechend angepasst werden, um in einem Abrechnungsverbund korrekt zu funktionieren.
