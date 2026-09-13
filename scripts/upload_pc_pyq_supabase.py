# -*- coding: utf-8 -*-
"""
Uploads all questions from:
1. src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json (100 questions)
2. src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json (100 questions)
to the Supabase pc_pyq table via REST API.
"""

import json
import os
import sys
import urllib.request
import urllib.error

sys.stdout.reconfigure(encoding='utf-8')

SUPABASE_URL = "https://oazgwzctyjowxnvbhiud.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hemd3emN0eWpvd3hudmJoaXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyMzE5ODEsImV4cCI6MjA4ODgwNzk4MX0.DvOTMoqNVJjPMiXGw4nhwmY0AXAcsUONAEzrkQfBrP0"

def load_and_transform(file_path, paper_code):
    with open(file_path, "r", encoding="utf-8") as f:
        questions = json.load(f)
        
    records = []
    for q in questions:
        q_num = q["question_number"]
        yr = q.get("year", 2026)
        row_id = f"pc-{paper_code}-{yr}-q{q_num}"
        record = {
            "id": row_id,
            "question_number": q_num,
            "year": yr,
            "month": q.get("month", "September"),
            "paper": q.get("paper", 1),
            "paper_code": paper_code,
            "exam_id": "ksp-pc",
            "node_id": q.get("node_id", ""),
            "subject": q.get("subject", ""),
            "subject_kannada": q.get("subject_kannada", ""),
            "domain": q.get("domain", ""),
            "domain_kannada": q.get("domain_kannada", ""),
            "sub_topic": q.get("sub_topic", ""),
            "sub_topic_kannada": q.get("sub_topic_kannada", ""),
            "difficulty": q.get("difficulty", "medium"),
            "tags": q.get("tags", []),
            "passage_english": q.get("passage_english", ""),
            "passage_kannada": q.get("passage_kannada", ""),
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
            "key_answer": str(q.get("key_answer", "")),
            "explanation_english": q.get("explanation_english", ""),
            "explanation_kannada": q.get("explanation_kannada", ""),
            "image_url": q.get("image_url"),
            "table_data": q.get("table_data")
        }
        records.append(record)
    return records

def main():
    hk_path = os.path.join("src", "data", "upsc_pyq", "pc", "hk_dar_pc_2026_sept.json")
    nhk_path = os.path.join("src", "data", "upsc_pyq", "pc", "nhk_dar_pc_2026_sept.json")
    
    hk_records = load_and_transform(hk_path, "hk")
    nhk_records = load_and_transform(nhk_path, "nhk")
    all_records = hk_records + nhk_records
    
    print(f"Total PC questions prepared: {len(all_records)} (HK: {len(hk_records)}, NHK: {len(nhk_records)})")
    
    url = f"{SUPABASE_URL}/rest/v1/pc_pyq"
    headers = {
        "apikey": SUPABASE_KEY,
        "Authorization": f"Bearer {SUPABASE_KEY}",
        "Content-Type": "application/json",
        "Prefer": "resolution=merge-duplicates"
    }
    
    # Test connection or first batch
    chunk_size = 20
    success_count = 0
    for i in range(0, len(all_records), chunk_size):
        chunk = all_records[i:i + chunk_size]
        payload = json.dumps(chunk, ensure_ascii=False).encode("utf-8")
        req = urllib.request.Request(url, data=payload, headers=headers, method="POST")
        try:
            with urllib.request.urlopen(req) as resp:
                print(f"Uploaded batch {i//chunk_size + 1}: {len(chunk)} questions (Status {resp.status})")
                success_count += len(chunk)
        except urllib.error.HTTPError as e:
            err_body = e.read().decode('utf-8')
            print(f"HTTPError on batch {i//chunk_size + 1}: {e.code} - {err_body}")
            if "PGRST204" in err_body or "relation" in err_body or "does not exist" in err_body:
                print("\n[NOTE] The table 'public.pc_pyq' does not exist in Supabase yet.")
                print("We must provide the SQL migration script so the table can be created.")
                return False
        except Exception as e:
            print(f"Error on batch {i//chunk_size + 1}: {e}")
            return False
            
    print(f"\nUpload complete! Total questions processed: {success_count}/{len(all_records)}")
    return True

if __name__ == "__main__":
    main()
