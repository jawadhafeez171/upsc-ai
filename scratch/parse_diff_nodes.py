import re
import json

with open('knowledge_graph_hierarchy.md', 'r', encoding='utf-8') as f:
    text = f.read()

# Let's inspect the exact lines where the new domains/nodes are defined
with open('scratch/find_missing_nodes.py', 'r', encoding='utf-8') as f:
    pass

# Read missing nodes list
import subprocess
diff = subprocess.check_output(['git', 'diff', 'knowledge_graph_hierarchy.md'], text=True)
added_lines = [l[1:] for l in diff.split('\n') if l.startswith('+') and not l.startswith('+++')]
added_text = '\n'.join(added_lines)

# Find all blocks in added_text
# Level 2 domain: ### X.X Domain Name \n - **ID**: `...`
# Level 3 topic: #### X.X.X Topic Name \n - **ID**: `...`
# Level 4 subtopic: - **Subtopic Name** \n - **ID**: `...`

nodes_found = []

# Pattern for headings or bullet nodes
lines = added_text.split('\n')
i = 0
while i < len(lines):
    line = lines[i].strip()
    name = None
    level = None
    if line.startswith('### '):
        # Domain or Topic
        m = re.match(r'###\s+(\d+\.\d+)\s+(.+)', line)
        if m:
            level = 2
            name = m.group(2).strip()
    elif line.startswith('#### '):
        m = re.match(r'####\s+(\d+\.\d+\.\d+)\s+(.+)', line)
        if m:
            level = 3
            name = m.group(2).strip()
    elif line.startswith('- **') and not line.startswith('- **ID**') and not line.startswith('- **Tags**') and not line.startswith('- **Level**') and not line.startswith('- **Scope') and not line.startswith('- **Key Concepts'):
        m = re.match(r'- \*\*([^*]+)\*\*', line)
        if m:
            name = m.group(1).strip()
            level = 4
            
    if name:
        # Look ahead for ID, Tags, Scope, Concepts
        node_info = {'name': name, 'level': level}
        j = i + 1
        while j < min(i + 15, len(lines)):
            subl = lines[j].strip()
            if subl.startswith('- **ID**:'):
                node_info['id'] = re.search(r'`([^`]+)`', subl).group(1)
            elif subl.startswith('- **Tags**:'):
                node_info['tags'] = re.findall(r'\[([^\]]+)\]', subl)
                node_info['rawExamTagString'] = subl.replace('- **Tags**:', '').strip()
            elif subl.startswith('- **Scope / Definition**:'):
                node_info['description'] = subl.replace('- **Scope / Definition**:', '').strip()
            elif subl.startswith('- **Key Concepts & Entities**:'):
                concepts_str = subl.replace('- **Key Concepts & Entities**:', '').strip()
                node_info['concepts'] = [c.strip() for c in re.split(r'[•;,]', concepts_str) if c.strip()]
            elif subl.startswith('###') or (subl.startswith('- **') and not any(subl.startswith(k) for k in ['- **ID', '- **Tags', '- **Level', '- **Scope', '- **Key Concepts', '- **Exam Tags'])):
                break
            j += 1
        if 'id' in node_info:
            nodes_found.append(node_info)
    i += 1

print(f"Parsed {len(nodes_found)} nodes from diff.")
for n in nodes_found:
    print(f"L{n.get('level')} | {n['id']} -> {n['name']}")
