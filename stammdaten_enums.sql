-- Enum-Stammdaten fuer ZIV Datenmodell 4.0
-- Generiert aus Datenmodell4_0.dbml

--  Definition der Enums
CREATE TABLE IF NOT EXISTS Enum_Anlagetyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Abgasanlage', '');
INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Feuerstaette', '');
INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Raumluftoeffnung', '');
INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Dunstabzuganlage_Leitung', '');
INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Lueftungsanlage', '');
INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Raumlueftung', '');
INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Raeucheranlage', '');
INSERT INTO Enum_Anlagetyp (Wert, Beschreibung) VALUES ('Brennstoffversorgungsanlage', '');

CREATE TABLE IF NOT EXISTS Enum_AbschnittAnlagetyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbschnittAnlagetyp (Wert, Beschreibung) VALUES ('Abgasanlage', 'Abschnitt gehört zu einer Abgasanlage');
INSERT INTO Enum_AbschnittAnlagetyp (Wert, Beschreibung) VALUES ('Feuerstaette', 'Abschnitt ist Verbindungsstück einer Feuerstätte');

CREATE TABLE IF NOT EXISTS Enum_AbnahmeAnlagetyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbnahmeAnlagetyp (Wert, Beschreibung) VALUES ('Abgasanlage', '');
INSERT INTO Enum_AbnahmeAnlagetyp (Wert, Beschreibung) VALUES ('Feuerstaette', '');

CREATE TABLE IF NOT EXISTS Enum_MangelHerkunftstyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_MangelHerkunftstyp (Wert, Beschreibung) VALUES ('Kehrbuch_Taetigkeit', '');
INSERT INTO Enum_MangelHerkunftstyp (Wert, Beschreibung) VALUES ('Kehrbuch_Abnahme', '');
INSERT INTO Enum_MangelHerkunftstyp (Wert, Beschreibung) VALUES ('Kehrbuch_Feuerstaettenschau', '');
INSERT INTO Enum_MangelHerkunftstyp (Wert, Beschreibung) VALUES ('Kehrbuch_Anlassbezogene_Ueberpruefung', '');

CREATE TABLE IF NOT EXISTS Enum_ZubehoerAnlagetyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZubehoerAnlagetyp (Wert, Beschreibung) VALUES ('Abschnitt', '');
INSERT INTO Enum_ZubehoerAnlagetyp (Wert, Beschreibung) VALUES ('Dunstabzuganlage_Leitung', '');

CREATE TABLE IF NOT EXISTS Enum_DokumentHerkunftstyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Gebaeude_Gebaeudeteil', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Nutzungseinheit', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Feuerstaettenbescheid_Grunddaten', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Abnahme', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Anlassbezogene_Ueberpruefung', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Pruefergebnis_Feuerstaettenschau', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Pruefergebnis_GEG', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Gasfeuerstaette', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Oelfeuerstaette', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Feststofffeuerstaette_HK', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Feststofffeuerstaette_ERF', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Sonderfeuerstaette', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Waermepumpe', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Dunstabzugsleitung', '');
INSERT INTO Enum_DokumentHerkunftstyp (Wert, Beschreibung) VALUES ('Mess_Pruefergebnis_Raumluftoeffnung', '');

