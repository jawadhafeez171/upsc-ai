import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

for year in [2016, 2018, 2020, 2022, 2024, 2026]:
    f = f'src/data/upsc_capf/CAPF_{year}_Paper1_GS.json'
    data = json.load(open(f, encoding='utf-8'))
    fb = [q for q in data if 'General Scientific Principles & Everyday Applications' in q.get('sub_topic', '')]
    print(f"\n=== {year}: {len(fb)} fallbacks ===")
    for q in fb[:5]:
        print(f"  Q{q.get('question_number')}: {q.get('question_english')[:85]}")
        print(f"      Expl: {q.get('explanation_english')[:90]}")
