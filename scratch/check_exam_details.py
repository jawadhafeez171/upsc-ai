import re

with open('src/data/examDetails.ts', encoding='utf-8') as f:
    txt = f.read()

matches = re.findall(r"'([a-z\-]+)':\s*\{", txt)
print("Exams in EXAM_DETAILS:", matches)
