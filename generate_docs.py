#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate HTML documentation for ZIV Datenmodell 4.0"""

import re
import html as html_mod

# ============================================================
# 1. Parse schema.sql
# ============================================================
def parse_schema(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    tables = {}
    # Match CREATE TABLE statements
    pattern = r'CREATE\s+TABLE\s+(\w+)\s*\((.*?)\);'
    for m in re.finditer(pattern, content, re.DOTALL):
        table_name = m.group(1)
        body = m.group(2)

        columns = []
        fks = []
        checks = {}

        lines = [l.strip() for l in body.split('\n') if l.strip()]

        for line in lines:
            line = line.rstrip(',')

            # Foreign key
            fk_match = re.match(r'FOREIGN\s+KEY\s*\((\w+)\)\s+REFERENCES\s+(\w+)\s*\((\w+)\)', line, re.IGNORECASE)
            if fk_match:
                fks.append({
                    'column': fk_match.group(1),
                    'ref_table': fk_match.group(2),
                    'ref_column': fk_match.group(3)
                })
                continue

            # Column definition
            # Handle quoted column names like "Filter" or "44BImSchV_Art"
            col_match = re.match(r'"?(\w+)"?\s+(INTEGER|TEXT|REAL|BLOB|DATE|DATETIME|FLOAT|BOOL|INT)\b(.*)', line, re.IGNORECASE)
            if col_match:
                col_name = col_match.group(1)
                col_type = col_match.group(2).upper()
                rest = col_match.group(3)

                is_pk = 'PRIMARY KEY' in rest.upper()
                is_autoincrement = 'AUTOINCREMENT' in rest.upper()
                is_not_null = 'NOT NULL' in rest.upper()

                default_match = re.search(r"DEFAULT\s+'([^']*)'", rest)
                if not default_match:
                    default_match = re.search(r'DEFAULT\s+(\S+)', rest)
                default_val = default_match.group(1) if default_match else None

                # CHECK constraint
                check_match = re.search(r"CHECK\s*\(\s*\"?(\w+)\"?\s+IN\s*\('([^)]+)'\)\s*\)", rest)
                check_values = None
                if check_match:
                    check_col = check_match.group(1)
                    check_values = [v.strip().strip("'") for v in check_match.group(2).split("', '")]

                columns.append({
                    'name': col_name,
                    'type': col_type,
                    'pk': is_pk,
                    'autoincrement': is_autoincrement,
                    'not_null': is_not_null,
                    'default': default_val,
                    'check_values': check_values
                })

        # Map FK info to columns
        fk_map = {}
        for fk in fks:
            fk_map[fk['column']] = fk

        for col in columns:
            if col['name'] in fk_map:
                col['fk'] = fk_map[col['name']]
            else:
                col['fk'] = None

        tables[table_name] = {
            'columns': columns,
            'fks': fks
        }

    return tables

# ============================================================
# 2. Parse stammdaten_enums.sql
# ============================================================
def parse_enums(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    enums = {}
    current_enum = None

    for line in content.split('\n'):
        line = line.strip()

        # CREATE TABLE
        ct_match = re.match(r'CREATE\s+TABLE\s+IF\s+NOT\s+EXISTS\s+(\w+)', line, re.IGNORECASE)
        if ct_match:
            current_enum = ct_match.group(1)
            if current_enum not in enums:
                enums[current_enum] = []
            continue

        # INSERT with (Wert, Beschreibung)
        ins_match = re.match(r"INSERT\s+INTO\s+(\w+)\s+\(Wert,\s*Beschreibung\)\s+VALUES\s+\('([^']*)',\s*'(.*)'\)\s*;", line, re.IGNORECASE)
        if ins_match:
            enum_name = ins_match.group(1)
            wert = ins_match.group(2)
            beschreibung = ins_match.group(3).replace("''", "'")
            if enum_name not in enums:
                enums[enum_name] = []
            enums[enum_name].append({'wert': wert, 'beschreibung': beschreibung})
            continue

        # INSERT with (Wert) only (no Beschreibung)
        ins_match2 = re.match(r"INSERT\s+INTO\s+(\w+)\s+\(Wert\)\s+VALUES\s+\('([^']*)'\)\s*;", line, re.IGNORECASE)
        if ins_match2:
            enum_name = ins_match2.group(1)
            wert = ins_match2.group(2)
            if enum_name not in enums:
                enums[enum_name] = []
            enums[enum_name].append({'wert': wert, 'beschreibung': ''})

    return enums

# ============================================================
# 3. Parse relations from DBML refs
# ============================================================
def parse_relations_from_dbml(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    relations = []
    current_table = None
    nr = 0

    for line in content.split('\n'):
        stripped = line.strip()
        if stripped.startswith('//'):
            continue

        table_match = re.match(r'^Table\s+(\w+)\s*\{', stripped)
        if table_match:
            current_table = table_match.group(1)
            continue

        if stripped == '}':
            current_table = None
            continue

        if current_table and 'ref:' in stripped:
            ref_match = re.search(r'ref:\s*([->])\s*(\w+)\.(\w+)', stripped)
            if ref_match:
                ref_type = ref_match.group(1)
                parent_table = ref_match.group(2)
                col_match = re.match(r'(\w+)\s+', stripped)
                if col_match:
                    nr += 1
                    col_name = col_match.group(1)
                    kardinalitaet = '1:1' if ref_type == '-' else 'n:1'
                    # Extract note for kommentar
                    note_match = re.search(r"note:\s*'([^']*)'", stripped)
                    kommentar = ''
                    if note_match:
                        note_text = note_match.group(1)
                        if '|' in note_text:
                            kommentar = note_text.split('|', 1)[1].strip()
                        else:
                            kommentar = note_text
                    relations.append({
                        'nr': nr,
                        'kind_tabelle': current_table,
                        'fk_feld': col_name,
                        'eltern_tabelle': parent_table,
                        'kardinalitaet': kardinalitaet,
                        'not_null': 'ja' if 'not null' in stripped.lower() else 'nein',
                        'status': 'EXISTIERT',
                        'kommentar': kommentar
                    })

    return relations

# ============================================================
# 4. Parse DBML for notes
# ============================================================
def parse_dbml_notes(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    notes = {}  # {table_name: {column_name: note_text}}
    arts = {}   # {table_name: {column_name: art_prefix}}
    current_table = None

    for line in content.split('\n'):
        stripped = line.strip()

        # Table definition
        table_match = re.match(r'^Table\s+(\w+)\s*\{', stripped)
        if table_match:
            current_table = table_match.group(1)
            if current_table not in notes:
                notes[current_table] = {}
            if current_table not in arts:
                arts[current_table] = {}
            continue

        if stripped == '}':
            current_table = None
            continue

        if current_table and stripped and not stripped.startswith('//'):
            # Extract column name and note
            # Pattern: column_name type [... note: 'text']
            col_match = re.match(r'^"?(\w+)"?\s+', stripped)
            if col_match:
                col_name = col_match.group(1)
                note_match = re.search(r"note:\s*'([^']*(?:''[^']*)*)'", stripped)
                if note_match:
                    note_text = note_match.group(1).replace("''", "'")
                    # Extract Art prefix (text before first |)
                    if '|' in note_text:
                        art_prefix = note_text.split('|', 1)[0].strip()
                        note_desc = note_text.split('|', 1)[1].strip()
                        if art_prefix in ('V',):
                            # Ignore V prefix
                            arts[current_table][col_name] = ''
                        else:
                            arts[current_table][col_name] = art_prefix
                        notes[current_table][col_name] = note_desc
                    else:
                        notes[current_table][col_name] = note_text
                        arts[current_table][col_name] = ''

    return notes, arts

# ============================================================
# 5. Build HTML
# ============================================================

def esc(text):
    """HTML escape"""
    if text is None:
        return ''
    return html_mod.escape(str(text))

def generate_html(tables, enums, relations, notes, arts):
    # Build relation maps
    # parent_refs[child] = [(fk_field, parent, comment), ...]
    parent_refs = {}
    # child_refs[parent] = [(child, fk_field, comment), ...]
    child_refs = {}

    for rel in relations:
        child = rel['kind_tabelle']
        parent = rel['eltern_tabelle']
        fk = rel['fk_feld']
        comment = rel['kommentar']

        if child not in parent_refs:
            parent_refs[child] = []
        parent_refs[child].append((fk, parent, comment, rel['kardinalitaet']))

        if parent not in child_refs:
            child_refs[parent] = []
        child_refs[parent].append((child, fk, comment, rel['kardinalitaet']))

    # Map CHECK values to enum tables
    # We need to figure out which CHECK constraint maps to which enum
    # Build a mapping from set of values -> enum table name
    enum_value_sets = {}
    for enum_name, values in enums.items():
        key = frozenset(v['wert'] for v in values)
        if key:
            enum_value_sets[key] = enum_name

    # Also build: which tables/columns use which enum
    enum_usage = {}  # enum_name -> [(table, column), ...]

    def find_enum_for_check(check_values):
        if not check_values:
            return None
        key = frozenset(check_values)
        return enum_value_sets.get(key)

    # Pre-compute enum usage
    for tname, tdata in tables.items():
        for col in tdata['columns']:
            if col['check_values']:
                enum_name = find_enum_for_check(col['check_values'])
                if enum_name:
                    if enum_name not in enum_usage:
                        enum_usage[enum_name] = []
                    enum_usage[enum_name].append((tname, col['name']))

    # Pre-compute polymorphic references (discriminator + ID column pattern)
    # Supported patterns: Anlagetyp/ID_Anlage, Herkunftstyp/ID_Herkunft
    poly_patterns = [
        ('Anlagetyp', 'ID_Anlage'),
        ('Herkunftstyp', 'ID_Herkunft'),
    ]
    poly_refs = {}  # table_name -> {id_col: [target_table, ...]}
    for tname, tdata in tables.items():
        for disc_col, id_col in poly_patterns:
            has_disc = None
            has_id = False
            for col in tdata['columns']:
                if col['name'] == disc_col and col['check_values']:
                    has_disc = col['check_values']
                if col['name'] == id_col:
                    has_id = True
            if has_disc and has_id:
                targets = [v for v in has_disc if v in tables]
                if tname not in poly_refs:
                    poly_refs[tname] = {}
                poly_refs[tname][id_col] = targets
                for target in targets:
                    if tname not in parent_refs:
                        parent_refs[tname] = []
                    parent_refs[tname].append((id_col, target, f'polymorph via {disc_col}', 'n:1'))
                    if target not in child_refs:
                        child_refs[target] = []
                    child_refs[target].append((tname, id_col, f'polymorph via {disc_col}', 'n:1'))

    # Group tables
    groups = [
        ("Stammdaten/Verwaltung", ['Meta', 'Kehrbezirk', 'Mitarbeiter', 'Vertreter', 'Kommunikation', 'Fremdfirma', 'Untere_Aufsichtsbehoerde']),
        ("Standort", ['Ort', 'Strasse', 'Grundstueck', 'Grundstueck_Eigentuemer', 'Gebaeude_Gebaeudeteil', 'Gebaeude_Eigentuemer', 'Gebaeudeeigenschaft']),
        ("Abgasanlagen", ['Abgasanlage', 'Abschnitt', 'Schicht', 'Muendung', 'Reinigungsart', 'Zubehoer']),
        ("Lueftungsanlagen", ['Lueftungsanlage', 'Raumlueftung', 'Raumlueftungsleitung', 'Raumluftoeffnung', 'Mess_Pruefergebnis_Raumluftoeffnung']),
        ("Nutzung/Wohnung/Raum", ['Nutzungseinheit', 'Nutzungseinheit_Eigentuemer', 'Wohnung', 'Raum']),
        ("Feuerstätten", ['Feuerstaette', 'Gasfeuerstaette', 'Oelfeuerstaette', 'Feste_Brennstoff_Feuerstaette', 'Sonderfeuerstaette', 'Waermepumpe', 'Feste_Brennstoff_Ableitbedingungen', 'Nachgeschalteter_Waermeaustauscher', 'Brennstoffversorgungsanlage', 'Raeucheranlage', 'Effizienzlabel']),
        ("Messergebnisse", ['Mess_Pruefergebnis_Gasfeuerstaette', 'Mess_Pruefergebnis_44BImSchV_Gasfeuerstaette', 'Mess_Pruefergebnis_Oelfeuerstaette', 'Mess_Pruefergebnis_44BImSchV_Oelfeuerstaette', 'Mess_Pruefergebnis_Feststofffeuerstaette_HK', 'Mess_Pruefergebnis_Feststofffeuerstaette_ERF', 'Mess_Pruefergebnis_Sonderfeuerstaette', 'Mess_Pruefergebnis_Waermepumpe', 'Messgeraet', 'Messgeraet_44', 'Messunsicherheit']),
        ("Dunstabzug", ['Dunstabzuganlage_Leitung', 'Dunstabzugsanlage_Haube', 'Dunstabzugsanlage_Feuerstaette', 'Abschnitt_Dunstabzugsleitung', 'Ventilator_Dunstabzug', 'Mess_Pruefergebnis_Dunstabzugsleitung']),
        ("Verbrennungsluft", ['Verbrennungsluftzufuhr_Element', 'Feuerst_Verbr_Element']),
        ("GEG/Effizienz", ['GEG', 'Pruefergebnis_GEG']),
        ("Hoheitliche Taetigkeiten", ['Abnahme', 'Abnahme_Anlage', 'Anlassbezogene_Ueberpruefung', 'Sonstige_Arbeit', 'Feuerstaettenschau', 'Pruefergebnis_Feuerstaettenschau']),
        ("Feuerstättenbescheid", ['Feuerstaettenbescheid_Grunddaten', 'Bescheid_Position', 'Bescheid_Termin_Position']),
        ("Abrechnung", ['Leistung', 'Aufteilung_Leistung', 'Datum_Ausfuehrung_Leistung', 'Rechnung', 'Landesrechtliche_Vorschrift', 'Bundes_KUEO']),
        ("Kehrbuch", ['Kehrbuch', 'Kehrbuch_Gebaeude', 'Kehrbuch_Gebaeude_Eigentuemer', 'Kehrbuch_Nutzungseinheit', 'Kehrbuch_Anlage', 'Kehrbuch_Taetigkeit', 'Kehrbuch_Abnahme', 'Kehrbuch_Anlassbezogene_Ueberpruefung', 'Kehrbuch_Feuerstaettenschau', 'Mangel']),
        ("Sonstiges", ['Dachskizze', 'Dachskizze_Element', 'Dokument', 'Gefaehrdungsbeurteilung']),
    ]

    # Count stats
    total_tables = len(tables)
    total_relations = len(relations)
    total_enums = len(enums)
    total_enum_values = sum(len(v) for v in enums.values())

    # ---- Start HTML ----
    h = []
    h.append('<!DOCTYPE html>')
    h.append('<html lang="de">')
    h.append('<head>')
    h.append('<meta charset="UTF-8">')
    h.append('<meta name="viewport" content="width=device-width, initial-scale=1.0">')
    h.append('<title>ZIV Datenmodell 4.0 - Dokumentation</title>')
    h.append('<style>')
    h.append(CSS)
    h.append('</style>')
    h.append('</head>')
    h.append('<body>')

    # Hero
    h.append('<header class="hero">')
    h.append('<div class="hero-content">')
    h.append('<h1>ZIV Datenmodell 4.0</h1>')
    h.append('<p class="subtitle">Dokumentation der SQLite-Datenbank</p>')
    h.append('<div class="stats">')
    h.append(f'<div class="stat-card"><span class="stat-number">{total_tables}</span><span class="stat-label">Tabellen</span></div>')
    h.append(f'<div class="stat-card"><span class="stat-number">{total_relations}</span><span class="stat-label">Relationen</span></div>')
    h.append(f'<div class="stat-card"><span class="stat-number">{total_enums}</span><span class="stat-label">Enums</span></div>')
    h.append(f'<div class="stat-card"><span class="stat-number">{total_enum_values:,}</span><span class="stat-label">Enum-Werte</span></div>')
    h.append('</div>')
    h.append('</div>')
    h.append('</header>')

    # Search
    h.append('<div class="search-bar">')
    h.append('<input type="text" id="searchInput" placeholder="Tabellen und Enums durchsuchen..." oninput="filterAll()">')
    h.append('</div>')

    # Layout
    h.append('<div class="layout">')

    # Sidebar
    h.append('<nav class="sidebar" id="sidebar">')
    h.append('<div class="sidebar-inner">')
    h.append('<h3>Inhaltsverzeichnis</h3>')

    for gname, gtables in groups:
        gid = gname.replace('/', '_').replace(' ', '_')
        h.append(f'<div class="nav-group">')
        h.append(f'<div class="nav-group-title" onclick="toggleGroup(this)">')
        h.append(f'<span class="arrow">&#9654;</span> {esc(gname)}')
        h.append(f'</div>')
        h.append(f'<div class="nav-group-items">')
        for t in gtables:
            if t in tables:
                h.append(f'<a href="#table-{t}" class="nav-item">{esc(t)}</a>')
        h.append('</div></div>')

    # Enums link
    h.append('<div class="nav-group">')
    h.append('<a href="#enums-section" class="nav-group-title" style="text-decoration:none;color:inherit;">')
    h.append('<span class="arrow">&#9654;</span> Enums</a>')
    h.append('</div>')

    h.append('</div></nav>')

    # Main content
    h.append('<main class="main-content">')

    # Tables by group
    for gname, gtables in groups:
        gid = gname.replace('/', '_').replace(' ', '_')
        h.append(f'<div class="group-header" id="group-{gid}">')
        h.append(f'<h2>{esc(gname)}</h2>')
        h.append('</div>')

        for tname in gtables:
            if tname not in tables:
                continue
            tdata = tables[tname]
            tnotes = notes.get(tname, {})
            tarts = arts.get(tname, {})

            h.append(f'<div class="table-card" id="table-{tname}" data-name="{tname.lower()}">')
            h.append(f'<h3 class="table-title">{esc(tname)}</h3>')

            # Columns table
            h.append('<div class="table-responsive">')
            h.append('<table class="columns-table">')
            h.append('<thead><tr>')
            h.append('<th>Spalte</th><th>Datentyp</th><th>NOT NULL</th><th>Default</th><th>Beschreibung / Constraint</th><th>Art</th>')
            h.append('</tr></thead>')
            h.append('<tbody>')

            for col in tdata['columns']:
                row_class = ' class="pk-row"' if col['pk'] else ''
                h.append(f'<tr{row_class}>')

                # Column name with badges
                badges = ''
                if col['pk']:
                    badges += '<span class="badge badge-pk" title="Primary Key">PK</span> '
                if tname in poly_refs and col['name'] in poly_refs[tname]:
                    disc_name = [d for d, i in poly_patterns if i == col['name']][0]
                    badges += f'<span class="badge badge-fk" title="Polymorphe Referenz via {disc_name}">FK*</span> '
                elif col['fk']:
                    badges += '<span class="badge badge-fk" title="Foreign Key">FK</span> '

                h.append(f'<td class="col-name">{badges}<code>{esc(col["name"])}</code></td>')
                h.append(f'<td><code>{esc(col["type"])}</code></td>')

                nn = 'Ja' if col['not_null'] or col['pk'] else ''
                h.append(f'<td class="center">{nn}</td>')

                default_str = esc(col['default']) if col['default'] else ''
                h.append(f'<td><code>{default_str}</code></td>')

                # Description
                desc_parts = []

                # DBML note
                note = tnotes.get(col['name'], '')
                if note:
                    desc_parts.append(esc(note))

                # FK reference
                if tname in poly_refs and col['name'] in poly_refs[tname]:
                    pass  # Polymorphe FKs: kein direkter Verweis, FK*-Badge + Relationen reichen
                elif col['fk']:
                    ref_table = col['fk']['ref_table']
                    desc_parts.append(f'<span class="fk-ref">&#8594; <a href="#table-{ref_table}">{esc(ref_table)}</a></span>')

                # CHECK / Enum reference
                if col['check_values']:
                    enum_name = find_enum_for_check(col['check_values'])
                    if enum_name:
                        desc_parts.append(f'<span class="enum-ref">Enum: <a href="#enum-{enum_name}">{esc(enum_name)}</a></span>')
                    else:
                        vals_preview = ", ".join(col['check_values'][:5])
                        if len(col['check_values']) > 5:
                            vals_preview += f" ... (+{len(col['check_values'])-5})"
                        desc_parts.append(f'<span class="check-info">CHECK IN ({esc(vals_preview)})</span>')

                h.append(f'<td class="desc-cell">{"<br>".join(desc_parts)}</td>')

                # Art column (chip badge)
                art_val = tarts.get(col['name'], '')
                art_html = ''
                if art_val:
                    if art_val.startswith('QS'):
                        art_html = f'<span class="badge badge-qs">{esc(art_val)}</span>'
                    elif art_val.startswith('§ 19') or art_val.startswith('\u00a7 19'):
                        chip_text = art_val.replace('§ 19_K', '19K').replace('§ 19_B', '19B').replace('\u00a7 19_K', '19K').replace('\u00a7 19_B', '19B')
                        art_html = f'<span class="badge badge-19">{esc(chip_text)}</span>'
                    elif art_val == 'NEIN':
                        art_html = '<span class="badge badge-nein">NEIN</span>'
                    else:
                        art_html = esc(art_val)
                h.append(f'<td class="center">{art_html}</td>')
                h.append('</tr>')

            h.append('</tbody></table>')
            h.append('</div>')

            # Relations box
            parents = parent_refs.get(tname, [])
            children = child_refs.get(tname, [])

            if parents or children:
                h.append('<div class="relations-box">')
                if parents:
                    h.append('<div class="rel-section">')
                    h.append('<strong>Referenziert:</strong> ')
                    links = []
                    for fk, parent, comment, kard in parents:
                        links.append(f'<a href="#table-{parent}">{esc(parent)}</a> <span class="rel-detail">({esc(fk)}, {esc(kard)})</span>')
                    h.append(', '.join(links))
                    h.append('</div>')

                if children:
                    h.append('<div class="rel-section">')
                    h.append('<strong>Referenziert von:</strong> ')
                    links = []
                    for child, fk, comment, kard in children:
                        links.append(f'<a href="#table-{child}">{esc(child)}</a> <span class="rel-detail">({esc(fk)}, {esc(kard)})</span>')
                    h.append(', '.join(links))
                    h.append('</div>')

                h.append('</div>')

            h.append('</div>')  # table-card

    # ---- Enum Section ----
    h.append('<div id="enums-section" class="group-header">')
    h.append('<h2>Enums (Stammdaten-Wertetabellen)</h2>')
    h.append('</div>')

    h.append('<div class="enum-search">')
    h.append('<input type="text" id="enumSearchInput" placeholder="Enums filtern..." oninput="filterEnums()">')
    h.append('</div>')

    sorted_enums = sorted(enums.keys())

    for enum_name in sorted_enums:
        values = enums[enum_name]
        usage = enum_usage.get(enum_name, [])

        h.append(f'<div class="enum-card" id="enum-{enum_name}" data-name="{enum_name.lower()}">')
        h.append(f'<div class="enum-header" onclick="toggleEnum(this)">')
        h.append(f'<h4>{esc(enum_name)} <span class="enum-count">({len(values)} Werte)</span></h4>')
        h.append(f'<span class="enum-toggle">&#9654;</span>')
        h.append('</div>')

        h.append('<div class="enum-body" style="display:none;">')

        if usage:
            h.append('<div class="enum-usage">')
            h.append('<strong>Verwendet in:</strong> ')
            ulinks = []
            for ut, uc in usage:
                ulinks.append(f'<a href="#table-{ut}">{esc(ut)}.{esc(uc)}</a>')
            h.append(', '.join(ulinks))
            h.append('</div>')

        h.append('<table class="enum-table">')
        h.append('<thead><tr><th>Wert</th><th>Beschreibung</th></tr></thead>')
        h.append('<tbody>')
        for v in values:
            h.append(f'<tr><td><code>{esc(v["wert"])}</code></td><td>{esc(v["beschreibung"])}</td></tr>')
        h.append('</tbody></table>')
        h.append('</div>')  # enum-body
        h.append('</div>')  # enum-card

    h.append('</main>')  # main-content
    h.append('</div>')  # layout

    # Back to top button
    h.append('<button class="back-to-top" id="backToTop" onclick="window.scrollTo({top:0,behavior:\'smooth\'})" title="Nach oben">&#8679;</button>')

    # Footer
    h.append('<footer class="footer">')
    h.append(f'<p>ZIV Datenmodell 4.0 &mdash; {total_tables} Tabellen &middot; {total_relations} Relationen &middot; {total_enums} Enums &middot; {total_enum_values:,} Enum-Werte</p>')
    from datetime import date
    h.append(f'<p>Generiert am {date.today().isoformat()}</p>')
    h.append('</footer>')

    # JavaScript
    h.append('<script>')
    h.append(JS)
    h.append('</script>')

    h.append('</body>')
    h.append('</html>')

    return '\n'.join(h)

# ============================================================
# CSS
# ============================================================
CSS = """
:root {
    --bg: #f5f5f7;
    --card-bg: #ffffff;
    --accent: #0071e3;
    --accent-light: #e8f2ff;
    --text: #1d1d1f;
    --text-secondary: #6e6e73;
    --border: #e5e5e7;
    --header-bg: #f5f5f7;
    --row-alt: #fafafa;
    --pk-bg: #fff8e1;
    --fk-color: #0071e3;
    --radius: 16px;
    --shadow: 0 2px 12px rgba(0,0,0,0.08);
}

* { box-sizing: border-box; margin: 0; padding: 0; }

html {
    scroll-behavior: smooth;
    -webkit-font-smoothing: antialiased;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
    line-height: 1.6;
    font-size: 15px;
}

/* Hero */
.hero {
    background: linear-gradient(135deg, #1d1d1f 0%, #2c2c2e 100%);
    color: white;
    padding: 60px 24px 50px;
    text-align: center;
}
.hero-content { max-width: 900px; margin: 0 auto; }
.hero h1 { font-size: 48px; font-weight: 700; letter-spacing: -0.5px; margin-bottom: 8px; }
.hero .subtitle { font-size: 20px; color: #a1a1a6; margin-bottom: 36px; font-weight: 400; }
.stats { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
.stat-card {
    background: rgba(255,255,255,0.08);
    border-radius: 12px;
    padding: 20px 28px;
    backdrop-filter: blur(10px);
    min-width: 140px;
    display: flex;
    flex-direction: column;
}
.stat-number { font-size: 32px; font-weight: 700; color: #0a84ff; }
.stat-label { font-size: 13px; color: #a1a1a6; margin-top: 4px; }

/* Search */
.search-bar {
    max-width: 1200px;
    margin: -24px auto 0;
    padding: 0 24px;
    position: relative;
    z-index: 10;
}
.search-bar input {
    width: 100%;
    padding: 16px 24px;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    background: var(--card-bg);
    box-shadow: var(--shadow);
    outline: none;
    font-family: inherit;
}
.search-bar input:focus {
    box-shadow: 0 0 0 3px rgba(0,113,227,0.3), var(--shadow);
}

/* Layout */
.layout {
    max-width: 1200px;
    margin: 32px auto 0;
    padding: 0 24px;
    display: flex;
    gap: 24px;
    align-items: flex-start;
}

/* Sidebar */
.sidebar {
    width: 260px;
    flex-shrink: 0;
    position: sticky;
    top: 20px;
    max-height: calc(100vh - 40px);
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
}
.sidebar-inner {
    background: var(--card-bg);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    padding: 20px;
}
.sidebar h3 {
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    color: var(--text-secondary);
    margin-bottom: 16px;
}
.nav-group { margin-bottom: 4px; }
.nav-group-title {
    font-size: 13px;
    font-weight: 600;
    padding: 8px 8px;
    cursor: pointer;
    border-radius: 8px;
    display: flex;
    align-items: center;
    gap: 6px;
    user-select: none;
}
.nav-group-title:hover { background: var(--bg); }
.nav-group-title .arrow {
    font-size: 10px;
    transition: transform 0.2s;
    display: inline-block;
}
.nav-group-title.open .arrow { transform: rotate(90deg); }
.nav-group-items {
    display: none;
    padding-left: 20px;
}
.nav-group-items.open { display: block; }
.nav-item {
    display: block;
    font-size: 12px;
    color: var(--text-secondary);
    text-decoration: none;
    padding: 3px 8px;
    border-radius: 6px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.nav-item:hover { background: var(--accent-light); color: var(--accent); }

/* Main */
.main-content {
    flex: 1;
    min-width: 0;
}

/* Group headers */
.group-header {
    margin: 32px 0 16px;
}
.group-header:first-child { margin-top: 0; }
.group-header h2 {
    font-size: 28px;
    font-weight: 700;
    letter-spacing: -0.3px;
}

/* Table card */
.table-card {
    background: var(--card-bg);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    margin-bottom: 20px;
    overflow: hidden;
}
.table-title {
    font-size: 20px;
    font-weight: 600;
    padding: 20px 24px 12px;
    border-bottom: 1px solid var(--border);
}
.table-responsive { overflow-x: auto; }

/* Column tables */
.columns-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
}
.columns-table thead th {
    text-align: left;
    padding: 10px 12px;
    background: var(--header-bg);
    font-weight: 600;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.3px;
    color: var(--text-secondary);
    border-bottom: 1px solid var(--border);
    white-space: nowrap;
}
.columns-table tbody tr { border-bottom: 1px solid #f0f0f2; }
.columns-table tbody tr:nth-child(even) { background: var(--row-alt); }
.columns-table tbody tr.pk-row { background: var(--pk-bg); }
.columns-table td {
    padding: 8px 12px;
    vertical-align: top;
}
.columns-table .col-name { white-space: nowrap; }
.columns-table .center { text-align: center; }
.columns-table code {
    font-family: 'SF Mono', SFMono-Regular, Menlo, Consolas, monospace;
    font-size: 12px;
    background: #f0f0f2;
    padding: 1px 6px;
    border-radius: 4px;
}
.desc-cell { max-width: 420px; font-size: 12px; color: var(--text-secondary); line-height: 1.5; }

/* Badges */
.badge {
    display: inline-block;
    font-size: 10px;
    font-weight: 700;
    padding: 1px 6px;
    border-radius: 4px;
    vertical-align: middle;
    letter-spacing: 0.3px;
}
.badge-pk { background: #ffd60a; color: #1d1d1f; }
.badge-fk { background: var(--accent-light); color: var(--accent); }
.badge-fk[title*="Polymorph"] { background: #e8f5e9; color: #2e7d32; }
.badge-qs { background: #0071e3; color: #fff; }
.badge-19 { background: #30d158; color: #fff; }
.badge-nein { background: #ff3b30; color: #fff; }

/* FK / Enum refs */
.fk-ref { color: var(--accent); }
.fk-ref a { color: var(--accent); text-decoration: none; font-weight: 500; }
.fk-ref a:hover { text-decoration: underline; }
.enum-ref { color: #30d158; }
.enum-ref a { color: #248a3d; text-decoration: none; font-weight: 500; }
.enum-ref a:hover { text-decoration: underline; }
.check-info { color: var(--text-secondary); font-style: italic; font-size: 11px; }

/* Relations box */
.relations-box {
    padding: 12px 24px 16px;
    background: var(--header-bg);
    border-top: 1px solid var(--border);
    font-size: 13px;
}
.rel-section { margin-bottom: 4px; }
.rel-section a { color: var(--accent); text-decoration: none; font-weight: 500; }
.rel-section a:hover { text-decoration: underline; }
.rel-detail { color: var(--text-secondary); font-size: 11px; }

/* Enum section */
.enum-search {
    margin-bottom: 16px;
}
.enum-search input {
    width: 100%;
    padding: 12px 20px;
    border: 1px solid var(--border);
    border-radius: 10px;
    font-size: 14px;
    background: var(--card-bg);
    outline: none;
    font-family: inherit;
}
.enum-search input:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px rgba(0,113,227,0.15);
}

.enum-card {
    background: var(--card-bg);
    border-radius: 12px;
    box-shadow: var(--shadow);
    margin-bottom: 10px;
    overflow: hidden;
}
.enum-header {
    padding: 14px 20px;
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    user-select: none;
}
.enum-header:hover { background: var(--bg); }
.enum-header h4 { font-size: 15px; font-weight: 600; margin: 0; }
.enum-count { color: var(--text-secondary); font-weight: 400; font-size: 13px; }
.enum-toggle {
    font-size: 12px;
    color: var(--text-secondary);
    transition: transform 0.2s;
    display: inline-block;
}
.enum-toggle.open { transform: rotate(90deg); }

.enum-body { padding: 0 20px 16px; }
.enum-usage {
    font-size: 12px;
    color: var(--text-secondary);
    margin-bottom: 10px;
    padding: 8px 12px;
    background: var(--accent-light);
    border-radius: 8px;
}
.enum-usage a { color: var(--accent); text-decoration: none; }
.enum-usage a:hover { text-decoration: underline; }

.enum-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
}
.enum-table thead th {
    text-align: left;
    padding: 8px 10px;
    background: var(--header-bg);
    font-weight: 600;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.3px;
    color: var(--text-secondary);
    border-bottom: 1px solid var(--border);
}
.enum-table tbody tr { border-bottom: 1px solid #f0f0f2; }
.enum-table tbody tr:nth-child(even) { background: var(--row-alt); }
.enum-table td { padding: 6px 10px; }
.enum-table code {
    font-family: 'SF Mono', SFMono-Regular, Menlo, Consolas, monospace;
    font-size: 12px;
    background: #f0f0f2;
    padding: 1px 5px;
    border-radius: 3px;
}

/* Back to top */
.back-to-top {
    position: fixed;
    bottom: 32px;
    right: 32px;
    width: 48px;
    height: 48px;
    border-radius: 50%;
    border: none;
    background: var(--accent);
    color: white;
    font-size: 24px;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0,113,227,0.4);
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    transition: opacity 0.3s, transform 0.3s;
}
.back-to-top:hover { transform: scale(1.1); }
.back-to-top.visible { display: flex; }

/* Footer */
.footer {
    text-align: center;
    padding: 40px 24px;
    color: var(--text-secondary);
    font-size: 13px;
    margin-top: 40px;
}

/* Responsive */
@media (max-width: 900px) {
    .sidebar {
        display: none;
    }
    .layout {
        flex-direction: column;
    }
    .hero h1 { font-size: 32px; }
    .stats { gap: 10px; }
    .stat-card { padding: 14px 18px; min-width: 100px; }
    .stat-number { font-size: 24px; }
}

@media (max-width: 600px) {
    .hero { padding: 40px 16px 36px; }
    .hero h1 { font-size: 26px; }
    .hero .subtitle { font-size: 16px; }
    .layout { padding: 0 12px; }
    .table-title { padding: 16px 16px 10px; font-size: 17px; }
    .columns-table td, .columns-table th { padding: 6px 8px; }
    .relations-box { padding: 10px 16px 12px; }
}

/* Scrollbar styling */
.sidebar::-webkit-scrollbar { width: 6px; }
.sidebar::-webkit-scrollbar-track { background: transparent; }
.sidebar::-webkit-scrollbar-thumb { background: #c7c7cc; border-radius: 3px; }
"""

# ============================================================
# JavaScript
# ============================================================
JS = """
// Toggle sidebar groups
function toggleGroup(el) {
    el.classList.toggle('open');
    var items = el.nextElementSibling;
    if (items) items.classList.toggle('open');
}

// Toggle enum cards
function toggleEnum(el) {
    var body = el.nextElementSibling;
    var toggle = el.querySelector('.enum-toggle');
    if (body.style.display === 'none') {
        body.style.display = 'block';
        if (toggle) toggle.classList.add('open');
    } else {
        body.style.display = 'none';
        if (toggle) toggle.classList.remove('open');
    }
}

// Filter all (tables + enums)
function filterAll() {
    var q = document.getElementById('searchInput').value.toLowerCase();
    // Filter table cards
    document.querySelectorAll('.table-card').forEach(function(card) {
        var name = card.getAttribute('data-name') || '';
        var text = card.textContent.toLowerCase();
        card.style.display = (q === '' || name.includes(q) || text.includes(q)) ? '' : 'none';
    });
    // Filter enum cards
    document.querySelectorAll('.enum-card').forEach(function(card) {
        var name = card.getAttribute('data-name') || '';
        var text = card.textContent.toLowerCase();
        card.style.display = (q === '' || name.includes(q) || text.includes(q)) ? '' : 'none';
    });
}

// Filter enums only
function filterEnums() {
    var q = document.getElementById('enumSearchInput').value.toLowerCase();
    document.querySelectorAll('.enum-card').forEach(function(card) {
        var name = card.getAttribute('data-name') || '';
        var text = card.textContent.toLowerCase();
        card.style.display = (q === '' || name.includes(q) || text.includes(q)) ? '' : 'none';
    });
}

// Back to top button
window.addEventListener('scroll', function() {
    var btn = document.getElementById('backToTop');
    if (window.scrollY > 400) {
        btn.classList.add('visible');
    } else {
        btn.classList.remove('visible');
    }
});

// Open first sidebar group on load
document.addEventListener('DOMContentLoaded', function() {
    var first = document.querySelector('.nav-group-title');
    if (first) {
        first.classList.add('open');
        var items = first.nextElementSibling;
        if (items) items.classList.add('open');
    }
});
"""

# ============================================================
# Main
# ============================================================
if __name__ == '__main__':
    import os
    base = os.path.dirname(os.path.abspath(__file__))

    print("Parsing schema.sql...")
    tables = parse_schema(os.path.join(base, 'schema.sql'))
    print(f"  Found {len(tables)} tables")

    print("Parsing stammdaten_enums.sql...")
    enums = parse_enums(os.path.join(base, 'stammdaten_enums.sql'))
    print(f"  Found {len(enums)} enums")

    print("Parsing DBML for relations...")
    relations = parse_relations_from_dbml(os.path.join(base, 'Datenmodell4_0.dbml'))
    print(f"  Found {len(relations)} relations")

    print("Parsing Datenmodell4_0.dbml for notes...")
    dbml_notes, dbml_arts = parse_dbml_notes(os.path.join(base, 'Datenmodell4_0.dbml'))
    print(f"  Found notes for {len(dbml_notes)} tables")

    print("Generating HTML...")
    html_content = generate_html(tables, enums, relations, dbml_notes, dbml_arts)

    output_path = os.path.join(base, 'dokumentation.html')
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(html_content)

    size_kb = os.path.getsize(output_path) / 1024
    print(f"Done! Written to {output_path} ({size_kb:.0f} KB)")
