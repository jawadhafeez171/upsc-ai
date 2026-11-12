"""Build the UPSC CSE Mains syllabus tree verbatim from the official notification (Section-III).
Usage: pdftotext -raw -enc UTF-8 src/Syllabus/upsc-syllabus.pdf raw.txt && python scripts/build_cse_mains_syllabus.py raw.txt src/data/syllabus/upsc-cse-mains.json

Text comes from `pdftotext -raw`; the only transformation is re-joining lines the PDF wrapped.
"""
import json, re, sys

src, out = sys.argv[1], sys.argv[2]
lines = [l.replace('\f', '').replace('', '•').rstrip() for l in open(src, encoding='utf-8')]
lines = [l.strip() for l in lines if l.strip()]

START = re.compile(r'^(•|[-–]\s|\d{1,2}\.(\d{1,2}(\.\d{1,2})*)?\.?(\s|$)|\(\w{1,5}\)|[a-z]\)\s|[ivx]+[).]\s|[IVX]+\.\s|[A-H]\.\s|'
                   r'Section|SECTION|PART|Part[-\s:]|Unit|Group|Paper|PAPER|NOTE|Note|\[|\(Answers|Answers must)')

def paragraphs(block):
    """Re-join wrapped lines into the PDF's own paragraphs / list items."""
    items, last = [], ''
    for ln in block:
        if items:
            # `last` is the previous printed line: only a full-width line can have wrapped.
            wrap = (not START.match(ln)) and (
                re.search(r'[A-Za-z]-$', last) or ln[:1].islower() or (len(last) >= 90 and not last.endswith(':'))
            )
            if wrap:
                items[-1] = items[-1] + ln if re.search(r'[A-Za-z]-$', last) else items[-1] + ' ' + ln
                last = ln
                continue
        items.append(ln)
        last = ln
    return items

def idx(text, start=0):
    for i in range(start, len(lines)):
        if lines[i] == text:
            return i
    raise SystemExit(f'not found: {text}')

# ── Compulsory papers ──
i_mains = idx('PART-B')
i_p1 = idx('PAPER-I', i_mains)
i_p2 = idx('PAPER-II', i_p1)
i_p3 = idx('PAPER-III', i_p2)
i_p4 = idx('PAPER-IV', i_p3)
i_p5 = idx('PAPER-V', i_p4)
i_opt = idx('PAPER-VI & PAPER VII', i_p5)

mains_intro = paragraphs(lines[i_mains + 1:i_p1])
assert mains_intro[0] == 'MAIN EXAMINATION', mains_intro[0]
mains_intro.pop(0)

essay = paragraphs(lines[i_p1 + 1:i_p2])

def gs(a, b, key):
    block = lines[a + 1:b]
    title = block[0]
    j = 1
    while len(block[j - 1]) >= 90 and not block[j].startswith('•'):  # title wrapped onto 2 lines
        title += ' ' + block[j]; j += 1
    rest = paragraphs(block[j:])
    intro = [p for p in rest if not p.startswith('•')]
    bullets = [p[1:].strip() for p in rest if p.startswith('•')]
    # A wrapped title must not swallow bullets
    assert all('•' not in p for p in intro), intro
    return title, intro, bullets

papers = [
    ('cse-mains-gs1', 'Paper-II', *gs(i_p2, i_p3, 'gs1'), '#F97316'),
    ('cse-mains-gs2', 'Paper-III', *gs(i_p3, i_p4, 'gs2'), '#0284C7'),
    ('cse-mains-gs3', 'Paper-IV', *gs(i_p4, i_p5, 'gs3'), '#16A34A'),
    ('cse-mains-gs4', 'Paper-V', *gs(i_p5, i_opt, 'gs4'), '#9333EA'),
]

# ── Optional subjects ──
opt_block = lines[i_opt + 1:]
opt_title = opt_block[0]  # "Optional Subject Papers I & II"
SUBJECTS = ['AGRICULTURE', 'ANIMAL HUSBANDRY AND VETERINARY SCIENCE', 'ANTHROPOLOGY', 'BOTANY', 'CHEMISTRY',
            'CIVIL ENGINEERING', 'COMMERCE AND ACCOUNTANCY', 'ECONOMICS', 'ELECTRICAL ENGINEERING', 'GEOGRAPHY',
            'GEOLOGY', 'HISTORY', 'LAW', 'Literature of the following languages',
            'ASSAMESE', 'BENGALI', 'BODO', 'DOGRI', 'ENGLISH', 'GUJARATI', 'HINDI', 'KANNADA', 'KASHMIRI', 'KONKANI',
            'MAITHILI', 'MALAYALAM', 'MANIPURI', 'MARATHI', 'NEPALI', 'ORIYA', 'PUNJABI', 'SANSKRIT', 'SANTHALI',
            'SINDHI', 'TAMIL', 'TELUGU', 'URDU',
            'MANAGEMENT', 'MATHEMATICS', 'MECHANICAL ENGINEERING', 'MEDICAL SCIENCE', 'PHILOSOPHY', 'PHYSICS',
            'POLITICAL SCIENCE AND INTERNATIONAL RELATIONS', 'PSYCHOLOGY', 'PUBLIC ADMINISTRATION', 'SOCIOLOGY',
            'STATISTICS', 'ZOOLOGY']
