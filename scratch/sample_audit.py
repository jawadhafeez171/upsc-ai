import json
import random

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

# Sample 2 questions from each subject
by_subject = {}
for q in questions:
    by_subject.setdefault(q['subject'], []).append(q)

print(f"Total Subjects: {len(by_subject)}")
for subj, qlist in sorted(by_subject.items()):
    print(f"\n=======================================================")
    print(f"SUBJECT: {subj} (Total: {len(qlist)} questions)")
    print(f"=======================================================")
    samples = qlist[:2]
    for q in samples:
        print(f"[{q['year']} {q['exam_name']} #Q{q['question_number']}]")
        print(f"  Domain: {q['domain']}")
        print(f"  Subtopic: {q['sub_topic']}")
        print(f"  Node ID: {q['node_id']}")
        print(f"  Question: {q['question_english'][:100]}...")
