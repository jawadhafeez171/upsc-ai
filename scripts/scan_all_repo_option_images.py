import glob
import json
import os
import re
from collections import Counter

all_data_files = glob.glob('src/data/**/*.json', recursive=True)
url_img_regex = re.compile(r'https?://[^\s"\']+\.(png|jpg|jpeg|svg|webp|gif)', re.IGNORECASE)

file_counts = Counter()
questions_details = []

for f in all_data_files:
    fname = os.path.basename(f)
    if 'knowledge_graph' in fname:
        continue
    try:
        with open(f, 'r', encoding='utf-8') as fl:
            data = json.load(fl)
    except Exception:
        continue
    if not isinstance(data, list):
        continue
        
    for q in data:
        if not isinstance(q, dict):
            continue
        opt_images = {}
        for k, v in q.items():
            if 'option' in k and isinstance(v, str) and url_img_regex.search(v):
                opt_images[k] = v
        if opt_images:
            file_counts[f] += 1
            if len(questions_details) < 15:
                questions_details.append((f, q.get('year'), q.get('question_number'), opt_images, q.get('question_english', '')[:80]))

print(f"Files with options containing image URLs ({len(file_counts)} files):")
for f, c in file_counts.most_common():
    print(f"  {f}: {c} questions")

print(f"\nSample questions with image URLs in options:")
for x in questions_details:
    print(f"[{x[0]} Q{x[2]} ({x[1]})]: {x[4]}")
    for ok, ov in x[3].items():
        print(f"   {ok}: {ov}")
