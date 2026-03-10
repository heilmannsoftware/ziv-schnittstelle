# ZIV Datenmodell 4.0

## Projektbeschreibung

Dieses Projekt definiert das **ZIV Datenmodell 4.0** – ein SQLite-Datenbankschema für das Schornsteinfegerwesen (Kehrbezirksverwaltung, Feuerstätten, Abgasanlagen, Messergebnisse, Kehrbuch, Abrechnung etc.).

## Quelldateien

| Datei | Beschreibung |
|---|---|
| `Datenmodell4_0.dbml` | Hauptdatenmodell in DBML-Notation (Tabellen, Spalten, Typen, Enums, Relationen, Notes) |
| `relationen_zuordnung.csv` | CSV mit allen Fremdschlüssel-Relationen (Semikolon-getrennt). Spalten: Nr, Kind_Tabelle, FK_Feld, Eltern_Tabelle, Kardinalitaet, NOT_NULL, Status, Kommentar |
| `stammdaten_enums.sql` | SQL-Datei mit Enum-/Stammdaten-Wertetabellen (CREATE TABLE IF NOT EXISTS + INSERT-Statements) |

## Generierte Dateien

| Datei | Beschreibung |
|---|---|
| `schema.sql` | Generiertes SQLite-Schema (CREATE TABLE mit FK-Constraints und CHECK-Constraints für Enums) |
| `dokumentation.html` | Generierte HTML-Dokumentation des Datenmodells |
| `entwicklerleitfaden.html` | Entwicklerleitfaden (HTML) |
| `test.db` | SQLite-Testdatenbank |

## Build-Skripte

- **`generate_schema.py`** – Erzeugt `schema.sql` aus `Datenmodell4_0.dbml` und `relationen_zuordnung.csv`. Führt topologische Sortierung der Tabellen durch, mappt DBML-Typen auf SQLite-Typen, generiert CHECK-Constraints für Enums und FOREIGN KEY-Constraints.
- **`generate_docs.py`** – Erzeugt `dokumentation.html` aus `schema.sql`, `stammdaten_enums.sql`, `relationen_zuordnung.csv` und den Notes aus `Datenmodell4_0.dbml`.

## Konventionen

- **Sprache**: Tabellen- und Spaltennamen auf Deutsch, PascalCase für Tabellen, PascalCase/Snake_Case-Mix für Spalten
- **Primary Keys**: `ID_<Tabellenname>` als INTEGER PRIMARY KEY AUTOINCREMENT
- **Foreign Keys**: FK-Spalten heißen wie der PK der referenzierten Tabelle (z.B. `ID_Kommunikation` → `Kommunikation.ID_Kommunikation`)
- **Enums**: Als TEXT-Spalten mit CHECK-Constraint realisiert; Enum-Werte in `stammdaten_enums.sql` gepflegt
- **Enum-Prefix**: Enum-Typen im DBML beginnen mit `_` (z.B. `_Bundesland`, `_Innung`)
- **Notes im DBML**: Format `'[Art] | Beschreibung'` – Art kann sein: `QS` (Qualitätssicherung), `§ 19_K`/`§ 19_B` (gesetzliche Grundlage), `NEIN` (nicht relevant), `V` (wird ignoriert)
- **CSV-Delimiter**: Semikolon (`;`)
- **Encoding**: UTF-8 durchgängig
- **SQLite**: `PRAGMA foreign_keys = ON;` wird im Schema gesetzt

## Workflow

1. Datenmodell in `Datenmodell4_0.dbml` pflegen
2. Relationen in `relationen_zuordnung.csv` pflegen
3. `python generate_schema.py` → erzeugt `schema.sql`
4. `python generate_docs.py` → erzeugt `dokumentation.html`

## Tabellengruppen

- **Stammdaten/Verwaltung**: Meta, Kehrbezirk, Mitarbeiter, Vertreter, Kommunikation, Fremdfirma, Untere_Aufsichtsbehoerde
- **Standort**: Ort, Strasse, Grundstueck, Grundstueck_Eigentuemer, Gebaeude_Gebaeudeteil, Gebaeude_Eigentuemer, Gebaeudeeigenschaft
- **Abgasanlagen**: Abgasanlage, Abschnitt, Schicht, Muendung, Reinigungsart
- **Lüftungsanlagen**: Lueftungsanlage, Raumlueftung, Raumlueftungsleitung, Raumluftoeffnung, Mess_Pruefergebnisse_Raumluftoeffnung, Zubehoer
- **Nutzung/Wohnung/Raum**: Nutzungseinheit, Wohnung, Raum
- **Feuerstätten**: Feuerstaette, Gasfeuerstaette, Oelfeuerstaette, Feste_Brennstoff_Feuerstaette, Sonderfeuerstaetten, Waermepumpe, u.a.
- **Messergebnisse**: Diverse Mess_Pruefergebnisse-Tabellen, Messgeraet, Messunsicherheit
- **Dunstabzug**: Dunstabzuganlage_Leitung, Abschnitt_Dunstabzugsleitung, etc.
- **GEG/Effizienz**: GEG, Pruefergebnisse_GEG, Effizienzlabel
- **Hoheitliche Tätigkeiten**: Abnahme, Anlassbezogene_Ueberpruefung, Feuerstaettenschau, etc.
- **Feuerstättenbescheid**: Feuerstaettenbescheid_Grunddaten, Bescheid_Positionen, Bescheid_Termine_Positionen
- **Abrechnung**: Leistung, Aufteilung_Leistung, Rechnung, etc.
- **Kehrbuch**: Kehrbuch, Kehrbuch_Gebaeude, Kehrbuch_Nutzungseinheit, Kehrbuch_Anlage, etc.
- **Berichte/Mängel**: Bericht, Mangel
- **Sonstiges**: Dachskizze, Belegungsplan, Dokument, Gefaehrdungsbeurteilung
