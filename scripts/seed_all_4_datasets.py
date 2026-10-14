# -*- coding: utf-8 -*-
"""
Master Seeding Pipeline:
Seeds all 4 examination datasets (6,685 questions) to Supabase:
1. UPSC EPFO (1,060 questions) -> public.epfo_pyq
2. KPSC KAS (1,200 questions) -> public.kas_questions
3. Karnataka Police Constable (2,800 questions) -> public.pc_pyq
4. UPSC CAPF (1,625 questions) -> public.capf_pyq
"""

import sys
import os
import time

sys.stdout.reconfigure(encoding='utf-8')
sys.path.append('scripts')

from upload_epfo_pyq_supabase import load_epfo_questions, upload_records as upload_epfo
from upload_kas_pyq_supabase import load_all_kas_records, upload_records as upload_kas
from seed_all_pc_pyq import load_all_28_papers, upload_records as upload_pc
from upload_capf_pyq_supabase import load_capf_questions, upload_records as upload_capf

def main():
    start_time = time.time()
    print("==================================================================")
    print("     MASTER QUESTION SEEDING PIPELINE TO SUPABASE                 ")
    print("     Total Scope: 6,685 Questions across 4 Exam Streams           ")
    print("==================================================================\n")

    # 1. EPFO
    print(">>> [1/4] SEEDING UPSC EPFO (public.epfo_pyq)...")
    epfo_records = load_epfo_questions()
    ok_epfo = upload_epfo(epfo_records)
    if not ok_epfo:
        print("[FAILED] EPFO upload encountered an error. Stopping.")
        return
    print(">>> [1/4] EPFO SEEDING COMPLETE.\n")

    # 2. KPSC KAS
    print(">>> [2/4] SEEDING KPSC KAS (public.kas_questions)...")
    kas_records = load_all_kas_records()
    ok_kas = upload_kas(kas_records)
    if not ok_kas:
        print("[FAILED] KPSC KAS upload encountered an error. Stopping.")
        return
    print(">>> [2/4] KPSC KAS SEEDING COMPLETE.\n")

    # 3. Karnataka Police Constable
    print(">>> [3/4] SEEDING KARNATAKA POLICE CONSTABLE (public.pc_pyq)...")
    pc_records = load_all_28_papers()
    ok_pc = upload_pc(pc_records)
    if not ok_pc:
        print("[FAILED] Karnataka PC upload encountered an error. Stopping.")
        return
    print(">>> [3/4] KARNATAKA PC SEEDING COMPLETE.\n")

    # 4. UPSC CAPF
    print(">>> [4/4] SEEDING UPSC CAPF (public.capf_pyq)...")
    capf_records = load_capf_questions()
    ok_capf = upload_capf(capf_records)
    if not ok_capf:
        print("[FAILED] UPSC CAPF upload encountered an error. Stopping.")
        return
    print(">>> [4/4] UPSC CAPF SEEDING COMPLETE.\n")

    elapsed = time.time() - start_time
    print("==================================================================")
    print("     ALL 4 EXAM DATASETS SUCCESSFULLY SEEDED TO SUPABASE!         ")
    print(f"     EPFO:  {len(epfo_records):>5} questions")
    print(f"     KAS:   {len(kas_records):>5} questions")
    print(f"     PC:    {len(pc_records):>5} questions")
    print(f"     CAPF:  {len(capf_records):>5} questions")
    print(f"     TOTAL: {len(epfo_records)+len(kas_records)+len(pc_records)+len(capf_records):>5} questions")
    print(f"     Total Time: {elapsed:.1f}s")
    print("==================================================================")

if __name__ == "__main__":
    main()
