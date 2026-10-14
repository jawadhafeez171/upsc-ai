import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

KG_PATH = 'src/data/knowledge_graph.json'

with open(KG_PATH, 'r', encoding='utf-8') as f:
    kg = json.load(f)

print(f"Loaded knowledge graph. Existing root subjects: {len(kg['rootSubjectIds'])}, Existing nodes: {len(kg['nodes'])}")

# Define Exam Tags for Communication Paper
EXAM_TAGS = {
    "kpsc": ["Group-C", "FDA", "SDA", "CTI", "Sub-Registrar"],
    "kea": ["VAO", "Village-Accountant"],
    "ksp": ["PSI-Paper1", "PC"],
    "kas": ["Compulsory-Kannada", "Compulsory-English"]
}
RAW_TAGS = "[KPSC: Group-C, FDA, SDA, CTI, Sub-Registrar] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang]"

def make_node(id_str, name, level, level_name, parent_id, ancestor_ids, children_ids=None, keywords=None):
    slug = id_str.split('.')[-1]
    if children_ids is None:
        children_ids = []
    if keywords is None:
        # Generate simple keywords from name
        clean_words = [w.strip("(),.-/:") for w in name.split() if len(w) > 2]
        keywords = list(dict.fromkeys(clean_words))[:10]
        
    return {
        "id": id_str,
        "slug": slug,
        "name": name,
        "level": level,
        "levelName": level_name,
        "subject": "Communication Paper",
        "subjectId": "communication_paper",
        "parentId": parent_id,
        "childrenIds": children_ids,
        "ancestorIds": ancestor_ids,
        "examTags": EXAM_TAGS,
        "rawExamTagString": RAW_TAGS,
        "entities": [],
        "keywords": keywords
    }

# 1. Root Subject
root_id = "communication_paper"
domains = [
    "communication_paper.general_kannada",
    "communication_paper.general_english",
    "communication_paper.computer_knowledge"
]

root_node = make_node(
    root_id,
    "Communication Paper (General Kannada, General English & Computer Knowledge)",
    1,
    "Subject",
    None,
    [],
    children_ids=domains,
    keywords=["Communication", "Paper", "Kannada", "English", "Computer", "Knowledge", "KPSC", "KEA"]
)