CREATE TABLE IF NOT EXISTS Enum_Bundesland (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('BW', 'Baden-Württemberg');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('BY', 'Bayern');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('BE', 'Berlin');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('BB', 'Brandenburg');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('HB', 'Bremen');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('HH', 'Hamburg');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('HE', 'Hessen');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('MV', 'Mecklenburg-Vorpommern');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('NI', 'Niedersachsen');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('NW', 'Nordrhein-Westfalen');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('RP', 'Rheinland-Pfalz');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('SL', 'Saarland');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('SN', 'Sachsen');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('ST', 'Sachsen-Anhalt');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('SH', 'Schleswig-Holstein');
INSERT INTO Enum_Bundesland (Wert, Beschreibung) VALUES ('TH', 'Thüringen');

CREATE TABLE IF NOT EXISTS Enum_Obere_Aufsichtsbehoerde (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BW_STU', 'Regierungspräsidium Stuttgart (Baden-Württemberg)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BY_OBB', 'Regierung von Oberbayern (Bayern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BY_NDB', 'Regierung von Niederbayern (Bayern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BY_OPF', 'Regierung von Oberpfalz (Bayern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BY_OFR', 'Regierung von Oberfranken (Bayern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BY_MFR', 'Regierung von Mittelfranken (Bayern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BY_UFR', 'Regierung von Unterfranken (Bayern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BY_SCH', 'Regierung von Schwaben (Bayern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BE_BER', 'Berlin (Berlin)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('BB_BRA', 'Brandenburg (Brandenburg)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('HB_BRE', 'Bremen (Bremen)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('HH_HAM', 'Hamburg (Hamburg)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('HE_HES', 'Hessen (Hessen)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('MV_MVP', 'Mecklenburg-Vorpommern (Mecklenburg-Vorpommern)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('NI_NDS', 'Niedersachsen (Niedersachsen)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('NW_NRW', 'Nordrhein-Westfalen (Nordrhein-Westfalen)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('RP_ADD', 'Aufsichts und Dienstleistungs Direktion Trier (Rheinland-Pfalz)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('SL_SAA', 'Saarland (Saarland)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('SN_SAC', 'Sachsen (Sachsen)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('ST_SAH', 'Sachsen-Anhalt (Sachsen-Anhalt)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('SH_SHL', 'Schleswig-Holstein (Schleswig-Holstein)');
INSERT INTO Enum_Obere_Aufsichtsbehoerde (Wert, Beschreibung) VALUES ('TH_THL', 'Thüringer Landesverwaltungsamt (Thüringen)');

CREATE TABLE IF NOT EXISTS Enum_Innung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BW_FR', 'Freiburg');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BW_KA', 'Karlsruhe');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BW_ST', 'Stuttgart');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BW_TU', 'Tübingen');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BY_MF', 'Mittelfranken');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BY_NB', 'Niederbayern');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BY_OB', 'Oberbayern');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BY_OF', 'Oberfranken');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BY_OP', 'Oberpfalz');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BY_SW', 'Schwaben');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BY_UF', 'Unterfranken');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BE_BE', 'Berlin');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BB_CO', 'Cottbus');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('HE_FO', 'Frankfurt (Oder)');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('BB_PO', 'Potsdam');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('HB_BR', 'Bremen');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('HH_HH', 'Hamburg');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('HE_DA', 'Darmstadt');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('HE_KS', 'Kassel');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('HE_RM', 'Rhein-Main');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('MV_MV', 'Mecklenburg-Vorpommern');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_BS', 'Braunschweig');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_HA', 'Hannover');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_LH', 'Lüneburger Heide');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_OL', 'Oldenburg');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_OE', 'Osnabrück-Emsland');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_OF', 'Ostfriesland');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_SD', 'Stade');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NI_SN', 'Südniedersachsen');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NW_AC', 'Aachen');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NW_AR', 'Arnsberg');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NW_OW', 'Ostwestfalen-Lippe');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NW_DD', 'Düsseldorf');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NW_KL', 'Köln');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('NW_MS', 'Münster');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('RP_KB', 'Koblenz');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('RP_MA', 'Montabaur');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('RP_PR', 'Pfalz-Rheinhessen');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('RP_TR', 'Trier');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('SL_SL', 'Saarland');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('SN_SX', 'Sachsen');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('ST_AM', 'Altmark');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('ST_HS', 'Halle (Saale)');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('ST_MD', 'Magdeburg');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('SH_FL', 'Flensburg');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('SH_LB', 'Lübeck');
INSERT INTO Enum_Innung (Wert, Beschreibung) VALUES ('TH_TH', 'Thüringen');

CREATE TABLE IF NOT EXISTS Enum_GebaeudeEigenschaft (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('ELBH', 'elektrisch beheizt');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('NEUB', 'geplanter Neubau');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('ROHB', 'Rohbau');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('LEER', 'z.Z. leer');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('KERN', 'Kernsanierung');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('KVT', 'keine vorgeschriebenen Tätigkeiten');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('FHAF', 'Freihafen');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('LGRD', 'Leergrundstück');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('NFW_MIT', 'Nah- oder Fernwärme mit Wärmeübertrager');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('NFW_OHN', 'Nah- oder Fernwärme ohne Wärmeübertrager');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('BHTT', 'Berghütte');
INSERT INTO Enum_GebaeudeEigenschaft (Wert, Beschreibung) VALUES ('INSL', 'Insel');

CREATE TABLE IF NOT EXISTS Enum_AbgasanlageHinterlueftung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbgasanlageHinterlueftung (Wert, Beschreibung) VALUES ('GLST', 'Gleichstrom');
INSERT INTO Enum_AbgasanlageHinterlueftung (Wert, Beschreibung) VALUES ('GGST', 'Gegenstrom');
INSERT INTO Enum_AbgasanlageHinterlueftung (Wert, Beschreibung) VALUES ('KANF', 'Keine Anforderungen');

CREATE TABLE IF NOT EXISTS Enum_Verwendbarkeitsnachweis (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Verwendbarkeitsnachweis (Wert, Beschreibung) VALUES ('CE', 'CE Zeichen');
INSERT INTO Enum_Verwendbarkeitsnachweis (Wert, Beschreibung) VALUES ('UE', 'UE Zeichen');
INSERT INTO Enum_Verwendbarkeitsnachweis (Wert, Beschreibung) VALUES ('ZIE', 'ZiE (Zustimmung im Einzelfall)');
INSERT INTO Enum_Verwendbarkeitsnachweis (Wert, Beschreibung) VALUES ('ABZ', 'abZ (allgemeine bauaufsichtliche Zulassung)');
INSERT INTO Enum_Verwendbarkeitsnachweis (Wert, Beschreibung) VALUES ('ETA', 'ETA (European Technical Assessment)');

CREATE TABLE IF NOT EXISTS Enum_AbgasanlageBauart18160 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbgasanlageBauart18160 (Wert, Beschreibung) VALUES ('MW', 'Mauerwerk');
INSERT INTO Enum_AbgasanlageBauart18160 (Wert, Beschreibung) VALUES ('MO', 'Montage');
INSERT INTO Enum_AbgasanlageBauart18160 (Wert, Beschreibung) VALUES ('SY', 'System');

CREATE TABLE IF NOT EXISTS Enum_AbschnittBetriebsart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbschnittBetriebsart (Wert, Beschreibung) VALUES ('N', 'Unterdruck (N)');
INSERT INTO Enum_AbschnittBetriebsart (Wert, Beschreibung) VALUES ('P', 'Überdruck (P)');
INSERT INTO Enum_AbschnittBetriebsart (Wert, Beschreibung) VALUES ('H', 'hohen Überdruck (H)');

CREATE TABLE IF NOT EXISTS Enum_Nutzung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Nutzung (Wert, Beschreibung) VALUES ('G', 'gewerblich');
INSERT INTO Enum_Nutzung (Wert, Beschreibung) VALUES ('H', 'häuslich');

CREATE TABLE IF NOT EXISTS Enum_RaumlueftungsleitungBetriebsart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_RaumlueftungsleitungBetriebsart (Wert, Beschreibung) VALUES ('UD', 'Unterdruck');
INSERT INTO Enum_RaumlueftungsleitungBetriebsart (Wert, Beschreibung) VALUES ('UED', 'Überdruck');

CREATE TABLE IF NOT EXISTS Enum_BrennstoffversorgungsanlageBestehungart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffversorgungsanlageBestehungart (Wert, Beschreibung) VALUES ('N', 'Neuerrichte Tankanlage');
INSERT INTO Enum_BrennstoffversorgungsanlageBestehungart (Wert, Beschreibung) VALUES ('B', 'Bestehende Tankanlage');

CREATE TABLE IF NOT EXISTS Enum_BrennstoffversorgungsanlageMaterialart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffversorgungsanlageMaterialart (Wert, Beschreibung) VALUES ('KS', 'Kunststoff');
INSERT INTO Enum_BrennstoffversorgungsanlageMaterialart (Wert, Beschreibung) VALUES ('GF', 'GFK');
INSERT INTO Enum_BrennstoffversorgungsanlageMaterialart (Wert, Beschreibung) VALUES ('AL', 'Aluminium');
INSERT INTO Enum_BrennstoffversorgungsanlageMaterialart (Wert, Beschreibung) VALUES ('GS', 'geschweißter Stahltank');
INSERT INTO Enum_BrennstoffversorgungsanlageMaterialart (Wert, Beschreibung) VALUES ('SB', 'Stahl-Batterietanks');

CREATE TABLE IF NOT EXISTS Enum_BrennstoffversorgungsanlageWandung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffversorgungsanlageWandung (Wert, Beschreibung) VALUES ('EW', 'einwandig');
INSERT INTO Enum_BrennstoffversorgungsanlageWandung (Wert, Beschreibung) VALUES ('DW', 'doppelwandig');

CREATE TABLE IF NOT EXISTS Enum_BrennstoffversorgungsanlageRaumart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffversorgungsanlageRaumart (Wert, Beschreibung) VALUES ('LR', 'Aufstellort ist Lagerraum');
INSERT INTO Enum_BrennstoffversorgungsanlageRaumart (Wert, Beschreibung) VALUES ('AR', 'Aufstellort ist Aufstellraum');

CREATE TABLE IF NOT EXISTS Enum_BrennstoffversorgungsanlageTankvolumen (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffversorgungsanlageTankvolumen (Wert, Beschreibung) VALUES ('K1', '< 1000');
INSERT INTO Enum_BrennstoffversorgungsanlageTankvolumen (Wert, Beschreibung) VALUES ('G1K5', '≥ 1000 < 5000');
INSERT INTO Enum_BrennstoffversorgungsanlageTankvolumen (Wert, Beschreibung) VALUES ('G5', '≥ 5000');

CREATE TABLE IF NOT EXISTS Enum_BrennstoffversorgungsanlageRohrsystem (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffversorgungsanlageRohrsystem (Wert, Beschreibung) VALUES ('E', 'Einrohrsystem');
INSERT INTO Enum_BrennstoffversorgungsanlageRohrsystem (Wert, Beschreibung) VALUES ('Z', 'Zweirohrsystem');

CREATE TABLE IF NOT EXISTS Enum_BrennstoffversorgungsanlageZustand (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffversorgungsanlageZustand (Wert, Beschreibung) VALUES ('IO', 'in Ordnung');
INSERT INTO Enum_BrennstoffversorgungsanlageZustand (Wert, Beschreibung) VALUES ('UE', 'Überprüfung empfohlen');
INSERT INTO Enum_BrennstoffversorgungsanlageZustand (Wert, Beschreibung) VALUES ('NIO', 'nicht in Ordnung');

CREATE TABLE IF NOT EXISTS Enum_ErgebnisDunstDurchfuehrung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ErgebnisDunstDurchfuehrung (Wert, Beschreibung) VALUES ('BT', 'Betreiber');
INSERT INTO Enum_ErgebnisDunstDurchfuehrung (Wert, Beschreibung) VALUES ('FF', 'Fachfirma');
INSERT INTO Enum_ErgebnisDunstDurchfuehrung (Wert, Beschreibung) VALUES ('WF', 'Wartungsfirma');
INSERT INTO Enum_ErgebnisDunstDurchfuehrung (Wert, Beschreibung) VALUES ('AB', 'durch Ausbrennen');
INSERT INTO Enum_ErgebnisDunstDurchfuehrung (Wert, Beschreibung) VALUES ('CH', 'chemische Reinigung');

CREATE TABLE IF NOT EXISTS Enum_FeuerloescherBrandklasse (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_FeuerloescherBrandklasse (Wert, Beschreibung) VALUES ('A', 'Brandklasse A (feste, glutbildende Stoffe: z.B. Holz, Papier, Textilien)');
INSERT INTO Enum_FeuerloescherBrandklasse (Wert, Beschreibung) VALUES ('B', 'Brandklasse B (flüssige oder flüssig werdende Stoffe: z.B. Benzin, Öl, Lacke, Wachs)');
INSERT INTO Enum_FeuerloescherBrandklasse (Wert, Beschreibung) VALUES ('C', 'Brandklasse C (gasförmige Stoffe: z.B. Propan, Butan, Methan)');
INSERT INTO Enum_FeuerloescherBrandklasse (Wert, Beschreibung) VALUES ('D', 'Brandklasse D (Metalle: z.B. Magnesium, Aluminium, Natrium, Kalium)');
INSERT INTO Enum_FeuerloescherBrandklasse (Wert, Beschreibung) VALUES ('F', 'Brandklasse F (Speiseöle/-fette: z.B. Fritteusenfett)');

CREATE TABLE IF NOT EXISTS Enum_FeuerloescherLoeschmittel (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_FeuerloescherLoeschmittel (Wert, Beschreibung) VALUES ('W', 'Wasser');
INSERT INTO Enum_FeuerloescherLoeschmittel (Wert, Beschreibung) VALUES ('S', 'Schaum');
INSERT INTO Enum_FeuerloescherLoeschmittel (Wert, Beschreibung) VALUES ('P', 'Pulver');
INSERT INTO Enum_FeuerloescherLoeschmittel (Wert, Beschreibung) VALUES ('CO2', 'Kohlendioxid (CO2)');
INSERT INTO Enum_FeuerloescherLoeschmittel (Wert, Beschreibung) VALUES ('FET', 'Fettbrandlöschmittel (Klasse F)');

CREATE TABLE IF NOT EXISTS Enum_FeuerloescherGroesseEinheit (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_FeuerloescherGroesseEinheit (Wert, Beschreibung) VALUES ('L', 'Liter (L)');
INSERT INTO Enum_FeuerloescherGroesseEinheit (Wert, Beschreibung) VALUES ('KG', 'Kilogramm (kg)');

CREATE TABLE IF NOT EXISTS Enum_RaumMechanischeEntlueftung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_RaumMechanischeEntlueftung (Wert, Beschreibung) VALUES ('J', 'Ja');
INSERT INTO Enum_RaumMechanischeEntlueftung (Wert, Beschreibung) VALUES ('JV', 'Ja, mit Verriegelung');
INSERT INTO Enum_RaumMechanischeEntlueftung (Wert, Beschreibung) VALUES ('N', 'Nein');

CREATE TABLE IF NOT EXISTS Enum_Brennerart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Brennerart (Wert, Beschreibung) VALUES ('OG', 'ohne Gebläse');
INSERT INTO Enum_Brennerart (Wert, Beschreibung) VALUES ('MG', 'mit Gebläse');
INSERT INTO Enum_Brennerart (Wert, Beschreibung) VALUES ('GU', 'Gebläse unterstützt');

CREATE TABLE IF NOT EXISTS Enum_FeuerstaetteAbgasanlage (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_FeuerstaetteAbgasanlage (Wert, Beschreibung) VALUES ('KA', 'keine Abgasanlage');
INSERT INTO Enum_FeuerstaetteAbgasanlage (Wert, Beschreibung) VALUES ('MA', 'mit Abgasanlage');
INSERT INTO Enum_FeuerstaetteAbgasanlage (Wert, Beschreibung) VALUES ('SZ', 'systemzertifizierte Abgasanlage');

CREATE TABLE IF NOT EXISTS Enum_MuendungAufsatz (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_MuendungAufsatz (Wert, Beschreibung) VALUES ('MS', 'Meidinger Scheibe');
INSERT INTO Enum_MuendungAufsatz (Wert, Beschreibung) VALUES ('DR', 'drehbar');
INSERT INTO Enum_MuendungAufsatz (Wert, Beschreibung) VALUES ('VE', 'Ventilator');

CREATE TABLE IF NOT EXISTS Enum_AbgaswegeCheck (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbgaswegeCheck (Wert, Beschreibung) VALUES ('IO', 'in Ordnung');
INSERT INTO Enum_AbgaswegeCheck (Wert, Beschreibung) VALUES ('MA', 'mangelhaft');
INSERT INTO Enum_AbgaswegeCheck (Wert, Beschreibung) VALUES ('NZ', 'nicht zutreffend');

CREATE TABLE IF NOT EXISTS Enum_MessungArt1BImSchVOelGas (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_MessungArt1BImSchVOelGas (Wert, Beschreibung) VALUES ('EM', 'Erstmessung (§ 14 1. BImSchV)');
INSERT INTO Enum_MessungArt1BImSchVOelGas (Wert, Beschreibung) VALUES ('WM', 'wiederkehrende Messung (§ 15 1. BImSchV)');
INSERT INTO Enum_MessungArt1BImSchVOelGas (Wert, Beschreibung) VALUES ('WH', 'Wiederholungsmessung (§ 15 (3) bzw. 14 (5))');
INSERT INTO Enum_MessungArt1BImSchVOelGas (Wert, Beschreibung) VALUES ('AO', 'Messung auf Anordnung');
INSERT INTO Enum_MessungArt1BImSchVOelGas (Wert, Beschreibung) VALUES ('FM', 'freiwillige Messung');
INSERT INTO Enum_MessungArt1BImSchVOelGas (Wert, Beschreibung) VALUES ('NM', 'nicht messpflichtig');

CREATE TABLE IF NOT EXISTS Enum_UeberpruefungArtOelGas (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_UeberpruefungArtOelGas (Wert, Beschreibung) VALUES ('U', 'Überprüfung');
INSERT INTO Enum_UeberpruefungArtOelGas (Wert, Beschreibung) VALUES ('WC', 'Wiederholungsüberprüfung CO (§ 1 (2 Satz 2) KUEO)');
INSERT INTO Enum_UeberpruefungArtOelGas (Wert, Beschreibung) VALUES ('AO', 'Überprüfung auf Anordnung (§ 1 (5) KUEO)');

CREATE TABLE IF NOT EXISTS Enum_MessungArt44BImSchV (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_MessungArt44BImSchV (Wert, Beschreibung) VALUES ('EM', 'Erstmessung gemäß § 31 Abs. 1 der 44. BImSchV');
INSERT INTO Enum_MessungArt44BImSchV (Wert, Beschreibung) VALUES ('WM', 'Wiederkehrende Messung gemäß § 22 der 44. BImSchV');

CREATE TABLE IF NOT EXISTS Enum_MessungArt1BImSchVFeststoff (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_MessungArt1BImSchVFeststoff (Wert, Beschreibung) VALUES ('U14_1', 'Überprüfung nach § 14 Absatz 1 1. BImSchV*');
INSERT INTO Enum_MessungArt1BImSchVFeststoff (Wert, Beschreibung) VALUES ('MU14_2', 'Messung und Überprüfung nach § 14 Absatz 2 1. BImSchV');
INSERT INTO Enum_MessungArt1BImSchVFeststoff (Wert, Beschreibung) VALUES ('MU15_1', 'Messung und Überprüfung nach § 15 Absatz 1 bzw. § 25 Absatz 4 1. BImSchV');
INSERT INTO Enum_MessungArt1BImSchVFeststoff (Wert, Beschreibung) VALUES ('WU14_5', 'Wiederholungsüberprüfung nach § 14 Absatz 5 1. BImSchV');
INSERT INTO Enum_MessungArt1BImSchVFeststoff (Wert, Beschreibung) VALUES ('B4_8', 'Beratung nach § 4 Absatz 8 bzw. § 25 Absatz 5 1. BImSchV');

CREATE TABLE IF NOT EXISTS Enum_StichtagStufe1 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_StichtagStufe1 (Wert, Beschreibung) VALUES ('S15', '01.01.2015');
INSERT INTO Enum_StichtagStufe1 (Wert, Beschreibung) VALUES ('S19', '01.01.2019');
INSERT INTO Enum_StichtagStufe1 (Wert, Beschreibung) VALUES ('S25', '01.01.2025');

CREATE TABLE IF NOT EXISTS Enum_StichtagEinzelraum (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_StichtagEinzelraum (Wert, Beschreibung) VALUES ('S14', '31.12.2014');
INSERT INTO Enum_StichtagEinzelraum (Wert, Beschreibung) VALUES ('S17', '31.12.2017');
INSERT INTO Enum_StichtagEinzelraum (Wert, Beschreibung) VALUES ('S20', '31.12.2020');
INSERT INTO Enum_StichtagEinzelraum (Wert, Beschreibung) VALUES ('S24', '31.12.2024');

CREATE TABLE IF NOT EXISTS Enum_WPAufstellbedingungEingehalten (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WPAufstellbedingungEingehalten (Wert, Beschreibung) VALUES ('J', 'Ja');
INSERT INTO Enum_WPAufstellbedingungEingehalten (Wert, Beschreibung) VALUES ('N', 'Nein');
INSERT INTO Enum_WPAufstellbedingungEingehalten (Wert, Beschreibung) VALUES ('NV', 'nicht vorhanden');

CREATE TABLE IF NOT EXISTS Enum_WPHeizkurve (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WPHeizkurve (Wert, Beschreibung) VALUES ('W', 'Werkseinstellung');
INSERT INTO Enum_WPHeizkurve (Wert, Beschreibung) VALUES ('H', 'Händisch eingestellt');

CREATE TABLE IF NOT EXISTS Enum_MessgeraeteTyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_MessgeraeteTyp (Wert, Beschreibung) VALUES ('AV', 'Abgasverlustmessgerät');
INSERT INTO Enum_MessgeraeteTyp (Wert, Beschreibung) VALUES ('CO', 'CO-Messgerät');
INSERT INTO Enum_MessgeraeteTyp (Wert, Beschreibung) VALUES ('SM', 'Staubmessgerät');
INSERT INTO Enum_MessgeraeteTyp (Wert, Beschreibung) VALUES ('RZ', 'Rußpumpe');
INSERT INTO Enum_MessgeraeteTyp (Wert, Beschreibung) VALUES ('SG', 'Andere Messgerät');

CREATE TABLE IF NOT EXISTS Enum_PruefstelleMessgeraete (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BW1', 'Messgeräteprüfstand der Schornsteinfegerinnung für den Regierungsbezirk Freiburg, Ahornweg 18, 79822 Titisee-Neustadt');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BW2', 'Messgeräteprüfstand der Schornsteinfegerinnung für den Regierungsbezirk Karlsruhe, Rüppurrer Str. 13, 76137 Karlsruhe');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BW3', 'Messgeräteprüfstand der Schornsteinfegerinnung für den Regierungsbezirk Stuttgart, Steinbeisstr. 9, 71332 Waiblingen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BW4', 'Messgeräteprüfstand der Schornsteinfegerinnung für den Regierungsbezirk Tübingen, Robert-Bosch-Str. 28, 88499 Riedlingen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BY1', 'Techn. Prüfstelle Innung Mittelfranken, Lechnerstr. 6, 90482 Nürnberg');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BY2', 'Prüfstand Niederbayern, Wenger Str. 13, 84164 Moosthenning');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BY3', 'Technische Prüfstelle Oberbayern, Gneisenaustr. 12, 80992 München');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BY4', 'Technische Prüfstelle Kaminkehrerinnung Oberfranken, Christensenstr. 2, 95463 Bindlach');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BY5', 'Oberpfalz Kaminkehrer Service GmbH & Co.KG, Florianstr. 1, 92345 Dietfurt/Mühlbach');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BY6', 'Techn. Prüfstelle Schwaben, Siebentischstr. 56, 86161 Augsburg');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BY7', 'Techn. Prüfstelle der Kaminkehrerinnung Unterfranken, Kirchplatz 3, 97228 Rottendorf');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BE1', 'Techn. Prüfstelle der Schornsteinfegerinnung in Berlin, Westfälische Str. 87, 10709 Berlin');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('BB1', 'Märkische Kiefer eG − Techn. Prüfstelle, Eschenallee 33, 14974 Ludwigsfelde');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('HB1', 'Techn. Prüfstelle Bremen, Oslebshauser Heerstr. 116, 28239 Bremen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('HH1', 'Techn. Prüfstelle der Schornsteinfegerinnung Hamburg, Osterrade 19, 21031 Hamburg');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('HE1', 'Messgeräteprüfstelle Langen GmbH, Heinrich-Hertz-Str. 20, 63225 Langen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('HE2', 'Technische Prüfstelle für Mess- und Prüfgeräte für Schornsteinfeger und Marktpartner Nordhessen UG (TPMP), Zum Vockenberg 2, 34302 Guxhagen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('HE3', 'Messgeräteprüfstelle Rhein-Main GmbH, Intzestr. 8-10, 60314 Frankfurt/M.');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('MV1', 'Techn. Prüfstelle Mecklenburg-Vorpommern, An der Molkerei 1, 18198 Klein Schwaß');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI1', 'Techn. Prüfstelle der Schornsteinfegerinnung Hannover e.V., Mannheimer Str. 14, 30880 Laatzen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2', 'Prüfstandsgesellschaft mbH, Konrad-Adenaür-Str. 7, 30853 Langenhagen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2_BS', 'Prüfstandsgesellschaft mbH, Außenstelle Braunschweig (AS-Bs), Göthestr. 6, 38122 Braunschweig');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2_LUE', 'Prüfstandsgesellschaft mbH, Außenstelle für Lüneburger Heide (AS-Lü), Georg-Leppien-Str. 20, 21337 Lüneburg');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2_OL', 'Prüfstandsgesellschaft mbH, Außenstelle für Oldenburg (AS-Ol), Tannenstr. 9-11, 26122 Oldenburg');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2_OSN', 'Prüfstandsgesellschaft mbH, Außenstelle für Osnabrück-Emsland (AS-Osn), Hollensteder Str. 11, 49584 Fürstenau');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2_OST', 'Prüfstandsgesellschaft mbH, Außenstelle für Ostfriesland (AS-Ost), Straße des Handwerks 2, 26603 Aurich');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2_STD', 'Prüfstandsgesellschaft mbH, Außenstelle für Stade (AS-Std), Hansestr. 26, 21682 Stade');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI2_SUE', 'Prüfstandsgesellschaft mbH, Außenstelle für Süd-Niedersachsen (AS-Sü), Blücherstr. 14, 31061 Alfeld/Leine');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NI3', 'Messgeräteprüfstelle Kleinschmidt GmbH, Stockholmer Str. 5, 29640 Schneverdingen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NW1', 'Schornsteinfegerinnung für den Handwerkskammerbezirk Aachen − Techn. Prüfstelle −, Auf der Hüls 199, 52068 Aachen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NW2', 'Schornsteinfegerinnung für den Regierungsbezirk Arnsberg − Techn. Prüfstelle −, Langer Brauck 1, 58640 Iserlohn');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NW3', 'Schornsteinfegerinnung für den Regierungsbezirk Münster − Techn. Prüfstelle −, Alter Ostdamm 17, 48249 Dülmen');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NW4', 'Schornsteinfegergenossenschaft für den Regierungsbezirk Düsseldorf − Techn. Prüfstelle −, Weinheimer Str. 27, 40229 Düsseldorf');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NW5', 'Schornsteinfegerinnung für den Kammerbezirk Köln − Technische Prüfstelle −, Genker Str. 8, 53842 Troisdorf');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('NW6', 'Schornsteinfegerinnung Ostwestfalen-Lippe, Sperlingstr. 24, 33607 Bielefeld');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('RP1', 'TPV Koblenz-Montabaur Technische Prüf- und Vertriebsstelle für das Schornsteinfegerhandwerk GmbH, Hövelstr. 19, 56073 Koblenz');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('RP2', 'Techn. Prüfstelle Schornsteinfegerinnung Pfalz – Rheinhessen, Im Stadtwald 15a, 67663 Kaiserslautern');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('RP3', 'Techn. Prüfstelle Schornsteinfegerinnung Trier, Ahornweg 5, 54317 Gusterath');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('SL1', 'Techn. Prüfstelle – Schornsteinfegerinnung für das Saarland, Kahler-Allee 37, 66386 St. Ingbert');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('SN1', 'Techn. Prüfstelle des LIV Sachsen, Wöllnaür Chaussee 8, 04838 Mörtitz');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('SN2', 'RED Riesär Energiedienst GbR, Hauptstr. 26, 01589 Riesa');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('ST1', 'Prüfstand Sachsen-Anhalt UG (haftungsbeschränkt), Gießerstr. 8, 06116 Halle/S');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('ST2', 'Messgeräteprüfstelle – Prüfung/Kalibrierung von Messgeräten für Schornsteinfegertätigkeiten Buchholz/Voigt GbR, Feld am Bruche 8, 39435 Egeln');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('SH1', 'Schornsteinfegerinnung Lübeck, BgA Prüfstand, Krummredder 13, 24539 Neumünster');
INSERT INTO Enum_PruefstelleMessgeraete (Wert, Beschreibung) VALUES ('TH1', 'Techn. Prüfstelle der Schornsteinfegerinnung im Freistaat Thüringen, Weimarsche Str. 62 a, 99428 Utzberg');

CREATE TABLE IF NOT EXISTS Enum_EffizienzlabelAngebracht (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_EffizienzlabelAngebracht (Wert, Beschreibung) VALUES ('B', 'Berechtigter (HSK Marktteilnehmer)');
INSERT INTO Enum_EffizienzlabelAngebracht (Wert, Beschreibung) VALUES ('V', 'Verpflichteter (bBSF)');

CREATE TABLE IF NOT EXISTS Enum_VerbrenungsluftRaumart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_VerbrenungsluftRaumart (Wert, Beschreibung) VALUES ('VR', 'Verbundraum');
INSERT INTO Enum_VerbrenungsluftRaumart (Wert, Beschreibung) VALUES ('VL', 'Verbrennungsluftraum');

CREATE TABLE IF NOT EXISTS Enum_RaeucheranlageArt (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('ROF', 'Räucherofen');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('RSC', 'Räucherschrank');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('KRA', 'Kalträucheranlage');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('HRA', 'Heissräucheranlage');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('DAR', 'Darranlage');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('TRK', 'Trockenkammer');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('RFG', 'Rauchfang');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('RST', 'Röstanlage');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('TLA', 'Trockenanlage');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('ABW', 'Abzugsweg');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('RTU', 'Räucherturm');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('SWB', 'Schwibbogen');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('RKM', 'Räucherkammer');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('VGL', 'Vorgelege');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('RZE', 'Raucherzeuger');
INSERT INTO Enum_RaeucheranlageArt (Wert, Beschreibung) VALUES ('FRA', 'Fischräucheranlagen');

CREATE TABLE IF NOT EXISTS Enum_Berechnungstyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Berechnungstyp (Wert, Beschreibung) VALUES ('MIN', 'Zeitaufwand in Minuten');
INSERT INTO Enum_Berechnungstyp (Wert, Beschreibung) VALUES ('AW', 'Arbeitsaufwand in AW');
INSERT INTO Enum_Berechnungstyp (Wert, Beschreibung) VALUES ('EUR', 'Geldwert');

CREATE TABLE IF NOT EXISTS Enum_SonstigeArbeitenTyp (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_SonstigeArbeitenTyp (Wert, Beschreibung) VALUES ('PF', 'Pflichtarbeit');
INSERT INTO Enum_SonstigeArbeitenTyp (Wert, Beschreibung) VALUES ('GP', 'gebührenpflichtige Nebenarbeit (Synonym: nicht wiederkehrende Pflichtarbeit)');
INSERT INTO Enum_SonstigeArbeitenTyp (Wert, Beschreibung) VALUES ('NG', 'nicht gebührenpflichtige Nebenarbeit');

CREATE TABLE IF NOT EXISTS Enum_DunstabzugHaubeBauform (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('SO', 'sonstiges');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('DE', 'Deckenhaube');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('MI', 'Mittelhaube');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('WA', 'Wandhaube');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('GR', 'Grillhaube');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('MA', 'Mittelhaube mit außenliegender Absaugung');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('IN', 'Induktionshaube');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('LG', 'Lüftungsdecke, geschlossenes System mit Stauraum');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('LD', 'Lüftungsdecke');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('GS', 'geschlossenes System (Wabendecke)');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('LO', 'Lüftungsdecke, offenes System mit herausnehmbaren Ärosolabscheidern');
INSERT INTO Enum_DunstabzugHaubeBauform (Wert, Beschreibung) VALUES ('LR', 'Lüftungsdecke, offenes System mit feststehender Rinnenabscheidung');

CREATE TABLE IF NOT EXISTS Enum_DunstabzugHaubeNutzung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_DunstabzugHaubeNutzung (Wert, Beschreibung) VALUES ('H', 'häuslich');
INSERT INTO Enum_DunstabzugHaubeNutzung (Wert, Beschreibung) VALUES ('G', 'gewerblich');
INSERT INTO Enum_DunstabzugHaubeNutzung (Wert, Beschreibung) VALUES ('U', 'Überprüfungspflichtig');

CREATE TABLE IF NOT EXISTS Enum_DunstabzugHaubeAerosolfilter (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_DunstabzugHaubeAerosolfilter (Wert, Beschreibung) VALUES ('G', 'gestrickt');
INSERT INTO Enum_DunstabzugHaubeAerosolfilter (Wert, Beschreibung) VALUES ('B', 'Brandschutz');

CREATE TABLE IF NOT EXISTS Enum_DunstabzugHaubeAbluftBbehandlung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_DunstabzugHaubeAbluftBbehandlung (Wert, Beschreibung) VALUES ('SO', 'sonstiges');
INSERT INTO Enum_DunstabzugHaubeAbluftBbehandlung (Wert, Beschreibung) VALUES ('AK', 'Aktivkohle');
INSERT INTO Enum_DunstabzugHaubeAbluftBbehandlung (Wert, Beschreibung) VALUES ('UV', 'UV (Ozon)');
INSERT INTO Enum_DunstabzugHaubeAbluftBbehandlung (Wert, Beschreibung) VALUES ('WA', 'Wäscher');
INSERT INTO Enum_DunstabzugHaubeAbluftBbehandlung (Wert, Beschreibung) VALUES ('NV', 'Nachverbrennungseinrichtung');

CREATE TABLE IF NOT EXISTS Enum_DunstabzugFeuerstaetteBetriebsweiseBrenner (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_DunstabzugFeuerstaetteBetriebsweiseBrenner (Wert, Beschreibung) VALUES ('OG', 'ohne Gebläse');
INSERT INTO Enum_DunstabzugFeuerstaetteBetriebsweiseBrenner (Wert, Beschreibung) VALUES ('HG', 'mit Gebläse hinter dem Brenner/Wärmeaustauscher');
INSERT INTO Enum_DunstabzugFeuerstaetteBetriebsweiseBrenner (Wert, Beschreibung) VALUES ('VG', 'mit Gebläse vor dem Brenner/Wärmeaustauscher');
INSERT INTO Enum_DunstabzugFeuerstaetteBetriebsweiseBrenner (Wert, Beschreibung) VALUES ('SG', 'mit Gebläse hinter der Strömungssicherung/Ausgleichöffnung');

CREATE TABLE IF NOT EXISTS Enum_VentilatorArt (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_VentilatorArt (Wert, Beschreibung) VALUES ('AX', 'axial');
INSERT INTO Enum_VentilatorArt (Wert, Beschreibung) VALUES ('RA', 'radial');

CREATE TABLE IF NOT EXISTS Enum_FeuerstaettenbescheidArt (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_FeuerstaettenbescheidArt (Wert, Beschreibung) VALUES ('KB', 'Bescheid nach Kehrbuch');
INSERT INTO Enum_FeuerstaettenbescheidArt (Wert, Beschreibung) VALUES ('FS', 'Bescheid nach Feuerstättenschau');
INSERT INTO Enum_FeuerstaettenbescheidArt (Wert, Beschreibung) VALUES ('AE', 'Änderungsbescheid');
INSERT INTO Enum_FeuerstaettenbescheidArt (Wert, Beschreibung) VALUES ('BA', 'Bescheid nach Bauabnahme');

CREATE TABLE IF NOT EXISTS Enum_Ausfuehrender (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Ausfuehrender (Wert, Beschreibung) VALUES ('BB', 'bBSF');
INSERT INTO Enum_Ausfuehrender (Wert, Beschreibung) VALUES ('GE', 'Geselle');
INSERT INTO Enum_Ausfuehrender (Wert, Beschreibung) VALUES ('HI', 'Hilfskraft');
INSERT INTO Enum_Ausfuehrender (Wert, Beschreibung) VALUES ('AU', 'Aushilfe');
INSERT INTO Enum_Ausfuehrender (Wert, Beschreibung) VALUES ('FF', 'Fremdfirma');

CREATE TABLE IF NOT EXISTS Enum_Dachskizzenobject (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('LI', 'Linie');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('AS', 'Aussteigeöffnung/Dachaufstieg/Dachzugang');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('LS', 'Laufsteg (gestrichelte Linie)');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('LE', 'Leiter (#)');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('HE', 'Hauseingang');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('AG', 'Abgasanlage');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('AC', 'Abgasanlage C1 und C3');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('GL', 'Geschossleiste');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('TF', 'Textfeld');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('SB', 'Stoßbesen (S)');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('HA', 'Haspel (H)');
INSERT INTO Enum_Dachskizzenobject (Wert, Beschreibung) VALUES ('RV', 'Reinigungsverschlüsse untereinander angeordnet (|)');

--  Kennzeichnung 2.1.1 Art der baulichen Anlage (BA)
CREATE TABLE IF NOT EXISTS Enum_AbgasanlageArt (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('AB', 'Abführung von Verbrennungsgasen von BH, WP, WA, FC, VM, NO | Erläuterung: Anlage zur Abführung von Verbrennungsgasen für Blockheizkraftwerke, Wärmepumpen, Brennstoffzellenheizgeräte, ortsfeste Verbrennungsmotoren, Notstromaggregate');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('AI', 'Abgasleitung im Schacht | Erläuterung: Nicht rußbrandbeständiges Innenrohr (Querschnittsanpassung) oder Abgasleitung verlegt in einem Schacht oder ehemaligen Schornstein mit Brandschutzanforderungen. Es können ausschließlich Feuerstätten für gasförmige oder flüssige Brennstoffe angeschlossen werden. Hinweis: Mit rußbrandbeständigem Innenrohr versehene Schornsteine und Anschluß einer Feuerstätte für feste Brennstoffe werden als "Schornstein - (SN)" eingestuft. | Sonstiges: Beispiele:');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('AL', 'Abgasleitung (ohne Schacht) | Erläuterung: Nicht rußbrandbeständige Abgasanlage. Es können ausschließlich Feuerstätten für gasförmige oder flüssige Brennstoffe angeschlossen werden. | Sonstiges: Beispiele:');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('AT', 'Abgasschacht, nicht rußbrandbeständig | Erläuterung: Nicht rußbrandbeständiger abgasführender Teil als Abgasleitung. Es können ausschließlich Feuerstätten für gasförmige oder flüssige Brennstoffe angeschlossen werden. | Sonstiges: Beispiel:');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('AX', 'Abgasschacht, rußbrandbeständig | Erläuterung: Rußbrandbeständiger abgasführender Schacht als Abgasleitung für Feuerstätten mit gasförmigen oder flüssigen Brennstoffent. Das Kriterium "Rußbrandbeständigkeit" wird jedoch nicht bewertet. | Sonstiges: Beispiel:');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('LA', 'Abgasschacht im Luftschacht, nicht rußbrandbeständig | Erläuterung: Nicht rußbrandbeständiger abgasführender Teil eines Luft- Abgassystems aus mineralischen Baustoffen. Der Abgasschacht ist im Luftschacht angeordnet (konzentrisch). Es können ausschließlich Feuerstätten für gasförmige oder flüssige Brennstoffe angeschlossen werden.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('LU', 'Luftschacht | Erläuterung: Für den Betrieb von Feuerstätten notwendiger Zu- oder Abluftschacht. Luftschächte können als Bestandteil eines Luft-Abgassystems oder als eigener Schacht ausgebildet sein.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('LS', 'Lüftungsschacht | Erläuterung: Lüftungsschacht in die Abgase eingeleitet werden | Sonstiges: Beispiel:');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('SC', 'Schacht für Abgasleitung/ Lüftungsleitung | Erläuterung: Dummy ?');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('SM', 'Sammelabgasanlage | Erläuterung: senkrechter Teil einer Abgasanlage für mehrere Dunkelstrahler');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('SN', 'Schornstein | Erläuterung: Abgasanlage für Feuerstätten mit festen Brennstoffen');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('SR', 'Sammelrohr | Erläuterung: waagerechter Teil einer Abgasanlage für mehrere Dunkelstrahler');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('VS', 'Verbindungsstück | Erläuterung: Teil der Abgasanlage zwischen Feuerstätte und senkrechtem Teil der Abgasanlage.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('ZR', 'Zweigrohr | Erläuterung: Teil der Abgasanlage zwischen Dunkelstrahler und Sammelrohr.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('AQ', 'abgasführendes Rohr / Innenrohr | Erläuterung: Abgasanlage als Sonderkonstruktion. Z.B. einwandige Abgasanlagen für Hochdruckreiniger und Warmlufterzeuger.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('LG', 'Lüftungsanlage, rußbrandbeständig | Erläuterung: Lüftunganlage, an die Feuerstätten für feste Brennstoffe angeschlossen sind.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('SX', 'LAS-Schornstein, rußbrandbeständig | Erläuterung: Rußbrandbeständiger abgasführender senkrechter Teil eines Luft- Abgassystems für raumluftabhängige und raumluftunabhänge Feuerstätten für feste Brennstoffe.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('LB', 'Luft-Abgassystem, nicht rußbrandbeständig | Erläuterung: Nicht rußbrandbeständiger abgasführender senkrechter Teil eines Luft- Abgassystems aus mineralischen Baustoffen. Abgasschacht und Luftschacht sind nebeneinander angeordnet. Es können ausschließlich Feuerstätten für gasförmige oder flüssige Brennstoffe angeschlossen werden.');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('MK', 'Mauerkasten | Erläuterung: Mauerkasten für Außenwandfeuerstätten');
INSERT INTO Enum_AbgasanlageArt (Wert, Beschreibung) VALUES ('HT', 'Hosenstück | Erläuterung: Übergangsrohr mit einem oder mehreren Abzweigungen zum Anschluss an senkrechte Abgasanlagen (Eine Feuerstätten an mehrere Abgasanlagen).');

--  Kennzeichnung 2.1.1.1 Zusätzliche Kennzeichnung zur baulichen Anlage
CREATE TABLE IF NOT EXISTS Enum_AbgasanlageZusaetzlicheKennzeichnungBaulicheAnlage (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_AbgasanlageZusaetzlicheKennzeichnungBaulicheAnlage (Wert, Beschreibung) VALUES ('M', 'Montage | Erläuterung: Montage-Abgasanlage: Abgasanlage, die auf der Baustelle montiert oder eingebaut wurde unter Verwendung einer Kombination kompatibler Bauprodukte, die von einem oder verschiedenen Herstellern kommen dürfen (DIN V 18160 Teil 1 Nr. 3.8).');
INSERT INTO Enum_AbgasanlageZusaetzlicheKennzeichnungBaulicheAnlage (Wert, Beschreibung) VALUES ('S', 'System | Erläuterung: System-Abgasanlage: Abgasanlage, die unter Verwendung kompatibler Bauteile zusammengesetzt wurde, die von einem Hersteller, der die Produkthaftung für die gesamte Anlage übernimmt, bezogen oder bestimmt wurde (DIN V 18160 Teil 1 Nr. 3.9).');
INSERT INTO Enum_AbgasanlageZusaetzlicheKennzeichnungBaulicheAnlage (Wert, Beschreibung) VALUES ('Z', 'systemzertifiziert | Erläuterung: Systemzertifizierte Abgasleitung: Abgasleitung sowie ggf. Zubehör und Gasgerät, welches zusammen zertifiziert ist und Bestandteil der Lieferung des Geräteherstellers ist.');

--  Kennzeichnung 2.1.3.1 Temperaturklasse nach DIN V 18160 Teil 1
CREATE TABLE IF NOT EXISTS Enum_Temperaturklasse18160 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T080', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T100', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T120', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T140', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T160', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T200', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T250', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T300', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T400', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T450', '');
INSERT INTO Enum_Temperaturklasse18160 (Wert, Beschreibung) VALUES ('T600', '');

--  Kennzeichnung 2.1.3.2 Druckklasse nach DIN V 18160-1
CREATE TABLE IF NOT EXISTS Enum_Druckklasse18160 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('N1', '≤ 0');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('N2', '≤ 0');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('P1', '≤ 200');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('P2', '≤ 200');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('M1', '≤ 1.500');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('M2', '≤ 1.500');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('H1', '≤ 5.000');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('H2', '≤ 5.000');
INSERT INTO Enum_Druckklasse18160 (Wert, Beschreibung) VALUES ('D0', 'Druckklasse entsprechend abZ der Abgasanlage (5 Ziffern z. B. 50.000)');

-- Kennzeichnung 2.1.3.3 Kondensatbestaendigkeitsklasse nach DIN V 18160-1
CREATE TABLE IF NOT EXISTS Enum_Kondensatbestaendigkeitsklasse18160 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Kondensatbestaendigkeitsklasse18160 (Wert, Beschreibung) VALUES ('W', 'für Abgasanlagen, die planmäßig feucht betrieben werden dürfen');
INSERT INTO Enum_Kondensatbestaendigkeitsklasse18160 (Wert, Beschreibung) VALUES ('D', 'für Abgasanlagen, die planmäßig unter Trocken-Bedingungen betrieben werden müssen');

-- Kennzeichnung 2.1.3.4 Korrosionswiderstandsklasse nach DIN V 18160-1
CREATE TABLE IF NOT EXISTS Enum_Korrosionswiderstandsklasse18160 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Korrosionswiderstandsklasse18160 (Wert, Beschreibung) VALUES ('K1', '');
INSERT INTO Enum_Korrosionswiderstandsklasse18160 (Wert, Beschreibung) VALUES ('K2', '');
INSERT INTO Enum_Korrosionswiderstandsklasse18160 (Wert, Beschreibung) VALUES ('K3', '');

-- Kennzeichnung 2.1.3.5 Russbrandbestaendigkeitsklasse nach DIN V 18160-1
CREATE TABLE IF NOT EXISTS Enum_Russbrandbestaendigkeitsklasse18160 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Russbrandbestaendigkeitsklasse18160 (Wert, Beschreibung) VALUES ('O', 'ohne Rußbrandbeständigeit');
INSERT INTO Enum_Russbrandbestaendigkeitsklasse18160 (Wert, Beschreibung) VALUES ('G', 'mit Rußbrandbeständigkeit.');

-- Kennzeichnung 2.1.3.7 Feuerwiderstandsklasse nach DIN V 18160 Teil 1
CREATE TABLE IF NOT EXISTS Enum_Feuerwiderstandsklasse18160 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Feuerwiderstandsklasse18160 (Wert, Beschreibung) VALUES ('L00', '0 Minuten');
INSERT INTO Enum_Feuerwiderstandsklasse18160 (Wert, Beschreibung) VALUES ('L30', '30 Minuten');
INSERT INTO Enum_Feuerwiderstandsklasse18160 (Wert, Beschreibung) VALUES ('L60', '60 Minuten');
INSERT INTO Enum_Feuerwiderstandsklasse18160 (Wert, Beschreibung) VALUES ('L90', '90 Minuten');
INSERT INTO Enum_Feuerwiderstandsklasse18160 (Wert, Beschreibung) VALUES ('L120', '120 Minuten');
INSERT INTO Enum_Feuerwiderstandsklasse18160 (Wert, Beschreibung) VALUES ('L30A', '30 Minuten');
INSERT INTO Enum_Feuerwiderstandsklasse18160 (Wert, Beschreibung) VALUES ('L90A', '90 Minuten');

-- Kennzeichnung 2.1.4 Material (MAT)
CREATE TABLE IF NOT EXISTS Enum_Material (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('AF', 'Aluminium, flexibel');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('AU', 'Aluminium, starr');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('AZ', 'Asbestzement');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('BE', 'Beton');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('DF', 'Dämmung, flexibel (Wolle, Schütt-)');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('DT', 'Dämmung stehender Luftspalt');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('DS', 'Dämmung, starr (Schalen, Platten)');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('EF', 'Edelstahl, flexibel');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('ES', 'Edelstahl, starr');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('FZ', 'Faserzement');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('FK', 'Fibersilikat');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('GI', 'Gips');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('GL', 'Glas');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('KF', 'Kunststoff, flexibel');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('KS', 'Kunststoff, starr');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('MW', 'Mauerwerk');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('SE', 'Stahlblech, beschichtet');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('SK', 'Schamotte/Keramik');
INSERT INTO Enum_Material (Wert, Beschreibung) VALUES ('ST', 'Stahlblech, schwarz');

-- Kennzeichnung 2.1.5 Querschnittsformen
CREATE TABLE IF NOT EXISTS Enum_Querschnittsform (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Querschnittsform (Wert, Beschreibung) VALUES ('RD', 'Rund');
INSERT INTO Enum_Querschnittsform (Wert, Beschreibung) VALUES ('RE', 'Rechteckig');
INSERT INTO Enum_Querschnittsform (Wert, Beschreibung) VALUES ('OV', 'Oval');

-- Kennzeichnung 2.2.1 Feuerstättenkategorie
CREATE TABLE IF NOT EXISTS Enum_Feuerstaettenart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('BA', 'Backofen/Pizzaofen/Wärme- und Gärraum');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('BH', 'Blockheizkraftwerk');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('BO', 'Brennofen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('DW', 'Durchlaufwasserheizer');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('FC', 'Brennstoffzelle (Fül Cell)');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('GK', 'Gewerbliche Küchengeräte');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('GO', 'Grundofen/ Kachel-, verputzter, Gestell-');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('HD', 'Herd');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('HE', 'Heizungsherd');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('HK', 'Heizkessel');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('HO', 'Hopfendarre');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KE', 'Kamineinsatz, Kaminkassette');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KH', 'Kachelofen mit Heizeinsatz');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KK', 'Kochkessel, Wurstkessel, Schnellkochkessel');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KO', 'Kaminofen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KW', 'Kombiwasserheizer');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('LE', 'Lufterhitzer');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('LT', 'Luft-Trocknungsanlage');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('OK', 'Offener Kamin');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('RA', 'Räucheranlage');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('RD', 'Hochdruckreiniger/Dampfreiniger');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('RF', 'Fischräucheranlage');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('RH', 'Raumheizer');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('RT', 'Röstanlage');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SD', 'Dunkelstrahler');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SF', 'Schmiedefeuer');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SG', 'Specksteingrundofen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SH', 'Hellstrahler');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SO', 'Schmelzofen/Glühofen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('UW', 'Umlaufwasserheizer');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('VM', 'Verbrennungsmotor');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('VW', 'Vorratswasserheizer/Badeofen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WA', 'Wärmepumpe, Adsorption');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WK', 'Waschkessel');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WL', 'Wäschemangel');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WM', 'Waschmaschine');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WP', 'Wärmepumpe, Motor');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WT', 'Wäschetrockner');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('NO', 'Notstromaggregat');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('PO', 'Pelletofen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('BP', 'Brat-/Grill-/ Glüh- / Griddle-Platte/Mongolengrill');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('EA', 'Essen-/Speisenausgabenanlage Wärmeplatte');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('FT', 'Friteuse');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('GY', 'Drehspieß (Gyros, Döner)');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KB', 'Kippbratpfanne');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KV', 'Konvektomat / Dampfschrank / Kombidämpfer');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SI', 'Strahlungsgrill (Salamander)');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WB', 'Wasserbad (Bainmarie)');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('WO', 'Wok, Hockerköcher');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SP', 'Speichereinzelfeuerstätte');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('DE', 'Destille (Alkoholerstellung)');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KG', 'Kachelofen mit Heizeinsatz im Grundofenprinzip');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('HG', 'Heizeinsatz Gas');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('GF', 'Gewerbliche Feuerstätten anderer Art');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('LP', 'Luftprozessanlagen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('KP', 'Koch- und Glühplatten, Glaskeramik-Kochfelder');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('NR', 'Nudel- /Reiskocher');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('FW', 'Fern- und Nahwärme mit und ohne Wärmeübertrager');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('BB', 'Brennstoffzellenheizgerät und Brennwertgerät (Kombigerät)');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('SA', 'Saunaöfen');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('HT', 'hot tube');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('GN', 'Wärmeübertrager im Gebäudenetz');
INSERT INTO Enum_Feuerstaettenart (Wert, Beschreibung) VALUES ('HB', 'Heißwassererzeuger für Getränke');

-- Kennzeichnung 2.2.1.1 Zusatzkennzeichnung 1 zur Feuerstättenkategorie (wasserführend für feste Brennstoffe)
CREATE TABLE IF NOT EXISTS Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffWassertasche (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffWassertasche (Wert, Beschreibung) VALUES ('W', 'wasserführend');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffWassertasche (Wert, Beschreibung) VALUES ('NW', 'nicht wasserführend');

-- Kennzeichnung 2.2.1.2 Zusatzkennzeichnung 2 zur Feuerstättenkategorie (Ölbrennertechnik für flüssige Brennstoffe)
CREATE TABLE IF NOT EXISTS Enum_ZusatzkennzeichnungFeuerstaettenkategorieOelBrenner (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieOelBrenner (Wert, Beschreibung) VALUES ('D', 'Verdampfungsbrenner');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieOelBrenner (Wert, Beschreibung) VALUES ('Z', 'Zerstäuberbrenner');

-- Kennzeichnung 2.2.1.3 Zusatzkennzeichnung 3 zur Feuerstättenkategorie (Feuerungsart für feste Brennstoffe)
CREATE TABLE IF NOT EXISTS Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffFeuerungsart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffFeuerungsart (Wert, Beschreibung) VALUES ('F', 'Flachfeuerung (Zeitbrand)');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffFeuerungsart (Wert, Beschreibung) VALUES ('UE', 'Füllfeuerung (Dauerbrand)');

-- Kennzeichnung 2.2.1.4 Zusatzkennzeichnung 4 zur Feuerstättenkategorie (Beschickungsart für feste Brennstoffe)
CREATE TABLE IF NOT EXISTS Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffBeschickung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffBeschickung (Wert, Beschreibung) VALUES ('H', 'handbeschickt');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffBeschickung (Wert, Beschreibung) VALUES ('A', 'mechanisch beschickt');

-- Kennzeichnung 2.2.1.5 Zusatzkennzeichnung 5 zur Feuerstättenkategorie (Art des Abbrandes für feste Brennstoffe)
CREATE TABLE IF NOT EXISTS Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (Wert, Beschreibung) VALUES ('O', 'oberer Abbrand');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (Wert, Beschreibung) VALUES ('T', 'unterer Abbrand');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (Wert, Beschreibung) VALUES ('X', 'Sturzbrand');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (Wert, Beschreibung) VALUES ('N', 'Unterschubfeuerung');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (Wert, Beschreibung) VALUES ('V', 'Vorofenfeuerung');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (Wert, Beschreibung) VALUES ('B', 'Einblasfeuerung');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorieFeststoffAbbrand (Wert, Beschreibung) VALUES ('Y', 'Feuerung anderer Art');

-- Kennzeichnung 2.2.1.7 Zusatzkennzeichung Art der Feuerungsanlage nach der 44. BImSchV
CREATE TABLE IF NOT EXISTS Enum_ZusatzkennzeichnungFeuerstaettenkategorie44BImschV (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorie44BImschV (Wert, Beschreibung) VALUES ('SU', 'Sonstige Feuerungsanlage');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorie44BImschV (Wert, Beschreibung) VALUES ('MD', 'Dieselmotoranlage');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorie44BImschV (Wert, Beschreibung) VALUES ('GT', 'Gasturbine');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorie44BImschV (Wert, Beschreibung) VALUES ('ZM', 'Zweistoffmotoranlage');
INSERT INTO Enum_ZusatzkennzeichnungFeuerstaettenkategorie44BImschV (Wert, Beschreibung) VALUES ('MO', 'Sonstige Motoranlage');

-- Kennzeichnung 2.2.1.8 Feuerstättenstatus
CREATE TABLE IF NOT EXISTS Enum_Feuerstaettenstatus (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FB', 'Bestehende Anlage');
INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FA', 'Altanlage/Austausch');
INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FS', 'stillgelegte Anlage');
INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FE', 'entfernte Anlage');
INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FN', 'Neuanlage ohne Ersatz für Altanlage');
INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FNE', 'Neuanlage als Ersatz für Altanlage');
INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FNB26', 'Neuanlage aufgrund von Austauschverpflichtung § 26 1. BImSchV');
INSERT INTO Enum_Feuerstaettenstatus (Wert, Beschreibung) VALUES ('FNGEG', 'Neuanlage aufgrund von Austauschverpflichtung GEG/EnEV');

-- Kennzeichnung 2.2.1.9 Bauart ERF
CREATE TABLE IF NOT EXISTS Enum_BauartERF (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BauartERF (Wert, Beschreibung) VALUES ('BA1', 'Bauart 1');
INSERT INTO Enum_BauartERF (Wert, Beschreibung) VALUES ('BA2', 'Bauart 2');

-- Kennzeichnung 2.2.2 Brennstoff
CREATE TABLE IF NOT EXISTS Enum_BrennstoffKombination (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('F', 'Feste Brennstoffe');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('O', 'Flüssige Brennstoffe');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('G', 'Gasförmige Brennstoffe');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('FO', 'Feste und flüssige Brennstoffe');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('FG', 'Feste und gasförmige Brennstoffe');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('OG', 'Flüssige und gasförmige Brennstoffe');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('FOG', 'Feste und flüssige und gasförmige Brennstoffe');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('S', 'Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('FS', 'Feste Brennstoffe + Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('OS', 'Flüssige Brennstoffe + Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('GS', 'Gasförmige Brennstoffe + Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('FOS', 'Feste und flüssige Brennstoffe + Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('FGS', 'Feste und gasförmige Brennstoffe + Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('OGS', 'Flüssige und gasförmige Brennstoffe + Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('FOGS', 'Feste und flüssige und gasförmige Brennstoffe + Strom');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('N', 'Nah-/Fernwärme');
INSERT INTO Enum_BrennstoffKombination (Wert, Beschreibung) VALUES ('T', 'Sonnenenergie (Thermisch solar)');

-- Kennzeichnung 2.2.2.1 Brennstoffe nach § 3 Abs. 1 1.BImSchV
CREATE TABLE IF NOT EXISTS Enum_BrennstoffBImSchV (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SK', '1 | Steinkohlen');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SKB', '1 | nicht pechgebundene Steinkohlenbriketts');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SKK', '1 | Steinkohlenkoks');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('BK', '2 | Braunkohlen');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('BKB', '2 | Braunkohlenbriketts');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('BKK', '2 | Braunkohlenkoks');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('BT', '3 | Brenntorf');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('BTP', '3 | Presslinge aus Brenntorf');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('GHK', '3a | Grill-Holzkohle, Grill-Holzkohlebriketts nach DIN EN 1860, Ausgabe September 2005');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SHZ', '4 | naturbelassenes stückiges Holz einschließlich anhaftender Rinde, insbesondere in Form von Scheitholz');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('HS', '4 | naturbelassenes stückiges Holz einschließlich anhaftender Rinde, insbesondere in Form von Hackschnitzel');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('RZ', '4 | naturbelassenes stückiges Holz einschließlich anhaftender Rinde, insbesondere in Form von Reisig und Zapfen');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SM', '5 | naturbelassenes nicht stückiges Holz, insbesondere in Form von Sägemehl');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SP', '5 | naturbelassenes nicht stückiges Holz, insbesondere in Form von Spänen');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SST', '5 | naturbelassenes nicht stückiges Holz, insbesondere in Form von Schleifstaub');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('RI', '5 | naturbelassenes nicht stückiges Holz, insbesondere in Form von Rinde');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('HB_DIN', '5a | Presslinge aus naturbelassenem Holz in Form von Holzbriketts nach DIN 51731, Ausgabe Oktober 1996');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('HP_DIN', '5a | Holzpellets nach den brennstofftechnischen Anforderungen des DINplus-Zertifizierungsprogramms „Holzpellets zur Verwendung in Kleinfeuerstätten nach DIN 51731-HP 5“, Ausgabe August 2007, sowie andere Holzbriketts oder Holzpellets aus naturbelassenem Holz mit gleichwertiger Qualität.');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('HB_EQ', '5a | andere Holzbriketts aus naturbelassenem Holz mit gleichwertiger Qualität');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('HP_EQ', '5a | andere Holzpellets aus naturbelassenem Holz mit gleichwertiger Qualität');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('HBL', '6 | gestrichenes, lackiertes oder beschichtetes Holz sowie daraus anfallende Reste, soweit keine Holzschutzmittel aufgetragen oder infolge einer Behandlung enthalten sind und Beschichtungen keine halogenorganischen Verbindungen oder Schwermetalle enthalten,');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('HLV', '7 | Sperrholz, Spanplatten, Faserplatten oder sonst verleimtes Holz sowie daraus anfallende Reste, soweit keine Holzschutzmittel aufgetragen oder infolge einer Behandlung enthalten sind und Beschichtungen keine halogenorganischen Verbindungen oder Schwermetalle enthalten');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('STR', '8 | Stroh und ähnliche pflanzliche Stoffe');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('GET', '8 | Getreide und Getreidepflanzen');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('GEP', '8 | Pellets aus Getreide und Getreidepflanzen');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('EL', '9 | Heizöl leicht (Heizöl EL) nach DIN 51603-1, Ausgabe August 2008');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('EL_EQ', '9 | andere leichte Heizöle mit gleichwertiger Qualität');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('PO', '9 | naturbelassene Pflanzenöle');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('PME', '9 | Pflanzenölmethylester');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('ME', '9 | Methanol');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('ET', '9 | Ethanol');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('GGV', '10 | Gase der öffentlichen Gasversorgung');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('NG', '10 | naturbelassenes Erdgas mit vergleichbaren Schwefelgehalten');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('OG', '10 | Erdölgas mit vergleichbaren Schwefelgehalten');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('LPG', '10 | Flüssiggas');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('H2B', '10 | Wasserstoff blau');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('KBG', '11 | Klärgas mit einem Volumengehalt an Schwefelverbindungen bis zu 1 Promille, angegeben als Schwefel, oder Biogas aus der Landwirtschaft');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('IG', '12 | Koksofengas, Grubengas, Stahlgas, Hochofengas, Raffineriegas und Synthesegas mit einem Volumengehalt an Schwefelverbindungen bis zu 1 Promille, angegeben als Schwefel');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('NWR', '13 | sonstige nachwachsende Rohstoffe, soweit diese die Anforderungen nach Absatz 5 einhalten');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('E', '- | elektrisch');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('KZ', '0 | Keine Zuordnung nach 1. BImSchV (z. B. bei Testanlagen)');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('NFW', '- | Nah-/Fernwärme');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('H2G', '10 | Wasserstoff grün');
INSERT INTO Enum_BrennstoffBImSchV (Wert, Beschreibung) VALUES ('SOL', '- | Sonnenenergie (Thermisch solar)');

-- Kennzeichnung 2.2.3 TRGI
CREATE TABLE IF NOT EXISTS Enum_TRGI (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('A1', 'Feuerstätten ohne Abgasanlage. Die Verbrennungsluft wird dem Aufstellraum entnommen. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('A2', 'Feuerstätten ohne Abgasanlage. Die Verbrennungsluft wird dem Aufstellraum entnommen. | mit Gebläse hinter dem Brenner/Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('A3', 'Feuerstätten ohne Abgasanlage. Die Verbrennungsluft wird dem Aufstellraum entnommen. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B11', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B12', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B13', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B14', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung | mit Gebläse hinter der Strömungssicherung');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B21', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B22', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B23', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B31', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung/Ausgleichsöffnung, bei der alle unter Überdruck stehenden Teile des Abgasweges verbrennungsluftumspült sind | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B32', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung/Ausgleichsöffnung, bei der alle unter Überdruck stehenden Teile des Abgasweges verbrennungsluftumspült sind | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B33', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung/Ausgleichsöffnung, bei der alle unter Überdruck stehenden Teile des Abgasweges verbrennungsluftumspült sind | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B41', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung und mit zugehöriger Abgasleitung und Windschutzeinrichtung | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B42', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung und mit zugehöriger Abgasleitung und Windschutzeinrichtung | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B43', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung und mit zugehöriger Abgasleitung und Windschutzeinrichtung | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B44', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte mit Strömungssicherung und mit zugehöriger Abgasleitung und Windschutzeinrichtung | mit Gebläse hinter der Strömungssicherung');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B51', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung und mit zugehöriger Abgasleitung und Windschutzeinrichtung | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B52', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung und mit zugehöriger Abgasleitung und Windschutzeinrichtung | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('B53', 'Feuerstätte mit Abgasabführung. Die Verbrennungsluft wird dem Aufstellraum entnommen. (raumluftabhängig) | Feuerstätte ohne Strömungssicherung und mit zugehöriger Abgasleitung und Windschutzeinrichtung | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C11', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger horizontaler Verbrennungsluftzu- und Abgasabführung durch die Außenwand oder über Dach. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C12', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger horizontaler Verbrennungsluftzu- und Abgasabführung durch die Außenwand oder über Dach. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C13', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger horizontaler Verbrennungsluftzu- und Abgasabführung durch die Außenwand oder über Dach. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C21', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit Verbrennungsluftzu- und Abgasabführung zum Anschluss an einen einfach oder mehrfach belegten Schacht für Verbrennungsluft und Abgas. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C22', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit Verbrennungsluftzu- und Abgasabführung zum Anschluss an einen einfach oder mehrfach belegten Schacht für Verbrennungsluft und Abgas. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C23', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit Verbrennungsluftzu- und Abgasabführung zum Anschluss an einen einfach oder mehrfach belegten Schacht für Verbrennungsluft und Abgas. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C31', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger Verbrennungsluftzu- und Abgasabführung senkrecht über Dach. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C32', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger Verbrennungsluftzu- und Abgasabführung senkrecht über Dach. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C33', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger Verbrennungsluftzu- und Abgasabführung senkrecht über Dach. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C41', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit Verbrennungsluftzu- und Abgasabführung zum Anschluss an ein bauseits vorhandenes einfach oder mehrfach belegtes Luft-Abgas-System (LAS). | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C42', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit Verbrennungsluftzu- und Abgasabführung zum Anschluss an ein bauseits vorhandenes einfach oder mehrfach belegtes Luft-Abgas-System (LAS). | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C43', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit Verbrennungsluftzu- und Abgasabführung zum Anschluss an ein bauseits vorhandenes einfach oder mehrfach belegtes Luft-Abgas-System (LAS). | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C51', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger getrennter Verbrennungsluftzuführung und Abgasabführung. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C52', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger getrennter Verbrennungsluftzuführung und Abgasabführung. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C53', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit zugehöriger getrennter Verbrennungsluftzuführung und Abgasabführung. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C61', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte, vorgesehen für den Anschluss an eine nicht mit der Feuerstätte geprüfte Verbrennungsluftzu und Abgasabführung. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C62', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte, vorgesehen für den Anschluss an eine nicht mit der Feuerstätte geprüfte Verbrennungsluftzu und Abgasabführung. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C63', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte, vorgesehen für den Anschluss an eine nicht mit der Feuerstätte geprüfte Verbrennungsluftzu und Abgasabführung. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C71', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit vertikaler Verbrennungsluftzu- und Abgasabführung. Die Verbrennungsluft wird dem Dachboden entnommen und die Abgase über Dach abgeführt. Eine Strömungssicherung/Ausgleichsöffnung ist im Dachboden angeordnet. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C72', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit vertikaler Verbrennungsluftzu- und Abgasabführung. Die Verbrennungsluft wird dem Dachboden entnommen und die Abgase über Dach abgeführt. Eine Strömungssicherung/Ausgleichsöffnung ist im Dachboden angeordnet. | mit Gebläse hinter dem Brenner/Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C73', 'Feuerstätte mit Abgasabführung; die Verbrennungsluft wird über ein geschlossenes System dem Freien entnommen (raumluftunabhängig) | Feuerstätte mit vertikaler Verbrennungsluftzu- und Abgasabführung. Die Verbrennungsluft wird dem Dachboden entnommen und die Abgase über Dach abgeführt. Eine Strömungssicherung/Ausgleichsöffnung ist im Dachboden angeordnet. | mit Gebläse vor dem Brenner/Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C81', 'Feuerstätte der Art C mit zugehöriger Verbrennungsluftzuführung aus dem Freien und zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte bauseits vorhandene Abgasanlage. Die Abgasabführung im Schacht erfolgt im Unterdruck. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C82', 'Feuerstätte der Art C mit zugehöriger Verbrennungsluftzuführung aus dem Freien und zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte bauseits vorhandene Abgasanlage. Die Abgasabführung im Schacht erfolgt im Unterdruck. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C83', 'Feuerstätte der Art C mit zugehöriger Verbrennungsluftzuführung aus dem Freien und zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte bauseits vorhandene Abgasanlage. Die Abgasabführung im Schacht erfolgt im Unterdruck. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C91', 'Feuerstätte der Art C mit zugehöriger Abgasabführung bis über Dach. Die Verbrennungsluftzuführung erfolgt über eine zugehörige Leitung im Aufstellraum und einen bestehenden Schacht als Gebäudebestandteil. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C92', 'Feuerstätte der Art C mit zugehöriger Abgasabführung bis über Dach. Die Verbrennungsluftzuführung erfolgt über eine zugehörige Leitung im Aufstellraum und einen bestehenden Schacht als Gebäudebestandteil. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C93', 'Feuerstätte der Art C mit zugehöriger Abgasabführung bis über Dach. Die Verbrennungsluftzuführung erfolgt über eine zugehörige Leitung im Aufstellraum und einen bestehenden Schacht als Gebäudebestandteil. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C101', 'Feuerstätte mit zugehöriger Verbrennungsluftzu- und Abgasabführung zum Anschluss an ein bauseits vorhandenes einfach oder mehrfach belegtes Luft-Abgas-System (LAS). Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C102', 'Feuerstätte mit zugehöriger Verbrennungsluftzu- und Abgasabführung zum Anschluss an ein bauseits vorhandenes einfach oder mehrfach belegtes Luft-Abgas-System (LAS). Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C103', 'Feuerstätte mit zugehöriger Verbrennungsluftzu- und Abgasabführung zum Anschluss an ein bauseits vorhandenes einfach oder mehrfach belegtes Luft-Abgas-System (LAS). Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C111', 'Feuerstätte der Art C mit zugehöriger Verbrennungsluftzu- und Abgasabführung sowie zugehöriger einfach oder mehrfach belegter senkrechter Luft-Abgas-Leitung. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C112', 'Feuerstätte der Art C mit zugehöriger Verbrennungsluftzu- und Abgasabführung sowie zugehöriger einfach oder mehrfach belegter senkrechter Luft-Abgas-Leitung. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C113', 'Feuerstätte der Art C mit zugehöriger Verbrennungsluftzu- und Abgasabführung sowie zugehöriger einfach oder mehrfach belegter senkrechter Luft-Abgas-Leitung. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C121', 'Feuerstätte der Art C mit zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte bauseits vorhandene Abgasanlage und zugehöriger Verbrennungsluftzuführung aus dem Freien. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C122', 'Feuerstätte der Art C mit zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte bauseits vorhandene Abgasanlage und zugehöriger Verbrennungsluftzuführung aus dem Freien. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C123', 'Feuerstätte der Art C mit zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte bauseits vorhandene Abgasanlage und zugehöriger Verbrennungsluftzuführung aus dem Freien. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C131', 'Feuersatätte der Art C mit zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte zugehörige Abgasleitung und zugehöriger Verbrennungsluftzuführung aus dem Freien. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C132', 'Feuersatätte der Art C mit zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte zugehörige Abgasleitung und zugehöriger Verbrennungsluftzuführung aus dem Freien. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C133', 'Feuersatätte der Art C mit zugehörigem Abgasanschluss an eine einfach oder mehrfach belegte zugehörige Abgasleitung und zugehöriger Verbrennungsluftzuführung aus dem Freien. Die Mündungen befinden sich in unterschiedlichen Druckbereichen. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C141', 'Feuerstätte der Art C mit zugehöriger Luft-Abgas-Leitung bis zur zugehörigen einfach oder mehrfach belegten senkrechten Abgasleitung und zum bauseits vorhandenen Schacht. Die Verbrennungsluftzuführung bis zur Luft-Abgas-Leitung erfolgt über den bauseits vorhandenen Schacht als Gebäudebestandteil. Die Mündungen der senkrechten Abgasleitung und des Schachtes befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C142', 'Feuerstätte der Art C mit zugehöriger Luft-Abgas-Leitung bis zur zugehörigen einfach oder mehrfach belegten senkrechten Abgasleitung und zum bauseits vorhandenen Schacht. Die Verbrennungsluftzuführung bis zur Luft-Abgas-Leitung erfolgt über den bauseits vorhandenen Schacht als Gebäudebestandteil. Die Mündungen der senkrechten Abgasleitung und des Schachtes befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C143', 'Feuerstätte der Art C mit zugehöriger Luft-Abgas-Leitung bis zur zugehörigen einfach oder mehrfach belegten senkrechten Abgasleitung und zum bauseits vorhandenen Schacht. Die Verbrennungsluftzuführung bis zur Luft-Abgas-Leitung erfolgt über den bauseits vorhandenen Schacht als Gebäudebestandteil. Die Mündungen der senkrechten Abgasleitung und des Schachtes befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse vor dem Brenner');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C151', 'Feuerstätte der Art C mit zugehöriger Luftleitung bis zum bauseits vorhandenen Schacht und zugehöriger einfach belegter Abgasleitung bis über Dach. Die Verbrennungsluftzuführung von der Mündung bis zur Luftleitung erfolgt für ein Gasgerät oder mehrere Gasgeräte über den gemeinsamen bestehenden Schacht als Gebäudebestandteil. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | ohne Gebläse');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C152', 'Feuerstätte der Art C mit zugehöriger Luftleitung bis zum bauseits vorhandenen Schacht und zugehöriger einfach belegter Abgasleitung bis über Dach. Die Verbrennungsluftzuführung von der Mündung bis zur Luftleitung erfolgt für ein Gasgerät oder mehrere Gasgeräte über den gemeinsamen bestehenden Schacht als Gebäudebestandteil. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse hinter dem Wärmetauscher');
INSERT INTO Enum_TRGI (Wert, Beschreibung) VALUES ('C153', 'Feuerstätte der Art C mit zugehöriger Luftleitung bis zum bauseits vorhandenen Schacht und zugehöriger einfach belegter Abgasleitung bis über Dach. Die Verbrennungsluftzuführung von der Mündung bis zur Luftleitung erfolgt für ein Gasgerät oder mehrere Gasgeräte über den gemeinsamen bestehenden Schacht als Gebäudebestandteil. Die Mündungen befinden sich nahe beieinander im gleichen Druckbereich. Die Abgasabführung ist bis ins Freie für Überdruck ausgelegt. | mit Gebläse vor dem Brenner');

-- Kennzeichnung 2.2.4 Zusätzliche Kennzeichnung zur TRGI
CREATE TABLE IF NOT EXISTS Enum_TRGIZusatz (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_TRGIZusatz (Wert, Beschreibung) VALUES ('AS', 'Raumluftüberwachungseinrichtung | Sonstiges: Nur möglich bei Feuerstätten der Art A');
INSERT INTO Enum_TRGIZusatz (Wert, Beschreibung) VALUES ('BS', 'Abgasüberwachungseinrichtung | Sonstiges: Nur möglich bei Feuerstätten der Art B');
INSERT INTO Enum_TRGIZusatz (Wert, Beschreibung) VALUES ('X', 'zusätzliche Dichtheitsanforderungen | Sonstiges: Nur möglich bei Feuerstätten der Art C (Ausnahme Feuerstätten für flüssige und feste Brennstoffe)');
INSERT INTO Enum_TRGIZusatz (Wert, Beschreibung) VALUES ('P', 'bestimmungsgemäßer Abgasabführung unter Überdruck. | Sonstiges: Nur möglich bei Feuerstätten der Art B2, B4 und B5');
INSERT INTO Enum_TRGIZusatz (Wert, Beschreibung) VALUES ('DT', 'Abführung von feuchter Trocknungsluft gemeinsam mit Abgasanteilen über eine Leitung direkt ins Freie | Sonstiges: Nur möglich bei Feuerstätten der Art B2');
INSERT INTO Enum_TRGIZusatz (Wert, Beschreibung) VALUES ('S', 'Abgasleitung im bauseits vorhandenen hinterlüfteten Schacht | Sonstiges: Nur möglich bei Feuerstätten der Art B5');

-- Kennzeichnung 2.2.5 Art der Anlage nach 1. BImSchV
CREATE TABLE IF NOT EXISTS Enum_ArtDerAnlageBImschV (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('HZ', 'Heizung / Zentralheizung');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('HZB', 'Heizung / Zentralheizung mit Brauchwasser');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('BD', 'Brauchwasseranlage dezentral');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('BZ', 'Brauchwasseranlage zentral');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('LU', 'Luftheizung / Lufterhitzer');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('ERF', 'Einzelraumfeuerungsanlage');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('SO', 'Feuerstätte anderer Art');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('HE', 'Heizung / Etagenheizung');
INSERT INTO Enum_ArtDerAnlageBImschV (Wert, Beschreibung) VALUES ('HEB', 'Heizung / Etagenheizung mit Brauchwasser');

-- Kennzeichnung 2.2.5.1 Rechtsgrundlage Messung
CREATE TABLE IF NOT EXISTS Enum_RechtsgrundlageMessung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_RechtsgrundlageMessung (Wert, Beschreibung) VALUES ('K', 'unterliegt nur der KÜO');
INSERT INTO Enum_RechtsgrundlageMessung (Wert, Beschreibung) VALUES ('B1', 'unterliegt nur der 1. BImSchV');
INSERT INTO Enum_RechtsgrundlageMessung (Wert, Beschreibung) VALUES ('B4', 'unterliegt nur der 4. BImSchV');
INSERT INTO Enum_RechtsgrundlageMessung (Wert, Beschreibung) VALUES ('B44', 'unterliegt nur der 44. BImSchV');
INSERT INTO Enum_RechtsgrundlageMessung (Wert, Beschreibung) VALUES ('B1K', 'unterliegt der 1. BImSchV und KÜO');
INSERT INTO Enum_RechtsgrundlageMessung (Wert, Beschreibung) VALUES ('B4K', 'unterliegt der 4. BImSchV und KÜO');
INSERT INTO Enum_RechtsgrundlageMessung (Wert, Beschreibung) VALUES ('B44K', 'unterliegt der 44. BImSchV und KÜO');

-- Kennzeichnung 2.2.5.2 Rechtsgrundlage für die Zulässigkeit des Weiterbetriebs nach § 26 der 1. BImSchV
CREATE TABLE IF NOT EXISTS Enum_RechtsgrundlageERFWeiterbetrieb (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('N0', 'Rechtsbezug: - | Erläuterung zu Rechtsbezug: noch kein Eintrag aufgrund laufender Übergangsfrist (nicht erfolgte FSS nach 01.01.2025) oder außer Betrieb genommene Feuerstätte nach 1. BImSchV');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A1S2P', 'Rechtsbezug: § 26 Abs. 1 Satz 2 | Erläuterung zu Rechtsbezug: Positive Prüfstandsmessbescheinigung des Herstellers liegt vor');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A1S2M', 'Rechtsbezug: § 26 Abs. 1 Satz 2 | Erläuterung zu Rechtsbezug: Positive Messung unter entsprechender Anwendung der Bestimmungen der Anlage 4 Nummer 3 durch eine Schornsteinfegerin oder einen Schornsteinfeger liegt vor');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A2', 'Rechtsbezug: § 26 Abs. 2 | Erläuterung zu Rechtsbezug: Einrichtung zur Reduzierung der Staubemissionen nach dem Stand der Technik eingebaut');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A3N1', 'Rechtsbezug: § 26 Abs. 3 Nr. 1 | Erläuterung zu Rechtsbezug: nichtgewerblich genutzte Herde und Backöfen mit einer Nennwärmeleistung unter 15 Kilowatt');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A3N2', 'Rechtsbezug: § 26 Abs. 3 Nr. 2 | Erläuterung zu Rechtsbezug: offener Kamine nach § 2 Nummer 12');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A3N3', 'Rechtsbezug: § 26 Abs. 3 Nr. 3 | Erläuterung zu Rechtsbezug: Grundofen nach § 2 Nummer 13');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A3N4', 'Rechtsbezug: § 26 Abs. 3 Nr. 4 | Erläuterung zu Rechtsbezug: Einzelraumfeuerungsanlage in einer Wohneinheit, deren Wärmeversorgung ausschließlich über diese Anlagen erfolgt');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A3N5', 'Rechtsbezug: § 26 Abs. 3 Nr. 5 | Erläuterung zu Rechtsbezug: Einzelraumfeuerungsanlagen, bei denen der Betreiber gegenüber dem Bezirksschornsteinfegermeister/bBSF glaubhaft machen konnte, dass sie vor dem 1. Januar 1950 hergestellt oder errichtet wurden.');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P22', 'Rechtsbezug: § 22 | Erläuterung zu Rechtsbezug: Ausnahme nach § 22 1. BImSchV');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('LR', 'Rechtsbezug: Landesrecht | Erläuterung zu Rechtsbezug: Ausnahme nach Landesrecht (z. B. Notfeuerstätte)');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('OVB', 'Rechtsbezug: offener Vollzug Behörde | Erläuterung zu Rechtsbezug: Die außer Betrieb zu nehmende ERF wurde der Behörde gemeldet, die Behörde hat den Vollzug noch nicht abgeschlossen.');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P1A2', 'Rechtsbezug: § 1 Abs. 2 | Erläuterung zu Rechtsbezug: Feuerstätten nach § 1 Abs. 2 (z.B. Badeöfen, Kleinbrennereien)');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('P26A4', 'Rechtsbezug: § 26 Abs. 4 | Erläuterung zu Rechtsbezug: Einrichtung zur Reduzierung der Staubemissionen nach dem Stand der Technik eingebaut --> fest eingemauerte Kamineinsätze, Kachelofeneinsätze oder vergleichbare Ofeneinsätze');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('AB', 'Rechtsbezug: - | Erläuterung zu Rechtsbezug: Außer Betrieb genommene Feuerstätte nach 1. BImSchV (SUFj)');
INSERT INTO Enum_RechtsgrundlageERFWeiterbetrieb (Wert, Beschreibung) VALUES ('ST12B', 'Rechtsbezug: - | Erläuterung zu Rechtsbezug: Feuerstätten mit Stufe 1 und Stufe 2 der 1. BImSchV (Feuerstätte mit einem Errichtungsdatum nach 21.03.2010)');

-- Kennzeichnung 2.2.6 Art der energetischen Nutzung
CREATE TABLE IF NOT EXISTS Enum_EnergetischeNutzung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_EnergetischeNutzung (Wert, Beschreibung) VALUES ('B', 'Brennwertfeuerstätte | Erläuterung: Wärmeerzeuger (Feuerstätte), bei dem die Verdampfungswärme des im Abgas enthaltenen Wasserdampfes konstruktionsbedingt durch Kondensation nutzbar gemacht wird; (Definition: 1. BImSchV/KÜO) | Sonstiges: "Brennwertkessel“ ein Heizkessel, der die energetische Nutzung des in den Abgasen enthaltenen Wasserdampfes durch Kondensation des Wasserdampfes im Betrieb vorsieht (GEG § 3 Abs. 1 Nr. 5)');
INSERT INTO Enum_EnergetischeNutzung (Wert, Beschreibung) VALUES ('H', 'Heizwertfeuerstätte, außer N und S | Erläuterung: Wärmeerzeuger (Feuerstätte) ohne bestimmungsgemäße Kondensation.');
INSERT INTO Enum_EnergetischeNutzung (Wert, Beschreibung) VALUES ('N', 'Heizwertfeuerstätte, Niedertemperatur | Erläuterung: Ist ein Niedertemperatur-Heizkessel ein Heizkessel, der kontinuierlich mit einer Eintrittstemperatur von 35 bis 40 Grad Celsius betrieben werden kann und in dem es unter bestimmten Umständen zur Kondensation des in den Abgasen enthaltenen Wasserdampfes kommen kann (Definition: EnEV) | Sonstiges: siehe auch neü Definition GEG');
INSERT INTO Enum_EnergetischeNutzung (Wert, Beschreibung) VALUES ('S', 'Heizwertfeuerstätte, nach EWG-Richtlinie | Erläuterung: Standardheizkessel, die einen 1 % höheren Abgasverlust als nach § 10 Abs. 1 1. BImSchV haben dürfen (Ausnahmefälle) | Sonstiges: Das Tragen einer CE-Kennzeichnung reicht als alleiniges Kriterium zur Einstufung in dieser Kategorie nicht aus. Bis heute sind keine Heizkessel bekannt, die konstruktionsbedingt die die Anforderungen der 1. BImSchV nicht erfüllen.');

-- Kennzeichnung 2.2.8 Ergänzende Kennzeichnung GEG
CREATE TABLE IF NOT EXISTS Enum_GEGErgaenzendeKennzeichnung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_GEGErgaenzendeKennzeichnung (Wert, Beschreibung) VALUES ('W', 'Feuerstätte, die neben weiteren Feuerstätten zu einem Heizungssystem gehören');
INSERT INTO Enum_GEGErgaenzendeKennzeichnung (Wert, Beschreibung) VALUES ('O', 'keine ergänzende Kennzeichnung');

-- Kennzeichnung 2.2.9 Nationales Effizienzlabel für Heizungsaltanlagen
CREATE TABLE IF NOT EXISTS Enum_EffizienzlabelEffizienzklasse (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('A3P', 'Effizienzklasse - A_PLUS_PLUS_PLUS | Erläuterung: aktuell noch keine Anwendung');
INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('A2P', 'Effizienzklasse - A_PLUS_PLUS | Erläuterung: aktuell noch keine Anwendung');
INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('AP', 'Effizienzklasse - A_PLUS | Erläuterung: aktuell noch keine Anwendung');
INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('A', 'Effizienzklasse - A');
INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('B', 'Effizienzklasse - B');
INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('C', 'Effizienzklasse - C');
INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('D', 'Effizienzklasse - D');
INSERT INTO Enum_EffizienzlabelEffizienzklasse (Wert, Beschreibung) VALUES ('E', 'Effizienzklasse - E');

-- Kennzeichnung 2.3.1 Art der baulichen Anlage (BA)
CREATE TABLE IF NOT EXISTS Enum_LueftungBaulicheAnlage (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('E1', 'freie Lüftung, Einzelschachtanlage (3)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('E2', 'freie Lüftung, Einzelschachtanlage (1)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('V1', 'freie Lüftung, Einzelverbundschachtanlage (3)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('V2', 'freie Lüftung, Doppelverbundschachtanlage (3)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('V3', 'mechanische Lüftung, Einzelverbundschachtanlage (4)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('V4', 'mechanische Lüftung, Doppelverbundschachtanlage (4)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('S1', 'mechanische Lüftung, Sammelschachtanlage mit wohnungsweise veränderlichen Volumenströmen (4)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('S2', 'mechanische Lüftung, Sammelschachtanlage mit unveränderlichen Volumenströmen (4)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('E3', 'mechanische Lüftung, Einzellüftungsanlage mit eigener Abluftleitung (2)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('E4', 'mechanische Lüftung, Einzellüftungsanlage mit gemeinsamer Abluftleitung (2)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('Z1', 'mechanische Lüftung, Zentrallüftungsanlage mit nur gemeinsam veränderlichem Gesamtvolumenstrom (2)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('Z2', 'mechanische Lüftung, Zentrallüftungsanlage mit wohnungsweise veränderlichen Volumenströmen (2)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('Z3', 'mechanische Lüftung, Zentrallüftungsanlage mit unveränderlichen Volumenströmen (2)');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('AE', 'Abluftleitung');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('AG', 'Abluftkanal');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('AO', 'Abluftschacht');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('AP', 'Ausblasleitung');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('AW', 'Anschlussleitung');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('FK', 'Kanal für Lüftungsleitung');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('HL', 'Hauptleitung');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('HS', 'Hauptschacht');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('NS', 'Nebenschacht');
INSERT INTO Enum_LueftungBaulicheAnlage (Wert, Beschreibung) VALUES ('SC', 'Schacht für Abgasleitung/ Lüftungsleitung');

-- Kennzeichnung 2.4.1 Dunstabzugsanlagen - Art der baulichen Anlagen
CREATE TABLE IF NOT EXISTS Enum_DunstBaulicheAnlage (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('DA', 'Dunstabzugsanlage als Haubenanlage');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('DD', 'Dunstabzugsanlage als Lüftungsdecke');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('DU', 'Dunstabzugsanlage als Kombination von Haubenanlage und Lüftungsdecke');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('DL', 'Dunstabluftleitung');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('FK', 'Kanal für die Lüftungsleitung');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('SC', 'Schacht für Abgasleitung/Lüftungsleitung');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('AO', 'Abluftschacht');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('LG', 'Lüftungsanlage, rußbrandbeständig | Erläuterung: Lüftunganlage, an die Feuerstätten für feste Brennstoffe angeschlossen sind.');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('DC', 'Dunstabzugsanlage als Deckenhaube');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('MB', 'Dunstabzugsanlage als Mittelhaube');
INSERT INTO Enum_DunstBaulicheAnlage (Wert, Beschreibung) VALUES ('WN', 'Dunstabzugsanlage als Wandhaube');

-- Kennzeichnung 3.1 Zusatzkennzeichnung Verbrauchssektor Energie (früher Gebaeudenutzung)
CREATE TABLE IF NOT EXISTS Enum_VerbrauchssektorEnergie (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_VerbrauchssektorEnergie (Wert, Beschreibung) VALUES ('WG', 'Wohngebäude');
INSERT INTO Enum_VerbrauchssektorEnergie (Wert, Beschreibung) VALUES ('GH', 'Gewerbe, Handel, Dienstleistung (GHD)');
INSERT INTO Enum_VerbrauchssektorEnergie (Wert, Beschreibung) VALUES ('IN', 'Industrie');
INSERT INTO Enum_VerbrauchssektorEnergie (Wert, Beschreibung) VALUES ('GOE', 'Öffentliche Gebäude (Schulen, Rathäuser, Strafanstalten etc.)');
INSERT INTO Enum_VerbrauchssektorEnergie (Wert, Beschreibung) VALUES ('GT', 'Garten-, Ferien-, Sommer- und Wochenendhäuser | Erläuterung: < 50 m2 Wohnfläche');
INSERT INTO Enum_VerbrauchssektorEnergie (Wert, Beschreibung) VALUES ('BW', 'Bundeswehr');

-- Kennzeichnung 3.1.1 Art des Gebäudes
CREATE TABLE IF NOT EXISTS Enum_ArtGebaeude (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('AN', 'Anbau | Zuordnung zu 3.1: -');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('EH', 'Einfamilienhaus- oder Zweifamilienhaus | Zuordnung zu 3.1: WG');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('GA', 'Garage | Zuordnung zu 3.1: -');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('HA', 'Halle (Werk-, Industrie-, Logistik- oder Verkaufshalle) | Zuordnung zu 3.1: GH');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('LR', 'Lager- und Abstellhalle | Zuordnung zu 3.1: GH');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('MH', 'Mehrfamilienhaus | Zuordnung zu 3.1: WG');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('WI', 'Wirtschaftsgebäude | Zuordnung zu 3.1: GH');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('OG', 'Öffentliches Gebäude (Schule, Kita, Verwaltung usw.) | Zuordnung zu 3.1: GÖ');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('GR', 'Gartenlaube | Zuordnung zu 3.1: GT');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('UB', 'U-Bahnhof | Zuordnung zu 3.1: ÖG');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('SB', 'S-Bahnhof | Zuordnung zu 3.1: ÖG');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('GW', 'Gewächshaus | Zuordnung zu 3.1: GH');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('MZ', 'Mehrzweckgebäude | Zuordnung zu 3.1: -');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('KI', 'Kirche | Erläuterung: Gebäude, die dem Gottesdienst oder anderen religösen Zwecken gewidemet sind. | Zuordnung zu 3.1: ÖG');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('BN', 'Bahnhof | Zuordnung zu 3.1: ÖG');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('BG', 'Bürogebäude | Zuordnung zu 3.1: GH');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('BT', 'Beherbungsstätte/Hotel/Hostel | Zuordnung zu 3.1: GH');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('VU', 'Veranstaltungsgebäude (z. B. Sporthalle, Messehalle) | Zuordnung zu 3.1: ÖG');
INSERT INTO Enum_ArtGebaeude (Wert, Beschreibung) VALUES ('ZH', 'Zweifamilienhaus | Zuordnung zu 3.1: WG');

-- Kennzeichnung 3.1.1.1 Zusatzkennzeichnung zu Art des Gebäudes (GEG)
CREATE TABLE IF NOT EXISTS Enum_ArtGebaeudeErgaenzung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ArtGebaeudeErgaenzung (Wert, Beschreibung) VALUES ('EB', 'Eigentümer bewohnt');
INSERT INTO Enum_ArtGebaeudeErgaenzung (Wert, Beschreibung) VALUES ('VV', 'Vollständig vermietet');
INSERT INTO Enum_ArtGebaeudeErgaenzung (Wert, Beschreibung) VALUES ('GE', 'Gemeinschaft der Wohnungseigentümer (GdWE) | Erläuterung: früher WEG');

-- Kennzeichnung 3.1.1.2 Ausnahmeregelung erneuerbarer Energien (EE)
CREATE TABLE IF NOT EXISTS Enum_ErneuerbarereEnergienAusnahme (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ErneuerbarereEnergienAusnahme (Wert, Beschreibung) VALUES ('EE0', 'zurzeit keine Anforderung');
INSERT INTO Enum_ErneuerbarereEnergienAusnahme (Wert, Beschreibung) VALUES ('EE15', '15 % EE ab 01.01.2029');
INSERT INTO Enum_ErneuerbarereEnergienAusnahme (Wert, Beschreibung) VALUES ('EE30', '30 % EE ab 01.01.2035');
INSERT INTO Enum_ErneuerbarereEnergienAusnahme (Wert, Beschreibung) VALUES ('EE60', '60 % EE ab 01.01.2040');

-- Kennzeichnung 3.1.1.3 Erfüllungsoptionen /-voraussetzungen (GEG)
CREATE TABLE IF NOT EXISTS Enum_GEGErfuellungsoptionenVoraussetzungen (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('HYB', 'Hybrid-Lösung | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('DIN', 'DIN V 18599 | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('EE65', '65% EE Brennstoff | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('H2R', 'Heizung 100 % H2 Ready | Neuanlage: X | Bestandsanlage: -');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('H2A', 'H2 Ausbaugebiet | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('WPV', 'Wärmepumpen Vorrang | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('SMR', 'Smart-Regelung | Neuanlage: X | Bestandsanlage: -');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('SPK', 'Brennwertkessel - Spitzenlast | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('HL30', 'Heizlastabdeckung mindestens 30 % | Erläuterung: Heizlastabdeckung mindestens 30 % der Leistung des Spitzenkessels | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('HL40B', 'Heizlastabdeckung mindestens 40 % - bivalent | Erläuterung: Heizlastabdeckung mindestens 40 %- bivalent der Leistung des Spitzenkessels | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('AF07', 'Apperaturfläche 0,07 m2/ m2 Nutzfläche | Erläuterung: WG max. 2 Wohneinheiten | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('AF06', 'Apperaturfläche NGW 0,06 m2/ m2 Nutzfläche und NT-Heikessel/Brennwert | Erläuterung: WG < 2 WE | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('EE60', 'Brennstoffanforderung 60 % EE und NT-Heizessel/Brennwert | Erläuterung: kleinere Flächen als nach Nr. 11 oder Nr. 12 höherer Anteil an EE (60-65 % EE) | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('J2EE65', '2 Jahresfrist - 65 % EE Brennstoff | Erläuterung: bei Hallenheizungen | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('J10', '10 Jahresfrist | Erläuterung: bei Hallenheizungen | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('BVT', 'Bestverfügbare Technik | Erläuterung: bei Hallenheizungen | Neuanlage: X | Bestandsanlage: -');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('BIOK', 'Heizkessel für feste Biomasse | Erläuterung: Brennstoffe nach 1. BImSchV § 3 Nr. 4, 5, 5a ,8 und 13 | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('POWT', 'Pelletofen mit Wassertasche | Erläuterung: Brennstoffe nach 1. BImSchV § 3 Nr. 4, 5, 5a, 8 und 13 | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('NZ', 'Nachhaltigkeitszertifikat | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('HUE', 'Hausübergabestation | Erläuterung: § 71b GEG | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('SDH', 'Stromdirektheizung | Erläuterung: § 71d GEG | Neuanlage: X | Bestandsanlage: -');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('STA', 'Solarthermische Anlage | Erläuterung: § 71e GEG | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('WNETZ', 'Wärmenetz | Erläuterung: § 71b GEG | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('J11H', '11 Jahresfrist (Hallenheizung) | Erläuterung: bei Hallenheizungen (§ 71 m Abs. 1 GEG) | Neuanlage: X | Bestandsanlage: X');
INSERT INTO Enum_GEGErfuellungsoptionenVoraussetzungen (Wert, Beschreibung) VALUES ('J1EE65', '1 Jahresfrist - Nachweis anteilig 65 % EE | Erläuterung: bei Hallenheizungen (§ 71 m Abs. 2 Satz 3 GEG) | Neuanlage: X | Bestandsanlage: X');

-- Kennzeichnung 3.1.1.4 Hybrid-Art
CREATE TABLE IF NOT EXISTS Enum_HybridArt (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_HybridArt (Wert, Beschreibung) VALUES ('YW', 'Wärmepumpe mit Spitzenlastkessel');
INSERT INTO Enum_HybridArt (Wert, Beschreibung) VALUES ('YS', 'Thermisch Solar mit Spitzenlastkessel');
INSERT INTO Enum_HybridArt (Wert, Beschreibung) VALUES ('YF', 'Feuerstätte mit fossilem Brennstoff mit zusätzlicher Feuerstätte mit Biomasse-Feuerstätte');

-- Kennzeichnung 3.1.1.5 Zusatzkennzeichnung Gebäudeart GEG24
CREATE TABLE IF NOT EXISTS Enum_ArtGebaeudeErgaenzungGEG24 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ArtGebaeudeErgaenzungGEG24 (Wert, Beschreibung) VALUES ('WGB2', 'Wohngebäude bis 2 WE');
INSERT INTO Enum_ArtGebaeudeErgaenzungGEG24 (Wert, Beschreibung) VALUES ('WGG2', 'Wohngebäude mit mehr als 2 WE');
INSERT INTO Enum_ArtGebaeudeErgaenzungGEG24 (Wert, Beschreibung) VALUES ('NWG', 'Nichtwohngebäude');
INSERT INTO Enum_ArtGebaeudeErgaenzungGEG24 (Wert, Beschreibung) VALUES ('HALG4', 'Halle > 4 m | Erläuterung: Mehr als 4 m lichte Höhe');
INSERT INTO Enum_ArtGebaeudeErgaenzungGEG24 (Wert, Beschreibung) VALUES ('HALB4', 'Halle ≤ 4 m | Erläuterung: weniger als 4 m lichte Höhe');

-- Kennzeichnung 3.1.1.6 Gebäudestatus GEG
CREATE TABLE IF NOT EXISTS Enum_GebaeudestatusGEG (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_GebaeudestatusGEG (Wert, Beschreibung) VALUES ('B', 'Bestandsgebäude');
INSERT INTO Enum_GebaeudestatusGEG (Wert, Beschreibung) VALUES ('N', 'Neubau');
INSERT INTO Enum_GebaeudestatusGEG (Wert, Beschreibung) VALUES ('NN', 'Neubau im Neubaugebiet');

-- Kennzeichnung 3.1.1.8 Rechtsbezug für Kehrbuch / GEG
CREATE TABLE IF NOT EXISTS Enum_RechtsbezugGEG (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P72A4', '§72 (4) Ablauf fossilie Energietäger | | 01.01.2045');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71I', '§ 71i Heizung EE-65 Allgemein | | Baubeginn + 5 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71A9', '§ 71 (9) Heizung EE-65 vor WP 15/30/60 | | 01.01.2029');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71M10', '§ 71m (1) Hallenheizung dezentral 10 Jahre | | Baubeginn + 10 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71M1F', '§ 71m (1) Hallenheizung 1 Jahr (n. Frist) | | Frist + 1 Jahr');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71M2', '§ 71m (1) Hallenheizung 2 Jahre | | Baugebinn + 2 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71L1', '§ 71 l (1) Etagenheizung Austausch nach WP | | Baubeginn + 5 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71L2E', '§ 71 l (2) Etagenheizung ZH-Beschluss bei Erstaustausch | | Baubeginn + 13 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71L2F8', '§ 71 l (2) Etagenheizung ZH-Beschluss innerhalb Frist | | Frist + 8 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71L2F1', '§ 71 l (2) Etagenheizung ZH-Austausch innerhalb Frist | | Frist + 1 Jahr');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71K1', '§71 k (1) H2-Ausbaugebiet EE-65 und H2-ready | | 01.01.2045');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71J1', '§ 71 j (1) Wärmenetz EE65 Anschluss < 10 Jahre | | Baubeginn + 10 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71J2', '§ 71 j (2) Wärmenetz EE65 Einstellungs-Bescheid | z. B. Aufhebungsbescheid Netzausbau | Bescheid + 3 Jahre');
INSERT INTO Enum_RechtsbezugGEG (Wert, Beschreibung) VALUES ('P71J3', '§ 71 j (3) Wärmenetz EE65 Fristverzug | | Frist + 3 Jahre');

-- Kennzeichnung 3.1.2 Geschosse im Gebäude
CREATE TABLE IF NOT EXISTS Enum_Etage (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K9', '9. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K8', '8. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K7', '7. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K6', '6. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K5', '5. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K4', '4. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K3', '3. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K2', '2. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('K1', '1. Kellergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('EG', 'Erdgeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG1', '1. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG2', '2. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG3', '3. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG4', '4. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG5', '5. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG6', '6. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG7', '7. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG8', '8. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG9', '9. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG10', '10. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG11', '11. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG12', '12. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG13', '13. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG14', '14. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG15', '15. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG16', '16. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG17', '17. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG18', '18. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG19', '19. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG20', '20. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG21', '21. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG22', '22. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG23', '23. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG24', '24. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG25', '25. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG26', '26. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG27', '27. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG28', '28. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG29', '29. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG30', '30. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG31', '31. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG32', '32. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG33', '33. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG34', '34. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG35', '35. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG36', '36. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG37', '37. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG38', '38. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG39', '39. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG40', '40. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG41', '41. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG42', '42. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG43', '43. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG44', '44. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG45', '45. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG46', '46. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG47', '47. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG48', '48. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG49', '49. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG50', '50. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG51', '51. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG52', '52. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG53', '53. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG54', '54. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG55', '55. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG56', '56. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG57', '57. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG58', '58. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG59', '59. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG60', '60. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG61', '61. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG62', '62. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG63', '63. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG64', '64. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG65', '65. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG66', '66. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG67', '67. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG68', '68. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG69', '69. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG70', '70. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG71', '71. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG72', '72. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG73', '73. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG74', '74. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG75', '75. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG76', '76. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG77', '77. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG78', '78. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG79', '79. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG80', '80. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG81', '81. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG82', '82. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG83', '83. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG84', '84. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG85', '85. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG86', '86. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG87', '87. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG88', '88. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG89', '89. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('OG90', '90. Obergeschoss');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D1', '1. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D2', '2. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D3', '3. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D4', '4. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D5', '5. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D6', '6. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D7', '7. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D8', '8. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('D9', '9. Dachgeschoss ab Traufkante usw.');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE1', '1. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE2', '2. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE3', '3. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE4', '4. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE5', '5. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE6', '6. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE7', '7. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE8', '8. Geschoss über Dach');
INSERT INTO Enum_Etage (Wert, Beschreibung) VALUES ('UE9', '9. Geschoss über Dach');

-- Kennzeichnung 3.1.2.1 Lagebeschreibung eines Objektes
CREATE TABLE IF NOT EXISTS Enum_Lage1 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Lage1 (Wert, Beschreibung) VALUES ('R', 'rechts');
INSERT INTO Enum_Lage1 (Wert, Beschreibung) VALUES ('L', 'links');
INSERT INTO Enum_Lage1 (Wert, Beschreibung) VALUES ('M', 'mitte');
INSERT INTO Enum_Lage1 (Wert, Beschreibung) VALUES ('WR', 'weit rechts');
INSERT INTO Enum_Lage1 (Wert, Beschreibung) VALUES ('WL', 'weit links');
INSERT INTO Enum_Lage1 (Wert, Beschreibung) VALUES ('HBR', 'halb rechts');
INSERT INTO Enum_Lage1 (Wert, Beschreibung) VALUES ('HBL', 'halb links');

CREATE TABLE IF NOT EXISTS Enum_Lage2 (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Lage2 (Wert, Beschreibung) VALUES ('V', 'vorne');
INSERT INTO Enum_Lage2 (Wert, Beschreibung) VALUES ('H', 'hinten');
INSERT INTO Enum_Lage2 (Wert, Beschreibung) VALUES ('WV', 'weit vorne');
INSERT INTO Enum_Lage2 (Wert, Beschreibung) VALUES ('WH', 'weit hinten');

-- Kennzeichnung 3.1.4 Raum in der Nutzungseinheit
CREATE TABLE IF NOT EXISTS Enum_Raum (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('AR', 'Aufstellraum | Erläuterung: Aufstellraum mit Lüftungsöffnungen ins Freie (35 - 50 kW)');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('BL', 'Brennstofflagerraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('BR', 'Betriebsraum/Werkstatt');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('BUE', 'Arbeitszimmer (Büro)');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('BZ', 'Badezimmer/Dusche');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('DB', 'Dachboden/Speicherraum/Bodenraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('EZ', 'Esszimmer');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('FL', 'Flur/Diele');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('GA', 'Garage');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('GZ', 'Gästezimmer');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('HA', 'Halle (Werk-, Industrie-, Logistik- oder Verkaufshalle)');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('HP', 'Hobby-, Bastel- oder Partyraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('HR', 'Heizraum | Erläuterung: Hinweis: Heizraum nach FeuV');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('HW', 'Hauswirtschaftsraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('JZ', 'Jugend-/ Kinderzimmer');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('KR', 'Kellerraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('KUE', 'Küche');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('LR', 'Lager- und Abstellraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('SZ', 'Schlafzimmer');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('TR', 'Technikraum/Hausanschlussraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('VR', 'Verkaufsraum/Laden/Geschäft/Gastraum');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('WC', 'Toilette');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('WG', 'Wintergarten');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('WUE', 'Waschküche');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('WZ', 'Wohnzimmer');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('VO', 'Speisekammer/Vorratsraum | Sonstiges: (Hinweis: versehentlich vorher 25)');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('SU', 'Sonstiger Raum | Sonstiges: (Hinweis: versehentlich vorher 26)');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('ER', 'Eigener Aufstellraum | Erläuterung: Eigener Aufstellraum nach FeuV (ab 100 kW)');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('IF', 'im Freien');
INSERT INTO Enum_Raum (Wert, Beschreibung) VALUES ('TH', 'Treppenhaus');

-- Kennzeichnung 3.1.4.1 Zusatzkennzeichnung - Raum in der Nutzungseinheit
CREATE TABLE IF NOT EXISTS Enum_RaumZusatz (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_RaumZusatz (Wert, Beschreibung) VALUES ('MF', 'Raum mit Fenster oder Tür ins Freie das geöffnet werden kann');
INSERT INTO Enum_RaumZusatz (Wert, Beschreibung) VALUES ('OF', 'Raum ohne Fenster oder Tür ins Freie das geöffnet werden kann');

-- Kennzeichnung 3.2 Haustypen nach TRGI
CREATE TABLE IF NOT EXISTS Enum_HaustypTRGI (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('HT1', '1 | Erläuterung: Haustyp 1');
INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('HT2', '1 | Erläuterung: Haustyp 2');
INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('HT3', '1.5 | Erläuterung: Haustyp 3');
INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('HT4', '1.5 | Erläuterung: Haustyp 4');
INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('HT5', '2 | Erläuterung: Haustyp 5');
INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('HT6', '2 | Erläuterung: Haustyp 6');
INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('HT7', '3 | Erläuterung: Haustyp 7');
INSERT INTO Enum_HaustypTRGI (Wert, Beschreibung) VALUES ('N50', 'Gemessener N50 Wert');

-- Kennzeichnung 3.2.1 Verbrennungsluftversorgung von Feuerstätten
CREATE TABLE IF NOT EXISTS Enum_Verbrennungsluftversorgung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('AD', 'Außenluftdurchlasselement einschließlich Fensterfalzlüfter');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('T0', 'Tür ohne Luftdurchlässigkeit');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('T1', 'Innentür mit 3seitig umlaufender Dichtung und ungekürztem Türblatt');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('T2', 'Innentür mit 3seitig umlaufender Dichtung und 1,0 cm gekürztem Türblatt sowie Innentür ohne umlaufender Dichtung und mit ungekürztem Türblatt oder mit Überstromdichtung und ungekürztem Türblatt / auch Überströmdichtungen');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('T3', 'Innentür mit 3seitig umlaufender Dichtung und 1,5 cm gekürztem Türblatt sowie Innentür ohne umlaufender Dichtung und mit 1,0 cm gekürztem Türblatt oder Innentür mit Überstromdichtung und 1 cm gekürztem Türblatt / auch Überströmdichtungen');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('T4', 'Innentür/Innenwand mit Verbrennungsluftöffnung von mindestens 150 cm² freien Querschnitts');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('T5', 'Innentür/Innenwand mit 2 Lüftungsöffnungen von je 150 cm² freien Querschnitts.');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('T6', 'Wandöffnung oder keine Tür.');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('VL', 'Verbrennungsluftleitung in den Raum');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('VO', 'Verbrennungsluftöffnung direkt ins Freie');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('VB', 'Richtungsänderung in Verbrennungsluftleitung');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('VG', 'Gitter an Verbrennungsluftöffnung oder Verbrennungsluftleitung');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('RG', 'Verbrennungsluftzuführung im Gegenstrom (Ringspalt)');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('VF', 'Verbrennungsluftleitung mit direktem Feuerstättenanschluss');
INSERT INTO Enum_Verbrennungsluftversorgung (Wert, Beschreibung) VALUES ('MV', 'Motorische Verbrennungsluftzuführung | Erläuterung: z.B. ventilatorunterstützte Verbrennungsluftversorgung');

-- Kennzeichnung 3.2.1.1 Lüftungseinrichtungen zur Raumlüftung von Aufstellräumen und Heizräumen mit Feuerstätten
CREATE TABLE IF NOT EXISTS Enum_Lueftungseinrichtungen (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('FEN_TUER', 'Einrichtung zur Bedarfslüftung des Raumes - Fenster oder Tür ins Freie | Erläuterung: MFeuV § 5 Abs. 1 Nr. 4 | Sonstiges: Bedarfslüftung > 100 kW');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZOA_FREI', 'Zuluft- und Abluftöffnung direkt ins Freie | Erläuterung: MFeuV § 5 Abs. 1 Nr. 4 | Sonstiges: Bedarfslüftung > 100 kW');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZAOL_FREI', 'Zuluft- und Abluftöffnung über Leitungen ins Freie | Erläuterung: MFeuV § 5 Abs. 1 Nr. 4 | Sonstiges: Bedarfslüftung > 100 kW');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZOAS_BD', 'Zuluftöffnung und Abluftschaft | Erläuterung: MFeuV § 5 Abs. 1 Nr. 4 | Sonstiges: Bedarfslüftung > 100 kW');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZLAS_BD', 'Zuluftleitung und Abluftschacht | Erläuterung: MFeuV § 5 Abs. 1 Nr. 4 | Sonstiges: Bedarfslüftung > 100 kW');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZAO_FREI', 'Zuluftleitung und Abluftöffnung ins Freie | Erläuterung: MFeuV § 5 Abs. 1 Nr. 4 | Sonstiges: Bedarfslüftung > 100 kW');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZOMA_FREI', 'Zuluftöffnung und motorischer Abluft ins Freie | Erläuterung: MFeuV § 5 Abs. 1 Nr. 4 | Sonstiges: Bedarfslüftung > 100 kW');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('W2X150', '2 Öffnungen in der Auswand, untenliegend und obenliegend für Gasfeuerstätte > 100 kW und Abgasführung im Überdruck, 150 cm² zzgl. 1 cm² für jedes über 100 kW hinausgehende kW, | Erläuterung: MFeuV § 5 Abs. 2 Satz 1 | Sonstiges: Überdruck-Gasfeuerstätte > 100 kW Überdruckabgasabführung');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZLAS_TRGI', 'Zuleitung und Abluftschacht | Erläuterung: TRGI 8.3.2.4.2.2.2 | Sonstiges: Überdruck-Gasfeuerstätte > 100 kW Überdruckabgasabführung');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('MEZ_1AL', 'mechanische Zuluftzuführung und 1 Abluftleitung | Erläuterung: TRGI 8.3.2.4.2.2.3 | Sonstiges: Überdruck-Gasfeuerstätte > 100 kW Überdruckabgasabführung');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZAO_HR_FREI', 'Zu- und Abluftöffnung Heizraum direkt ins Freie | Erläuterung: MFeuV § 6 Abs. 4 | Sonstiges: Heizräume');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZAL_HR_FREI', 'Zu- und Abluftleitungen Heizraum ins Freie | Erläuterung: MFeuV § 6 Abs. 4 | Sonstiges: Heizräume');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZOAS_HR', 'Zuluftöffnung und Abluftschacht | Erläuterung: MFeuV § 6 Abs. 4 | Sonstiges: Heizräume');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('ZLAS_HR', 'Zuluftleitung und Abluftschacht | Erläuterung: MFeuV § 6 Abs. 4 | Sonstiges: Heizräume');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('EUD_ZAO', 'einwandige Überdruck-Abgasanlagen, Zu- und Abluftöffnung | Erläuterung: MFeuV § 7 Abs. 8 Nr 1 i.V TRGI Pkt. 8.3.2.5 | Sonstiges: Einwandige Überdruck-Abgasleitungen');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('EUD_OAL', 'einwandige Überdruck-Abgasanlagen, Zu- und Abluftleitungen | Erläuterung: MFeuV § 7 Abs. 8 Nr 1 i.V TRGI Pkt. 8.3.2.5 | Sonstiges: Einwandige Überdruck-Abgasleitungen');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('EUD_ZOAS', 'einwandige Überdruck-Abgasanlagen, Zuluftöffnung und Abluftschacht | Erläuterung: MFeuV § 7 Abs. 8 Nr 1 i.V TRGI Pkt. 8.3.2.5 | Sonstiges: Einwandige Überdruck-Abgasleitungen');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('EUD_ZLAS', 'einwandige Überdruck.-Abgasanlagen, Zuluftletungen und Abluftschacht | Erläuterung: MFeuV § 7 Abs. 8 Nr 1 i.V TRGI Pkt. 8.3.2.5 | Sonstiges: Einwandige Überdruck-Abgasleitungen');
INSERT INTO Enum_Lueftungseinrichtungen (Wert, Beschreibung) VALUES ('C_150_FREI', 'Gasgeräte Art C mit Gebläse ohne Zusatzkennzeichnung x, unmittelbar ins Freie führende Öffnung mit mind. 150 cm² oder 2 Öffnungen von je 75 cm² | Erläuterung: TRGI PKt. 8.3.3.1');

-- Kennzeichnung 3.2.2 Zuluftversorgung bei Lüftungsanlagen
CREATE TABLE IF NOT EXISTS Enum_ZuluftversorgungLueftungsanlagen (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_ZuluftversorgungLueftungsanlagen (Wert, Beschreibung) VALUES ('NOE', 'Nachströmöffnung');
INSERT INTO Enum_ZuluftversorgungLueftungsanlagen (Wert, Beschreibung) VALUES ('ZK', 'Zuluftkanal');
INSERT INTO Enum_ZuluftversorgungLueftungsanlagen (Wert, Beschreibung) VALUES ('ZS', 'Zuluftschacht');
INSERT INTO Enum_ZuluftversorgungLueftungsanlagen (Wert, Beschreibung) VALUES ('ZOE', 'Zuluftöffnung');

-- Kennzeichnung 3.3 Zubehör
CREATE TABLE IF NOT EXISTS Enum_Zubehoer (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('AA', 'Aufsatz und Verlängerungen für Abgasanlagen');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('AK', 'Abgasklappe, thermisch');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('AM', 'Abgasklappe, motorisch');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('AV', 'Abgasventilator');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('BK', 'Brandschutzklappe');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('BS', 'Abgasüberwachungseinrichtung');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('DH', 'Drossel- oder Absperreinrichtung, handgesteuert');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('DK', 'Druckwächter');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('DM', 'Drossel- oder Absperreinrichtung, motorisch');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('FA', 'Abgasfilter / Staubabscheider');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('FE', 'Abgasfilter / Staubabscheider elektrisch');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('KA', 'Kondensatabführung/Siphon');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('LF', 'Luftrohr bei konzentrisch angordnetem VS');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('NE', 'Neutralisationseinrichtung');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('NK', 'Nebenluftvorrichtung, kombiniert');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('NM', 'Nebenluftvorrichtung, motorisch');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('NV', 'Nebenluftvorrichtung, selbsttätig');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('ROE', 'Prüf- und Reinigungsöffnung');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('RV', 'Verschluss der Prüf- und Reinigungsöffnung');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('SL', 'Schalldämpfer/Schallschutzhaube');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('TB', 'Temperaturbegrenzer');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('VA', 'Ventil / Öffnung in Lüftungsanlagen');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('VV', 'Vorrang-, Verriegelungsschaltung');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('ZD', 'Zusatzwärmedämmung');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('ZG', 'Zusatzgebläse');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('ZW', 'Zusatzwärmetauscher');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('BF', 'Brandschutzfilter');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('BV', 'Brandschutzventil');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('FM', 'Maschenfilter');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('FV', 'Aktivkohlefilter');
INSERT INTO Enum_Zubehoer (Wert, Beschreibung) VALUES ('UV', 'UV-Röhren');

-- Kennzeichnung 4.1 Benutzungsintensität von Anlagen (Feuerstätten, Dunstabzugsanlagen, Lüftungsanlagen, Abgasanlagen etc.)
CREATE TABLE IF NOT EXISTS Enum_Benutzungsintensitaet (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('DU', 'Benutzungsintensität: betriebsbereit, jedoch dauernd unbenutzt (KÜO) | Tätigkeit nach KÜO: Prüfung (ggf. mit CO-Messung) | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Ja | Beispiele: Zusätzlich vorhandener Gasheizkessel, der aktuell nicht betrieben wird. Abgaswegüberprüfung, Messung nach 1. BImSchV und Überprüfung des senkrechten Teils der Abgasanlage');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('GB', 'Benutzungsintensität: gelegentlich benutzt | Tätigkeit nach KÜO: Prüfung/ Kehrung | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Ja | Beispiele: Kaminofen, der max. 30 Tage im Jahr genutzt wird.');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('NR', 'Benutzungsintensität: mehr als gelegentlich, aber nicht regelmäßig benutzt | Tätigkeit nach KÜO: Prüfung/ Kehrung | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Ja | Beispiele: Kaminofen, der mehr als 30 Tage genutzt wird, aber nicht regelmäßig genutzt wird.');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('RH', 'Benutzungsintensität: regelmäßig in der üblichen Heizperiode | Tätigkeit nach KÜO: Prüfung/ Kehrung | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Ja | Beispiele: Ölheizkessel, der nur zur Heizzwecken verwendet wird.');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('GR', 'Benutzungsintensität: ganzjährig regelmäßig benutzt | Tätigkeit nach KÜO: Prüfung/ Kehrung | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Ja | Beispiele: Ölheizkessel, der zur Heizzwecken und zur Brauchwassererwärmung verwendet wird.');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('SK', 'Benutzungsintensität: stillgelegt im Sinne der KÜO / 1. BImSchV (keine Arbeiten) | Tätigkeit nach KÜO: Nein | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Nein | Beispiele: Anlage, die physisch vorhanden ist aber nicht in Betrieb genommen werden.');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('S1', 'Benutzungsintensität: stillgelegt im Sinne der 1. BImSchV-Außerbetriebnahme | Tätigkeit nach KÜO: Prüfung | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Nein | Beispiele: Feuerstätte, die nur für den Notbetrieb verwendet werden darf. (Auflage Behörde z. B. Stromunterbrechung von mehr als 24 h)');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('DB', 'Benutzungsintensität: defekt oder kein Brennstoff | Tätigkeit nach KÜO: Prüfung (ohne CO-Messung) | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Nein | Beispiele: Gasheizkessel, der aktuell nicht betrieben wird, da die Gaszufuhr gesperrt oder getrennt ist.');
INSERT INTO Enum_Benutzungsintensitaet (Wert, Beschreibung) VALUES ('AB', 'Benutzungsintensität: Außerbetriebnahme außerhalb der 1. BImSchV durch die Behörde | Tätigkeit nach KÜO: Nein | Tätigkeit nach 1. BImSchV (sofern die Anlage nach 1. BImSchV messpflichtig ist): Nein | Beispiele: Feuerstätte der Stufe 2 nach 1. BImSchV, der Betreiber betreibt die Feuerstätte entgegen der Vorgaben des Herstellers.');

-- Kennzeichnung 4.2 Bearbeitungszyklus Feuerstätten/Abgasanlagen etc.
CREATE TABLE IF NOT EXISTS Enum_Bearbeitungszyklus (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('K', 'kein Bearbeitszyklus');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('J', 'jährlich');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('G', 'gerades Jahr');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('U', 'ungerades Jahr');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('D', 'im jedem durch drei teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('E', 'jeweils ein Jahr nach einem durch drei teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('Z', 'jeweils zwei Jahre nach einem durch drei teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('F', 'in jedem durch fünf teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('EF', 'jeweils ein Jahr nach einem durch fünf teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('ZF', 'jeweils zwei Jahre nach einem durch fünf teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('DF', 'jeweils drei Jahre nach einem durch fünf teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('VF', 'jeweils vier Jahre nach einem durch fünf teilbaren Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('EM', 'einmalig');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('AUE', 'anlassbezogene Überprüfung (§ 15 SchfHwG)');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('K1', 'einmal im Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('K2', 'zweimal im Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('K3', 'dreimal im Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('K4', 'viermal im Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('K6', 'sechsmal im Jahr.');
INSERT INTO Enum_Bearbeitungszyklus (Wert, Beschreibung) VALUES ('K8', 'achtmal im Jahr.');

-- Kennzeichnung 5.1 Standfläche nach DIN 18160 Teil 5
CREATE TABLE IF NOT EXISTS Enum_Standflaeche (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Standflaeche (Wert, Beschreibung) VALUES ('A', '');
INSERT INTO Enum_Standflaeche (Wert, Beschreibung) VALUES ('B', '');
INSERT INTO Enum_Standflaeche (Wert, Beschreibung) VALUES ('C', '');
INSERT INTO Enum_Standflaeche (Wert, Beschreibung) VALUES ('D', '');
INSERT INTO Enum_Standflaeche (Wert, Beschreibung) VALUES ('E', '');

-- Kennzeichnung 5.2 Verkehrsweg
CREATE TABLE IF NOT EXISTS Enum_Verkehrsweg (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('FT', 'Erläuterung: Verkehrsweg Flur und Treppen | Hinweise: Bei Standfläche A bis D');
INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('BT', 'Erläuterung: Bodentreppe | Hinweise: Bei Standfläche A bis D');
INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('AL', 'Erläuterung: Anlegleitern | Hinweise: Bei Standfläche A bis D');
INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('AD_A', 'Erläuterung: Arbeiten über Dach (Verkehrsweg, Arbeitsplatz und Absturzsicherung) - (Standfläche A) | Hinweise: Nur bei Standfläche A');
INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('UD_B', 'Erläuterung: Arbeiten unter Dach (maximaler Abstand zur Mündung 5 m) - (Standfläche B) | Hinweise: Nur bei Standfläche B');
INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('UD_C', 'Erläuterung: Arbeiten unter Dach (maximaler Abstand zur Mündung 15 m) - (Standfläche C) | Hinweise: Nur bei Standfläche C');
INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('RO_D', 'Erläuterung: Arbeiten an der unteren Reinigungsöffnung - (Standfläche D) | Hinweise: Nur bei Standfläche D');
INSERT INTO Enum_Verkehrsweg (Wert, Beschreibung) VALUES ('BA_E', 'Erläuterung: Besondere Arbeitsplätze / freistehende Schornsteine - (Standfläche E) | Hinweise: Nur bei Standfläche E');

-- Kennzeichnung 5.3 Prüfpunkte Gefährdungsbeurteilung
CREATE TABLE IF NOT EXISTS Enum_GefaehrdungPruefpunkte (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('BEL', 'Beleuchtung ausreichend | Matrix: 1.1');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('LW_OK', 'Laufwege in Ordnung | Matrix: 1.1');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('LW_RS', 'Laufwege frei von Rutsch- und Stolperfallen | Matrix: 1.1');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('LW_HG', 'Laufweg frei von herabhängenden Gegenständen (insb. stromführende Leitungen) | Matrix: 1.1');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('SH_OK', 'Stufen / Holme in Ordnung | Matrix: 1.2');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('BEF_OK', 'Befestigung in Ordnung | Matrix: 1.2');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('BES_OK', 'Beschläge in Ordnung | Matrix: 1.2');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('TST_OK', 'Treppenstütze in Ordnung | Matrix: 1.2');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('BP_OK', 'Bolzenplatte in Ordnung | Matrix: 1.2');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('SB_OK', 'Schwenkbeschlag in Ordnung | Matrix: 1.2');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('TB_OK', 'Treppenband in Ordnung | Matrix: 1.2');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('AL_USE', 'Verwendung einer Anlegeleiter in Ordnung (Stichwort: Gewerbliches Gebäude*2) | Matrix: 1.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('AL_TRBS', 'Die zu verwendende Anlegeleiter erfüllt die notwendigen Sicherheitsanforderungen der TRBS 2121 Teil 2 | Matrix: 1.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('AL_FIT', 'Die Art der Leiter passt zur durchzuführenden Tätigkeit | Matrix: 1.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('AL_SEC', 'Holme, Sprossen, Stufen, Rutschsicherung und Kippsicherung in Ordnung | Matrix: 1.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('DSO_OK', 'Durchsteigeöffnung in Ordnung | Matrix: 1.4.1, 1.4.2, 1.4.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('LDS_OK', 'Laufstege, Dachtritte und Standflächen in Ordnung | Matrix: 1.4.1, 1.4.2, 1.4.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('SS_OK', 'Seitenschutz i.O. | Matrix: 1.4.1, 1.4.2, 1.4.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('GEL_OK', 'Geländer in Ordnung (z.B.: Seitenschutz, Oberlichter Flachdach) | Matrix: 1.4.1, 1.4.2, 1.4.3');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('SF_OK', 'Standfläche in Ordnung | Matrix: 1.4.2, 1.4.3, 1.4.4');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('SS_REQ', 'erforderlicher Seitenschutz in Ordnung | Matrix: 1.4.2, 1.4.3, 1.4.4');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('LRP_OK', 'Lichtraumprofil in Ordnung | Matrix: 1.4.2, 1.4.3, 1.4.4');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('RETT', 'Rettungskonzept | Matrix: 1.4.5');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('PSGA', 'PSGA | Matrix: 1.4.5');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('VW', 'Verkehrsweg | Matrix: 1.4.5');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('RB', 'Ruhebühnen | Matrix: 1.4.5');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('AP', 'Arbeitsplätze | Matrix: 1.4.5');
INSERT INTO Enum_GefaehrdungPruefpunkte (Wert, Beschreibung) VALUES ('URO', 'Verkehrswege und Standflächen müssen frei von Stolperfallen sein. Sie müssen ausreichend beleuchtet sein. Verkehrswege und Standflächen müssen ein ausreichendes Lichtraumprofil aufweisen. | Matrix: 1.4.4');

-- Kennzeichnung 5.4 Bewertungssystematik-Allgemein
CREATE TABLE IF NOT EXISTS Enum_Bewertungssystematik (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Bewertungssystematik (Wert, Beschreibung) VALUES ('NA', 'Beschreibung: nicht zutreffend | Erläuterung 1: Feld wird verwendet, wenn ein Prüfpunkt nicht zutreffend ist!');
INSERT INTO Enum_Bewertungssystematik (Wert, Beschreibung) VALUES ('WORK', 'Beschreibung: muss bearbeitet werden | Erläuterung 1: 5 (Kennzeichnungstabelle 5.5) | Erläuterung 2: oder Feld mit automatischer Vorbelegung- Farbe "Rosa"');
INSERT INTO Enum_Bewertungssystematik (Wert, Beschreibung) VALUES ('OK', 'Beschreibung: in Ordnung | Erläuterung 1: 1, 2 ,3 (Kennzeichnungstabelle 5.5)');
INSERT INTO Enum_Bewertungssystematik (Wert, Beschreibung) VALUES ('NOK', 'Beschreibung: nicht in Ordnung | Erläuterung 1: 4 (Kennzeichnungstabelle 5.5)');

-- Kennzeichnung 5.5 Gefährdungseinschätzung - Verkehrsweg/Standfläche
CREATE TABLE IF NOT EXISTS Enum_Risikoeinschaetzung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_Risikoeinschaetzung (Wert, Beschreibung) VALUES ('SGR', 'Einschätzung: Sehr gering | Rot: 177 | Grün: 255 | Blau: 149');
INSERT INTO Enum_Risikoeinschaetzung (Wert, Beschreibung) VALUES ('GR', 'Einschätzung: gering | Rot: 230 | Grün: 249 | Blau: 115');
INSERT INTO Enum_Risikoeinschaetzung (Wert, Beschreibung) VALUES ('AKZ', 'Einschätzung: akzeptabel | Rot: 255 | Grün: 229 | Blau: 153');
INSERT INTO Enum_Risikoeinschaetzung (Wert, Beschreibung) VALUES ('GRZ', 'Einschätzung: Grenzrisiko erreicht | Rot: 237 | Grün: 125 | Blau: 49');
INSERT INTO Enum_Risikoeinschaetzung (Wert, Beschreibung) VALUES ('IRZ', 'Einschätzung: Individuelle Risikobewertung zwingend erforderlich! | Rot: 68 | Grün: 114 | Blau: 196');

-- Kennzeichnung 6.2 Wärmequelle der Wärmepumpe
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeWaermequelle (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeWaermequelle (Wert, Beschreibung) VALUES ('LUFT', 'Luft');
INSERT INTO Enum_WaermepumpeWaermequelle (Wert, Beschreibung) VALUES ('WASS', 'Wasser (Brunnen, Fluss)');
INSERT INTO Enum_WaermepumpeWaermequelle (Wert, Beschreibung) VALUES ('SOLE', 'Sole');
INSERT INTO Enum_WaermepumpeWaermequelle (Wert, Beschreibung) VALUES ('EIS', 'Eisspeicher');
INSERT INTO Enum_WaermepumpeWaermequelle (Wert, Beschreibung) VALUES ('ABL', 'Abluft');

-- Kennzeichnung 6.3 Betriebsweise der Wärmepumpe
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeBetriebsweise (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeBetriebsweise (Wert, Beschreibung) VALUES ('MONO', 'monovalent');
INSERT INTO Enum_WaermepumpeBetriebsweise (Wert, Beschreibung) VALUES ('MONE', 'monönergetisch');
INSERT INTO Enum_WaermepumpeBetriebsweise (Wert, Beschreibung) VALUES ('BIP', 'bivalent parallel');
INSERT INTO Enum_WaermepumpeBetriebsweise (Wert, Beschreibung) VALUES ('BIA', 'bivalent alternativ');

-- Kennzeichnung 6.4 Bauweise der Wärmepumpe
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeBauweise (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeBauweise (Wert, Beschreibung) VALUES ('SPL', 'Split');
INSERT INTO Enum_WaermepumpeBauweise (Wert, Beschreibung) VALUES ('MNB', 'Monoblock');

-- Kennzeichnung 6.5 Betriebspunkt der Wärmepumpe
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeBetriebspunkt (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeBetriebspunkt (Wert, Beschreibung) VALUES ('A2W35', 'Luft/Wasser-Wärmepumpe: A2/W35');
INSERT INTO Enum_WaermepumpeBetriebspunkt (Wert, Beschreibung) VALUES ('B0W35', 'Sole/ Wasser-Wärmepumpe: B0/W35');
INSERT INTO Enum_WaermepumpeBetriebspunkt (Wert, Beschreibung) VALUES ('W10W35', 'Wasser/ Wasser-Wärmepumpe: W10/W35');

-- Kennzeichnung 6.6 Kältemittelgruppe
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeKaeltemittelgruppe (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R290', 'R290 Propan');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R454C', 'R454C');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R454B', 'R454B');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R32', 'R32');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R134A', 'R134a');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R407C', 'R407C');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R410A', 'R410A');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R404A', 'R404A');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R744', 'R744 CO2');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R717', 'R717 Ammoniak');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R600A', 'R600a Isobutan');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R1234ZE', 'R1234ze(E)');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R1234YF', 'R1234yf');
INSERT INTO Enum_WaermepumpeKaeltemittelgruppe (Wert, Beschreibung) VALUES ('R513A', 'R513A');

-- Kennzeichnung 6.7 GWP-Wert
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeGWP (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G1', '1');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G3', '3');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G146', '146');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G148', '148');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G466', '466');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G675', '675');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G630', '630');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G1430', '1430');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G1774', '1774');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G2088', '2088');
INSERT INTO Enum_WaermepumpeGWP (Wert, Beschreibung) VALUES ('G3922', '3922');

-- Kennzeichnung 6.8 Wärmeübertrager
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeWaermeuebertrager (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeWaermeuebertrager (Wert, Beschreibung) VALUES ('FH', 'Flächenheizung (Wandheizung, Fußbodenheizung, Deckenheizung)');
INSERT INTO Enum_WaermepumpeWaermeuebertrager (Wert, Beschreibung) VALUES ('HK', 'Heizkörper');
INSERT INTO Enum_WaermepumpeWaermeuebertrager (Wert, Beschreibung) VALUES ('TABS', 'TABS (Thermisch aktivierte Bauteilssysteme)');
INSERT INTO Enum_WaermepumpeWaermeuebertrager (Wert, Beschreibung) VALUES ('LH', 'Luftheizung');
INSERT INTO Enum_WaermepumpeWaermeuebertrager (Wert, Beschreibung) VALUES ('WW', 'Wasser | Erläuterung: z.B. zur Warmwasserbereitung');
INSERT INTO Enum_WaermepumpeWaermeuebertrager (Wert, Beschreibung) VALUES ('FC', 'Gebläsekonvektor / Fan Coil');

-- Kennzeichnung 6.9 Installationsort
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeInstallationsort (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('GRT', 'Garten');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('EIN', 'Einfahrt');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('TER', 'Terasse');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('DAC', 'Dach');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('GEB', 'im Gebäude');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('HAW', 'Hauswand');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('VOG', 'Vorgarten');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('CAR', 'Carport');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('GAR', 'Garage');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('GDAC', 'Garagendach');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('BAL', 'Balkon');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('KEL', 'Keller');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('TEC', 'Technikraum');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('HWR', 'Hauswirtschaftsraum');
INSERT INTO Enum_WaermepumpeInstallationsort (Wert, Beschreibung) VALUES ('DAB', 'Dachboden');

-- Kennzeichnung 6.10 Aufstellung der Außeneinheit
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeAufstellung (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeAufstellung (Wert, Beschreibung) VALUES ('KEIN', 'keine');
INSERT INTO Enum_WaermepumpeAufstellung (Wert, Beschreibung) VALUES ('WAND', 'wandhängend');
INSERT INTO Enum_WaermepumpeAufstellung (Wert, Beschreibung) VALUES ('FND', 'Fundament');
INSERT INTO Enum_WaermepumpeAufstellung (Wert, Beschreibung) VALUES ('KON', 'Konsole');

-- Kennzeichnung 6.11 Wärmepumpenbauart
CREATE TABLE IF NOT EXISTS Enum_WaermepumpeBauart (
    Wert TEXT PRIMARY KEY,
    Beschreibung TEXT NOT NULL
);

INSERT INTO Enum_WaermepumpeBauart (Wert, Beschreibung) VALUES ('LW', 'Luft-Wasser');
INSERT INTO Enum_WaermepumpeBauart (Wert, Beschreibung) VALUES ('WW', 'Wasser-Wasser');
INSERT INTO Enum_WaermepumpeBauart (Wert, Beschreibung) VALUES ('SW', 'Sole-Wasser');
INSERT INTO Enum_WaermepumpeBauart (Wert, Beschreibung) VALUES ('LL', 'Luft-Luft');
