#!/usr/bin/env python3
"""Generiert stammdaten_enums.sql aus Datenmodell4_0.dbml.

Liest alle Enum-Definitionen aus dem DBML und erzeugt daraus
CREATE TABLE + INSERT-Statements fuer die Enum-Stammdaten.
"""

import re
import sys


def parse_enums(dbml_path):
    """Parse alle Enum-Definitionen aus dem DBML."""
    with open(dbml_path, 'r', encoding='utf-8') as f:
        content = f.read()

    enums = []
    # Match: Enum _Name { ... }
    enum_pattern = re.compile(
        r'(?://[^\n]*\n)?'           # optionaler Kommentar davor
        r'Enum\s+(_\w+)\s*\{([^}]*)\}',
        re.DOTALL
    )

    # Finde alle Kommentare vor Enums für Kontext
    lines = content.split('\n')
    comment_before_enum = {}
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped.startswith('Enum _'):
            # Schaue ob Zeile davor ein Kommentar ist
            if i > 0 and lines[i-1].strip().startswith('//'):
                comment_before_enum[stripped.split('{')[0].strip()] = lines[i-1].strip()

    for match in enum_pattern.finditer(content):
        enum_name = match.group(1)  # z.B. _AbgasanlageArt
        enum_body = match.group(2)

        # Enum-Name: entferne fuehrendes _ und setze Enum_ davor
        table_name = 'Enum' + enum_name  # z.B. Enum_AbgasanlageArt

        values = parse_enum_values(enum_body)

        # Kommentar suchen
        comment = comment_before_enum.get(f'Enum {enum_name}', None)

        enums.append({
            'name': table_name,
            'comment': comment,
            'values': values
        })

    return enums


def parse_enum_values(body):
    """Parse die Werte eines Enum-Blocks."""
    values = []
    for line in body.split('\n'):
        line = line.strip()
        if not line or line.startswith('//'):
            continue

        # Match: Wert [note: "Beschreibung"]  oder  Wert (ohne note)
        note_match = re.match(
            r"(\S+)\s+\[note:\s*['\"](.+?)['\"]\s*\]",
            line
        )
        if note_match:
            wert = note_match.group(1)
            beschreibung = note_match.group(2)
            # Escaped quotes im note zurueckwandeln
            beschreibung = beschreibung.replace('\\"', '"')
        else:
            # Nur Wert ohne note
            plain_match = re.match(r'(\S+)\s*$', line)
            if plain_match:
                wert = plain_match.group(1)
                beschreibung = ''
            else:
                continue

        values.append((wert, beschreibung))

    return values


def generate_sql(enums):
    """Generiere SQL aus den geparsten Enums."""
    lines = []
    lines.append('-- Enum-Stammdaten fuer ZIV Datenmodell 4.0')
    lines.append('-- Generiert aus Datenmodell4_0.dbml')
    lines.append('')

    for enum in enums:
        if enum['comment']:
            lines.append(f"-- {enum['comment'].lstrip('/')}")
        lines.append(f"CREATE TABLE IF NOT EXISTS {enum['name']} (")
        lines.append(f"    Wert TEXT PRIMARY KEY,")
        lines.append(f"    Beschreibung TEXT NOT NULL")
        lines.append(f");")
        lines.append('')

        for wert, beschreibung in enum['values']:
            # SQL-Escape fuer einfache Anfuehrungszeichen
            beschreibung_escaped = beschreibung.replace("'", "''")
            lines.append(
                f"INSERT INTO {enum['name']} (Wert, Beschreibung) "
                f"VALUES ('{wert}', '{beschreibung_escaped}');"
            )

        lines.append('')

    return '\n'.join(lines)


def main():
    dbml_path = 'Datenmodell4_0.dbml'
    output_path = 'stammdaten_enums.sql'

    print(f'Parsing {dbml_path}...')
    enums = parse_enums(dbml_path)
    print(f'  Found {len(enums)} enums')

    sql = generate_sql(enums)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(sql)

    # Zaehle Gesamtanzahl der Werte
    total_values = sum(len(e['values']) for e in enums)
    print(f'Generated {output_path} ({len(enums)} tables, {total_values} values)')


if __name__ == '__main__':
    main()
