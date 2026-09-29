import json
import glob
import sys
import os
import re

sys.stdout.reconfigure(encoding='utf-8')

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))

# We want to check for cross-subject false classifications:
# For example:
# A Science question classified as History, Economy, or Polity
# A History question classified as Science, Economy, or Polity
# An Economy question classified as Science or History
# A Polity question classified as History or Science
# A Geography question classified as Economy or Science

# Indicators:
RULES = [
    # True Polity indicators
    ('indian_polity_constitution_governance', [
        r'\bconstitution\s+of\s+india\b', r'\barticle\s+\d+([a-z])?\b', r'\bfundamental\s+rights?\b', 
        r'\bdirective\s+principles?\b', r'\blok\s+sabha\b', r'\brajya\s+sabha\b', r'\bparliamentary\b', 
        r'\bsupreme\s+court\b', r'\bhigh\s+court\b', r'\bwrit\s+of\b', r'\bhabeas\s+corpus\b', 
        r'\bmandamus\b', r'\bpanchayat(i)?\b', r'\bmunicipalit(y|ies)\b', r'\belection\s+commission\b', 
        r'\bfinance\s+commission\b', r'\bupsc\b', r'\battorney\s+general\b', r'\bcomptroller\s+and\s+auditor\b', 
        r'\bcag\b', r'\bno-confidence\s+motion\b', r'\bmoney\s+bill\b', r'\bdeliberative\s+democracy\b', 
        r'\bright\s+to\s+information\b', r'\bcitizen\'?s?\s+charter\b', r'\badministrative\s+reforms\s+commission\b'
    ]),
    # True History indicators
    ('history', [
        r'\bmauryan?\b', r'\bgupta\s+(empire|period|dynasty)\b', r'\bchola\b', r'\bpallava\b', 
        r'\bmughal\b', r'\bdelhi\s+sultanate\b', r'\bakbar\b', r'\bashoka\b', r'\bharappa(n)?\b', 
        r'\bindus\s+valley\b', r'\bvedic\s+period\b', r'\bbrahmi\b', r'\bkharosthi\b', r'\bjames\s+prinsep\b', 
        r'\bnon-cooperation\s+movement\b', r'\bcivil\s+disobedience\b', r'\bquit\s+india\b', 
        r'\bswadeshi\b', r'\browlatt\s+act\b', r'\bjallianwala\b', r'\beast\s+india\s+company\b', 
        r'\bpermanent\s+settlement\b', r'\bryotwari\b', r'\bmahalwari\b', r'\bvasudeo\s+balwant\s+phadke\b', 
        r'\bsubhas\s+chandra\s+bose\b', r'\binan?\b', r'\bindian\s+national\s+congress\b'
    ]),
    # True Science indicators
    ('science_technology_defence', [
        r'\bphotosynthesis\b', r'\bchlorophyll\b', r'\bmitochondri(a|on)\b', r'\bchromosomes?\b', 
        r'\bdna\b', r'\brna\b', r'\bprokaryot(e|ic)\b', r'\beukaryot(e|ic)\b', r'\bcell\s+wall\b', 
        r'\bxylem\b', r'\bphloem\b', r'\benzyme\b', r'\bhornwort\b', r'\bbryophyte\b', r'\bpteridophyte\b', 
        r'\brefraction\b', r'\bdispersion\s+of\s+light\b', r'\btotal\s+internal\s+reflection\b', 
        r'\bconcave\s+mirror\b', r'\bconvex\s+lens\b', r'\belectric\s+current\b', r'\bohm\'?s?\s+law\b', 
        r'\bresistance\b', r'\bmagnetic\s+field\b', r'\belectromagnetic\b', r'\bradioactiv(e|ity)\b', 
        r'\boxidation\s+number\b', r'\bperiodic\s+table\b', r'\bvalence\s+electrons?\b', r'\bisotopes?\b', 
        r'\blimestone\b', r'\bcalcium\s+oxide\b', r'\bslaked\s+lime\b'
    ]),
    # True Geography indicators
    ('geography_earth_systems', [
        r'\broaring\s+forties\b', r'\bcircum-pacific\b', r'\bring\s+of\s+fire\b', r'\bplate\s+tectonics?\b', 
        r'\btroposphere\b', r'\bstratosphere\b', r'\bcoriolis\s+force\b', r'\btrade\s+winds?\b', 
        r'\bmonsoon\s+trough\b', r'\bwestern\s+disturbances?\b', r'\bel\s+ni[ñn]o\b', r'\bla\s+ni[ñn]a\b', 
        r'\bdolomite\b', r'\bbauxite\b', r'\briver\s+basin\b', r'\btributar(y|ies)\b', 
        r'\bwestern\s+ghats\b', r'\beastern\s+ghats\b', r'\bblack\s+soil\b', r'\bregur\b', r'\blaterite\b', 
        r'\bkharif\b', r'\brabi\b', r'\bzayed\b', r'\bseaport\b', r'\bmajor\s+ports?\b'
    ]),
    # True Economy indicators
    ('indian_economy_development', [
        r'\bgdp\b', r'\bgross\s+domestic\s+product\b', r'\binflation\b', r'\bconsumer\s+price\s+index\b', 
        r'\bcpi\b', r'\bwpi\b', r'\brepo\s+rate\b', r'\breverse\s+repo\b', r'\bmonetary\s+policy\s+committee\b', 
        r'\bfiscal\s+deficit\b', r'\brevenue\s+deficit\b', r'\bbalance\s+of\s+payments\b', 
        r'\bcurrent\s+account\s+deficit\b', r'\bforeign\s+direct\s+investment\b', r'\bfdi\b', 
        r'\bfii\b', r'\bcode\s+on\s+wages\b', r'\bminimum\s+support\s+price\b', r'\bmsp\b', 
        r'\bdisinvestment\b', r'\bgst\s+council\b', r'\bgoods\s+and\s+services\s+tax\b', 
        r'\blaw\s+of\s+diminishing\s+returns\b', r'\bpradhan\s+mantri\s+jan\s+dhan\b'
    ])
]

