import re
import os
import subprocess

def enrich_knowledge_graph():
    md_path = "knowledge_graph.md"
    with open(md_path, "r", encoding="utf-8") as f:
        content = f.read()

    print(f"Original knowledge_graph.md size: {len(content)} bytes")

    # Verbatim UPSC & KAS Syllabus phrases to ensure complete inclusion
    # We will verify and enrich specific domains in the markdown text
    
    # 1. Update/Enrich Pillar 5: Indian Polity, Constitution & Governance
    # Ensure Public Admin management tools and verbatim phrases
    if "Management Tools & Techniques (PERT/CPM, SWOT, PDCA Cycle, POSDCORB, quality tools)" not in content:
        posdcorb_block = """- Management Tools & Techniques (PERT/CPM, SWOT, PDCA Cycle, POSDCORB, Quality Circles, Total Quality Management / TQM)
- Administrative Reforms, Ethics & Values, Good Governance, Lokpal & Lokayukta, Citizen Charters, Sakala Act 2011"""
        content = content.replace(
            "- Administrative Reforms (First & Second ARC, Hota Committee, Punchhi Commission Recommendations)",
            f"- Administrative Reforms (First & Second ARC, Hota Committee, Punchhi Commission Recommendations)\n{posdcorb_block}"
        )

    # 2. Enrich Pillar 7: Indian Economy & Development
    # Ensure verbatim agriculture, e-technology in the aid of farmers, technology missions, economics of animal rearing, sericulture/horticulture
    if "e-technology in the aid of farmers" not in content:
        content = content.replace(
            "- Agricultural Marketing & APMC Reforms",
            "- Agricultural Marketing & APMC Reforms (Storage, transport and marketing of agricultural produce; Issues and related constraints; e-technology in the aid of farmers; e-NAM portal)"
        )
    if "economics of animal-rearing" not in content:
        content = content.replace(
            "- Livestock & Dairy Sector",
            "- Livestock & Dairy Sector (Economics of animal-rearing; Dairy cooperatives AMUL and KMF Nandini; Livestock breeds; Marine and inland fisheries; National Livestock Mission)"
        )
    if "Horticulture & Sericulture in India & Karnataka" not in content:
        content = content.replace(
            "- Technology Missions in Agriculture",
            "- Technology Missions in Agriculture (National Mission on Oilseeds, Horticulture & Sericulture in India & Karnataka, Hi-tech horticulture, Sericulture value chain)"
        )

    # 3. Enrich Pillar 8: Environment & Ecology
    # Ensure verbatim KAS/UPSC terms: Red Data Book, Joint Forest Management, river linking, carbon credits
    if "Red Data Book" not in content:
        content = content.replace(
            "- Wildlife Protection Act 1972 & Wildlife Conservation",
            "- Wildlife Protection Act 1972 & Wildlife Conservation (Project Tiger, Project Elephant, IUCN Red Data Book, Eco-tourism guidelines)"
        )
    if "Joint Forest Management" not in content:
        content = content.replace(
            "- Forest Conservation & Social Forestry",
            "- Forest Conservation & Social Forestry (Joint Forest Management / JFM, Community participation, Agro-forestry, Compensatory Afforestation / CAMPA)"
        )
    if "Global environmental challenges (Global warming, acid rain, river linking, ozone depletion, carbon credits)" not in content:
        content = content.replace(
            "- Global Climate Change & Global Warming",
            "- Global Climate Change & Global Warming (Global environmental challenges: Global warming, acid rain, river linking, ozone depletion, carbon credits & carbon trading)"
        )

    # 4. Enrich Pillar 9: Science, Technology & Defence
    # Ensure Space INSAT, IRS, Chandrayaan, Gaganyaan, Human Capital, HDI
    if "Space Technology (INSAT, IRS, Chandrayaan, Gaganyaan, applications in agriculture/rural development)" not in content:
        content = content.replace(
            "- Space Technology & ISRO Missions",
            "- Space Technology & ISRO Missions (Space Technology: INSAT, IRS, Chandrayaan, Gaganyaan, Aditya-L1; Applications in agriculture, disaster management & rural development)"
        )

    # 5. Enrich Pillar 11: Ethics, Integrity & Aptitude
    # Ensure verbatim phrases: Essence, determinants and consequences of Ethics in human actions; Nolan Principles, Probity in governance
    if "Essence, determinants and consequences of Ethics in human actions" not in content:
        content = content.replace(
            "- Ethics & Human Interface",
            "- Ethics & Human Interface (Essence, determinants and consequences of Ethics in human actions; Dimensions of ethics; Ethics in private and public relationships; Human Values – lessons from the lives and teachings of great leaders, reformers and administrators; Role of family, society and educational institutions in inculcating values)"
        )
    if "Probity in Governance: Concept of public service; Philosophical basis of governance and probity" not in content:
        content = content.replace(
            "- Probity in Governance & Anti-Corruption",
            "- Probity in Governance & Anti-Corruption (Probity in Governance: Concept of public service; Philosophical basis of governance and probity; Information sharing and transparency in government, Right to Information, Codes of Ethics, Codes of Conduct, Citizen’s Charters, Work culture, Quality of service delivery, Utilization of public funds, Challenges of corruption)"
        )

    with open(md_path, "w", encoding="utf-8") as f:
        f.write(content)

    print(f"Updated knowledge_graph.md with verbatim syllabus phrases (new size: {len(content)} bytes)")

if __name__ == "__main__":
    enrich_knowledge_graph()
