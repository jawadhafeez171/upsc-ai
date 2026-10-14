# -*- coding: utf-8 -*-
"""
Uploads all 6,364 questions from src/data/kea/*.json
to the Supabase public.kea_questions table via REST API using UPSERT (merge-duplicates).
"""

import json
import os
import sys
import glob
import re
import urllib.request
import urllib.error

import functools
print = functools.partial(print, flush=True)

def load_env():
    env = {}
    for fname in ['.env.local', '.env']:
        if os.path.exists(fname):
            with open(fname, 'r', encoding='utf-8') as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith('#') and '=' in line:
                        k, v = line.split('=', 1)
                        env[k.strip()] = v.strip('"\'')
    return env

def sanitize_slug(name):
    clean = re.sub(r'[^a-zA-Z0-9]+', '-', name).strip('-').lower()
    return clean

def load_all_kea_records():
    files = sorted(glob.glob('src/data/kea/*.json'))
    print(f"Found {len(files)} KEA question files.")
    
    all_records = []
    for filepath in files:
        filename = os.path.basename(filepath)
        paper_clean = filename.replace('.json', '')
        paper_slug = sanitize_slug(paper_clean)
        
        with open(filepath, 'r', encoding='utf-8') as f:
            questions = json.load(f)
            
        if not isinstance(questions, list):
            print(f"Skipping non-list file: {filename}")
            continue
            
        for idx, q in enumerate(questions):
            q_num = q.get('question_number') or (idx + 1)
            row_id = f"kea-{paper_slug}-q{q_num}"
            
            try:
                yr = int(q.get('year') or 2024)
            except (ValueError, TypeError):
                yr = 2024
                
            try:
                ppr = int(q.get('paper') or 1)
            except (ValueError, TypeError):
                ppr = 1

            record = {
                "id": row_id,
                "question_number": int(q_num),
                "year": yr,
                "month": q.get('month') or "",
                "paper": ppr,
                "paper_code": paper_clean,
                "exam_id": "kea",
                "exam_name": q.get('exam_name') or q.get('exam') or paper_clean,
                "node_id": q.get('node_id') or None,
                "subject": q.get('subject') or None,
                "subject_kannada": q.get('subject_kannada'),
                "domain": q.get('domain') or None,
                "domain_kannada": q.get('domain_kannada'),
                "sub_topic": q.get('sub_topic') or None,
                "sub_topic_kannada": q.get('sub_topic_kannada'),
                "difficulty": (q.get('difficulty') or 'medium').lower(),
                "tags": q.get('tags') or [],
                "passage_english": q.get('passage_english'),
                "passage_kannada": q.get('passage_kannada'),
                "question_english": q.get('question_english') or q.get('question') or '',
                "question_kannada": q.get('question_kannada'),
                "option_1_english": q.get('option_1_english'),
                "option_2_english": q.get('option_2_english'),
                "option_3_english": q.get('option_3_english'),
                "option_4_english": q.get('option_4_english'),
                "option_1_kannada": q.get('option_1_kannada'),
                "option_2_kannada": q.get('option_2_kannada'),
                "option_3_kannada": q.get('option_3_kannada'),
                "option_4_kannada": q.get('option_4_kannada'),
                "key_answer": str(q.get('key_answer', '1')).strip(),
                "explanation_english": q.get('explanation_english'),
                "explanation_kannada": q.get('explanation_kannada'),
                "image_url": q.get('image_url'),
                "table_data": q.get('table_data')
            }
            all_records.append(record)

    print(f"Total KEA questions transformed: {len(all_records)}")
    return all_records

def upload_records(all_records, chunk_size=50):
    env = load_env()
    supabase_url = env.get('NEXT_PUBLIC_SUPABASE_URL')
    supabase_key = env.get('NEXT_PUBLIC_SUPABASE_ANON_KEY')
    
    if not supabase_url or not supabase_key:
        print("ERROR: Supabase URL/Key missing.")
        return False

    url = f"{supabase_url}/rest/v1/kea_questions"
    headers = {
        "apikey": supabase_key,
        "Authorization": f"Bearer {supabase_key}",
        "Content-Type": "application/json",
        "Prefer": "resolution=merge-duplicates"
    }

    total = len(all_records)
    success_count = 0
    total_batches = (total + chunk_size - 1) // chunk_size

    print(f"Starting upload of {total} KEA questions in {total_batches} batches...")

    import time

    for i in range(0, total, chunk_size):
        chunk = all_records[i:i + chunk_size]
        payload = json.dumps(chunk, ensure_ascii=False).encode("utf-8")
        batch_num = i // chunk_size + 1
        
        uploaded = False
        for attempt in range(1, 5):
            req = urllib.request.Request(url, data=payload, headers=headers, method="POST")
            try:
                with urllib.request.urlopen(req, timeout=30) as resp:
                    success_count += len(chunk)
                    pct = (success_count / total) * 100
                    print(f"[{pct:5.1f}%] Batch {batch_num}/{total_batches}: Uploaded {len(chunk)} questions (Status {resp.status})")
                    uploaded = True
                    break
            except urllib.error.HTTPError as e:
                err_body = e.read().decode('utf-8')
                print(f"HTTPError on batch {batch_num} (attempt {attempt}): {e.code} - {err_body}")
                if e.code in (404, 400) and ("relation" in err_body or "does not exist" in err_body):
                    print("\n[TABLE MISSING] Table 'public.kea_questions' does not exist in Supabase.")
                    return False
                time.sleep(2 * attempt)
            except Exception as e:
                print(f"Network error on batch {batch_num} (attempt {attempt}): {e}. Retrying in {2 * attempt}s...")
                time.sleep(2 * attempt)
                
        if not uploaded:
            print(f"Failed to upload batch {batch_num} after 4 attempts.")
            return False

    print(f"\nUpload complete! Successfully seeded: {success_count}/{total} KEA questions.")
    return True

if __name__ == "__main__":
    records = load_all_kea_records()
    upload_records(records)
