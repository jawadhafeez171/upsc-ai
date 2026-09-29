import json
import glob
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg.get('nodes', {})

# Import flagged from collect_flagged
sys.path.append('scripts')
from collect_flagged import flagged

print(f"Total flagged questions to map: {len(flagged)}")

# Let's inspect the distinct reasons:
# 1. Invalid node IDs (subtopic slug variations in GMA, Geography, Economy)
# 2. GS questions in GMA (e.g. History, Polity, Geography, Science)
# 3. Cross-subject mismatches

# Let's write out the full list to an inspection file
with open('scripts/flagged_details.txt', 'w', encoding='utf-8') as out:
    for idx, item in enumerate(flagged):
        out.write(f"[{idx+1}] File: {item['file']} | Year: {item['year']} | Q{item['qnum']}\n")
        out.write(f"Reasons: {item['reasons']}\n")
        out.write(f"Current Subj: {item['current_subject']} | Node: {item['current_node_id']}\n")
        out.write(f"Text: {item['text']}\n")
        out.write("-" * 80 + "\n")

print("Saved detailed list to scripts/flagged_details.txt")