# 2. General Kannada Structure
kannada_topics = {
    "communication_paper.general_kannada.kannada_grammar_and_syntax": {
        "name": "ಕನ್ನಡ ವ್ಯಾಕರಣ ಮತ್ತು ವಾಕ್ಯ ರಚನೆ (Kannada Grammar & Syntax)",
        "subtopics": [
            ("varnamale_sandhi_samasa", "ಕನ್ನಡ ವರ್ಣಮಾಲೆ, ಸಂಧಿಗಳು ಮತ್ತು ಸಮಾಸಗಳು (Alphabets, Sandhi & Samasa)"),
            ("namapada_vibhakti_linga_vachana", "ನಾಮಪದಗಳು, ಲಿಂಗ-ವಚನ ಮತ್ತು ವಿಭಕ್ತಿ ಪ್ರತ್ಯಯಗಳು (Nouns, Gender, Number & Case Endings)"),
            ("kriyapada_dhatu_kala_prayoga", "ಕ್ರಿಯಾಪದಗಳು, ಧಾತು, ಕಾಲಗಳು ಮತ್ತು ಕರ್ತರಿ-ಕರ್ಮಣಿ ಪ್ರಯೋಗ (Verbs, Tenses & Voice)"),
            ("avyayagalu_vakya_rachane", "ಅವ್ಯಯಗಳು ಮತ್ತು ವಾಕ್ಯ ರಚನೆಯ ವಿಧಗಳು (Indeclinables & Sentence Formation)")
        ]
    },
    "communication_paper.general_kannada.kannada_vocabulary_idioms_proverbs": {
        "name": "ಕನ್ನಡ ಶಬ್ದಕೋಶ ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು (Kannada Vocabulary & Idioms)",
        "subtopics": [
            ("tatsama_tadbhavagalu_deshya_anyadeshya", "ತತ್ಸಮ-ತದ್ಭವಗಳು, ದೇಶ್ಯ ಮತ್ತು ಅನ್ಯದೇಶ್ಯ ಶಬ್ದಗಳು (Etymology & Loan Words)"),
            ("samanarthaka_viruddharthaka_nanarthaka", "ಸಮಾನಾರ್ಥಕ, ವಿರುದ್ಧಾರ್ಥಕ ಮತ್ತು ನಾನಾರ್ಥಕ ಪದಗಳು (Synonyms, Antonyms & Homonyms)"),
            ("jodunudi_dvirukti_anukarana", "ಜೋಡುನುಡಿಗಳು, ದ್ವಿರುಕ್ತಿಗಳು ಮತ್ತು ಅನುಕರಣಾವ್ಯಯಗಳು (Collocations & Reduplicatives)"),
            ("kannada_gade_nudigattugalu", "ಕನ್ನಡ ಗಾದೆಗಳು ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು (Kannada Proverbs & Idiomatic Usage)")
        ]
    },
    "communication_paper.general_kannada.kannada_literature_authors_awards": {
        "name": "ಕನ್ನಡ ಸಾಹಿತ್ಯ, ಕವಿಗಳು ಮತ್ತು ಪ್ರಶಸ್ತಿಗಳು (Kannada Literature, Poets & Awards)",
        "subtopics": [
            ("hale_nadu_hosagannada_sahitya_yugagalu", "ಹಳಗನ್ನಡ, ನಡುಗನ್ನಡ ಮತ್ತು ಹೊಸಗನ್ನಡ ಸಾಹಿತ್ಯ ಯುಗಗಳು (Eras of Kannada Literature - Pampa, Vachana, Haridasa)"),
            ("pramukha_kavigalu_krutigalu", "ಪ್ರಮುಖ ಕವಿಗಳು, ಅವರ ಕೃತಿಗಳು ಮತ್ತು ಬಿರುದುಗಳು (Prominent Authors, Works & Titles)"),
            ("jnanpith_sahitya_academy_pampa_awards", "ಜ್ಞಾನಪೀಠ, ಕೇಂದ್ರ ಸಾಹಿತ್ಯ ಅಕಾಡೆಮಿ ಮತ್ತು ಪಂಪ ಪ್ರಶಸ್ತಿಗಳು (Major Literary Awards & Laureates)")
        ]
    },
    "communication_paper.general_kannada.kannada_comprehension_and_usage": {
        "name": "ಕನ್ನಡ ಗ್ರಹಿಕೆ ಮತ್ತು ಭಾಷಾ ಬಳಕೆ (Kannada Comprehension & Language Usage)",
        "subtopics": [
            ("gadya_grahike_passage_comprehension", "ಗದ್ಯ ಗ್ರಹಿಕೆ (Passage Reading Comprehension)"),
            ("vakya_dosha_tiddupadi", "ವಾಕ್ಯ ದೋಷ ತಿದ್ದುಪಡಿ ಮತ್ತು ಅಕ್ಷರ ವಿನ್ಯಾಸ (Sentence Correction & Orthography)"),
            ("adalitatmaka_paribhashika_padagalu", "ಆಡಳಿತಾತ್ಮಕ ಮತ್ತು ಕಚೇರಿ ಪಾರಿಭಾಷಿಕ ಪದಗಳು (Official Administrative & Governance Terminology)")
        ]
    }
}

