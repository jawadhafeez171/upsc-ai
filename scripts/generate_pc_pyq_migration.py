# -*- coding: utf-8 -*-
"""
Generates supabase_migration_pc_pyq.sql containing:
1. CREATE TABLE IF NOT EXISTS public.pc_pyq
2. RLS policies and performance indexes
3. Complete SQL INSERT statements with ON CONFLICT for all 200 questions:
   - 100 questions from hk_dar_pc_2026_sept.json (paper_code: 'hk')
   - 100 questions from nhk_dar_pc_2026_sept.json (paper_code: 'nhk')
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

def sql_jsonb_escape(obj):
    if obj is None:
        return "NULL"
    json_str = json.dumps(obj, ensure_ascii=False).replace("'", "''")
    return f"'{json_str}'::JSONB"

def build_migration():
    hk_path = os.path.join("src", "data", "upsc_pyq", "pc", "hk_dar_pc_2026_sept.json")
    nhk_path = os.path.join("src", "data", "upsc_pyq", "pc", "nhk_dar_pc_2026_sept.json")
    
    with open(hk_path, "r", encoding="utf-8") as f:
        hk_questions = json.load(f)
    with open(nhk_path, "r", encoding="utf-8") as f:
        nhk_questions = json.load(f)
        
    print(f"Loaded {len(hk_questions)} HK questions and {len(nhk_questions)} NHK questions.")
    
    all_papers = [
        ("hk", hk_questions, "Hyderabad-Karnataka (HK) CAR/DAR Sept 2026"),
        ("nhk", nhk_questions, "Non-Hyderabad Karnataka (NHK) CAR/DAR Sept 2026")
    ]
    
    sql_lines = []
    sql_lines.append("-- ═════════════════════════════════════════════════════════════════════════")
    sql_lines.append("-- SUPABASE MIGRATION: Police Constable (PC) CAR/DAR PYQ Table")
    sql_lines.append("-- Datasets: HK DAR PC Sept 2026 & NHK DAR PC Sept 2026 (200 Questions Total)")
    sql_lines.append("-- ═════════════════════════════════════════════════════════════════════════")
    sql_lines.append("")
    sql_lines.append("CREATE TABLE IF NOT EXISTS public.pc_pyq (")
    sql_lines.append("    id TEXT PRIMARY KEY,")
    sql_lines.append("    question_number INTEGER NOT NULL,")
    sql_lines.append("    year INTEGER NOT NULL DEFAULT 2026,")
    sql_lines.append("    month TEXT NOT NULL DEFAULT 'September',")
    sql_lines.append("    paper INTEGER NOT NULL DEFAULT 1,")
    sql_lines.append("    paper_code TEXT NOT NULL CHECK (paper_code IN ('hk', 'nhk')),")
    sql_lines.append("    exam_id TEXT NOT NULL DEFAULT 'ksp-pc',")
    sql_lines.append("    node_id TEXT NOT NULL,")
    sql_lines.append("    subject TEXT NOT NULL,")
    sql_lines.append("    subject_kannada TEXT,")
    sql_lines.append("    domain TEXT NOT NULL,")
    sql_lines.append("    domain_kannada TEXT,")
    sql_lines.append("    sub_topic TEXT NOT NULL,")
    sql_lines.append("    sub_topic_kannada TEXT,")
    sql_lines.append("    difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),")
    sql_lines.append("    tags TEXT[],")
    sql_lines.append("    passage_english TEXT,")
    sql_lines.append("    passage_kannada TEXT,")
    sql_lines.append("    question_english TEXT NOT NULL,")
    sql_lines.append("    question_kannada TEXT NOT NULL,")
    sql_lines.append("    option_1_english TEXT NOT NULL,")
    sql_lines.append("    option_2_english TEXT NOT NULL,")
    sql_lines.append("    option_3_english TEXT NOT NULL,")
    sql_lines.append("    option_4_english TEXT NOT NULL,")
    sql_lines.append("    option_1_kannada TEXT NOT NULL,")
    sql_lines.append("    option_2_kannada TEXT NOT NULL,")
    sql_lines.append("    option_3_kannada TEXT NOT NULL,")
    sql_lines.append("    option_4_kannada TEXT NOT NULL,")
    sql_lines.append("    key_answer TEXT NOT NULL,")
    sql_lines.append("    explanation_english TEXT NOT NULL,")
    sql_lines.append("    explanation_kannada TEXT NOT NULL,")
    sql_lines.append("    image_url TEXT,")
    sql_lines.append("    table_data JSONB,")
    sql_lines.append("    created_at TIMESTAMPTZ DEFAULT NOW()")
    sql_lines.append(");")
    sql_lines.append("")
    sql_lines.append("-- Row Level Security (RLS)")
    sql_lines.append("ALTER TABLE public.pc_pyq ENABLE ROW LEVEL SECURITY;")
    sql_lines.append("")
    sql_lines.append("DROP POLICY IF EXISTS \"Allow public read access on pc_pyq\" ON public.pc_pyq;")
    sql_lines.append("CREATE POLICY \"Allow public read access on pc_pyq\" ON public.pc_pyq FOR SELECT USING (true);")
    sql_lines.append("")
    sql_lines.append("DROP POLICY IF EXISTS \"Allow anon insert on pc_pyq\" ON public.pc_pyq;")
    sql_lines.append("CREATE POLICY \"Allow anon insert on pc_pyq\" ON public.pc_pyq FOR INSERT WITH CHECK (true);")
    sql_lines.append("")
    sql_lines.append("DROP POLICY IF EXISTS \"Allow anon update on pc_pyq\" ON public.pc_pyq;")
    sql_lines.append("CREATE POLICY \"Allow anon update on pc_pyq\" ON public.pc_pyq FOR UPDATE USING (true);")
    sql_lines.append("")
    sql_lines.append("-- Performance Indexes")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_year ON public.pc_pyq(year);")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_paper ON public.pc_pyq(paper);")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_paper_code ON public.pc_pyq(paper_code);")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_node_id ON public.pc_pyq(node_id);")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_subject ON public.pc_pyq(subject);")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_domain ON public.pc_pyq(domain);")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_difficulty ON public.pc_pyq(difficulty);")
    sql_lines.append("CREATE INDEX IF NOT EXISTS idx_pc_pyq_exam_id ON public.pc_pyq(exam_id);")
    sql_lines.append("")

    for paper_code, questions, label in all_papers:
        sql_lines.append(f"-- ═════════════════════════════════════════════════════════════════════════")
        sql_lines.append(f"-- Seed Data: {label} (Q1 to Q{len(questions)})")
        sql_lines.append(f"-- ═════════════════════════════════════════════════════════════════════════")
        
        # Insert in chunks of 25 questions
        chunk_size = 25
        for c_idx in range(0, len(questions), chunk_size):
            chunk = questions[c_idx:c_idx + chunk_size]
            sql_lines.append("INSERT INTO public.pc_pyq (")
            sql_lines.append("    id, question_number, year, month, paper, paper_code, exam_id, node_id,")
            sql_lines.append("    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,")
            sql_lines.append("    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,")
            sql_lines.append("    option_1_english, option_2_english, option_3_english, option_4_english,")
            sql_lines.append("    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,")
            sql_lines.append("    key_answer, explanation_english, explanation_kannada, image_url, table_data")
            sql_lines.append(") VALUES")
            
            val_rows = []
            for q in chunk:
                qnum = q["question_number"]
                yr = q.get("year", 2026)
                row_id = f"pc-{paper_code}-{yr}-q{qnum}"
                
                row_vals = [
                    sql_escape(row_id),
                    str(qnum),
                    str(yr),
                    sql_escape(q.get("month", "September")),
                    str(q.get("paper", 1)),
                    sql_escape(paper_code),
                    sql_escape("ksp-pc"),
                    sql_escape(q.get("node_id", "")),
                    sql_escape(q.get("subject", "")),
                    sql_escape(q.get("subject_kannada", "")),
                    sql_escape(q.get("domain", "")),
                    sql_escape(q.get("domain_kannada", "")),
                    sql_escape(q.get("sub_topic", "")),
                    sql_escape(q.get("sub_topic_kannada", "")),
                    sql_escape(q.get("difficulty", "medium")),
                    sql_array_escape(q.get("tags", [])),
                    sql_escape(q.get("passage_english", "")),
                    sql_escape(q.get("passage_kannada", "")),
                    sql_escape(q.get("question_english", "")),
                    sql_escape(q.get("question_kannada", "")),
                    sql_escape(q.get("option_1_english", "")),
                    sql_escape(q.get("option_2_english", "")),
                    sql_escape(q.get("option_3_english", "")),
                    sql_escape(q.get("option_4_english", "")),
                    sql_escape(q.get("option_1_kannada", "")),
                    sql_escape(q.get("option_2_kannada", "")),
                    sql_escape(q.get("option_3_kannada", "")),
                    sql_escape(q.get("option_4_kannada", "")),
                    sql_escape(str(q.get("key_answer", ""))),
                    sql_escape(q.get("explanation_english", "")),
                    sql_escape(q.get("explanation_kannada", "")),
                    sql_escape(q.get("image_url")),
                    sql_jsonb_escape(q.get("table_data"))
                ]
                val_rows.append("    (" + ", ".join(row_vals) + ")")
                
            sql_lines.append(",\n".join(val_rows))
            sql_lines.append("ON CONFLICT (id) DO UPDATE SET")
            sql_lines.append("    node_id = EXCLUDED.node_id,")
            sql_lines.append("    subject = EXCLUDED.subject,")
            sql_lines.append("    subject_kannada = EXCLUDED.subject_kannada,")
            sql_lines.append("    domain = EXCLUDED.domain,")
            sql_lines.append("    domain_kannada = EXCLUDED.domain_kannada,")
            sql_lines.append("    sub_topic = EXCLUDED.sub_topic,")
            sql_lines.append("    sub_topic_kannada = EXCLUDED.sub_topic_kannada,")
            sql_lines.append("    difficulty = EXCLUDED.difficulty,")
            sql_lines.append("    tags = EXCLUDED.tags,")
            sql_lines.append("    question_english = EXCLUDED.question_english,")
            sql_lines.append("    question_kannada = EXCLUDED.question_kannada,")
            sql_lines.append("    option_1_english = EXCLUDED.option_1_english,")
            sql_lines.append("    option_2_english = EXCLUDED.option_2_english,")
            sql_lines.append("    option_3_english = EXCLUDED.option_3_english,")
            sql_lines.append("    option_4_english = EXCLUDED.option_4_english,")
            sql_lines.append("    option_1_kannada = EXCLUDED.option_1_kannada,")
            sql_lines.append("    option_2_kannada = EXCLUDED.option_2_kannada,")
            sql_lines.append("    option_3_kannada = EXCLUDED.option_3_kannada,")
            sql_lines.append("    option_4_kannada = EXCLUDED.option_4_kannada,")
            sql_lines.append("    key_answer = EXCLUDED.key_answer,")
            sql_lines.append("    explanation_english = EXCLUDED.explanation_english,")
            sql_lines.append("    explanation_kannada = EXCLUDED.explanation_kannada,")
            sql_lines.append("    image_url = EXCLUDED.image_url,")
            sql_lines.append("    table_data = EXCLUDED.table_data;")
            sql_lines.append("")

    output_path = "supabase_migration_pc_pyq.sql"
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_lines) + "\n")
        
    print(f"Generated {output_path} ({len(sql_lines)} lines, {os.path.getsize(output_path)} bytes).")

if __name__ == "__main__":
    build_migration()
