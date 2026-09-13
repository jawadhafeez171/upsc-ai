# -*- coding: utf-8 -*-
"""
Separate ENSO & IOD from Ocean Currents in Knowledge Graph
----------------------------------------------------------
Splits the combined ocean currents and ENSO node into two distinct Level-4 nodes:
1. Ocean Currents: Global Gyres & Thermohaline Circulation
2. Ocean-Atmosphere Teleconnections: ENSO (El Niño, La Niña) & Indian Ocean Dipole (IOD)
"""

import json
import re

SUBJECT_ID = "geography_earth_systems"
SUBJECT_NAME = "Geography & Earth Systems"
PARENT_TOPIC_ID = f"{SUBJECT_ID}.oceanography_marine_systems.ocean_water_dynamics"

OLD_NODE_ID = f"{PARENT_TOPIC_ID}.ocean_currents_gyres_thermohaline_and_enso"

def generate_keywords(name, description, entities):
    text = f"{name} {description} {' '.join(entities)}"
    words = re.findall(r'[a-zA-Z0-9\~%]+', text)
    seen = set()
    keywords = []
    stopwords = {"and", "or", "the", "a", "an", "in", "on", "of", "to", "for", "with", "by", "from", "at", "is", "are", "vs", "etc", "as", "its"}
    for w in words:
        wl = w.lower()
        if wl not in stopwords and len(w) > 1 and w not in seen:
            seen.add(w)
            keywords.append(w)
    return keywords

