# -*- coding: utf-8 -*-
"""
Uploads all 2,492 questions from 38 Karnataka State Police (KSP) / KEA 
Police Sub-Inspector (PSI) question papers in 'src/data/psi/'
to the Supabase 'psi_pyq' table via the PostgREST API.

Usage:
    python scripts/upload_psi_pyq_supabase.py           # Uploads all questions
    python scripts/upload_psi_pyq_supabase.py --dry-run # Validates data without uploading
"""

import glob
import json
import os
import sys
import urllib.request
import urllib.error

sys.stdout.reconfigure(encoding='utf-8')

# ─────────────────────────────────────────────────────────────────────────────
# CONFIGURATION & CREDENTIALS
# ─────────────────────────────────────────────────────────────────────────────

def get_env_credentials():
    url = "https://oazgwzctyjowxnvbhiud.supabase.co"
    key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hemd3emN0eWpvd3hudmJoaXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyMzE5ODEsImV4cCI6MjA4ODgwNzk4MX0.DvOTMoqNVJjPMiXGw4nhwmY0AXAcsUONAEzrkQfBrP0"
    
    env_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), ".env.local")
    if os.path.exists(env_path):
        with open(env_path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line.startswith("NEXT_PUBLIC_SUPABASE_URL="):
                    url = line.split("=", 1)[1].strip()
                elif line.startswith("NEXT_PUBLIC_SUPABASE_ANON_KEY="):
                    key = line.split("=", 1)[1].strip()
    return url, key

SUPABASE_URL, SUPABASE_KEY = get_env_credentials()

# ─────────────────────────────────────────────────────────────────────────────
# CADRE RESOLVER
# ─────────────────────────────────────────────────────────────────────────────

def detect_cadre(filename: str) -> str:
    fname = filename.lower()
    if "civil-psi" in fname:
        return "Civil PSI"
    elif "wireless" in fname:
        return "Wireless PSI"
    elif "reserve-si" in fname or "armed-reserve" in fname or "car-dar" in fname:
        return "Reserve SI (CAR/DAR)"
    elif "ksrp" in fname and "ksisf" in fname:
        return "KSRP Special Reserve / KSISF SI"
    elif "ksrp" in fname:
        return "KSRP Special Reserve SI"
    elif "ksisf" in fname:
        return "KSISF SI"
    elif "fingerprint" in fname:
        return "Fingerprint Bureau PSI"
    elif "state-intelligence" in fname or "intelligence" in fname:
        return "State Intelligence PSI"
    elif "detective" in fname:
        return "Detective SI"
    return "Police Sub-Inspector"

# ─────────────────────────────────────────────────────────────────────────────
# DATA TRANSFORMER
# ─────────────────────────────────────────────────────────────────────────────

def load_and_transform_all(psi_dir: str):
    json_files = sorted(glob.glob(os.path.join(psi_dir, "*.json")))
    if not json_files:
        raise FileNotFoundError(f"No JSON files found in {psi_dir}")

    all_records = []
    file_stats = []

    for fpath in json_files:
        fname = os.path.basename(fpath)
        stem = os.path.splitext(fname)[0]
        cadre = detect_cadre(fname)

        with open(fpath, "r", encoding="utf-8") as f:
            questions = json.load(f)

        # Disambiguate multi-topic questions (e.g. Paper 1 essay options Q1a-Q1e)
        from collections import Counter, defaultdict
        qn_counts = Counter(q.get("question_number", 0) for q in questions)
        qn_seen = defaultdict(int)

        for q in questions:
            q_num = q.get("question_number", 0)
            qn_seen[q_num] += 1
            if qn_counts[q_num] > 1:
                suffix = chr(ord('a') + qn_seen[q_num] - 1)
                row_id = f"{stem}-q{q_num:03d}{suffix}"
            else:
                row_id = f"{stem}-q{q_num:03d}"

            # Normalize key_answer (Paper 1 is None)
            key_ans = q.get("key_answer")
            if key_ans is not None:
                key_ans = str(key_ans).strip()

            record = {
                "id": row_id,
                "question_number": q_num,
                "year": q.get("year", 2024),
                "month": q.get("month"),
                "paper": q.get("paper", 2),
                "cadre": cadre,
                "exam_id": "ksp-psi",
                "exam_name": q.get("exam_name"),
                "file_source": fname,
                "node_id": q.get("node_id", ""),
                "subject": q.get("subject", ""),
                "subject_kannada": q.get("subject_kannada"),
                "domain": q.get("domain", ""),
                "domain_kannada": q.get("domain_kannada"),
                "sub_topic": q.get("sub_topic", ""),
                "sub_topic_kannada": q.get("sub_topic_kannada"),
                "difficulty": q.get("difficulty", "medium"),
                "tags": q.get("tags") or [],
                "passage_english": q.get("passage_english"),
                "passage_kannada": q.get("passage_kannada"),
                "question_english": q.get("question_english", ""),
                "question_kannada": q.get("question_kannada"),
                "option_1_english": q.get("option_1_english"),
                "option_2_english": q.get("option_2_english"),
                "option_3_english": q.get("option_3_english"),
                "option_4_english": q.get("option_4_english"),
                "option_1_kannada": q.get("option_1_kannada"),
                "option_2_kannada": q.get("option_2_kannada"),
                "option_3_kannada": q.get("option_3_kannada"),
                "option_4_kannada": q.get("option_4_kannada"),
                "key_answer": key_ans,
                "explanation_english": q.get("explanation_english"),
                "explanation_kannada": q.get("explanation_kannada"),
                "image_url": q.get("image_url")
            }
            all_records.append(record)

        file_stats.append({
            "file": fname,
            "cadre": cadre,
            "questions": len(questions),
            "paper": questions[0].get("paper", 2) if questions else None,
            "year": questions[0].get("year") if questions else None
        })

    return all_records, file_stats

# ─────────────────────────────────────────────────────────────────────────────
# MAIN UPLOAD ROUTINE
# ─────────────────────────────────────────────────────────────────────────────

def main():
    is_dry_run = "--dry-run" in sys.argv
    base_dir = os.path.dirname(os.path.dirname(__file__))
    psi_dir = os.path.join(base_dir, "src", "data", "psi")

    print("═══════════════════════════════════════════════════════════════════")
    print(" Karnataka State Police / KEA PSI PYQ Supabase Ingestion")
    print("═══════════════════════════════════════════════════════════════════")
    print(f"Directory: {psi_dir}")

    all_records, file_stats = load_and_transform_all(psi_dir)
    print(f"Total files parsed: {len(file_stats)}")
    print(f"Total questions transformed: {len(all_records)}")

    # Summary by Cadre
    cadre_counts = {}
    for stat in file_stats:
        cadre_counts[stat["cadre"]] = cadre_counts.get(stat["cadre"], 0) + stat["questions"]

    print("\nCadre Breakdown:")
    for cadre, count in sorted(cadre_counts.items(), key=lambda x: -x[1]):
        print(f"  • {cadre:<32}: {count:>4} questions")

    if is_dry_run:
        print("\n[DRY RUN] Verification successful. No data was uploaded to Supabase.")
        print(f"Sample Record ID: {all_records[0]['id']}")
        print(f"Sample Question: {all_records[0]['question_english'][:80]}...")
        return

    # Ingestion via PostgREST
    url = f"{SUPABASE_URL}/rest/v1/psi_pyq"
    headers = {
        "apikey": SUPABASE_KEY,
        "Authorization": f"Bearer {SUPABASE_KEY}",
        "Content-Type": "application/json",
        "Prefer": "resolution=merge-duplicates"
    }

    chunk_size = 50
    total_batches = (len(all_records) + chunk_size - 1) // chunk_size
    success_count = 0

    print(f"\nUploading to Supabase: {url}")
    print(f"Chunk size: {chunk_size} questions per batch ({total_batches} batches total)\n")

    for i in range(0, len(all_records), chunk_size):
        batch_num = (i // chunk_size) + 1
        chunk = all_records[i:i + chunk_size]
        payload = json.dumps(chunk, ensure_ascii=False).encode("utf-8")
        req = urllib.request.Request(url, data=payload, headers=headers, method="POST")

        try:
            with urllib.request.urlopen(req) as resp:
                success_count += len(chunk)
                if batch_num % 5 == 0 or batch_num == total_batches:
                    print(f"  [✓] Batch {batch_num:>2}/{total_batches} uploaded successfully ({success_count}/{len(all_records)} questions, status: {resp.status})")
        except urllib.error.HTTPError as e:
            err_body = e.read().decode('utf-8', errors='replace')
            print(f"\n[✗] HTTPError on batch {batch_num}/{total_batches}: HTTP {e.code}")
            print(f"    Response: {err_body}")
            if "PGRST204" in err_body or "relation" in err_body or "does not exist" in err_body:
                print("\n[CRITICAL NOTE] The table 'public.psi_pyq' has not been created in Supabase yet.")
                print("Please execute the DDL script 'supabase_table_psi_pyq.sql' in the Supabase SQL Editor first:")
                print(f"  File: {os.path.join(base_dir, 'supabase_table_psi_pyq.sql')}")
            return
        except Exception as ex:
            print(f"\n[✗] Unexpected error on batch {batch_num}: {ex}")
            return

    print("\n═══════════════════════════════════════════════════════════════════")
    print(f" Ingestion Complete! Successfully uploaded {success_count}/{len(all_records)} questions into public.psi_pyq.")
    print("═══════════════════════════════════════════════════════════════════")

if __name__ == "__main__":
    main()
