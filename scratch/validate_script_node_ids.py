import json
import re

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg_nodes = json.load(f)['nodes']

with open('scripts/diligently_reaudit_epfo.py', encoding='utf-8') as f:
    code = f.read()

# Extract all string literals that look like node IDs
node_ids = re.findall(r'["\']([a-z0-9_]+(?:\.[a-z0-9_\-]+)+)["\']', code)
print(f"Total potential node IDs found in script: {len(node_ids)}")

invalid_ids = set()
for nid in node_ids:
    if nid not in kg_nodes:
        # Ignore things that are not node_ids like python module paths
        if any(s in nid for s in ['industrial_', 'general_', 'social_', 'applied_', 'history.', 'art_culture', 'indian_', 'science_', 'geography_', 'environment_', 'international_', 'language_']):
            invalid_ids.add(nid)

print(f"Invalid node IDs found ({len(invalid_ids)}):")
for inv in sorted(invalid_ids):
    print("  ", inv)
