import sys
import json
import re

sys.stdout.reconfigure(encoding='utf-8')

tree = {}
curr_s_id = None
curr_s_title = None
curr_d_id = None
curr_d_title = None

with open('knowledge_graph_hierarchy.md', 'r', encoding='utf-8') as f:
    for line in f:
        line_s = line.strip()
        m_s = re.match(r'^## (\d+)\.\s+([^<]+)', line_s)
        if m_s and 'Table of Contents' not in line_s:
            curr_s_title = m_s.group(2).strip()
            curr_s_id = None
            curr_d_id = None
            continue
        
        m_d = re.match(r'^### (\d+\.\d+)\s+([^<]+)', line_s)
        if m_d:
            curr_d_title = m_d.group(2).strip()
            curr_d_id = None
            continue
            
        if line_s.startswith('- **ID**: `') and '`' in line_s:
            node_id = line_s.split('`')[1]
            if curr_s_title and curr_s_id is None and '.' not in node_id:
                curr_s_id = node_id
                tree[curr_s_id] = {'title': curr_s_title, 'domains': {}}
            elif curr_d_title and curr_s_id and curr_d_id is None and node_id.count('.') == 1:
                curr_d_id = node_id
                tree[curr_s_id]['domains'][curr_d_id] = {'title': curr_d_title}

with open('scripts/kg_domains.json', 'w', encoding='utf-8') as out:
    json.dump(tree, out, indent=2, ensure_ascii=False)

print('Dumped KG domains! Total subjects:', len(tree))
for s_id, s_val in tree.items():
    print(f"{s_id}: {s_val['title']} ({len(s_val['domains'])} domains)")
