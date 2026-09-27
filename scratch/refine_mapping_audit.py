import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('scratch/deep_mapping_candidates.json', 'r', encoding='utf-8') as f:
    candidates = json.load(f)

print(f"Loaded {len(candidates)} candidates.")

# Let's inspect year by year, displaying the question, current node_id, detected cat, and reasons
def display_year(yr):
    yr_cands = [c for c in candidates if c['year'] == str(yr)]
    print(f"\n=================== YEAR {yr} ({len(yr_cands)} candidates) ===================")
    for c in yr_cands:
        print(f"[{yr} Q{c['q_num']}] {c['detected_category']} ({c['detected_region']} - {c['detected_skill']})")
        print(f"   Reason: {', '.join(c['reasons'])}")
        print(f"   Current Node: {c['current_node_id']}")
        print(f"   Text: {c['question_en']}")
        print("-" * 70)

# Display 2011 & 2012 as a first check
display_year(2011)
