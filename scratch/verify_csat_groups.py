import json
from scratch.test_full_csat_extract import results

passage_map = {}
for qn, pe, qe, ph, qh in results:
    # Use first 80 chars of passage content (after Directions) as key
    key = pe.replace('Directions for the following item:', '').strip()[:80]
    if key not in passage_map:
        passage_map[key] = []
    passage_map[key].append(qn)

print("Passage Groups in CSAT 2020:")
for k, q_list in passage_map.items():
    if len(q_list) > 1:
        print(f"  LINKED GROUP: Questions {q_list} -> Passage snippet: {repr(k[:40])}")
    else:
        print(f"  Single: Q{q_list[0]}")
