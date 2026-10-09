import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

for yr in [2016, 2017, 2021, 2023, 2025]:
    paper_qs = [q for q in questions if q.get('year') == yr]
    exams = set(q['exam_name'] for q in paper_qs)
    for exam in sorted(exams):
        eqs = [q for q in paper_qs if q['exam_name'] == exam]
        print(f"\n--- {yr} {exam} ---")
        # Find questions mentioning accounts, labour, audit, insurance, stats
        for q in eqs:
            txt = ((q.get('question_english') or '') + ' ' + (q.get('explanation_english') or '')).lower()
            if any(k in txt for k in ['journal', 'ledger', 'balance sheet', 'depreciation', 'trial balance', 'accounting']):
                print(f"  [ACCOUNTING] Q{q['question_number']}: {q['question_english'][:70]}")
            elif any(k in txt for k in ['labour', 'trade union', 'factories act', 'industrial dispute', 'strike', 'lockout']):
                print(f"  [LABOUR LAWS] Q{q['question_number']}: {q['question_english'][:70]}")
            elif any(k in txt for k in ['audit', 'auditor', 'vouching', 'internal check']):
                print(f"  [AUDITING] Q{q['question_number']}: {q['question_english'][:70]}")
            elif any(k in txt for k in ['insurance', 'insurable', 'indemnity', 'subrogation']):
                print(f"  [INSURANCE] Q{q['question_number']}: {q['question_english'][:70]}")
            elif any(k in txt for k in ['standard deviation', 'variance', 'median', 'correlation', 'regression', 'mean deviation']):
                print(f"  [STATISTICS] Q{q['question_number']}: {q['question_english'][:70]}")