LANGS = SUBJECTS[SUBJECTS.index('ASSAMESE'):SUBJECTS.index('URDU') + 1]

pos, cur = [], 0
for s in SUBJECTS:
    k = opt_block.index(s, cur)
    pos.append(k); cur = k + 1
opt_note = paragraphs(opt_block[1:pos[0]])

SMALL = {'and', 'of', 'the', 'in'}
def title_case(s):
    return ' '.join(w if i and w.lower() in SMALL else w.capitalize() for i, w in enumerate(s.lower().split()))

PAPER_RE = re.compile(r'^PAPER\s*[-–]?\s*(II|I)$', re.I)
def slug(s):
    return re.sub(r'[^a-z0-9]+', '-', s.lower()).strip('-')

problems = []
def subject_node(name, block, is_lang):
    sid = 'opt-' + slug(name)
    marks = [k for k, l in enumerate(block) if PAPER_RE.match(l)]
    if len(marks) != 2:
        problems.append((name, [block[k] for k in marks]))
    intro = paragraphs(block[:marks[0]]) if marks else paragraphs(block)
    kids = []
    for n, k in enumerate(marks):
        end = marks[n + 1] if n + 1 < len(marks) else len(block)
        roman = PAPER_RE.match(block[k]).group(1).upper()
        kids.append({
            'id': f'{sid}-p{len(roman)}', 'label': f'{title_case(name)} — Paper-{roman}', 'category': 'topic',
            'kindLabel': 'Paper', 'verbatim': True, 'items': paragraphs(block[k + 1:end]),
        })
    node = {'id': sid, 'label': title_case(name), 'category': 'domain' if not is_lang else 'topic',
            'kindLabel': 'Literature' if is_lang else 'Optional subject', 'children': kids}
    if intro:
        node['description'] = '\n\n'.join(intro)
    return node

subjects, lit = [], None
for n, s in enumerate(SUBJECTS):
    end = pos[n + 1] if n + 1 < len(pos) else len(opt_block)
    block = opt_block[pos[n] + 1:end]
    if s == 'Literature of the following languages':
        lit = {'id': 'opt-literature', 'label': 'Literature of the following languages', 'category': 'domain',
               'kindLabel': 'Optional subject', 'description': '\n\n'.join(paragraphs(block)), 'children': []}
        subjects.append(lit)
    elif s in LANGS:
        lit['children'].append(subject_node(s, block, True))
    else:
        subjects.append(subject_node(s, block, False))

def to_items(node):
    """`items` → MindMapNode.entities (rendered as a list in the detail panel)."""
    if 'items' in node:
        node['entities'] = node.pop('items')
    for c in node.get('children', []):
        to_items(c)
    return node

mains = {
    'id': 'cse-mains', 'label': 'Part-B: Main Examination', 'label_kn': 'ಭಾಗ-ಬಿ: ಮುಖ್ಯ ಪರೀಕ್ಷೆ', 'category': 'stage',
    'color': '#3B82F6', 'description': '\n\n'.join(mains_intro),
    'children': [
        {'id': 'cse-mains-essay', 'label': 'Paper-I: Essay', 'label_kn': 'ಪತ್ರಿಕೆ-I: ಪ್ರಬಂಧ', 'category': 'paper',
         'badge': '250 marks', 'color': '#EC4899', 'description': '\n\n'.join(p.removeprefix('Essay:').strip() for p in essay)},
        *[{
            'id': pid, 'label': f'{num}: {title}', 'category': 'paper', 'badge': '250 marks', 'color': color,
            **({'description': '\n\n'.join(intro)} if intro else {}),
            'children': [{'id': f'{pid}-{k + 1}', 'label': b, 'category': 'topic'} for k, b in enumerate(bullets)],
        } for pid, num, title, intro, bullets, color in papers],
        to_items({'id': 'cse-mains-optional', 'label': f'Paper-VI & Paper-VII: {opt_title}', 'category': 'paper',
                  'badge': '250 marks each', 'color': '#0D9488', 'description': '\n\n'.join(opt_note),
                  'children': subjects}),
    ],
}
json.dump(mains, open(out, 'w', encoding='utf-8'), ensure_ascii=False, separators=(',', ':'))

# ── Report ──
print('problems:', problems or 'none')
for pid, num, title, intro, bullets, _ in papers:
    print(num, '|', title, '|', len(bullets), 'bullets', '| intro' if intro else '')
print('optional subjects:', len([s for s in subjects if s['id'] != 'opt-literature']), '+ literature langs:', len(lit['children']))
