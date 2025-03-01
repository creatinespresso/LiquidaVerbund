# LiquidaVerbund


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
