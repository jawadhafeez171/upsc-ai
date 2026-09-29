import json
import glob
import sys

sys.stdout.reconfigure(encoding='utf-8')

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))

# Let's inspect each subject
by_subject = {}
for fpath in capf_files:
    fname = fpath.split('\\')[-1].split('/')[-1]
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        q['__file__'] = fname
        s = q.get('subject', 'Unknown')
        by_subject.setdefault(s, []).append(q)

print("=== SUBJECT COUNTS ===")
for s, qs in sorted(by_subject.items(), key=lambda x: -len(x[1])):
    print(f"{s}: {len(qs)}")

# Let's check GMA questions misclassified under other subjects
# Typical GMA phrases: "find the missing number", "speed of", "km/h", "work together in", 
# "ratio of", "average of", "how many triangles", "sum of", "perimeter", "triangle abc", "dice", "clock"
gma_keywords = [
    r'missing\s+(number|term|figure)', r'find\s+the\s+next\s+term', r'km\/h', r'work\s+together\s+in\s+\d+\s+days',
    r'how\s+many\s+(triangles|squares|cubes|rectangles)', r'clock\s+shows', r'opposite\s+face',
    r'dice', r'odd\s+man\s+out', r'odd\s+one\s+out', r'code\s+stands\s+for', r'coded\s+as',
    r'blood\s+relation', r'brother\s+of', r'sister\s+of', r'father\s+of', r'son\s+of',
    r'remainder\s+when', r'divisible\s+by\s+\d+', r'hcf\s+and\s+lcm', r'simple\s+interest', r'compound\s+interest',
    r'cost\s+price', r'selling\s+price', r'profit\s+percentage'
]

import re
print("\n=== CHECKING FOR GMA QUESTIONS IN OTHER SUBJECTS ===")
for s, qs in by_subject.items():
    if s == "General Mental Ability, Quantitative Aptitude & Comprehension":
        continue
    for q in qs:
        txt = q.get('question_english', '')
        for pat in gma_keywords:
            if re.search(r'\b' + pat + r'\b', txt, re.IGNORECASE):
                # Verify if it's genuinely a math/reasoning problem
                print(f"[{s}] {q['__file__']} {q.get('year')} Q{q.get('question_number')} (Hit {pat}): {txt[:90]}")
                break
