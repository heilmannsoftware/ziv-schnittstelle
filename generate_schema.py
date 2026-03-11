#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Generate schema.sql from Datenmodell4_0.dbml
"""

import os
import re
import sys
from collections import defaultdict, deque

_BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DBML_FILE = os.path.join(_BASE_DIR, "Datenmodell4_0.dbml")
OUTPUT_FILE = os.path.join(_BASE_DIR, "schema.sql")

# ============================================================
# 1) Parse Enums from DBML
# ============================================================
def parse_enums(dbml_text):
    """Parse all Enum definitions and return dict: enum_name -> [values]"""
    enums = {}
    pattern = re.compile(r'^Enum\s+(\S+)\s*\{(.*?)\n\}', re.DOTALL | re.MULTILINE)
    for m in pattern.finditer(dbml_text):
        enum_name = m.group(1)
        body = m.group(2)
        values = []
        for line in body.split('\n'):
            line = line.strip()
            if not line or line.startswith('//'):
                continue
            val_match = re.match(r'(\S+)', line)
            if val_match:
                val = val_match.group(1)
                if val in ('[', ']', '{', '}'):
                    continue
                values.append(val)
        if values:
            enums[enum_name] = values
    return enums

# ============================================================
# 2) Parse Tables from DBML
# ============================================================
def parse_tables(dbml_text):
    """Parse all non-commented Table definitions."""
    tables = {}
    lines = dbml_text.split('\n')
    i = 0
    while i < len(lines):
        line = lines[i].strip()

        # Check for commented table
        if line.startswith('//') and 'Table ' in line:
            brace_count = 0
            if '{' in line:
                brace_count = 1
            i += 1
            while i < len(lines) and brace_count > 0:
                l = lines[i].strip()
                if not l.startswith('//'):
                    break
                brace_count += l.count('{') - l.count('}')
                i += 1
            continue

        table_match = re.match(r'^Table\s+(\S+)\s*\{', line)
        if table_match:
            table_name = table_match.group(1)
            columns = []
            i += 1
            brace_count = 1
            while i < len(lines) and brace_count > 0:
                col_line = lines[i]
                col_stripped = col_line.strip()

                if col_stripped == '}':
                    brace_count -= 1
                    i += 1
                    continue

                if not col_stripped or col_stripped.startswith('//'):
                    i += 1
                    continue

                # Parse column: Name Type [constraints]
                col_match = re.match(r'\s*(\S+)\s+(\S+)\s*(\[.*\])?\s*$', col_stripped)
                if col_match:
                    col_name = col_match.group(1)
                    col_type_raw = col_match.group(2)
                    constraints_str = col_match.group(3) or ''

                    is_pk = False
                    is_not_null = False
                    is_unique = False
                    default_val = None
                    enum_type = None

                    if constraints_str:
                        if 'pk' in constraints_str:
                            is_pk = True
                        if 'not null' in constraints_str:
                            is_not_null = True
                        if 'unique' in constraints_str:
                            is_unique = True
                        def_match = re.search(r"default:\s*'([^']*)'", constraints_str)
                        if def_match:
                            default_val = "'" + def_match.group(1) + "'"
                        else:
                            def_match = re.search(r"default:\s*(\S+?)[\],]", constraints_str)
                            if def_match:
                                default_val = def_match.group(1)

                    # Determine if enum type
                    base_types = ('int', 'float', 'text', 'bool', 'date', 'datetime', 'blob')
                    if col_type_raw.lower() not in base_types:
                        enum_type = col_type_raw

                    columns.append({
                        'name': col_name,
                        'type_raw': col_type_raw,
                        'pk': is_pk,
                        'not_null': is_not_null,
                        'unique': is_unique,
                        'default': default_val,
                        'enum_type': enum_type,
                    })

                i += 1

            tables[table_name] = columns
            continue

        i += 1

    return tables


# ============================================================
# Helper: quote identifiers that need it
# ============================================================
SQLITE_RESERVED = {
    'ABORT', 'ACTION', 'ADD', 'AFTER', 'ALL', 'ALTER', 'ALWAYS', 'ANALYZE',
    'AND', 'AS', 'ASC', 'ATTACH', 'AUTOINCREMENT', 'BEFORE', 'BEGIN',
    'BETWEEN', 'BY', 'CASCADE', 'CASE', 'CAST', 'CHECK', 'COLLATE',
    'COLUMN', 'COMMIT', 'CONFLICT', 'CONSTRAINT', 'CREATE', 'CROSS',
    'CURRENT', 'CURRENT_DATE', 'CURRENT_TIME', 'CURRENT_TIMESTAMP',
    'DATABASE', 'DEFAULT', 'DEFERRABLE', 'DEFERRED', 'DELETE', 'DESC',
    'DETACH', 'DISTINCT', 'DO', 'DROP', 'EACH', 'ELSE', 'END', 'ESCAPE',
    'EXCEPT', 'EXCLUDE', 'EXCLUSIVE', 'EXISTS', 'EXPLAIN', 'FAIL',
    'FILTER', 'FIRST', 'FOLLOWING', 'FOR', 'FOREIGN', 'FROM', 'FULL',
    'GENERATED', 'GLOB', 'GROUP', 'GROUPS', 'HAVING', 'IF', 'IGNORE',
    'IMMEDIATE', 'IN', 'INDEX', 'INDEXED', 'INITIALLY', 'INNER', 'INSERT',
    'INSTEAD', 'INTERSECT', 'INTO', 'IS', 'ISNULL', 'JOIN', 'KEY', 'LAST',
    'LEFT', 'LIKE', 'LIMIT', 'MATCH', 'MATERIALIZED', 'NATURAL', 'NO',
    'NOT', 'NOTHING', 'NOTNULL', 'NULL', 'NULLS', 'OF', 'OFFSET', 'ON',
    'OR', 'ORDER', 'OTHERS', 'OUTER', 'OVER', 'PARTITION', 'PLAN',
    'PRAGMA', 'PRECEDING', 'PRIMARY', 'QUERY', 'RAISE', 'RANGE',
    'RECURSIVE', 'REFERENCES', 'REGEXP', 'REINDEX', 'RELEASE', 'RENAME',
    'REPLACE', 'RESTRICT', 'RETURNING', 'RIGHT', 'ROLLBACK', 'ROW',
    'ROWS', 'SAVEPOINT', 'SELECT', 'SET', 'TABLE', 'TEMP', 'TEMPORARY',
    'THEN', 'TIES', 'TO', 'TRANSACTION', 'TRIGGER', 'UNBOUNDED', 'UNION',
    'UNIQUE', 'UPDATE', 'USING', 'VACUUM', 'VALUES', 'VIEW', 'VIRTUAL',
    'WHEN', 'WHERE', 'WINDOW', 'WITH', 'WITHOUT',
}

def quote_id(name):
    """Quote column/table names that start with a digit, contain special chars, or are reserved words."""
    if not name:
        return name
    if name[0].isdigit() or not re.match(r'^[A-Za-z_][A-Za-z0-9_]*$', name) or name.upper() in SQLITE_RESERVED:
        return '"' + name + '"'
    return name

# ============================================================
# 4) Type mapping
# ============================================================
def map_type(type_raw):
    type_lower = type_raw.lower()
    type_map = {
        'int': 'INTEGER',
        'float': 'REAL',
        'text': 'TEXT',
        'bool': 'BOOL',
        'date': 'DATE',
        'datetime': 'DATETIME',
        'blob': 'BLOB',
    }
    return type_map.get(type_lower, 'TEXT')

# ============================================================
# 5) Build CHECK constraint for enum
# ============================================================
def build_check_constraint(col_name, enum_name, enums):
    # Try exact match
    if enum_name in enums:
        values = enums[enum_name]
    elif '_' + enum_name in enums:
        # Handle case like ErgebnisDunstDurchfuehrung -> _ErgebnisDunstDurchfuehrung
        values = enums['_' + enum_name]
    else:
        for k, v in enums.items():
            if k.lstrip('_') == enum_name.lstrip('_'):
                values = v
                break
        else:
            return None

    quoted = ', '.join("'" + v + "'" for v in values)
    return "CHECK(" + col_name + " IN (" + quoted + "))"

# ============================================================
# 6) Parse refs from DBML
# ============================================================
def parse_refs_from_dbml(dbml_text):
    refs = []
    lines = dbml_text.split('\n')
    current_table = None

    for line in lines:
        stripped = line.strip()
        if stripped.startswith('//'):
            continue

        table_match = re.match(r'^Table\s+(\S+)\s*\{', stripped)
        if table_match:
            current_table = table_match.group(1)
            continue

        if stripped == '}':
            current_table = None
            continue

        if current_table and 'ref:' in stripped:
            ref_match = re.search(r'ref:\s*([->])\s*(\S+)\.(\S+)', stripped)
            if ref_match:
                ref_type = ref_match.group(1)
                parent_table = ref_match.group(2)
                parent_col = ref_match.group(3).rstrip(',')
                col_match = re.match(r'(\S+)\s+', stripped)
                if col_match:
                    col_name = col_match.group(1)
                    is_not_null = 'not null' in stripped.lower()
                    kardinalitaet = '1:1' if ref_type == '-' else 'n:1'
                    refs.append({
                        'child': current_table,
                        'fk_field': col_name,
                        'parent': parent_table,
                        'parent_col': parent_col,
                        'not_null': is_not_null,
                        'kardinalitaet': kardinalitaet,
                    })

    return refs

# ============================================================
# 7) Topological sort
# ============================================================
def topological_sort(table_names, relations):
    graph = defaultdict(set)
    all_tables = set(table_names)

    for rel in relations:
        child = rel['child']
        parent = rel['parent']
        if child in all_tables and parent in all_tables and child != parent:
            graph[child].add(parent)

    in_degree = defaultdict(int)
    for t in all_tables:
        in_degree[t] = 0

    for child, parents in graph.items():
        in_degree[child] = len(parents)

    queue = deque()
    for t in sorted(all_tables):
        if in_degree[t] == 0:
            queue.append(t)

    result = []
    while queue:
        node = queue.popleft()
        result.append(node)
        for child in sorted(all_tables):
            if node in graph.get(child, set()):
                graph[child].discard(node)
                in_degree[child] -= 1
                if in_degree[child] == 0:
                    queue.append(child)

    # Add remaining (circular)
    for t in sorted(all_tables):
        if t not in result:
            result.append(t)

    return result

# ============================================================
# MAIN
# ============================================================
def main():
    with open(DBML_FILE, 'r', encoding='utf-8') as f:
        dbml_text = f.read()

    enums = parse_enums(dbml_text)
    tables = parse_tables(dbml_text)
    dbml_refs = parse_refs_from_dbml(dbml_text)

    print(f"Parsed {len(enums)} enums")
    print(f"Parsed {len(tables)} tables")
    print(f"Parsed {len(dbml_refs)} DBML refs")

    # Build relations from DBML refs
    all_relations = []
    for ref in dbml_refs:
        all_relations.append({
            'child': ref['child'],
            'fk_field': ref['fk_field'],
            'parent': ref['parent'],
            'not_null': ref['not_null'],
        })

    # Topological sort
    sorted_tables = topological_sort(list(tables.keys()), all_relations)

    print(f"\nTable order ({len(sorted_tables)} tables):")
    for i, t in enumerate(sorted_tables):
        print(f"  {i+1}. {t}")

    # FK lookup: (child, fk_field) -> parent
    fk_lookup = {}
    for rel in all_relations:
        fk_lookup[(rel['child'], rel['fk_field'])] = rel['parent']

    def get_pk_col(parent_table):
        if parent_table in tables:
            for col in tables[parent_table]:
                if col['pk']:
                    return col['name']
        return "ID_" + parent_table

    # ============================================================
    # Generate SQL
    # ============================================================
    sql_lines = []
    sql_lines.append("PRAGMA foreign_keys = ON;")
    sql_lines.append("")

    for table_name in sorted_tables:
        columns = tables[table_name]
        col_defs = []
        fk_defs = []

        is_meta = (table_name == 'Meta')

        for col in columns:
            parts = []
            col_name = col['name']
            qcol = quote_id(col_name)
            sqlite_type = map_type(col['type_raw']) if not col['enum_type'] else 'TEXT'

            if col['pk']:
                if is_meta:
                    parts.append("    " + qcol + " " + sqlite_type)
                    if col['not_null']:
                        parts.append("NOT NULL")
                    if col['default'] is not None:
                        parts.append("DEFAULT " + col['default'])
                    col_defs.append(' '.join(parts))
                else:
                    col_defs.append("    " + qcol + " INTEGER PRIMARY KEY AUTOINCREMENT")
                continue

            parts.append("    " + qcol + " " + sqlite_type)

            # NOT NULL
            if col['not_null']:
                parts.append("NOT NULL")

            # DEFAULT
            if col['default'] is not None:
                parts.append("DEFAULT " + col['default'])

            # CHECK constraint for enum
            if col['enum_type']:
                check = build_check_constraint(qcol, col['enum_type'], enums)
                if check:
                    parts.append(check)

            col_defs.append(' '.join(parts))

            # FK constraint
            fk_key = (table_name, col_name)
            if fk_key in fk_lookup:
                parent = fk_lookup[fk_key]
                parent_pk = get_pk_col(parent)
                fk_defs.append("    FOREIGN KEY (" + qcol + ") REFERENCES " + parent + " (" + quote_id(parent_pk) + ")")

        all_defs = col_defs + fk_defs
        sql_lines.append("CREATE TABLE " + table_name + " (")
        sql_lines.append(',\n'.join(all_defs))
        sql_lines.append(");")
        sql_lines.append("")

    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))

    print(f"\nGenerated {OUTPUT_FILE}")
    print(f"Total tables: {len(sorted_tables)}")

if __name__ == '__main__':
    main()
