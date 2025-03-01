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
