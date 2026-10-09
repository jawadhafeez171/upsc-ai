# -*- coding: utf-8 -*-
"""
Uploads all 1,060 questions from src/data/epfo/epfo-all-papers.json
to the Supabase public.epfo_pyq table via REST API using UPSERT (merge-duplicates).
"""

import json
import os
import sys
import urllib.request
import urllib.error

sys.stdout.reconfigure(encoding='utf-8')

SUPABASE_URL = "https://oazgwzctyjowxnvbhiud.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hemd3emN0eWpvd3hudmJoaXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyMzE5ODEsImV4cCI6MjA4ODgwNzk4MX0.DvOTMoqNVJjPMiXGw4nhwmY0AXAcsUONAEzrkQfBrP0"

def load_epfo_questions():
    file_path = os.path.join("src", "data", "epfo", "epfo-all-papers.json")
    with open(file_path, "r", encoding="utf-8") as f:
        questions = json.load(f)

    records = []
    for q in questions:
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

        record = {
            "id": row_id,
            "question_number": qn,
            "year": yr,
            "month": q.get("month", "July"),
            "paper": q.get("paper", 1),
            "paper_code": pcode,
            "exam_name": exam_name,
            "exam_id": "upsc-epfo",
            "node_id": q.get("node_id", ""),
            "subject": q.get("subject", ""),
            "subject_hindi": q.get("subject_hindi"),
            "domain": q.get("domain", ""),
            "domain_hindi": q.get("domain_hindi"),
            "sub_topic": q.get("sub_topic", ""),
            "sub_topic_hindi": q.get("sub_topic_hindi"),
            "difficulty": diff,
            "tags": q.get("tags", []),
            "passage_english": q.get("passage_english"),
            "passage_hindi": q.get("passage_hindi"),
            "question_english": q.get("question_english", ""),
            "question_hindi": q.get("question_hindi"),
            "option_a_english": q.get("option_a_english", ""),
            "option_b_english": q.get("option_b_english", ""),
            "option_c_english": q.get("option_c_english", ""),
            "option_d_english": q.get("option_d_english", ""),
            "option_a_hindi": q.get("option_a_hindi"),
            "option_b_hindi": q.get("option_b_hindi"),
            "option_c_hindi": q.get("option_c_hindi"),
            "option_d_hindi": q.get("option_d_hindi"),
            "key_answer": key_ans,
            "explanation_english": q.get("explanation_english", ""),
            "explanation_hindi": q.get("explanation_hindi"),
            "image_url": q.get("image_url")
        }
        records.append(record)

    return records

def upload_records(all_records):
    print(f"Total EPFO questions prepared for upload: {len(all_records)}")

    url = f"{SUPABASE_URL}/rest/v1/epfo_pyq"
    headers = {
        "apikey": SUPABASE_KEY,
        "Authorization": f"Bearer {SUPABASE_KEY}",
        "Content-Type": "application/json",
        "Prefer": "resolution=merge-duplicates"
    }

    chunk_size = 50
    success_count = 0
    total_batches = (len(all_records) + chunk_size - 1) // chunk_size

    for i in range(0, len(all_records), chunk_size):
        chunk = all_records[i:i + chunk_size]
        payload = json.dumps(chunk, ensure_ascii=False).encode("utf-8")
        req = urllib.request.Request(url, data=payload, headers=headers, method="POST")
        try:
            with urllib.request.urlopen(req) as resp:
                success_count += len(chunk)
                print(f"Uploaded batch {i//chunk_size + 1}/{total_batches}: {len(chunk)} questions (Status {resp.status})")
        except urllib.error.HTTPError as e:
            err_body = e.read().decode('utf-8')
            print(f"HTTPError on batch {i//chunk_size + 1}: {e.code} - {err_body}")
            if "PGRST205" in err_body or "PGRST204" in err_body or "relation" in err_body or "does not exist" in err_body:
                print("\n[TABLE REQUIRED] The table 'public.epfo_pyq' needs to be created in Supabase SQL editor.")
                print("Run the SQL script: supabase_table_epfo_pyq.sql")
                return False
        except Exception as e:
            print(f"Error on batch {i//chunk_size + 1}: {e}")
            return False

    print(f"\nUpload complete! Successfully seeded: {success_count}/{len(all_records)} questions.")
    return True

if __name__ == "__main__":
    records = load_epfo_questions()
    upload_records(records)
