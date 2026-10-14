# -*- coding: utf-8 -*-
"""
Seeds all 28 active question papers (2,800 questions) from src/data/pc/
into the Supabase 'pc_pyq' table via REST API.
"""

import glob
import json
import os
import sys
import time
import urllib.error
import urllib.request

sys.stdout.reconfigure(encoding='utf-8')

SUPABASE_URL = "https://oazgwzctyjowxnvbhiud.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hemd3emN0eWpvd3hudmJoaXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyMzE5ODEsImV4cCI6MjA4ODgwNzk4MX0.DvOTMoqNVJjPMiXGw4nhwmY0AXAcsUONAEzrkQfBrP0"

HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates"
}

def derive_paper_code(filename):
    clean = filename.replace(".json", "")
    if clean.endswith("_q001-100"):
        clean = clean[:-9]
    return clean

def load_all_28_papers():
    pc_dir = os.path.join("src", "data", "pc")
    all_files = sorted(glob.glob(os.path.join(pc_dir, "*.json")))
    
    question_files = [f for f in all_files if not os.path.basename(f).startswith("knowledge_graph")]
    
    print(f"Found {len(question_files)} active PC question papers in {pc_dir}.")
    
    records = []
    paper_stats = []
    
    for fpath in question_files:
        fname = os.path.basename(fpath)
        p_code = derive_paper_code(fname)
        
        with open(fpath, "r", encoding="utf-8") as f:
            data = json.load(f)
            
        if not isinstance(data, list):
            print(f"Skipping non-list file: {fname}")
            continue
            
        for q in data:
            q_num = q["question_number"]
            yr = q.get("year") or 2020
            
            # Deterministic, unique primary key
            row_id = f"pc-{p_code}-q{q_num}"
            
            record = {
                "id": row_id,
                "question_number": q_num,
                "year": int(yr),
                "month": q.get("month") or "",
                "paper": int(q.get("paper") or 1),
                "paper_code": p_code,
                "exam_id": "ksp-pc",
                "node_id": q.get("node_id", ""),
                "subject": q.get("subject", ""),
                "subject_kannada": q.get("subject_kannada", ""),
                "domain": q.get("domain", ""),
                "domain_kannada": q.get("domain_kannada", ""),
                "sub_topic": q.get("sub_topic", ""),
                "sub_topic_kannada": q.get("sub_topic_kannada", ""),
                "difficulty": q.get("difficulty") or "medium",
                "tags": q.get("tags") or [],
                "passage_english": q.get("passage_english"),
                "passage_kannada": q.get("passage_kannada"),
                "question_english": q.get("question_english", ""),
                "question_kannada": q.get("question_kannada", ""),
                "option_1_english": q.get("option_1_english", ""),
                "option_2_english": q.get("option_2_english", ""),
                "option_3_english": q.get("option_3_english", ""),
                "option_4_english": q.get("option_4_english", ""),
                "option_1_kannada": q.get("option_1_kannada", ""),
                "option_2_kannada": q.get("option_2_kannada", ""),
                "option_3_kannada": q.get("option_3_kannada", ""),
                "option_4_kannada": q.get("option_4_kannada", ""),
                "key_answer": str(q.get("key_answer", "1")),
                "explanation_english": q.get("explanation_english", ""),
                "explanation_kannada": q.get("explanation_kannada", ""),
                "image_url": q.get("image_url"),
                "table_data": q.get("table_data")
            }
            records.append(record)
            
        paper_stats.append((p_code, len(data)))
        
    print(f"Total prepared questions: {len(records)} across {len(paper_stats)} papers.")
    return records

def upload_records(records, chunk_size=50):
    url = f"{SUPABASE_URL}/rest/v1/pc_pyq"
    total = len(records)
    uploaded = 0
    
    print(f"\nStarting upload of {total} records in chunks of {chunk_size}...")
    
    for i in range(0, total, chunk_size):
        chunk = records[i:i + chunk_size]
        payload = json.dumps(chunk, ensure_ascii=False).encode("utf-8")
        req = urllib.request.Request(url, data=payload, headers=HEADERS, method="POST")
        
        retries = 3
        while retries > 0:
            try:
                with urllib.request.urlopen(req) as resp:
                    uploaded += len(chunk)
                    progress = (uploaded / total) * 100
                    print(f"[{progress:5.1f}%] Batch {i//chunk_size + 1}/{(total + chunk_size - 1)//chunk_size}: Uploaded {uploaded}/{total} questions (HTTP {resp.status})")
                    break
            except urllib.error.HTTPError as e:
                err_text = e.read().decode("utf-8")
                print(f"HTTPError on batch {i//chunk_size + 1}: {e.code} - {err_text}")
                if "pc_pyq_paper_code_check" in err_text:
                    print("\n[CONSTRAINT ERROR]: Table has 'CHECK (paper_code IN (\'hk\', \'nhk\'))'.")
                    print("Please run the SQL to drop this constraint in Supabase SQL editor:")
                    print("  ALTER TABLE public.pc_pyq DROP CONSTRAINT IF EXISTS pc_pyq_paper_code_check;")
                    return False
                retries -= 1
                if retries > 0:
                    time.sleep(2)
                else:
                    return False
            except Exception as e:
                print(f"Exception on batch {i//chunk_size + 1}: {e}")
                retries -= 1
                if retries > 0:
                    time.sleep(2)
                else:
                    return False
                    
    print(f"\nSUCCESS! Seeded {uploaded}/{total} questions to Supabase table 'pc_pyq'.")
    return True

if __name__ == "__main__":
    records = load_all_28_papers()
    upload_records(records)