# 3. General English Structure
english_topics = {
    "communication_paper.general_english.english_grammar_and_parts_of_speech": {
        "name": "English Grammar & Parts of Speech",
        "subtopics": [
            ("nouns_pronouns_articles", "Nouns, Pronouns, Articles & Determiners"),
            ("adjectives_adverbs_comparison", "Adjectives, Adverbs & Degrees of Comparison"),
            ("prepositions_conjunctions", "Prepositions, Conjunctions & Interjections")
        ]
    },
    "communication_paper.general_english.tenses_voice_and_narration": {
        "name": "Tenses, Voice & Narration",
        "subtopics": [
            ("tenses_and_verb_forms", "Tenses & Auxiliary Verbs"),
            ("subject_verb_agreement", "Subject-Verb Agreement (Syntax Rules)"),
            ("active_and_passive_voice", "Active & Passive Voice Transformations"),
            ("direct_and_indirect_speech", "Direct & Indirect Speech (Reported Speech)")
        ]
    },
    "communication_paper.general_english.english_vocabulary_idioms_phrasal_verbs": {
        "name": "English Vocabulary, Idioms & Phrasal Verbs",
        "subtopics": [
            ("synonyms_and_antonyms", "Synonyms & Antonyms"),
            ("one_word_substitutions", "One-Word Substitutions"),
            ("idioms_and_phrases", "Idiomatic Expressions & Common Sayings"),
            ("phrasal_verbs_and_prepositional_phrases", "Phrasal Verbs & Prepositional Phrases"),
            ("spelling_rules_and_homophones", "Spelling Rules, Homophones & Confusable Words")
        ]
    },
    "communication_paper.general_english.sentence_correction_and_comprehension": {
        "name": "Sentence Correction & Comprehension",
        "subtopics": [
            ("spotting_errors_in_sentences", "Spotting Errors & Sentence Improvement"),
            ("sentence_rearrangement_para_jumbles", "Sentence Rearrangement & Para Jumbles"),
            ("reading_comprehension_passages", "Reading Comprehension Passages"),
            ("cloze_test_and_sentence_completion", "Cloze Test & Fill in the Blanks")
        ]
    }
}

# 4. Computer Knowledge Structure
computer_topics = {
    "communication_paper.computer_knowledge.computer_fundamentals_and_architecture": {
        "name": "Computer Fundamentals & Architecture",
        "subtopics": [
            ("generations_and_types_of_computers", "History, Generations (1st to 5th) & Classification of Computers"),
            ("cpu_input_output_devices", "CPU Architecture (ALU, CU, Registers) & Input/Output Devices"),
            ("primary_and_secondary_memory", "Memory Hierarchy, RAM, ROM, Cache, Registers & Storage Media (HDD, SSD, Optical)"),
            ("computer_software_types", "System Software vs Application Software, OS, Compilers & Device Drivers"),
            ("number_systems_and_computer_codes", "Binary, Octal, Decimal, Hexadecimal, ASCII & Unicode Encoding")
        ]
    },
    "communication_paper.computer_knowledge.operating_systems_and_shortcuts": {
        "name": "Operating Systems & Shortcuts",
        "subtopics": [
            ("operating_system_concepts", "Operating System Concepts, Functions & Types (Windows, Linux, DOS, Android)"),
            ("dos_commands_and_file_management", "Command Prompt / DOS Commands, File Systems (FAT, NTFS), Directories & Paths"),
            ("file_extensions_and_formats", "Common File Extensions (Documents, Spreadsheets, Multimedia, System, Executable)"),
            ("keyboard_shortcuts_and_windows_gui", "Standard Universal & Windows Keyboard Shortcuts, Taskbar, Control Panel Utilities")
        ]
    },
    "communication_paper.computer_knowledge.ms_office_productivity_tools": {
        "name": "MS Office Productivity Suite",
        "subtopics": [
            ("ms_word_word_processing", "MS Word: Formatting, Styles, Tables, Header/Footer, Mail Merge & Word Shortcuts"),
            ("ms_excel_spreadsheets_and_formulas", "MS Excel: Worksheets, Cells, Formulas (SUM, AVERAGE, IF, VLOOKUP), Charts & Formatting"),
            ("ms_powerpoint_presentations", "MS PowerPoint: Slide Layouts, Views, Animations, Transitions & Slide Show Controls"),
            ("ms_access_database_basics", "MS Access & DBMS Fundamentals: Tables, Records, Primary Keys, Queries & Forms")
        ]
    },
    "communication_paper.computer_knowledge.internet_networking_and_email": {
        "name": "Internet, Networking & Email Communication",
        "subtopics": [
            ("computer_networks_topologies_devices", "Computer Networks (LAN, MAN, WAN), Topologies (Star, Ring, Mesh, Bus) & Network Devices"),
            ("internet_architecture_and_protocols", "Internet Architecture, IPv4 vs IPv6, MAC Address, DNS, TCP/IP, HTTP/HTTPS, FTP"),
            ("web_browsers_and_search_engines", "Web Browsers vs Search Engines, URL Anatomy, Bookmarks, Cookies & Cache"),
            ("email_communication_and_protocols", "Email Architecture, SMTP, POP3, IMAP Protocols, CC vs BCC, Attachments & Email Etiquette")
        ]
    },
    "communication_paper.computer_knowledge.cyber_security_and_digital_india": {
        "name": "Cyber Security, IT Act & Digital Governance",
        "subtopics": [
            ("malware_threats_and_antivirus", "Malware Types (Viruses, Worms, Trojans, Spyware, Ransomware), Phishing, Firewalls & Antivirus"),
            ("cyber_laws_and_it_act_2000", "Information Technology Act 2000, Cyber Crimes, Digital Signatures & CERT-In"),
            ("digital_india_and_e_governance", "Digital India Initiatives, DigiLocker, UPI, UMANG, Aadhaar Enabled Services"),
            ("karnataka_e_governance_initiatives", "Karnataka State E-Governance Portals: Bhoomi, Seva Sindhu, KSWAN, Kutumba, FRUITS")
        ]
    }
}

