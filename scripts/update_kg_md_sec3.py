# -*- coding: utf-8 -*-
import json
import re

def main():
    with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
        kg = json.load(f)

    with open('knowledge_graph.md', 'r', encoding='utf-8') as f:
        md = f.read()

    nodes = kg['nodes']
    subj_id = 'geography_earth_systems'
    s_node = nodes[subj_id]

    out = []
    out.append('==================================================\n')
    out.append('3. GEOGRAPHY & EARTH SYSTEMS `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`\n')
    out.append('==================================================\n\n')
    out.append('Geography & Earth Systems\n\n')

    # List domains
    for did in s_node.get('childrenIds', []):
        d = nodes.get(did)
        if d:
            out.append(f"- {d['name']}\n")
    out.append('\n')

    # For each domain
    for did in s_node.get('childrenIds', []):
        d = nodes.get(did)
        if not d:
            continue
        tag_str = d.get('rawExamTagString', '')
        out.append(f"{d['name']} `{tag_str}`\n\n")
        
        for tid in d.get('childrenIds', []):
            t = nodes.get(tid)
            if not t:
                continue
            t_name = t['name']
            out.append(f"### {t_name}\n\n")
            
            subs = t.get('childrenIds', [])
            if subs:
                for sub_id in subs:
                    sub = nodes.get(sub_id)
                    if not sub:
                        continue
                    sub_tags = sub.get('rawExamTagString', '')
                    out.append(f"- **{sub['name']}** {sub_tags}\n")
                    if sub.get('description'):
                        out.append(f"  {sub['description']}\n")
                    if sub.get('entities'):
                        entities_str = ' • '.join(sub['entities'])
                        out.append(f"  *Key Concepts & Entities*: {entities_str}\n")
                    out.append('\n')
            else:
                out.append('*(Core Regional / Mapping Topic)*\n\n')

    new_sec3 = ''.join(out)

    m3 = re.search(r'={20,}\s*\n3\.\s*GEOGRAPHY', md)
    m4 = re.search(r'={20,}\s*\n4\.\s*INDIAN\s*SOCIETY', md)

    if m3 and m4:
        updated_md = md[:m3.start()] + new_sec3 + md[m4.start():]
        with open('knowledge_graph.md', 'w', encoding='utf-8') as f:
            f.write(updated_md)
        print(f"Updated knowledge_graph.md Section 3! Length: {len(new_sec3)}")
    else:
        print("Error: Could not locate Section 3 / Section 4 markers in knowledge_graph.md")

if __name__ == '__main__':
    main()
