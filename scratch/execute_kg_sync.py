import json
import re
import os
import sys

# Ensure UTF-8 output
sys.stdout.reconfigure(encoding='utf-8')

# 1. Parse the 40 new nodes from diff of knowledge_graph_hierarchy.md
import subprocess
diff = subprocess.check_output(['git', 'diff', 'knowledge_graph_hierarchy.md'], text=True)
added_lines = [l[1:] for l in diff.split('\n') if l.startswith('+') and not l.startswith('+++')]
added_text = '\n'.join(added_lines)

lines = added_text.split('\n')
parsed_nodes = []
i = 0
while i < len(lines):
    line = lines[i].strip()
    name = None
    level = None
    if line.startswith('### '):
        m = re.match(r'###\s+(\d+\.\d+)\s+(.+)', line)
        if m:
            level = 2
            name = m.group(2).strip()
    elif line.startswith('#### '):
        m = re.match(r'####\s+(\d+\.\d+\.\d+)\s+(.+)', line)
        if m:
            level = 3
            name = m.group(2).strip()
    elif line.startswith('- **') and not any(line.startswith(k) for k in ['- **ID', '- **Tags', '- **Level', '- **Scope', '- **Key Concepts', '- **Exam Tags']):
        m = re.match(r'- \*\*([^*]+)\*\*', line)
        if m:
            name = m.group(1).strip()
            level = 4
            
    if name:
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
            parsed_nodes.append(node_info)
    i += 1

print(f"Extracted {len(parsed_nodes)} nodes from hierarchy diff.")

def sync_kg_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        kg = json.load(f)
        
    nodes = kg.get('nodes', {})
    added_count = 0
    
    for p_node in parsed_nodes:
        nid = p_node['id']
        if nid in nodes:
            continue
            
        parts = nid.split('.')
        parent_id = '.'.join(parts[:-1]) if len(parts) > 1 else None
        
        # Determine subject and domain
        subject = "History"
        domain = ""
        if parent_id and parent_id in nodes:
            parent_node = nodes[parent_id]
            subject = parent_node.get('subject', 'History')
            domain = parent_node.get('domain', parent_node.get('name', ''))
            
        new_node = {
            'id': nid,
            'name': p_node['name'],
            'level': p_node.get('level', len(parts)),
            'parent': parent_id,
            'children': [],
            'subject': subject,
            'domain': domain,
            'tags': p_node.get('tags', ['UPSC: Mains-GS1']),
            'rawExamTagString': p_node.get('rawExamTagString', '[UPSC: Mains-GS1]'),
            'description': p_node.get('description', ''),
            'keywords': p_node.get('concepts', [])
        }
        
        nodes[nid] = new_node
        added_count += 1
        
        # Link child to parent
        if parent_id and parent_id in nodes:
            if 'children' not in nodes[parent_id] or nodes[parent_id]['children'] is None:
                nodes[parent_id]['children'] = []
            if nid not in nodes[parent_id]['children']:
                nodes[parent_id]['children'].append(nid)
                
    # Also update Geography Mapping facets
    mapping_domains = [
        'geography_earth_systems.world_mapping_geopolitical_locations',
        'geography_earth_systems.indian_mapping_spatial_geography',
        'geography_earth_systems.karnataka_mapping_state_geography'
    ]
    for md_id in mapping_domains:
        if md_id in nodes:
            nodes[md_id]['isMappingFacet'] = True
            nodes[md_id]['facetType'] = 'virtual_spatial_collection'
            current_desc = nodes[md_id].get('description', '')
            if 'Dual-Presence Architecture' not in current_desc:
                nodes[md_id]['description'] = (
                    current_desc + " (Dual-Presence Architecture: Functions as a virtual cross-cutting spatial collection. All spatial questions have their canonical home in primary conceptual topics and project dynamically here via the is_mapping: true facet.)"
                ).strip()

    # Recalculate stats
    kg['stats'] = {
        'total_nodes': len(nodes),
        'level_1_subjects': sum(1 for n in nodes.values() if n.get('level') == 1),
        'level_2_domains': sum(1 for n in nodes.values() if n.get('level') == 2),
        'level_3_topics': sum(1 for n in nodes.values() if n.get('level') == 3),
        'level_4_subtopics': sum(1 for n in nodes.values() if n.get('level') == 4)
    }
    
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(kg, f, ensure_ascii=False, indent=2)
        
    print(f"Updated {file_path}: added {added_count} new nodes. New total: {len(nodes)} nodes.")
    return len(nodes)

# Sync both files
sync_kg_file('src/data/knowledge_graph_civil_services.json')
sync_kg_file('src/data/knowledge_graph.json')
