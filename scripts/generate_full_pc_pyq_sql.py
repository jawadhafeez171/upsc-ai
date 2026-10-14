# -*- coding: utf-8 -*-
"""
Generates supabase_truncate_and_seed_28_pc_pyq.sql containing:
1. TRUNCATE TABLE public.pc_pyq
2. DROP CONSTRAINT IF EXISTS pc_pyq_paper_code_check
3. Policy update for DELETE
4. INSERT statements for all 2,800 questions across the 28 active papers.
"""

import glob
import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

OUTPUT_SQL = "supabase_truncate_and_seed_28_pc_pyq.sql"

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

def derive_paper_code(filename):
    clean = filename.replace(".json", "")
    if clean.endswith("_q001-100"):
        clean = clean[:-9]
    return clean

def main():
    pc_dir = os.path.join("src", "data", "pc")
    all_files = sorted(glob.glob(os.path.join(pc_dir, "*.json")))
    question_files = [f for f in all_files if not os.path.basename(f).startswith("knowledge_graph")]
    
    print(f"Generating full SQL script for {len(question_files)} papers...")
    
    with open(OUTPUT_SQL, "w", encoding="utf-8") as out:
        out.write("-- ═════════════════════════════════════════════════════════════════════════\n")
        out.write("-- SUPABASE MIGRATION: TRUNCATE & SEED ALL 28 POLICE CONSTABLE PAPERS\n")
        out.write(f"-- Total Papers: {len(question_files)} | Total Questions: {len(question_files) * 100}\n")
        out.write("-- ═════════════════════════════════════════════════════════════════════════\n\n")
        
        # 1. Truncate & Alter Table
        out.write("-- 1. Clean existing table & remove restrictive paper_code check constraint\n")
        out.write("TRUNCATE TABLE public.pc_pyq;\n")
        out.write("ALTER TABLE public.pc_pyq DROP CONSTRAINT IF EXISTS pc_pyq_paper_code_check;\n\n")
        
        out.write("-- 2. Ensure RLS policies cover DELETE for future resets\n")
        out.write("DROP POLICY IF EXISTS \"Allow anon delete on pc_pyq\" ON public.pc_pyq;\n")
        out.write("CREATE POLICY \"Allow anon delete on pc_pyq\" ON public.pc_pyq FOR DELETE USING (true);\n\n")
        
        total_qs = 0
        
        # 2. Inserts
        for fpath in question_files:
            fname = os.path.basename(fpath)
            p_code = derive_paper_code(fname)
            
            with open(fpath, "r", encoding="utf-8") as f:
                questions = json.load(f)
                
            out.write(f"-- ─── Paper: {fname} ({len(questions)} Questions) ───\n")
            out.write("INSERT INTO public.pc_pyq (\n")
            out.write("    id, question_number, year, month, paper, paper_code, exam_id,\n")
            out.write("    node_id, subject, subject_kannada, domain, domain_kannada,\n")
            out.write("    sub_topic, sub_topic_kannada, difficulty, tags,\n")
            out.write("    passage_english, passage_kannada,\n")
            out.write("    question_english, question_kannada,\n")
            out.write("    option_1_english, option_2_english, option_3_english, option_4_english,\n")
            out.write("    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,\n")
            out.write("    key_answer, explanation_english, explanation_kannada,\n")
            out.write("    image_url, table_data\n")
            out.write(") VALUES\n")
            
            row_lines = []
            for q in questions:
                q_num = q["question_number"]
                yr = q.get("year") or 2020
                row_id = f"pc-{p_code}-q{q_num}"
                
                vals = [
                    sql_escape(row_id),
                    str(q_num),
                    str(int(yr)),
                    sql_escape(q.get("month", "")),
                    str(int(q.get("paper") or 1)),
                    sql_escape(p_code),
                    sql_escape("ksp-pc"),
                    sql_escape(q.get("node_id", "")),
                    sql_escape(q.get("subject", "")),
                    sql_escape(q.get("subject_kannada", "")),
                    sql_escape(q.get("domain", "")),
                    sql_escape(q.get("domain_kannada", "")),
                    sql_escape(q.get("sub_topic", "")),
                    sql_escape(q.get("sub_topic_kannada", "")),
                    sql_escape(q.get("difficulty") or "medium"),
                    sql_array_escape(q.get("tags") or []),
                    sql_escape(q.get("passage_english")),
                    sql_escape(q.get("passage_kannada")),
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
                    sql_escape(str(q.get("key_answer", "1"))),
                    sql_escape(q.get("explanation_english", "")),
                    sql_escape(q.get("explanation_kannada", "")),
                    sql_escape(q.get("image_url")),
                    sql_jsonb_escape(q.get("table_data"))
                ]
                row_lines.append("    (" + ", ".join(vals) + ")")
                total_qs += 1
                
            out.write(",\n".join(row_lines))
            out.write("\nON CONFLICT (id) DO UPDATE SET\n")
            out.write("    node_id = EXCLUDED.node_id,\n")
            out.write("    subject = EXCLUDED.subject,\n")
            out.write("    subject_kannada = EXCLUDED.subject_kannada,\n")
            out.write("    domain = EXCLUDED.domain,\n")
            out.write("    domain_kannada = EXCLUDED.domain_kannada,\n")
            out.write("    sub_topic = EXCLUDED.sub_topic,\n")
            out.write("    sub_topic_kannada = EXCLUDED.sub_topic_kannada,\n")
            out.write("    difficulty = EXCLUDED.difficulty,\n")
            out.write("    tags = EXCLUDED.tags;\n\n")
            
    print(f"Generated {OUTPUT_SQL} with {total_qs} questions! File size: {os.path.getsize(OUTPUT_SQL):,} bytes.")

if __name__ == "__main__":
    main()
