import re

SUBJECT_RULES = [
    ('Polity', [
        r'\bconstitution\b', r'\bparliament\b', r'\blok sabha\b', r'\brajya sabha\b', r'\bsupreme court\b',
        r'\bhigh court\b', r'\bfundamental rights\b', r'\bdirective principles\b', r'\bduties\b', r'\barticle \d+',
        r'\bpresident of india\b', r'\bgovernor\b', r'\bp叙speaker\b', r'\badjournment motion\b', r'\bjoint sitting\b',
        r'\bpanchayat\b', r'\bpanchayati raj\b', r'\bpesa\b', r'\bmunicipal\b', r'\bcag\b', r'\battorney general\b',
        r'\belection commission\b', r'\bfinance commission\b', r'\bjudiciary\b', r'\bjudicial review\b',
        r'\bwrit\b', r'\bamendment act\b', r'\bdeliberation\b', r'\bbill\b', r'\bpassed by\b', r'\bparliamentary\b'
    ]),
    ('History', [
        r'\bindian national congress\b', r'\bgandhi\b', r'\bnehru\b', r'\bswadeshi\b', r'\bnon-cooperation\b',
        r'\bcivil disobedience\b', r'\bquit india\b', r'\bbritish rule\b', r'\beast india company\b',
        r'\bryotwari\b', r'\bmahalwari\b', r'\bpermanent settlement\b', r'\bmorley-minto\b', r'\bmontagu-chelmsford\b',
        r'\bcharter act\b', r'\bgovernment of india act\b', r'\bancient india\b', r'\bmedieval india\b',
        r'\bmaury\b', r'\bgupta\b', r'\bchola\b', r'\bpallava\b', r'\bharappa\b', r'\bindus valley\b',
        r'\bvedic\b', r'\bbuddhism\b', r'\bjainism\b', r'\bshreni\b', r'\binscription\b', r'\brock edict\b',
        r'\btemple architecture\b', r'\bnagara\b', r'\bdravida\b', r'\bvesara\b', r'\bminiature painting\b',
        r'\bmoghul\b', r'\bmughal\b', r'\bsultanate\b', r'\bvijayanagar\b', r'\bkarl marx\b'
    ]),
    ('Economy', [
        r'\bgdp\b', r'\bgnp\b', r'\binflation\b', r'\brbi\b', r'\breserve bank of india\b', r'\bmonetary policy\b',
        r'\bfiscal deficit\b', r'\bbanking\b', r'\bcommercial banks\b', r'\brepo rate\b', r'\bcrr\b', r'\bslr\b',
        r'\bfdi\b', r'\bfii\b', r'\bbalance of payments\b', r'\bcurrent account\b', r'\bcapital account\b',
        r'\bdisinvestment\b', r'\bcpse\b', r'\bpoverty line\b', r'\bfinancial inclusion\b', r'\bmicrofinance\b',
        r'\bpriority sector\b', r'\bwto\b', r'\bimf\b', r'\bworld bank\b', r'\btrade policy\b', r'\btaxation\b',
        r'\bgoods and services tax\b', r'\bgst\b', r'\bcustoms duty\b', r'\bunion budget\b', r'\bpublic finance\b',
        r'\bforeign exchange\b', r'\bforex\b', r'\bdepreciation\b', r'\bderivatives\b', r'\bstock exchange\b'
    ]),
    ('Environment', [
        r'\bbiodiversity\b', r'\becosystem\b', r'\bwetland\b', r'\bramsar\b', r'\bnational park\b',
        r'\bwildlife\b', r'\bsanctuary\b', r'\bbiosphere reserve\b', r'\btiger reserve\b', r'\biucn\b',
        r'\bred data\b', r'\bclimate change\b', r'\bgreenhouse gas\b', r'\bglobal warming\b', r'\bunfccc\b',
        r'\bkyoto\b', r'\bparis agreement\b', r'\bcarbon credit\b', r'\bcarbon footprint\b', r'\bpollution\b',
        r'\beutrophication\b', r'\bbiodegradable\b', r'\bbiofertilizer\b', r'\bendangered\b', r'\bfauna\b',
        r'\bflora\b', r'\bcoral reef\b', r'\bmangrove\b', r'\becological\b', r'\bacid rain\b', r'\be-waste\b'
    ]),
    ('Science & Technology', [
        r'\bgraphene\b', r'\bnanotechnology\b', r'\bnanotubes\b', r'\bstem cell\b', r'\bgenetic\b',
        r'\bdna\b', r'\brna\b', r'\bcrispr\b', r'\btransgenic\b', r'\bbt cotton\b', r'\bbt brinjal\b',
        r'\blaser\b', r'\bled\b', r'\boled\b', r'\boptical fibre\b', r'\bbluetooth\b', r'\bwi-fi\b',
        r'\b5g\b', r'\b4g\b', r'\bradar\b', r'\blidar\b', r'\bsatellite\b', r'\bisro\b', r'\bnasa\b',
        r'\blaunch vehicle\b', r'\bpslv\b', r'\bgslv\b', r'\borbit\b', r'\bmissile\b', r'\bnuclear reactor\b',
        r'\bthorium\b', r'\bheavy water\b', r'\bparticle physics\b', r'\bhiggs boson\b', r'\bcern\b',
        r'\bartificial intelligence\b', r'\bmachine learning\b', r'\bcloud computing\b', r'\bcyber\b', r'\bvpn\b'
    ]),
    ('Geography', [
        r'\bmonsoon\b', r'\bwestern disturbances\b', r'\bcyclone\b', r'\banticyclone\b', r'\bel nino\b',
        r'\bla nina\b', r'\btributary\b', r'\btributaries\b', r'\bdrainage\b', r'\briver\b', r'\bconfluence\b',
        r'\bhimalayas\b', r'\bwestern ghats\b', r'\beastern ghats\b', r'\bpass\b', r'\bgorge\b',
        r'\bplateau\b', r'\bsoil\b', r'\black soil\b', r'\balluvial\b', r'\blaterite\b', r'\bregur\b',
        r'\bcontinental drift\b', r'\bplate tectonics\b', r'\bearthquake\b', r'\bvolcano\b', r'\btropic of cancer\b',
        r'\bequator\b', r'\blatitude\b', r'\blongitude\b', r'\bcurrents\b', r'\btides\b', r'\bocean floor\b',
        r'\bcrops\b', r'\bcropping pattern\b', r'\bkharif\b', r'\brabi\b', r'\bplantation\b', r'\bcoal reserves\b',
        r'\bmineral reserves\b', r'\biron ore\b', r'\bbauxite\b', r'\bmica\b'
    ]),
    ('International Relations', [
        r'\bstart treaty\b', r'\bexport control\b', r'\bwassenaar\b', r'\bmtcr\b', r'\baustralia group\b',
        r'\bnuclear suppliers group\b', r'\bnsg\b', r'\bun security council\b', r'\bunsc\b', r'\bpeacekeeping\b',
        r'\binternational court of justice\b', r'\bicj\b', r'\bradiation protection\b', r'\biaea\b',
        r'\blook east\b', r'\bact east\b', r'\bindian ocean rim\b', r'\bior-arc\b', r'\biora\b', r'\bchabahar\b'
    ])
]

def classify_question_subject(q_text):
    text = q_text.lower()
    scores = {}
    for subj, patterns in SUBJECT_RULES:
        sc = 0
        for pat in patterns:
            matches = len(re.findall(pat, text))
            sc += matches
        scores[subj] = sc
        
    best_subj, best_sc = max(scores.items(), key=lambda x: x[1])
    if best_sc > 0:
        return best_subj
    return None

if __name__ == '__main__':
    import json
    with open('src/data/upsc_pyq/2012.json', 'r', encoding='utf-8') as f:
        pyq = json.load(f)
    print("Testing classification on 2012 questions:")
    for q in pyq[:20]:
        qnum = q['question_number']
        txt = q['question_english'][:90].replace('\n', ' ')
        s = classify_question_subject(q['question_english'])
        print(f"Q{qnum:2d} -> [{s}]: {txt}")