new_nodes = {}
new_nodes[root_id] = root_node

# Add Domain Nodes (Level 2)
new_nodes["communication_paper.general_kannada"] = make_node(
    "communication_paper.general_kannada",
    "General Kannada (ಸಾಮಾನ್ಯ ಕನ್ನಡ)",
    2,
    "Domain",
    root_id,
    [root_id],
    children_ids=list(kannada_topics.keys()),
    keywords=["General", "Kannada", "ಸಾಮಾನ್ಯ", "ಕನ್ನಡ", "ವ್ಯಾಕರಣ", "ಸಾಹಿತ್ಯ", "ಗ್ರಹಿಕೆ"]
)

new_nodes["communication_paper.general_english"] = make_node(
    "communication_paper.general_english",
    "General English (ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್)",
    2,
    "Domain",
    root_id,
    [root_id],
    children_ids=list(english_topics.keys()),
    keywords=["General", "English", "Grammar", "Vocabulary", "Tenses", "Voice", "Comprehension"]
)

new_nodes["communication_paper.computer_knowledge"] = make_node(
    "communication_paper.computer_knowledge",
    "Computer Knowledge & Literacy (ಗಣಕಯಂತ್ರ ಜ್ಞಾನ)",
    2,
    "Domain",
    root_id,
    [root_id],
    children_ids=list(computer_topics.keys()),
    keywords=["Computer", "Knowledge", "Hardware", "Software", "MS Office", "Internet", "Networking", "Cyber", "Security"]
)

# Helper to process topics and subtopics
def process_domain_tree(domain_id, topic_dict):
    for top_id, tdata in topic_dict.items():
        sub_ids = [f"{top_id}.{sub[0]}" for sub in tdata["subtopics"]]
        # Topic node (Level 3)
        top_node = make_node(
            top_id,
            tdata["name"],
            3,
            "Topic",
            domain_id,
            [root_id, domain_id],
            children_ids=sub_ids
        )
        new_nodes[top_id] = top_node
        
        # Subtopic nodes (Level 4)
        for sub_slug, sub_name in tdata["subtopics"]:
            sub_id = f"{top_id}.{sub_slug}"
            sub_node = make_node(
                sub_id,
                sub_name,
                4,
                "Subtopic_Entity",
                top_id,
                [root_id, domain_id, top_id],
                children_ids=[]
            )
            new_nodes[sub_id] = sub_node

process_domain_tree("communication_paper.general_kannada", kannada_topics)
process_domain_tree("communication_paper.general_english", english_topics)
process_domain_tree("communication_paper.computer_knowledge", computer_topics)

print(f"\nGenerated {len(new_nodes)} total nodes for Communication Paper:")
for nid, n in new_nodes.items():
    print(f"[{n['levelName']}] {nid} --> {n['name']}")

# Check if communication_paper already in rootSubjectIds
if root_id not in kg["rootSubjectIds"]:
    kg["rootSubjectIds"].append(root_id)

# Merge into kg['nodes']
for nid, node_data in new_nodes.items():
    kg["nodes"][nid] = node_data

# Save back to src/data/knowledge_graph.json
with open(KG_PATH, 'w', encoding='utf-8') as f:
    json.dump(kg, f, ensure_ascii=False, indent=2)

print(f"\nSuccessfully added communication_paper to {KG_PATH}!")
print(f"Total Root Subjects: {len(kg['rootSubjectIds'])}")
print(f"Total Nodes: {len(kg['nodes'])}")
