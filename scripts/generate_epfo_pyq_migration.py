# -*- coding: utf-8 -*-
"""
Generates supabase_migration_epfo_pyq.sql containing:
1. CREATE TABLE IF NOT EXISTS public.epfo_pyq
2. RLS policies and performance indexes
3. Complete SQL INSERT statements with ON CONFLICT for all 1,060 EPFO questions.
"""

import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

def sql_escape(text):
    if text is None:
        return "NULL"
    if isinstance(text, (int, float)):
        return str(text)
    escaped = str(text).replace("'", "''")
    return f"'{escaped}'"

def sql_array_escape(arr):
    if arr is None or not arr:
        return "ARRAY[]::TEXT[]"
    items = []
    for item in arr:
        escaped = str(item).replace("'", "''")
        items.append(f"'{escaped}'")
    joined = ", ".join(items)
    return f"ARRAY[{joined}]::TEXT[]"

def generate_migration():
    json_path = os.path.join("src", "data", "epfo", "epfo-all-papers.json")
    with open(json_path, "r", encoding="utf-8") as f:
        questions = json.load(f)

    print(f"Loaded {len(questions)} EPFO questions for migration generation.")

    sql_lines = []
    sql_lines.append("-- ═════════════════════════════════════════════════════════════════════════")
    sql_lines.append("-- SUPABASE MIGRATION: UPSC EPFO (EO/AO & APFC) PYQ Table")
    sql_lines.append(f"-- Total: {len(questions)} Questions across 9 Examination Papers (2002 to 2025)")
    sql_lines.append("-- ═════════════════════════════════════════════════════════════════════════\n")

    # Include DDL
    with open("supabase_table_epfo_pyq.sql", "r", encoding="utf-8") as f:
        ddl = f.read()
    sql_lines.append(ddl)
    sql_lines.append("\n-- ═════════════════════════════════════════════════════════════════════════")
    sql_lines.append("-- DATA INSERT STATEMENTS")
    sql_lines.append("-- ═════════════════════════════════════════════════════════════════════════\n")

    # Group into batches of 50
    batch_size = 50
    total_batches = (len(questions) + batch_size - 1) // batch_size

    for b in range(total_batches):
        batch = questions[b * batch_size : (b + 1) * batch_size]
        sql_lines.append(f"-- Batch {b + 1} of {total_batches} ({len(batch)} questions)")
        sql_lines.append("INSERT INTO public.epfo_pyq (")
        sql_lines.append("    id, question_number, year, month, paper, paper_code, exam_name, exam_id,")
        sql_lines.append("    node_id, subject, subject_hindi, domain, domain_hindi, sub_topic, sub_topic_hindi,")
        sql_lines.append("    difficulty, tags, passage_english, passage_hindi, question_english, question_hindi,")
        sql_lines.append("    option_a_english, option_b_english, option_c_english, option_d_english,")
        sql_lines.append("    option_a_hindi, option_b_hindi, option_c_hindi, option_d_hindi,")
        sql_lines.append("    key_answer, explanation_english, explanation_hindi, image_url")
        sql_lines.append(") VALUES")

        value_rows = []
        for q in batch:
            exam_name = q.get('exam_name', '')
            yr = q.get('year', 0)
            qn = q.get('question_number', 0)

            if 'APFC' in exam_name and 'EO/AO' in exam_name:
                pcode = 'eoao-apfc'
            elif 'APFC' in exam_name:
                pcode = 'apfc'
            elif 'EO/AO' in exam_name:
                pcode = 'eoao'
            else:
                pcode = 'gen'

            row_id = f"epfo-{pcode}-{yr}-q{qn}"
            key_ans = str(q.get('key_answer') or 'x').lower().strip()
            if not key_ans:
                key_ans = 'x'

            diff = q.get('difficulty') or 'medium'
            if diff not in ['easy', 'medium', 'hard']:
                diff = 'medium'

            row = (
                f"    ({sql_escape(row_id)}, {qn}, {yr}, {sql_escape(q.get('month', 'July'))}, "
                f"{q.get('paper', 1)}, {sql_escape(pcode)}, {sql_escape(exam_name)}, 'upsc-epfo', "
                f"{sql_escape(q.get('node_id'))}, {sql_escape(q.get('subject'))}, {sql_escape(q.get('subject_hindi'))}, "
                f"{sql_escape(q.get('domain'))}, {sql_escape(q.get('domain_hindi'))}, {sql_escape(q.get('sub_topic'))}, "
                f"{sql_escape(q.get('sub_topic_hindi'))}, {sql_escape(diff)}, {sql_array_escape(q.get('tags'))}, "
                f"{sql_escape(q.get('passage_english'))}, {sql_escape(q.get('passage_hindi'))}, "
                f"{sql_escape(q.get('question_english'))}, {sql_escape(q.get('question_hindi'))}, "
                f"{sql_escape(q.get('option_a_english'))}, {sql_escape(q.get('option_b_english'))}, "
                f"{sql_escape(q.get('option_c_english'))}, {sql_escape(q.get('option_d_english'))}, "
                f"{sql_escape(q.get('option_a_hindi'))}, {sql_escape(q.get('option_b_hindi'))}, "
                f"{sql_escape(q.get('option_c_hindi'))}, {sql_escape(q.get('option_d_hindi'))}, "
                f"{sql_escape(key_ans)}, {sql_escape(q.get('explanation_english'))}, {sql_escape(q.get('explanation_hindi'))}, "
                f"{sql_escape(q.get('image_url'))})"
            )
            value_rows.append(row)

        sql_lines.append(",\n".join(value_rows))
        sql_lines.append("ON CONFLICT (id) DO UPDATE SET")
        sql_lines.append("    node_id = EXCLUDED.node_id,")
        sql_lines.append("    subject = EXCLUDED.subject,")
        sql_lines.append("    subject_hindi = EXCLUDED.subject_hindi,")
        sql_lines.append("    domain = EXCLUDED.domain,")
        sql_lines.append("    domain_hindi = EXCLUDED.domain_hindi,")
        sql_lines.append("    sub_topic = EXCLUDED.sub_topic,")
        sql_lines.append("    sub_topic_hindi = EXCLUDED.sub_topic_hindi,")
        sql_lines.append("    difficulty = EXCLUDED.difficulty,")
        sql_lines.append("    tags = EXCLUDED.tags,")
        sql_lines.append("    key_answer = EXCLUDED.key_answer,")
        sql_lines.append("    explanation_english = EXCLUDED.explanation_english;\n")

    out_path = "supabase_migration_epfo_pyq.sql"
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_lines))

    file_size_mb = os.path.getsize(out_path) / (1024 * 1024)
    print(f"Successfully generated {out_path} ({file_size_mb:.2f} MB) with {len(questions)} insert records.")

if __name__ == "__main__":
    generate_migration()
