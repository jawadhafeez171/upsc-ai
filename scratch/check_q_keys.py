import json

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

sample = questions[0]
print("Keys in question:")
for k, v in sample.items():
    print(f"  {k}: {type(v).__name__} = {repr(v)[:80]}")
