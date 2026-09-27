import subprocess
import re
import json

diff = subprocess.check_output(['git', 'diff', 'knowledge_graph_hierarchy.md'], text=True)
added_lines = [line[1:] for line in diff.split('\n') if line.startswith('+') and not line.startswith('+++')]
added_text = '\n'.join(added_lines)

# Find all node blocks:
# - **Name** or ### Name
# - **ID**: `...`
# - **Tags**: ...
# - **Scope / Definition**: ...
# - **Key Concepts & Entities**: ...

pattern = re.compile(
    r'(?:- \*\*([^*]+)\*\*|###+ ([^\n]+))\s*\n\s*- \*\*ID\*\*:\s*`([^`]+)`\s*\n\s*- \*\*Tags\*\*:\s*([^\n]+)\s*\n\s*- \*\*Scope / Definition\*\*:\s*([^\n]+)\s*\n\s*- \*\*Key Concepts & Entities\*\*:\s*([^\n]+)',
    re.MULTILINE
)

matches = pattern.findall(added_text)
print(f"Total structured node matches found in diff: {len(matches)}")

for m in matches:
    name = m[0] or m[1]
    nid = m[2]
    tags_raw = m[3]
    scope = m[4]
    concepts = m[5]
    print(f"\nNode: {name.strip()} ({nid})")
    print(f"  Tags: {tags_raw}")
    print(f"  Scope: {scope[:80]}...")
