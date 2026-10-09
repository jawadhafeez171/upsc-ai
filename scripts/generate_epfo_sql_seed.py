# -*- coding: utf-8 -*-
"""
Generates supabase_seed_4_epfo.sql containing all 81 EPFO Knowledge Graph nodes.
"""

import json
import os

def sql_escape(text):
    if text is None:
        return "NULL"
    if isinstance(text, (int, float)):
        return str(text)
    escaped = str(text).replace("'", "''")
    return f"'{escaped}'"

def sql_array_escape(arr):
    if arr is None or not arr:
        return "ARRAY[]::text[]"
    items = []
    for item in arr:
        escaped = str(item).replace("'", "''")
        items.append(f"'{escaped}'")
    joined = ", ".join(items)
    return f"ARRAY[{joined}]::text[]"

def sql_jsonb_escape(obj):
    if obj is None:
        return "'{}'::jsonb"
    json_str = json.dumps(obj, ensure_ascii=False).replace("'", "''")
    return f"'{json_str}'::jsonb"

def generate_epfo_sql():
    with open('src/data/knowledge_graph_epfo.json', 'r', encoding='utf-8') as f:
        graph = json.load(f)

    nodes = list(graph['nodes'].values())
    # Sort ascending by level so parent nodes insert before children
    nodes.sort(key=lambda n: n['level'])

    lines = []
    lines.append("-- =========================================================================")
    lines.append(f"-- SUPABASE SEED 4: UPSC EPFO SUBGRAPH ({len(nodes)} NODES)")
    lines.append("-- =========================================================================")
    lines.append("")
    lines.append("BEGIN;")
    lines.append("")
    lines.append("INSERT INTO public.knowledge_nodes (")
    lines.append("    id, slug, name, level, level_name, subject, subject_id, parent_id,")
    lines.append("    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams")
    lines.append(") VALUES")

    value_entries = []
    for node in nodes:
        parent_val = sql_escape(node['parentId']) if node['parentId'] else "NULL"
        entry = (
            f"    (\n"
            f"        {sql_escape(node['id'])}, {sql_escape(node['slug'])}, {sql_escape(node['name'])}, {node['level']},\n"
            f"        {sql_escape(node['levelName'])}, {sql_escape(node['subject'])}, {sql_escape(node['subjectId'])}, {parent_val},\n"
            f"        {sql_array_escape(node.get('childrenIds', []))}, {sql_array_escape(node.get('ancestorIds', []))}, {sql_jsonb_escape(node.get('examTags', {}))},\n"
            f"        {sql_escape(node.get('rawExamTagString', ''))}, {sql_escape(node.get('description', ''))}, {sql_array_escape(node.get('entities', []))}, {sql_array_escape(node.get('keywords', []))},\n"
            f"        'epfo', ARRAY['epfo']::text[]\n"
            f"    )"
        )
        value_entries.append(entry)

    lines.append(",\n".join(value_entries))
    lines.append("ON CONFLICT (id) DO UPDATE SET")
    lines.append("    name = EXCLUDED.name,")
    lines.append("    level = EXCLUDED.level,")
    lines.append("    level_name = EXCLUDED.level_name,")
    lines.append("    subject = EXCLUDED.subject,")
    lines.append("    subject_id = EXCLUDED.subject_id,")
    lines.append("    parent_id = EXCLUDED.parent_id,")
    lines.append("    children_ids = EXCLUDED.children_ids,")
    lines.append("    ancestor_ids = EXCLUDED.ancestor_ids,")
    lines.append("    exam_tags = EXCLUDED.exam_tags,")
    lines.append("    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,")
    lines.append("    keywords = EXCLUDED.keywords,")
    lines.append("    stream = EXCLUDED.stream,")
    lines.append("    streams = EXCLUDED.streams;")
    lines.append("")
    lines.append("COMMIT;")
    lines.append("")

    out_file = "supabase_seed_4_epfo.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"Generated {out_file} with {len(nodes)} nodes.")

if __name__ == "__main__":
    generate_epfo_sql()