def main():
    kg_path = "src/data/knowledge_graph.json"
    with open(kg_path, "r", encoding="utf-8") as f:
        kg = json.load(f)

    nodes = kg["nodes"]
    parent_topic = nodes.get(PARENT_TOPIC_ID)
    if not parent_topic:
        print(f"Error: Parent topic {PARENT_TOPIC_ID} not found!")
        return

    # Remove old node if exists
    if OLD_NODE_ID in nodes:
        del nodes[OLD_NODE_ID]
        print(f"Deleted old combined node: {OLD_NODE_ID}")

    if OLD_NODE_ID in parent_topic.get("childrenIds", []):
        parent_topic["childrenIds"].remove(OLD_NODE_ID)

    # 1. Pure Ocean Currents Node
    node1_id = f"{PARENT_TOPIC_ID}.ocean_currents_gyres_and_thermohaline_circulation"
    desc1 = "Surface wind-driven ocean circulation: Five major Subtropical Gyres (North/South Atlantic, North/South Pacific, Indian Ocean) circulating clockwise in Northern Hemisphere and counter-clockwise in Southern Hemisphere; Western Boundary Currents (narrow, deep, swift warm currents: Gulf Stream, Kuroshio, Brazil, Agulhas) vs Eastern Boundary Currents (broad, shallow, slow cold currents: California, Canaries, Benguela, Peru / Humboldt); Sargasso Sea enclosed by Atlantic gyre; Seasonal reversal of North Indian Ocean currents (Southwest Monsoon Drift eastward vs Northeast Monsoon Drift westward); Thermohaline Circulation / Global Conveyor Belt driven by cold saline North Atlantic Deep Water (NADW) formation; Coastal upwelling and downwelling mechanisms."
    entities1 = ["Five Subtropical Ocean Gyres", "Western Boundary Currents (Gulf Stream, Kuroshio)", "Eastern Boundary Currents (Humboldt, Canaries)", "Sargasso Sea", "North Indian Ocean Monsoon Reversal", "Thermohaline Conveyor Belt (NADW)", "Coastal Upwelling and Downwelling"]
    keywords1 = generate_keywords("Ocean Currents: Global Gyres & Thermohaline Circulation", desc1, entities1)

    node1 = {
        "id": node1_id,
        "slug": "ocean_currents_gyres_and_thermohaline_circulation",
        "name": "Ocean Currents: Global Gyres & Thermohaline Circulation",
        "level": 4,
        "levelName": "Subtopic_Entity",
        "subject": SUBJECT_NAME,
        "subjectId": SUBJECT_ID,
        "parentId": PARENT_TOPIC_ID,
        "childrenIds": [],
        "ancestorIds": list(parent_topic.get("ancestorIds", [])) + [PARENT_TOPIC_ID],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]},
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "description": desc1,
        "entities": entities1,
        "keywords": keywords1
    }

    # 2. Separate Standalone ENSO & IOD Node
    node2_id = f"{PARENT_TOPIC_ID}.enso_dynamics_and_indian_ocean_dipole"
    desc2 = "Coupled ocean-atmosphere teleconnections: Normal Walker Circulation over equatorial Pacific; El Niño Southern Oscillation (ENSO): El Niño warm phase (weakening of Trade winds, eastward displacement of warm water pool, suppression of Peruvian coastal upwelling, collapse of anchovy fishery, teleconnections suppressing Indian monsoon and causing Australian drought); La Niña cold phase (intensified Trade winds, amplified Peruvian upwelling, enhanced monsoon rainfall in India); El Niño Modoki (central Pacific warming anomaly); Indian Ocean Dipole (IOD): Positive IOD (warm Western Indian Ocean, cool Eastern Indian Ocean, favorable for Indian monsoon) vs Negative IOD (cool Western Indian Ocean, suppressed monsoon); ENSO-IOD coupling and global climatic anomalies."
    entities2 = ["Walker Circulation Cell", "El Niño (ENSO Warm Phase)", "La Niña (ENSO Cold Phase)", "Southern Oscillation Index (SOI)", "El Niño Modoki", "Indian Ocean Dipole (Positive & Negative IOD)", "Peruvian Upwelling Suppression", "Teleconnections to Indian Monsoon"]
    keywords2 = generate_keywords("Ocean-Atmosphere Teleconnections: ENSO & Indian Ocean Dipole", desc2, entities2)

    node2 = {
        "id": node2_id,
        "slug": "enso_dynamics_and_indian_ocean_dipole",
        "name": "Ocean-Atmosphere Teleconnections: ENSO (El Niño, La Niña) & Indian Ocean Dipole (IOD)",
        "level": 4,
        "levelName": "Subtopic_Entity",
        "subject": SUBJECT_NAME,
        "subjectId": SUBJECT_ID,
        "parentId": PARENT_TOPIC_ID,
        "childrenIds": [],
        "ancestorIds": list(parent_topic.get("ancestorIds", [])) + [PARENT_TOPIC_ID],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]},
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "description": desc2,
        "entities": entities2,
        "keywords": keywords2
    }

    nodes[node1_id] = node1
    nodes[node2_id] = node2

    if node1_id not in parent_topic.get("childrenIds", []):
        parent_topic["childrenIds"].append(node1_id)
    if node2_id not in parent_topic.get("childrenIds", []):
        parent_topic["childrenIds"].append(node2_id)

    # Recompute Stats
    l1_count = sum(1 for n in nodes.values() if n.get("level") == 1)
    l2_count = sum(1 for n in nodes.values() if n.get("level") == 2)
    l3_count = sum(1 for n in nodes.values() if n.get("level") == 3)
    l4_count = sum(1 for n in nodes.values() if n.get("level") == 4)

    kg["stats"] = {
        "total_nodes": len(nodes),
        "level_1_subjects": l1_count,
        "level_2_domains": l2_count,
        "level_3_topics": l3_count,
        "level_4_subtopics": l4_count
    }

    with open(kg_path, "w", encoding="utf-8") as f:
        json.dump(kg, f, indent=2, ensure_ascii=False)

    print(f"\nSeparation Completed successfully!")
    print(f"Added {node1_id}")
    print(f"Added {node2_id}")
    print(f"New KG Total Nodes: {len(nodes)} (L1: {l1_count}, L2: {l2_count}, L3: {l3_count}, L4: {l4_count})")

if __name__ == "__main__":
    main()
