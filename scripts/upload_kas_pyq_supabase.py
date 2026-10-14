# -*- coding: utf-8 -*-
"""
Uploads all 1,200 questions from src/data/kpsc kas/kas_*.json
to the Supabase public.kas_questions table via REST API using UPSERT (merge-duplicates).
"""

import json
import os
import sys
import glob
import re
import urllib.request
import urllib.error

sys.stdout.reconfigure(encoding='utf-8')

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

def normalize_month(m):
    if not m:
        return 'december'
    month = str(m).lower().strip()
    if month.startswith('jan'): return 'january'
    if month.startswith('feb'): return 'february'
    if month.startswith('mar'): return 'march'
    if month.startswith('apr'): return 'april'
    if month.startswith('may'): return 'may'
    if month.startswith('jun'): return 'june'
    if month.startswith('jul'): return 'july'
    if month.startswith('aug'): return 'august'
    if month.startswith('sep'): return 'september'
    if month.startswith('oct'): return 'october'
    if month.startswith('nov'): return 'november'
    if month.startswith('dec'): return 'december'
    return month

def load_all_kas_records():
    files = sorted(glob.glob('src/data/kpsc kas/kas_*.json'))
    print(f"Found {len(files)} KPSC KAS files.")
    
    all_records = []
    for filepath in files:
        filename = os.path.basename(filepath)
        with open(filepath, 'r', encoding='utf-8') as f:
            questions = json.load(f)
            
        year_match = re.search(r'\d{4}', filename)
        paper_match = re.search(r'p(\d)', filename, re.IGNORECASE)
        month_match = re.search(r'(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*', filename, re.IGNORECASE)
        
        file_year = int(year_match.group(0)) if year_match else 2024
        file_paper = int(paper_match.group(1)) if paper_match else 1
        file_month = normalize_month(month_match.group(0)) if month_match else 'december'
        
        for q in questions:
            q_num = q.get('question_number') or q.get('number') or 1
            try:
                correct_idx = int(q.get('key_answer', 1)) - 1
            except (ValueError, TypeError):
                correct_idx = 0
            if correct_idx < 0:
                correct_idx = 0

            options_en = [
                q.get('option_1_english') or '',
                q.get('option_2_english') or '',
                q.get('option_3_english') or '',
                q.get('option_4_english') or ''
            ]
            options_en = [o for o in options_en if o]

            options_kn = [
                q.get('option_1_kannada') or '',
                q.get('option_2_kannada') or '',
                q.get('option_3_kannada') or '',
                q.get('option_4_kannada') or ''
            ]
            options_kn = [o for o in options_kn if o]

            q_year = int(q.get('year')) if q.get('year') is not None else file_year
            q_month = normalize_month(q.get('month')) if q.get('month') else file_month
            q_paper = int(q.get('paper')) if q.get('paper') is not None else file_paper

            record = {
                "id": f"kpsc-kas-{q_year}-{q_month}-p{q_paper}-q{q_num}",
                "exam_id": "kpsc-kas",
                "text_en": q.get('question_english') or q.get('question', ''),
                "text_kn": q.get('question_kannada', ''),
                "options_en": options_en,
                "options_kn": options_kn,
                "correct_index": correct_idx,
                "explanation_en": q.get('explanation_english') or q.get('explanation') or 'No explanation available.',
                "explanation_kn": q.get('explanation_kannada') or 'ವಿವರಣೆ ಲಭ್ಯವಿಲ್ಲ.',
                "subject": q.get('subject') or 'General Studies',
                "subject_kannada": q.get('subject_kannada'),
                "domain": q.get('domain'),
                "domain_kannada": q.get('domain_kannada'),
                "sub_topic": q.get('sub_topic'),
                "sub_topic_kannada": q.get('sub_topic_kannada'),
                "node_id": q.get('node_id'),
                "secondary_node_ids": q.get('secondary_node_ids') or [],
                "is_mapping": bool(q.get('is_mapping', False)),
                "mapping": q.get('mapping'),
                "tags": q.get('tags') or [],
                "passage_en": q.get('passage_english'),
                "passage_kn": q.get('passage_kannada'),
                "difficulty": (q.get('difficulty') or 'medium').lower(),
                "image_url": q.get('image_url'),
                "year": q_year,
                "month": q_month,
                "paper": q_paper
            }
            all_records.append(record)

    return all_records

def upload_records(all_records):
    env = load_env()
    supabase_url = env.get('NEXT_PUBLIC_SUPABASE_URL')
    supabase_key = env.get('NEXT_PUBLIC_SUPABASE_ANON_KEY')
    
    if not supabase_url or not supabase_key:
        print("ERROR: Supabase URL/Key missing.")
        return False

    print(f"Total KPSC KAS questions prepared for upload: {len(all_records)}")
    url = f"{supabase_url}/rest/v1/kas_questions"
    headers = {
        "apikey": supabase_key,
        "Authorization": f"Bearer {supabase_key}",
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
            return False
        except Exception as e:
            print(f"Error on batch {i//chunk_size + 1}: {e}")
            return False

    print(f"\nUpload complete! Successfully seeded: {success_count}/{len(all_records)} KPSC KAS questions.")
    return True

if __name__ == "__main__":
    records = load_all_kas_records()
    upload_records(records)
