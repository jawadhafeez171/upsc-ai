import json
import re

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

existing_nids = set(kg['nodes'].keys())

with open('knowledge_graph_hierarchy.md', 'r', encoding='utf-8') as f:
    md_text = f.read()

# Match all node IDs in markdown: - **ID**: `...`
all_md_nids = re.findall(r'- \*\*ID\*\*:\s*`([^`]+)`', md_text)
print(f"Total node IDs in knowledge_graph_hierarchy.md: {len(all_md_nids)}")

missing_in_json = [nid for nid in all_md_nids if nid not in existing_nids]
print(f"Total missing in knowledge_graph_civil_services.json: {len(missing_in_json)}")

print("\nMissing Nodes List (1 to 40):")
for idx, nid in enumerate(missing_in_json[:40], 1):
    print(f"{idx:2d}. {nid}")
