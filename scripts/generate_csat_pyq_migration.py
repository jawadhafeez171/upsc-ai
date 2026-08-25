# -*- coding: utf-8 -*-
"""
Generates supabase_migration_csat_pyq.sql containing:
1. CREATE TABLE IF NOT EXISTS public.csat_pyq
2. RLS policies and performance indexes
3. Complete SQL INSERT statements for all 80 questions in 2020_csat.json
"""

import json
import os

def sql_escape(text):
    if text is None:
        return "NULL"
    if isinstance(text, (int, float)):
        return str(text)
    # Replace single quote with double single quotes for SQL string literal
    escaped = str(text).replace("'", "''")
    return f"'{escaped}'"

def sql_array_escape(arr):
    if arr is None:
        return "NULL"
    items = []
    for item in arr:
        escaped = str(item).replace("'", "''")
        items.append(f"'{escaped}'")
    joined = ", ".join(items)
    return f"ARRAY[{joined}]::TEXT[]"

def main():
    json_path = os.path.join("src", "data", "upsc_pyq", "csat", "2020_csat.json")
    with open(json_path, "r", encoding="utf-8") as f:
        questions = json.load(f)

    sql_output_path = "supabase_migration_csat_pyq.sql"

    lines = []
    lines.append("-- ═════════════════════════════════════════════════════════════════════════")
    lines.append("-- SUPABASE MIGRATION: UPSC CSE Prelims Paper 2 (CSAT) PYQ Table")
    lines.append("-- ═════════════════════════════════════════════════════════════════════════")
    lines.append("")
    lines.append("CREATE TABLE IF NOT EXISTS public.csat_pyq (")
    lines.append("    id TEXT PRIMARY KEY,")
    lines.append("    question_number INTEGER NOT NULL,")
    lines.append("    year INTEGER NOT NULL DEFAULT 2020,")
    lines.append("    paper INTEGER NOT NULL DEFAULT 2,")
    lines.append("    exam_id TEXT NOT NULL DEFAULT 'upsc-cse',")
    lines.append("    node_id TEXT NOT NULL,")
    lines.append("    subject TEXT NOT NULL,")
    lines.append("    subject_hindi TEXT,")
    lines.append("    domain TEXT NOT NULL,")
    lines.append("    domain_hindi TEXT,")
    lines.append("    sub_topic TEXT NOT NULL,")
    lines.append("    sub_topic_hindi TEXT,")
    lines.append("    difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),")
    lines.append("    tags TEXT[],")
    lines.append("    question_english TEXT NOT NULL,")
    lines.append("    question_hindi TEXT,")
    lines.append("    option_a_english TEXT NOT NULL,")
    lines.append("    option_b_english TEXT NOT NULL,")
    lines.append("    option_c_english TEXT NOT NULL,")
    lines.append("    option_d_english TEXT NOT NULL,")
    lines.append("    option_a_hindi TEXT,")
    lines.append("    option_b_hindi TEXT,")
    lines.append("    option_c_hindi TEXT,")
    lines.append("    option_d_hindi TEXT,")
    lines.append("    key_answer TEXT NOT NULL,")
    lines.append("    explanation_english TEXT NOT NULL,")
    lines.append("    explanation_hindi TEXT,")
    lines.append("    image_url TEXT,")
    lines.append("    created_at TIMESTAMPTZ DEFAULT NOW()")
    lines.append(");")
    lines.append("")
    lines.append("-- Row Level Security (RLS)")
    lines.append("ALTER TABLE public.csat_pyq ENABLE ROW LEVEL SECURITY;")
    lines.append("")
    lines.append("CREATE POLICY \"Allow public read access on csat_pyq\"")
    lines.append("    ON public.csat_pyq FOR SELECT")
    lines.append("    USING (true);")
    lines.append("")
    lines.append("CREATE POLICY \"Allow anon insert on csat_pyq\"")
    lines.append("    ON public.csat_pyq FOR INSERT")
    lines.append("    WITH CHECK (true);")
    lines.append("")
    lines.append("CREATE POLICY \"Allow anon update on csat_pyq\"")
    lines.append("    ON public.csat_pyq FOR UPDATE")
    lines.append("    USING (true);")
    lines.append("")
    lines.append("-- Optimized Performance Indexes")
    lines.append("CREATE INDEX IF NOT EXISTS idx_csat_pyq_year ON public.csat_pyq(year);")
    lines.append("CREATE INDEX IF NOT EXISTS idx_csat_pyq_paper ON public.csat_pyq(paper);")
    lines.append("CREATE INDEX IF NOT EXISTS idx_csat_pyq_node_id ON public.csat_pyq(node_id);")
    lines.append("CREATE INDEX IF NOT EXISTS idx_csat_pyq_domain ON public.csat_pyq(domain);")
    lines.append("CREATE INDEX IF NOT EXISTS idx_csat_pyq_difficulty ON public.csat_pyq(difficulty);")
    lines.append("CREATE INDEX IF NOT EXISTS idx_csat_pyq_exam_id ON public.csat_pyq(exam_id);")
    lines.append("")
    lines.append("-- Seed Data: 2020 CSAT Questions (Q1 to Q80)")
    lines.append("INSERT INTO public.csat_pyq (")
    lines.append("    id, question_number, year, paper, exam_id, node_id, subject, subject_hindi,")
    lines.append("    domain, domain_hindi, sub_topic, sub_topic_hindi, difficulty, tags,")
    lines.append("    question_english, question_hindi, option_a_english, option_b_english,")
    lines.append("    option_c_english, option_d_english, option_a_hindi, option_b_hindi,")
    lines.append("    option_c_hindi, option_d_hindi, key_answer, explanation_english,")
    lines.append("    explanation_hindi, image_url")
    lines.append(") VALUES")

    insert_rows = []
    for q in questions:
        q_num = q["question_number"]
        yr = q.get("year", 2020)
        row_id = f"csat-{yr}-q{q_num}"
        
        row_vals = [
            sql_escape(row_id),
            str(q_num),
            str(yr),
            str(q.get("paper", 2)),
            sql_escape("upsc-cse"),
            sql_escape(q.get("node_id", "")),
            sql_escape(q.get("subject", "")),
            sql_escape(q.get("subject_hindi", "")),
            sql_escape(q.get("domain", "")),
            sql_escape(q.get("domain_hindi", "")),
            sql_escape(q.get("sub_topic", "")),
            sql_escape(q.get("sub_topic_hindi", "")),
            sql_escape(q.get("difficulty", "medium")),
            sql_array_escape(q.get("tags", [])),
            sql_escape(q.get("question_english", "")),
            sql_escape(q.get("question_hindi", "")),
            sql_escape(q.get("option_a_english", "")),
            sql_escape(q.get("option_b_english", "")),
            sql_escape(q.get("option_c_english", "")),
            sql_escape(q.get("option_d_english", "")),
            sql_escape(q.get("option_a_hindi", "")),
            sql_escape(q.get("option_b_hindi", "")),
            sql_escape(q.get("option_c_hindi", "")),
            sql_escape(q.get("option_d_hindi", "")),
            sql_escape(q.get("key_answer", "")),
            sql_escape(q.get("explanation_english", "")),
            sql_escape(q.get("explanation_hindi", "")),
            sql_escape(q.get("image_url"))
        ]
        insert_rows.append(f"    ({', '.join(row_vals)})")

    lines.append(",\n".join(insert_rows))
    lines.append("ON CONFLICT (id) DO UPDATE SET")
    lines.append("    node_id = EXCLUDED.node_id,")
    lines.append("    subject = EXCLUDED.subject,")
    lines.append("    subject_hindi = EXCLUDED.subject_hindi,")
    lines.append("    domain = EXCLUDED.domain,")
    lines.append("    domain_hindi = EXCLUDED.domain_hindi,")
    lines.append("    sub_topic = EXCLUDED.sub_topic,")
    lines.append("    sub_topic_hindi = EXCLUDED.sub_topic_hindi,")
    lines.append("    difficulty = EXCLUDED.difficulty,")
    lines.append("    tags = EXCLUDED.tags,")
    lines.append("    question_english = EXCLUDED.question_english,")
    lines.append("    question_hindi = EXCLUDED.question_hindi,")
    lines.append("    option_a_english = EXCLUDED.option_a_english,")
    lines.append("    option_b_english = EXCLUDED.option_b_english,")
    lines.append("    option_c_english = EXCLUDED.option_c_english,")
    lines.append("    option_d_english = EXCLUDED.option_d_english,")
    lines.append("    option_a_hindi = EXCLUDED.option_a_hindi,")
    lines.append("    option_b_hindi = EXCLUDED.option_b_hindi,")
    lines.append("    option_c_hindi = EXCLUDED.option_c_hindi,")
    lines.append("    option_d_hindi = EXCLUDED.option_d_hindi,")
    lines.append("    key_answer = EXCLUDED.key_answer,")
    lines.append("    explanation_english = EXCLUDED.explanation_english,")
    lines.append("    explanation_hindi = EXCLUDED.explanation_hindi,")
    lines.append("    image_url = EXCLUDED.image_url;")
    lines.append("")

    with open(sql_output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"Generated {sql_output_path} with {len(questions)} questions successfully!")

if __name__ == "__main__":
    main()
