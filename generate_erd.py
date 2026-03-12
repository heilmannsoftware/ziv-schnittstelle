#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate interactive ER diagram (erd.html) from ZIV Datenmodell 4.0"""

import json
import os
import re

# ============================================================
# 1. Parse schema.sql — extract tables with PK and FK columns
# ============================================================
def parse_schema(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    tables = {}
    pattern = r'CREATE\s+TABLE\s+(\w+)\s*\((.*?)\);'
    for m in re.finditer(pattern, content, re.DOTALL):
        table_name = m.group(1)
        body = m.group(2)

        columns = []
        fks = []

        lines = [l.strip() for l in body.split('\n') if l.strip()]

        for line in lines:
            line = line.rstrip(',')

            fk_match = re.match(
                r'FOREIGN\s+KEY\s*\((\w+)\)\s+REFERENCES\s+(\w+)\s*\((\w+)\)',
                line, re.IGNORECASE)
            if fk_match:
                fks.append({
                    'column': fk_match.group(1),
                    'ref_table': fk_match.group(2),
                    'ref_column': fk_match.group(3)
                })
                continue

            col_match = re.match(
                r'"?(\w+)"?\s+(INTEGER|TEXT|REAL|BLOB|DATE|DATETIME|FLOAT|BOOL|INT)\b(.*)',
                line, re.IGNORECASE)
            if col_match:
                col_name = col_match.group(1)
                rest = col_match.group(3)
                is_pk = 'PRIMARY KEY' in rest.upper()

                # Extract CHECK IN values
                check_values = None
                check_match = re.search(
                    r"CHECK\s*\(\s*\"?\w+\"?\s+IN\s*\('([^)]+)'\)\s*\)", rest)
                if check_match:
                    check_values = [v.strip().strip("'")
                                    for v in check_match.group(1).split("', '")]

                is_not_null = 'NOT NULL' in rest.upper()

                columns.append({
                    'name': col_name,
                    'pk': is_pk,
                    'not_null': is_not_null,
                    'check_values': check_values,
                })

        fk_set = {fk['column'] for fk in fks}
        for col in columns:
            col['fk'] = col['name'] in fk_set

        tables[table_name] = {
            'columns': columns,
            'fks': fks
        }

    return tables


# ============================================================
# 2. Parse relations from DBML refs
# ============================================================
def parse_relations_from_dbml(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    relations = []
    current_table = None

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
                    col_name = col_match.group(1)
                    kardinalitaet = '1:1' if ref_type == '-' else 'n:1'
                    not_null = 'not null' in stripped.lower()
                    relations.append({
                        'child': current_table,
                        'fk_field': col_name,
                        'parent': parent_table,
                        'kardinalitaet': kardinalitaet,
                        'not_null': not_null,
                    })

    return relations


# ============================================================
# 3. Table groups (same as generate_docs.py)
# ============================================================
GROUPS = [
    ("Stammdaten/Verwaltung", ['Meta', 'Kehrbezirk', 'Mitarbeiter', 'Vertreter', 'Kommunikation', 'Fremdfirma', 'Untere_Aufsichtsbehoerde']),
    ("Standort", ['Ort', 'Strasse', 'Grundstueck', 'Grundstueck_Eigentuemer', 'Gebaeude_Gebaeudeteil', 'Gebaeude_Eigentuemer', 'Gebaeudeeigenschaft']),
    ("Abgasanlagen", ['Abgasanlage', 'Abschnitt', 'Schicht', 'Muendung', 'Reinigungsart', 'Zubehoer']),
    ("Lueftungsanlagen", ['Lueftungsanlage', 'Raumlueftung', 'Raumlueftungsleitung', 'Raumluftoeffnung', 'Mess_Pruefergebnis_Raumluftoeffnung']),
    ("Nutzung/Wohnung/Raum", ['Nutzungseinheit', 'Nutzungseinheit_Eigentuemer', 'Wohnung', 'Raum']),
    ("Feuerstaetten", ['Feuerstaette', 'BImSchV44_Aggregationspool', 'Gasfeuerstaette', 'Oelfeuerstaette', 'Feste_Brennstoff_Feuerstaette', 'Sonderfeuerstaette', 'Waermepumpe', 'Feste_Brennstoff_Ableitbedingungen', 'Nachgeschalteter_Waermeaustauscher', 'Brennstoffversorgungsanlage', 'Raeucheranlage', 'Effizienzlabel']),
    ("Messergebnisse", ['Mess_Pruefergebnis_Gasfeuerstaette', 'Mess_Pruefergebnis_44BImSchV_Gasfeuerstaette', 'Mess_Pruefergebnis_Oelfeuerstaette', 'Mess_Pruefergebnis_44BImSchV_Oelfeuerstaette', 'Mess_Pruefergebnis_Feststofffeuerstaette_HK', 'Mess_Pruefergebnis_Feststofffeuerstaette_ERF', 'Mess_Pruefergebnis_Sonderfeuerstaette', 'Mess_Pruefergebnis_Waermepumpe', 'Messgeraet', 'Messgeraet_44', 'Messunsicherheit']),
    ("Dunstabzug", ['Dunstabzuganlage_Leitung', 'Dunstabzugsanlage_Haube', 'Dunstabzugsanlage_Feuerstaette', 'Abschnitt_Dunstabzugsleitung', 'Ventilator_Dunstabzug', 'Mess_Pruefergebnis_Dunstabzugsleitung']),
    ("Verbrennungsluft", ['Verbrennungsluftzufuhr_Element', 'Feuerst_Verbr_Element']),
    ("GEG/Effizienz", ['GEG', 'Pruefergebnis_GEG']),
    ("Hoheitliche Taetigkeiten", ['Abnahme', 'Abnahme_Anlage', 'Anlassbezogene_Ueberpruefung', 'Sonstige_Arbeit', 'Feuerstaettenschau', 'Pruefergebnis_Feuerstaettenschau']),
    ("Feuerstaettenbescheid", ['Feuerstaettenbescheid_Grunddaten', 'Bescheid_Position', 'Bescheid_Termin_Position']),
    ("Abrechnung", ['Leistung', 'Aufteilung_Leistung', 'Datum_Ausfuehrung_Leistung', 'Rechnung', 'Landesrechtliche_Vorschrift', 'Bundes_KUEO']),
    ("Kehrbuch", ['Kehrbuch', 'Kehrbuch_Gebaeude', 'Kehrbuch_Gebaeude_Eigentuemer', 'Kehrbuch_Nutzungseinheit', 'Kehrbuch_Anlage', 'Kehrbuch_Taetigkeit', 'Kehrbuch_Abnahme', 'Kehrbuch_Anlassbezogene_Ueberpruefung', 'Kehrbuch_Feuerstaettenschau', 'Mangel']),
    ("Sonstiges", ['Dachskizze', 'Dachskizze_Element', 'Dokument', 'Gefaehrdungsbeurteilung']),
]

GROUP_COLORS = [
    "#5B8DEF",  # Stammdaten - Blue
    "#43A047",  # Standort - Green
    "#EF5350",  # Abgasanlagen - Red
    "#AB47BC",  # Lueftungsanlagen - Purple
    "#FF7043",  # Nutzung - Deep Orange
    "#FFA726",  # Feuerstaetten - Orange
    "#26C6DA",  # Messergebnisse - Cyan
    "#8D6E63",  # Dunstabzug - Brown
    "#EC407A",  # Verbrennungsluft - Pink
    "#66BB6A",  # GEG - Light Green
    "#7E57C2",  # Hoheitliche - Deep Purple
    "#FFCA28",  # Feuerstaettenbescheid - Amber
    "#29B6F6",  # Abrechnung - Light Blue
    "#78909C",  # Kehrbuch - Blue Grey
    "#BDBDBD",  # Sonstiges - Grey
]


# ============================================================
# 4. Build graph data
# ============================================================
def build_graph_data(tables, relations):
    # Map table -> group
    table_group = {}
    for idx, (gname, gtables) in enumerate(GROUPS):
        for t in gtables:
            table_group[t] = idx

    table_set = set(tables.keys())

    # Detect polymorphic references (same logic as generate_docs.py)
    poly_patterns = [
        ('Anlagetyp', 'ID_Anlage'),
        ('Herkunftstyp', 'ID_Herkunft'),
    ]
    poly_extra_fks = {}  # tname -> set of poly FK col names
    poly_relations = []

    for tname, tdata in tables.items():
        for disc_col, id_col in poly_patterns:
            has_disc = None
            has_id = False
            for col in tdata['columns']:
                if col['name'] == disc_col and col.get('check_values'):
                    has_disc = col['check_values']
                if col['name'] == id_col:
                    has_id = True
            if has_disc and has_id:
                targets = [v for v in has_disc if v in table_set]
                if targets:
                    if tname not in poly_extra_fks:
                        poly_extra_fks[tname] = set()
                    poly_extra_fks[tname].add(id_col)
                    for target in targets:
                        poly_relations.append({
                            'child': tname,
                            'fk_field': f'{id_col} ({disc_col})',
                            'parent': target,
                            'kardinalitaet': 'n:1',
                            'poly': True,
                        })

    nodes = []
    for tname, tdata in tables.items():
        pk_cols = [c['name'] for c in tdata['columns'] if c['pk']]
        fk_cols = [c['name'] for c in tdata['columns'] if c['fk']]
        # Add polymorphic FK columns (marked with *)
        poly_fk_names = poly_extra_fks.get(tname, set())
        for pf in poly_fk_names:
            if pf not in fk_cols:
                fk_cols.append(pf + '*')
        group_idx = table_group.get(tname, len(GROUPS) - 1)
        nodes.append({
            'id': tname,
            'pk': pk_cols,
            'fk': fk_cols,
            'group': group_idx,
        })

    # Build column not_null lookup from schema for polymorphic FKs
    col_not_null = {}
    for tname, tdata in tables.items():
        for col in tdata['columns']:
            col_not_null[(tname, col['name'])] = col.get('not_null', False)

    # Build links from DBML relations + polymorphic relations
    links = []
    for rel in relations:
        if rel['child'] in table_set and rel['parent'] in table_set:
            links.append({
                'source': rel['child'],
                'target': rel['parent'],
                'fk_field': rel['fk_field'],
                'kardinalitaet': rel['kardinalitaet'],
                'not_null': rel.get('not_null', False),
            })
    for rel in poly_relations:
        # Derive not_null from schema column definition (ID_Anlage / ID_Herkunft)
        id_col = rel['fk_field'].split(' ')[0]  # "ID_Anlage (Anlagetyp)" -> "ID_Anlage"
        nn = col_not_null.get((rel['child'], id_col), False)
        links.append({
            'source': rel['child'],
            'target': rel['parent'],
            'fk_field': rel['fk_field'],
            'kardinalitaet': rel['kardinalitaet'],
            'poly': True,
            'not_null': nn,
        })

    return nodes, links


# ============================================================
# 5. HTML template
# ============================================================
def generate_html(nodes, links):
    groups_json = json.dumps(
        [{'name': g[0], 'color': GROUP_COLORS[i]} for i, g in enumerate(GROUPS)],
        ensure_ascii=False)
    nodes_json = json.dumps(nodes, ensure_ascii=False)
    links_json = json.dumps(links, ensure_ascii=False)

    return f'''<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZIV Datenmodell 4.0 - ER-Diagramm</title>
<script src="https://d3js.org/d3.v7.min.js"></script>
<style>
* {{ box-sizing: border-box; margin: 0; padding: 0; }}
html, body {{ width: 100%; height: 100%; overflow: hidden; }}
body {{
    font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    background: #1a1a2e;
    color: #e0e0e0;
}}

/* Header bar */
.header {{
    position: fixed; top: 0; left: 0; right: 0; z-index: 100;
    background: rgba(26, 26, 46, 0.95);
    backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(255,255,255,0.1);
    padding: 10px 20px;
    display: flex; align-items: center; gap: 16px;
    height: 52px;
}}
.header h1 {{
    font-size: 16px; font-weight: 700; color: #fff;
    white-space: nowrap;
}}
.header .stats {{
    font-size: 12px; color: #888; white-space: nowrap;
}}
.header .search-box {{
    flex: 0 0 260px;
    position: relative;
}}
.header .search-box input {{
    width: 100%; padding: 6px 12px 6px 32px;
    background: rgba(255,255,255,0.08);
    border: 1px solid rgba(255,255,255,0.15);
    border-radius: 8px; color: #fff; font-size: 13px;
    outline: none; font-family: inherit;
}}
.header .search-box input:focus {{
    border-color: rgba(91,141,239,0.6);
    background: rgba(255,255,255,0.12);
}}
.header .search-box::before {{
    content: "\\1F50D"; position: absolute; left: 10px; top: 50%;
    transform: translateY(-50%); font-size: 13px; opacity: 0.5;
}}
.controls {{
    display: flex; gap: 6px; margin-left: auto;
}}
.controls button {{
    padding: 5px 12px; font-size: 12px; font-family: inherit;
    background: rgba(255,255,255,0.08); border: 1px solid rgba(255,255,255,0.15);
    border-radius: 6px; color: #ccc; cursor: pointer;
    transition: background 0.15s;
}}
.controls button:hover {{ background: rgba(255,255,255,0.15); }}

/* Legend */
.legend {{
    position: fixed; bottom: 16px; left: 16px; z-index: 100;
    background: rgba(26, 26, 46, 0.92);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 10px; padding: 12px 14px;
    max-height: calc(100vh - 100px);
    overflow-y: auto;
    font-size: 11px;
    transition: transform 0.2s;
}}
.legend.collapsed {{
    transform: translateY(calc(100% - 36px));
}}
.legend-title {{
    font-weight: 700; font-size: 12px; margin-bottom: 8px;
    cursor: pointer; user-select: none; color: #aaa;
}}
.legend-item {{
    display: flex; align-items: center; gap: 8px;
    padding: 2px 0; cursor: pointer;
}}
.legend-item:hover {{ opacity: 0.7; }}
.legend-dot {{
    width: 10px; height: 10px; border-radius: 3px; flex-shrink: 0;
}}
.legend-label {{ color: #bbb; }}

/* Tooltip */
.tooltip {{
    position: fixed; z-index: 200; pointer-events: none;
    background: rgba(20, 20, 40, 0.95);
    border: 1px solid rgba(255,255,255,0.2);
    border-radius: 8px; padding: 10px 14px;
    font-size: 12px; max-width: 320px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.5);
    display: none;
}}
.tooltip .tt-title {{
    font-weight: 700; font-size: 14px; margin-bottom: 6px;
}}
.tooltip .tt-group {{
    font-size: 11px; color: #888; margin-bottom: 6px;
}}
.tooltip .tt-cols {{
    font-size: 11px; line-height: 1.6;
}}
.tooltip .tt-pk {{ color: #FFD60A; }}
.tooltip .tt-fk {{ color: #5B8DEF; }}

/* SVG */
svg {{ display: block; }}

/* Link labels */
.link-label {{
    font-size: 9px;
    fill: #666;
    pointer-events: none;
}}
</style>
</head>
<body>

<div class="header">
    <h1>ZIV Datenmodell 4.0</h1>
    <span class="stats" id="statsText"></span>
    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Tabelle suchen..." autocomplete="off">
    </div>
    <div class="controls">
        <button onclick="resetView()" title="Ansicht zuruecksetzen">Reset</button>
        <button onclick="toggleLabels()" title="Kantenbezeichnungen ein/aus" id="labelBtn">Labels aus</button>
        <button onclick="toggleFixed()" title="Alle Knoten fixieren/loesen" id="fixBtn">Fixieren</button>
        <button onclick="toggleEdges()" title="Kanten hover/sichtbar umschalten" id="edgeBtn">Kanten sichtbar</button>
    </div>
</div>

<div class="legend" id="legend">
    <div class="legend-title" onclick="toggleLegend()">Gruppen</div>
    <div class="legend-items" id="legendItems"></div>
</div>

<div class="tooltip" id="tooltip"></div>
<script>
// ============================================================
// Data
// ============================================================
const groups = {groups_json};
const nodes = {nodes_json};
const links = {links_json};

// ============================================================
// State
// ============================================================
let showLabels = false;
let allFixed = false;
let highlightedNode = null;
let searchTerm = '';
let edgesMode = 'hover'; // 'hover' or 'visible'

// Stats
document.getElementById('statsText').textContent =
    nodes.length + ' Tabellen \\u00B7 ' + links.length + ' Relationen';

// Group name lookup
const groupName = {{}};
groups.forEach((g, i) => groupName[i] = g.name);

// ============================================================
// SVG setup
// ============================================================
const width = window.innerWidth;
const height = window.innerHeight;

const svg = d3.select('body').append('svg')
    .attr('width', width)
    .attr('height', height);

// Zoom
const g = svg.append('g');
const zoom = d3.zoom()
    .scaleExtent([0.1, 4])
    .on('zoom', (event) => g.attr('transform', event.transform));
svg.call(zoom);

// Crow's Foot markers
const defs = svg.append('defs');

// "One" marker: vertical bar |
function addOneMarker(id, color) {{
    const m = defs.append('marker')
        .attr('id', id)
        .attr('viewBox', '0 -6 4 12')
        .attr('refX', 2)
        .attr('refY', 0)
        .attr('markerWidth', 4)
        .attr('markerHeight', 12)
        .attr('orient', 'auto');
    m.append('line')
        .attr('x1', 2).attr('y1', -5).attr('x2', 2).attr('y2', 5)
        .attr('stroke', color).attr('stroke-width', 1.5);
}}

// "Many" marker: crow's foot >|
function addManyMarker(id, color) {{
    const m = defs.append('marker')
        .attr('id', id)
        .attr('viewBox', '0 -8 12 16')
        .attr('refX', 10)
        .attr('refY', 0)
        .attr('markerWidth', 10)
        .attr('markerHeight', 14)
        .attr('orient', 'auto');
    m.append('line')
        .attr('x1', 0).attr('y1', -6).attr('x2', 10).attr('y2', 0)
        .attr('stroke', color).attr('stroke-width', 1.5);
    m.append('line')
        .attr('x1', 0).attr('y1', 6).attr('x2', 10).attr('y2', 0)
        .attr('stroke', color).attr('stroke-width', 1.5);
    m.append('line')
        .attr('x1', 10).attr('y1', -6).attr('x2', 10).attr('y2', 6)
        .attr('stroke', color).attr('stroke-width', 1.5);
}}

// Normal markers (muted)
addOneMarker('marker-one', '#555');
addManyMarker('marker-many', '#555');
// Colored highlight markers per cardinality type
addOneMarker('marker-one-blue', '#5B8DEF');
addManyMarker('marker-many-blue', '#5B8DEF');
addOneMarker('marker-one-orange', '#FF7043');
addOneMarker('marker-one-green', '#4CAF50');
addManyMarker('marker-many-green', '#4CAF50');

// ============================================================
// Force simulation
// ============================================================
const simulation = d3.forceSimulation(nodes)
    .force('link', d3.forceLink(links).id(d => d.id).distance(140).strength(0.4))
    .force('charge', d3.forceManyBody().strength(-600).distanceMax(600))
    .force('center', d3.forceCenter(width / 2, height / 2))
    .force('collision', d3.forceCollide().radius(60))
    .force('x', d3.forceX(width / 2).strength(0.03))
    .force('y', d3.forceY(height / 2).strength(0.03));

// ============================================================
// Draw links
// ============================================================
// Edge color by type
function edgeColor(d) {{
    if (d.poly) return '#4CAF50';
    return d.kardinalitaet === '1:1' ? '#FF7043' : '#5B8DEF';
}}

// Marker assignment helpers
function markerStart(d, highlight) {{
    if (d.kardinalitaet === 'n:1') {{
        if (highlight) return d.poly ? 'url(#marker-many-green)' : 'url(#marker-many-blue)';
        return 'url(#marker-many)';
    }}
    // 1:1
    if (highlight) return d.poly ? 'url(#marker-one-green)' : 'url(#marker-one-orange)';
    return 'url(#marker-one)';
}}
function markerEnd(d, highlight) {{
    if (highlight) {{
        if (d.poly) return 'url(#marker-one-green)';
        return d.kardinalitaet === '1:1' ? 'url(#marker-one-orange)' : 'url(#marker-one-blue)';
    }}
    return 'url(#marker-one)';
}}

const linkGroup = g.append('g').attr('class', 'links');
const link = linkGroup.selectAll('line')
    .data(links)
    .join('line')
    .attr('stroke', d => edgeColor(d))
    .attr('stroke-width', 0.5)
    .attr('stroke-dasharray', d => d.poly ? '6,3' : null)
    .attr('opacity', 0.08)
    .attr('marker-start', d => markerStart(d, false))
    .attr('marker-end', d => markerEnd(d, false));

const linkLabel = linkGroup.selectAll('text')
    .data(links)
    .join('text')
    .attr('class', 'link-label')
    .text(d => d.fk_field)
    .attr('display', 'none');

// ============================================================
// Draw nodes
// ============================================================
const nodeGroup = g.append('g').attr('class', 'nodes');
const node = nodeGroup.selectAll('g')
    .data(nodes)
    .join('g')
    .attr('class', 'node')
    .call(d3.drag()
        .on('start', dragstarted)
        .on('drag', dragged)
        .on('end', dragended));

// Node background rect
node.append('rect')
    .attr('rx', 6)
    .attr('ry', 6)
    .attr('stroke', d => groups[d.group]?.color || '#888')
    .attr('stroke-width', 2)
    .attr('fill', d => {{
        const c = groups[d.group]?.color || '#888';
        return c + '18';
    }});

// Table name
node.append('text')
    .attr('class', 'node-title')
    .attr('text-anchor', 'middle')
    .attr('fill', '#fff')
    .attr('font-size', '11px')
    .attr('font-weight', '700')
    .text(d => d.id);

// Key columns (PK + FK)
node.each(function(d) {{
    const el = d3.select(this);
    const keyCols = [];
    d.pk.forEach(c => keyCols.push({{ name: c, type: 'pk' }}));
    d.fk.forEach(c => keyCols.push({{ name: c, type: 'fk' }}));

    keyCols.forEach((col, i) => {{
        el.append('text')
            .attr('class', 'node-col')
            .attr('text-anchor', 'start')
            .attr('fill', col.type === 'pk' ? '#FFD60A' : '#5B8DEF')
            .attr('font-size', '9px')
            .text((col.type === 'pk' ? 'PK ' : 'FK ') + col.name);
    }});
}});

// Size rects to content
node.each(function(d) {{
    const el = d3.select(this);
    const texts = el.selectAll('text');
    let maxW = 0;
    texts.each(function() {{
        const w = this.getComputedTextLength();
        if (w > maxW) maxW = w;
    }});

    const keyCols = d.pk.length + d.fk.length;
    const headerH = 20;
    const colH = keyCols * 14;
    const padding = 12;
    const totalH = headerH + colH + 8;
    const totalW = maxW + padding * 2;

    d._w = totalW;
    d._h = totalH;

    el.select('rect')
        .attr('x', -totalW / 2)
        .attr('y', -headerH - 2)
        .attr('width', totalW)
        .attr('height', totalH);

    // Reposition key column texts
    let yOff = 14;
    el.selectAll('.node-col').each(function(_, i) {{
        d3.select(this)
            .attr('x', -totalW / 2 + 8)
            .attr('y', yOff);
        yOff += 14;
    }});
}});

// ============================================================
// Hover & Click interactions
// ============================================================
const tooltip = document.getElementById('tooltip');

node.on('mouseover', function(event, d) {{
    // Show tooltip
    const pkList = d.pk.map(c => '<span class="tt-pk">PK ' + c + '</span>').join('<br>');
    const fkList = d.fk.map(c => '<span class="tt-fk">FK ' + c + '</span>').join('<br>');
    const cols = [pkList, fkList].filter(x => x).join('<br>');
    tooltip.innerHTML =
        '<div class="tt-title">' + d.id + '</div>' +
        '<div class="tt-group" style="color:' + (groups[d.group]?.color || '#888') + '">' +
        (groupName[d.group] || 'Sonstige') + '</div>' +
        '<div class="tt-cols">' + cols + '</div>';
    tooltip.style.display = 'block';
    updateTooltipPos(event);
    // Highlight connected edges on hover (if no node is click-locked)
    if (!highlightedNode) {{
        highlightNode(d.id);
    }}
}})
.on('mousemove', function(event) {{
    updateTooltipPos(event);
}})
.on('mouseout', function() {{
    tooltip.style.display = 'none';
    // Remove highlight if no node is click-locked
    if (!highlightedNode) {{
        clearHighlight();
    }}
}})
.on('click', function(event, d) {{
    event.stopPropagation();
    if (highlightedNode === d.id) {{
        highlightedNode = null;
        clearHighlight();
    }} else {{
        highlightedNode = d.id;
        highlightNode(d.id);
    }}
}});

svg.on('click', function() {{
    highlightedNode = null;
    clearHighlight();
}});

function updateTooltipPos(event) {{
    const x = event.clientX + 14;
    const y = event.clientY + 14;
    const tw = tooltip.offsetWidth;
    const th = tooltip.offsetHeight;
    tooltip.style.left = (x + tw > window.innerWidth ? event.clientX - tw - 10 : x) + 'px';
    tooltip.style.top = (y + th > window.innerHeight ? event.clientY - th - 10 : y) + 'px';
}}

// Connected set for a node
function getConnected(nodeId) {{
    const connected = new Set([nodeId]);
    const connectedLinks = new Set();
    links.forEach((l, i) => {{
        const sid = typeof l.source === 'object' ? l.source.id : l.source;
        const tid = typeof l.target === 'object' ? l.target.id : l.target;
        if (sid === nodeId || tid === nodeId) {{
            connected.add(sid);
            connected.add(tid);
            connectedLinks.add(i);
        }}
    }});
    return {{ connected, connectedLinks }};
}}

function highlightNode(nodeId) {{
    const {{ connected, connectedLinks }} = getConnected(nodeId);

    node.select('rect')
        .attr('opacity', d => connected.has(d.id) ? 1 : 0.12);
    node.selectAll('text')
        .attr('opacity', d => connected.has(d.id) ? 1 : 0.12);

    link
        .attr('stroke', (d, i) => connectedLinks.has(i) ? edgeColor(d) : '#222')
        .attr('stroke-width', (d, i) => {{
            if (!connectedLinks.has(i)) return 0.3;
            return d.not_null ? 2.5 : 1.5;
        }})
        .attr('opacity', (d, i) => connectedLinks.has(i) ? 1 : 0.03)
        .attr('stroke-dasharray', (d, i) => d.poly ? '6,3' : null)
        .attr('marker-start', (d, i) => markerStart(d, connectedLinks.has(i)))
        .attr('marker-end', (d, i) => markerEnd(d, connectedLinks.has(i)));

    linkLabel
        .attr('fill', (d, i) => connectedLinks.has(i) ? '#aaa' : '#444')
        .attr('opacity', (d, i) => connectedLinks.has(i) ? 1 : 0.1);
}}

function clearHighlight() {{
    node.select('rect').attr('opacity', 1);
    node.selectAll('text').attr('opacity', 1);
    const baseOpacity = edgesMode === 'visible' ? 0.6 : 0.08;
    const baseWidth = edgesMode === 'visible' ? (d => d.not_null ? 2.0 : 1.0) : (() => 0.5);
    link
        .attr('stroke', d => edgeColor(d))
        .attr('stroke-width', (d) => typeof baseWidth === 'function' ? baseWidth(d) : baseWidth)
        .attr('stroke-dasharray', d => d.poly ? '6,3' : null)
        .attr('opacity', baseOpacity)
        .attr('marker-start', d => markerStart(d, edgesMode === 'visible'))
        .attr('marker-end', d => markerEnd(d, edgesMode === 'visible'));
    linkLabel
        .attr('fill', '#666')
        .attr('opacity', edgesMode === 'visible' ? 1 : 0.08);
}}

// ============================================================
// Search
// ============================================================
const searchInput = document.getElementById('searchInput');
searchInput.addEventListener('input', function() {{
    searchTerm = this.value.toLowerCase();
    if (!searchTerm) {{
        highlightedNode = null;
        clearHighlight();
        return;
    }}

    const matched = new Set();
    nodes.forEach(n => {{
        if (n.id.toLowerCase().includes(searchTerm)) matched.add(n.id);
    }});

    if (matched.size === 0) {{
        node.select('rect').attr('opacity', 0.15);
        node.selectAll('text').attr('opacity', 0.15);
        link.attr('opacity', 0.05);
        linkLabel.attr('opacity', 0.05);
        return;
    }}

    // Also include directly connected
    const expanded = new Set(matched);
    links.forEach(l => {{
        const sid = typeof l.source === 'object' ? l.source.id : l.source;
        const tid = typeof l.target === 'object' ? l.target.id : l.target;
        if (matched.has(sid)) expanded.add(tid);
        if (matched.has(tid)) expanded.add(sid);
    }});

    node.select('rect')
        .attr('opacity', d => matched.has(d.id) ? 1 : expanded.has(d.id) ? 0.5 : 0.1);
    node.selectAll('text')
        .attr('opacity', d => matched.has(d.id) ? 1 : expanded.has(d.id) ? 0.5 : 0.1);

    link.attr('opacity', (d) => {{
        const sid = typeof d.source === 'object' ? d.source.id : d.source;
        const tid = typeof d.target === 'object' ? d.target.id : d.target;
        if (matched.has(sid) || matched.has(tid)) return 1;
        return 0.05;
    }});
    linkLabel.attr('opacity', (d) => {{
        const sid = typeof d.source === 'object' ? d.source.id : d.source;
        const tid = typeof d.target === 'object' ? d.target.id : d.target;
        if (matched.has(sid) || matched.has(tid)) return 1;
        return 0.05;
    }});
}});

// ============================================================
// Legend
// ============================================================
const legendItems = document.getElementById('legendItems');
groups.forEach((g, i) => {{
    const item = document.createElement('div');
    item.className = 'legend-item';
    item.innerHTML = '<div class="legend-dot" style="background:' + g.color + '"></div>' +
        '<span class="legend-label">' + g.name + '</span>';
    item.onclick = () => {{
        // Filter by group
        searchInput.value = '';
        searchTerm = '';
        const groupNodes = new Set();
        nodes.forEach(n => {{ if (n.group === i) groupNodes.add(n.id); }});

        if (groupNodes.size === 0) return;

        // Also include connected
        const expanded = new Set(groupNodes);
        links.forEach(l => {{
            const sid = typeof l.source === 'object' ? l.source.id : l.source;
            const tid = typeof l.target === 'object' ? l.target.id : l.target;
            if (groupNodes.has(sid)) expanded.add(tid);
            if (groupNodes.has(tid)) expanded.add(sid);
        }});

        node.select('rect')
            .attr('opacity', d => groupNodes.has(d.id) ? 1 : expanded.has(d.id) ? 0.4 : 0.08);
        node.selectAll('text')
            .attr('opacity', d => groupNodes.has(d.id) ? 1 : expanded.has(d.id) ? 0.4 : 0.08);
        link.attr('opacity', d => {{
            const sid = typeof d.source === 'object' ? d.source.id : d.source;
            const tid = typeof d.target === 'object' ? d.target.id : d.target;
            if (groupNodes.has(sid) || groupNodes.has(tid)) return 1;
            return 0.03;
        }});
        linkLabel.attr('opacity', d => {{
            const sid = typeof d.source === 'object' ? d.source.id : d.source;
            const tid = typeof d.target === 'object' ? d.target.id : d.target;
            if (groupNodes.has(sid) || groupNodes.has(tid)) return 1;
            return 0.03;
        }});

        highlightedNode = '__group__';
    }};
    legendItems.appendChild(item);
}});

function toggleLegend() {{
    document.getElementById('legend').classList.toggle('collapsed');
}}

// ============================================================
// Controls
// ============================================================
function resetView() {{
    svg.transition().duration(500).call(zoom.transform, d3.zoomIdentity);
    highlightedNode = null;
    searchInput.value = '';
    searchTerm = '';
    clearHighlight();
    // Unfix all nodes
    nodes.forEach(n => {{ n.fx = null; n.fy = null; }});
    allFixed = false;
    document.getElementById('fixBtn').textContent = 'Fixieren';
    simulation.alpha(0.3).restart();
}}

function toggleLabels() {{
    showLabels = !showLabels;
    linkLabel.attr('display', showLabels ? null : 'none');
    document.getElementById('labelBtn').textContent = showLabels ? 'Labels ein' : 'Labels aus';
}}

function toggleFixed() {{
    allFixed = !allFixed;
    if (allFixed) {{
        nodes.forEach(n => {{ n.fx = n.x; n.fy = n.y; }});
        document.getElementById('fixBtn').textContent = 'Loesen';
    }} else {{
        nodes.forEach(n => {{ n.fx = null; n.fy = null; }});
        document.getElementById('fixBtn').textContent = 'Fixieren';
        simulation.alpha(0.3).restart();
    }}
}}

function toggleEdges() {{
    edgesMode = edgesMode === 'hover' ? 'visible' : 'hover';
    document.getElementById('edgeBtn').textContent =
        edgesMode === 'hover' ? 'Kanten sichtbar' : 'Kanten hover';
    if (!highlightedNode) {{
        clearHighlight();
    }}
}}

// ============================================================
// Drag behavior
// ============================================================
function dragstarted(event, d) {{
    if (!event.active) simulation.alphaTarget(0.3).restart();
    d.fx = d.x;
    d.fy = d.y;
}}

function dragged(event, d) {{
    d.fx = event.x;
    d.fy = event.y;
}}

function dragended(event, d) {{
    if (!event.active) simulation.alphaTarget(0);
    if (!allFixed) {{
        d.fx = null;
        d.fy = null;
    }}
}}

// ============================================================
// Tick
// ============================================================
simulation.on('tick', () => {{
    link
        .attr('x1', d => d.source.x)
        .attr('y1', d => d.source.y)
        .attr('x2', d => d.target.x)
        .attr('y2', d => d.target.y);

    linkLabel
        .attr('x', d => (d.source.x + d.target.x) / 2)
        .attr('y', d => (d.source.y + d.target.y) / 2 - 4);

    node.attr('transform', d => 'translate(' + d.x + ',' + d.y + ')');
}});

// Initial zoom to fit after layout stabilizes
setTimeout(() => {{
    const bounds = g.node().getBBox();
    if (bounds.width === 0 || bounds.height === 0) return;
    const pad = 60;
    const scaleX = (width - pad * 2) / bounds.width;
    const scaleY = (height - pad * 2) / bounds.height;
    const scale = Math.min(scaleX, scaleY, 1.2);
    const cx = bounds.x + bounds.width / 2;
    const cy = bounds.y + bounds.height / 2;
    const tx = width / 2 - cx * scale;
    const ty = height / 2 - cy * scale;
    svg.transition().duration(800).call(
        zoom.transform,
        d3.zoomIdentity.translate(tx, ty).scale(scale)
    );
}}, 2500);

// Keyboard shortcut: Escape to reset
document.addEventListener('keydown', function(e) {{
    if (e.key === 'Escape') {{
        searchInput.value = '';
        searchTerm = '';
        highlightedNode = null;
        clearHighlight();
        searchInput.blur();
    }}
}});
</script>
</body>
</html>'''


# ============================================================
# Main
# ============================================================
if __name__ == '__main__':
    base = os.path.dirname(os.path.abspath(__file__))

    print("Parsing schema.sql...")
    tables = parse_schema(os.path.join(base, 'schema.sql'))
    print(f"  Found {len(tables)} tables")

    print("Parsing DBML for relations...")
    relations = parse_relations_from_dbml(os.path.join(base, 'Datenmodell4_0.dbml'))
    print(f"  Found {len(relations)} relations")

    print("Building graph data...")
    nodes, links = build_graph_data(tables, relations)
    print(f"  {len(nodes)} nodes, {len(links)} links")

    print("Generating erd.html...")
    html_content = generate_html(nodes, links)

    output_path = os.path.join(base, 'erd.html')
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(html_content)

    size_kb = os.path.getsize(output_path) / 1024
    print(f"Done! Written to {output_path} ({size_kb:.0f} KB)")
