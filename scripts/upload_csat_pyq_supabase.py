# -*- coding: utf-8 -*-
"""
Uploads all 80 questions from 2020_csat.json to the Supabase csat_pyq table via REST API.
"""

import json
import os
import urllib.request
import urllib.error

SUPABASE_URL = "https://oazgwzctyjowxnvbhiud.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hemd3emN0eWpvd3hudmJoaXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyMzE5ODEsImV4cCI6MjA4ODgwNzk4MX0.DvOTMoqNVJjPMiXGw4nhwmY0AXAcsUONAEzrkQfBrP0"

def main():
    json_path = os.path.join("src", "data", "upsc_pyq", "csat", "2020_csat.json")
    with open(json_path, "r", encoding="utf-8") as f:
        questions = json.load(f)

    print(f"Read {len(questions)} questions from {json_path}")

    records = []
    for q in questions:
        q_num = q["question_number"]
        yr = q.get("year", 2020)
        row_id = f"csat-{yr}-q{q_num}"
        record = {
            "id": row_id,
            "question_number": q_num,
            "year": yr,
            "paper": q.get("paper", 2),
            "exam_id": "upsc-cse",
            "node_id": q.get("node_id", ""),
            "subject": q.get("subject", ""),
            "subject_hindi": q.get("subject_hindi", ""),
            "domain": q.get("domain", ""),
            "domain_hindi": q.get("domain_hindi", ""),
            "sub_topic": q.get("sub_topic", ""),
            "sub_topic_hindi": q.get("sub_topic_hindi", ""),
            "difficulty": q.get("difficulty", "medium"),
            "tags": q.get("tags", []),
            "question_english": q.get("question_english", ""),
            "question_hindi": q.get("question_hindi", ""),
            "option_a_english": q.get("option_a_english", ""),
            "option_b_english": q.get("option_b_english", ""),
            "option_c_english": q.get("option_c_english", ""),
            "option_d_english": q.get("option_d_english", ""),
            "option_a_hindi": q.get("option_a_hindi", ""),
            "option_b_hindi": q.get("option_b_hindi", ""),
            "option_c_hindi": q.get("option_c_hindi", ""),
            "option_d_hindi": q.get("option_d_hindi", ""),
            "key_answer": q.get("key_answer", ""),
            "explanation_english": q.get("explanation_english", ""),
            "explanation_hindi": q.get("explanation_hindi", ""),
            "image_url": q.get("image_url")
        }
        records.append(record)

    url = f"{SUPABASE_URL}/rest/v1/csat_pyq"
    headers = {
        "apikey": SUPABASE_KEY,
        "Authorization": f"Bearer {SUPABASE_KEY}",
        "Content-Type": "application/json",
        "Prefer": "resolution=merge-duplicates"
    }

    # Upload in chunks of 20
    chunk_size = 20
    success_count = 0
    for i in range(0, len(records), chunk_size):
        chunk = records[i:i + chunk_size]
        payload = json.dumps(chunk).encode("utf-8")
        req = urllib.request.Request(url, data=payload, headers=headers, method="POST")
        try:
            with urllib.request.urlopen(req) as resp:
                print(f"Uploaded batch {i//chunk_size + 1}: {len(chunk)} questions (Status {resp.status})")
                success_count += len(chunk)
        except urllib.error.HTTPError as e:
            print(f"HTTPError on batch {i//chunk_size + 1}: {e.code} - {e.read().decode('utf-8')}")
        except Exception as e:
            print(f"Error on batch {i//chunk_size + 1}: {e}")

    print(f"\nUpload complete! Total questions processed: {success_count}/{len(records)}")

if __name__ == "__main__":
    main()
