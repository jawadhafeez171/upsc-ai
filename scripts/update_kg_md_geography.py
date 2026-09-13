# -*- coding: utf-8 -*-
"""
Update knowledge_graph.md with granular narrative sections for:
1. Indian Physical Geography
2. Human Geography
3. Economic & Resource Geography
4. Geography of the World (Dedicated country sections)
5. World Mapping & Geopolitical Locations (Pure mapping)
"""

import json

def format_subtopic(sub):
    lines = []
    lines.append(f"- **{sub['name']}** {sub['rawExamTagString']}")
    lines.append(f"  {sub['description']}")
    entities_str = " • ".join(sub['entities'])
    lines.append(f"  *Key Concepts & Entities*: {entities_str}")
    lines.append("")
    return "\n".join(lines)

def format_domain(domain_node, nodes):
    lines = []
    lines.append(f"{domain_node['name']} `{domain_node['rawExamTagString']}`")
    lines.append("")
    for topic_id in domain_node.get("childrenIds", []):
        topic_node = nodes.get(topic_id)
        if not topic_node:
            continue
        lines.append(f"### {topic_node['name']}")
        lines.append("")
        for sub_id in topic_node.get("childrenIds", []):
            sub_node = nodes.get(sub_id)
            if sub_node:
                lines.append(format_subtopic(sub_node))
    return "\n".join(lines)

def main():
    with open("src/data/knowledge_graph.json", "r", encoding="utf-8") as f:
        kg = json.load(f)
    nodes = kg["nodes"]

    with open("knowledge_graph.md", "r", encoding="utf-8") as f:
        md_content = f.read()

    # 1. Update domain list under Geography & Earth Systems header
    old_domain_list = """Geography & Earth Systems

- Physical Geography & Earth Systems (Geomorphology)
- Climatology
- Oceanography & Marine Systems
- Indian Physical Geography & Monsoon Architecture
- Economic & Resource Geography
- Human Geography & Population Settlements
- Geography of Karnataka
- World Mapping & Geopolitical Locations
- Indian Mapping & Spatial Geography
- Karnataka Mapping & Spatial Geography"""

    new_domain_list = """Geography & Earth Systems

- Physical Geography & Earth Systems (Geomorphology)
- Climatology
- Oceanography & Marine Systems
- Indian Physical Geography & Monsoon Architecture
- Human Geography & Population Settlements
- Economic & Resource Geography
- Geography of the World
- World Mapping & Geopolitical Locations
- Indian Mapping & Spatial Geography
- Geography of Karnataka
- Karnataka Mapping & Spatial Geography"""

    if old_domain_list in md_content:
        md_content = md_content.replace(old_domain_list, new_domain_list)
        print("Updated domain list successfully.")
    else:
        print("Warning: old_domain_list not found directly, checking variations...")

    # 2. Format the 4 middle domains: Indian Physical, Human, Economic, Geography of the World
    d_indian = nodes["geography_earth_systems.indian_physical_geography_monsoon_architecture"]
    d_human = nodes["geography_earth_systems.human_geography_population_settlements"]
    d_econ = nodes["geography_earth_systems.economic_resource_geography"]
    d_world = nodes["geography_earth_systems.geography_of_the_world"]

    middle_domains_md = "\n".join([
        format_domain(d_indian, nodes),
        format_domain(d_human, nodes),
        format_domain(d_econ, nodes),
        format_domain(d_world, nodes)
    ])

    # Target slice to replace: from "Indian Physical Geography & Monsoon Architecture `[UPSC:" to "Geography of Karnataka `[KAS:"
    lines = md_content.splitlines(True)
    idx_indian_start = None
    idx_karnataka_start = None
    idx_world_map_start = None
    idx_indian_map_start = None

    for i, line in enumerate(lines):
        if line.startswith("Indian Physical Geography & Monsoon Architecture `[UPSC:"):
            idx_indian_start = i
        elif line.startswith("Geography of Karnataka `[KAS:"):
            idx_karnataka_start = i
        elif line.startswith("World Mapping & Geopolitical Locations `[UPSC:"):
            idx_world_map_start = i
        elif line.startswith("Indian Mapping & Spatial Geography `[UPSC:"):
            idx_indian_map_start = i

    print(f"Indices: Indian={idx_indian_start}, Karnataka={idx_karnataka_start}, WorldMap={idx_world_map_start}, IndianMap={idx_indian_map_start}")

    if idx_indian_start is not None and idx_karnataka_start is not None and idx_world_map_start is not None and idx_indian_map_start is not None:
        # Format World Mapping
        d_mapping = nodes["geography_earth_systems.world_mapping_geopolitical_locations"]
        world_mapping_md = format_domain(d_mapping, nodes)

        # Assemble new lines
        # First part: up to idx_indian_start
        part1 = lines[:idx_indian_start]
        # Middle part: replacement for Indian, Human, Econ, World Geo
        # Part after Karnataka up to World Map
        part2 = lines[idx_karnataka_start:idx_world_map_start]
        # Part after Indian Map
        part3 = lines[idx_indian_map_start:]

        new_content = "".join(part1) + middle_domains_md + "\n" + "".join(part2) + world_mapping_md + "\n" + "".join(part3)

        with open("knowledge_graph.md", "w", encoding="utf-8") as f:
            f.write(new_content)
        print("Successfully updated knowledge_graph.md with granular Geography sections!")
    else:
        print("ERROR: Could not find all section start markers in knowledge_graph.md.")

if __name__ == "__main__":
    main()