mismatches = []
for fpath in capf_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        assigned_subj = q.get('subject')
        year = q.get('year')
        qnum = q.get('question_number')
        txt = q.get('question_english', '')
        
        for expected_subj_id, patterns in RULES:
            # Check if text matches patterns
            for pat in patterns:
                if re.search(pat, txt, re.IGNORECASE):
                    # Check if assigned subject corresponds to expected
                    # Let's map expected_subj_id to full name:
                    subj_mapping = {
                        'indian_polity_constitution_governance': "Indian Polity, Constitution & Governance",
                        'history': "History",
                        'science_technology_defence': "Science, Technology & Defence",
                        'geography_earth_systems': "Geography & Earth Systems",
                        'indian_economy_development': "Indian Economy & Development"
                    }
                    expected_name = subj_mapping[expected_subj_id]
                    if assigned_subj != expected_name:
                        # Some overlaps are legitimate (e.g. art & culture for ancient history, or internal security for defence)
                        if expected_subj_id == 'history' and assigned_subj in ["Art, Culture & Heritage"]:
                            continue
                        if expected_subj_id == 'science_technology_defence' and assigned_subj in ["Internal Security", "Environment, Ecology & Disaster Management"]:
                            continue
                        if expected_subj_id == 'geography_earth_systems' and assigned_subj in ["Environment, Ecology & Disaster Management"]:
                            continue
                        mismatches.append((fname, year, qnum, pat, assigned_subj, expected_name, txt[:75]))
                    break

print(f"Total potential mismatches detected: {len(mismatches)}")
print("\nSample Mismatches:")
for m in mismatches[:35]:
    print(f"[{m[0]} {m[1]} Q{m[2]}] Pattern '{m[3]}'\n  Assigned: {m[4]} -> Expected: {m[5]}\n  Text: {m[6]}...\n")
