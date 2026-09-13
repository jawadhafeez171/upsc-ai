# -*- coding: utf-8 -*-
"""
Generate Knowledge Graph Hierarchy Markdown
-------------------------------------------
Reads src/data/knowledge_graph.json and outputs knowledge_graph_hierarchy.md
with full parent-child hierarchy across all 4 levels (Subject -> Domain -> Topic -> Subtopic/Entity).
"""

import json
import os
import re

def slugify(text):
    text = text.lower()
    text = re.sub(r'[^\w\s-]', '', text)
    text = re.sub(r'[\s_]+', '-', text)
    return text

def main():
    kg_path = os.path.join("src", "data", "knowledge_graph.json")
    out_path = "knowledge_graph_hierarchy.md"

    with open(kg_path, "r", encoding="utf-8") as f:
        kg = json.load(f)

    nodes = kg.get("nodes", {})
    root_subject_ids = kg.get("rootSubjectIds", [])
    stats = kg.get("stats", {})

    lines = []
    lines.append("# Universal Knowledge Graph - Complete Node Hierarchy\n")
    lines.append("> **Universal Multi-Stream Competitive Examination Knowledge Taxonomy**  \n")
    lines.append(f"> **Total Nodes**: {len(nodes)} | **Subjects**: {len(root_subject_ids)} | **Domains**: {stats.get('level_2_domains', 103)} | **Topics**: {stats.get('level_3_topics', 397)} | **Subtopics/Entities**: {stats.get('level_4_subtopics', 349)}\n\n")
    lines.append("---\n\n")

    # Table of Contents
    lines.append("## 📑 Table of Contents\n\n")
    for s_idx, sid in enumerate(root_subject_ids, start=1):
        s_node = nodes.get(sid)
        s_name = s_node.get("name") if s_node else sid
        anchor = f"{s_idx}-{slugify(s_name)}"
        lines.append(f"{s_idx}. [{s_name}](#{anchor})\n")
    lines.append("\n---\n\n")

    # Hierarchy Body
    for s_idx, sid in enumerate(root_subject_ids, start=1):
        s_node = nodes.get(sid)
        if not s_node:
            continue

        s_name = s_node.get("name", sid)
        anchor = f"{s_idx}-{slugify(s_name)}"
        lines.append(f"## {s_idx}. {s_name} <a id=\"{anchor}\"></a>\n\n")
        lines.append(f"- **ID**: `{s_node['id']}`\n")
        lines.append(f"- **Level**: `Level 1 (Subject)`\n")
        if s_node.get("rawExamTagString"):
            lines.append(f"- **Exam Tags**: {s_node['rawExamTagString']}\n")
        lines.append("\n")

        # Domains (Level 2)
        domain_ids = s_node.get("childrenIds", [])
        for d_idx, did in enumerate(domain_ids, start=1):
            d_node = nodes.get(did)
            if not d_node:
                continue

            lines.append(f"### {s_idx}.{d_idx} {d_node['name']}\n\n")
            lines.append(f"- **ID**: `{d_node['id']}`\n")
            lines.append(f"- **Level**: `Level 2 (Domain)`\n")
            if d_node.get("rawExamTagString"):
                lines.append(f"- **Exam Tags**: {d_node['rawExamTagString']}\n")
            lines.append("\n")

            # Topics (Level 3)
            topic_ids = d_node.get("childrenIds", [])
            for t_idx, tid in enumerate(topic_ids, start=1):
                t_node = nodes.get(tid)
                if not t_node:
                    continue

                lines.append(f"#### {s_idx}.{d_idx}.{t_idx} {t_node['name']}\n\n")
                lines.append(f"- **ID**: `{t_node['id']}`\n")
                lines.append(f"- **Level**: `Level 3 (Topic)`\n")
                if t_node.get("rawExamTagString"):
                    lines.append(f"- **Exam Tags**: {t_node['rawExamTagString']}\n")
                lines.append("\n")

                # Subtopics (Level 4)
                sub_ids = t_node.get("childrenIds", [])
                if sub_ids:
                    lines.append("**Subtopics & Entities (Level 4):**\n\n")
                    for sub_id in sub_ids:
                        sub_node = nodes.get(sub_id)
                        if not sub_node:
                            continue
                        lines.append(f"- **{sub_node['name']}**\n")
                        lines.append(f"  - **ID**: `{sub_node['id']}`\n")
                        if sub_node.get("rawExamTagString"):
                            lines.append(f"  - **Tags**: {sub_node['rawExamTagString']}\n")
                        if sub_node.get("description"):
                            lines.append(f"  - **Scope / Definition**: {sub_node['description']}\n")
                        if sub_node.get("entities"):
                            lines.append(f"  - **Key Concepts & Entities**: {' • '.join(sub_node['entities'])}\n")
                    lines.append("\n")
                else:
                    lines.append("*(Leaf Topic - No child subtopics)*\n\n")

        lines.append("---\n\n")

    content = "".join(lines)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(content)

    print(f"Successfully generated {out_path} with {len(nodes)} nodes across {len(root_subject_ids)} subjects!")

if __name__ == "__main__":
    main()
