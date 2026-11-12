"""Build the UPSC CSE Mains syllabus tree verbatim from the official notification (Section-III).
Usage: pdftotext -raw -enc UTF-8 src/Syllabus/upsc-syllabus.pdf raw.txt && python scripts/build_cse_mains_syllabus.py raw.txt src/data/syllabus/upsc-cse-mains.json

Text comes from `pdftotext -raw`; the only transformation is re-joining lines the PDF wrapped.
"""
import json, re, sys

src, out = sys.argv[1], sys.argv[2]
lines = [l.replace('\f', '').replace('', '•').rstrip() for l in open(src, encoding='utf-8')]
lines = [l.strip() for l in lines if l.strip()]

START = re.compile(r'^(•|[-–]\s|\d{1,2}\.(\d{1,2}(\.\d{1,2})*)?\.?(\s|$)|\(\w{1,5}\)|[a-z]\)\s|[ivx]+[).]\s|[IVX]+\.\s|[A-H]\.\s|'
                   r'Section|SECTION|PART|Part\s*[-:]?\s*(\d|[IVX]+\b)|Unit|Group\s*\d|Paper|PAPER|NOTE|Note|\[|\(Answers|Answers must)')

def paragraphs(block):
    """Re-join wrapped lines into the PDF's own paragraphs / list items."""
    items, last = [], ''
    for ln in block:
        if items and (ln[:1] in '+,' or (len(ln) <= 12 and not START.match(ln) and ln[:1].isdigit() and re.search(r'[A-Z]$', last))):
            items[-1] += ln   # a sub/superscript the PDF set on its own line: H2 + → H2+, SN 1 → SN1
            last += ln
            continue
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

# ── Structuring an optional paper ──
# Each logical line is classified by its numbering ("Section-A", "1.", "1.1", "(a)", "(i)", "a)", "Unit 3", "•" …).
# Items nest by a stack of numbering styles: a style that is already open closes back to that level (a sibling);
# a new style opens one level deeper. Number/letter/roman styles must follow their sequence (1→2, a→b),
# otherwise the line is ordinary text: this keeps author initials ("A. Minaketan Singh") and stray
# parentheses from becoming headings. Every line keeps its exact text and order.
ROMAN = ['i', 'ii', 'iii', 'iv', 'v', 'vi', 'vii', 'viii', 'ix', 'x', 'xi', 'xii', 'xiii', 'xiv', 'xv']
UROMAN = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII']
STYLES = [  # (style, regex, sequence key)
    ('section', re.compile(r'^(?:Section|SECTION|PART)\s*[-–]?\s*([A-D])\b'), None),
    ('part', re.compile(r'^Part\s*[-:]?\s*(\d|[IVX]+)\b'), None),
    ('unit', re.compile(r'^Unit\s*[-–]?\s*(\d)'), None),
    ('group', re.compile(r'^Group\s*(\d)'), None),
    ('dec2', re.compile(r'^(\d{1,2})\.\d{1,2}\.\d{1,2}\.?(\s|$)'), None),
    ('dec', re.compile(r'^(\d{1,2})\.\d{1,2}\.?(\s|$)'), None),
    ('num', re.compile(r'^(\d{1,2})\.(\s|$|\()'), 'n'),
    ('pnum', re.compile(r'^\((\d{1,2})\)\s?'), 'n'),
    ('proman', re.compile(r'^\((' + '|'.join(ROMAN) + r')\)\s?'), 'r'),
    ('PROMAN', re.compile(r'^\((' + '|'.join(UROMAN) + r')\)\s?'), 'R'),
    ('palpha', re.compile(r'^\(([a-z])\)\s?'), 'a'),
    ('alpha', re.compile(r'^([a-z])[).]\s'), 'a'),
    ('ALPHA', re.compile(r'^([A-H])[.)]?\s'), 'A'),
    ('bullet', re.compile(r'^•'), None),
    ('dash', re.compile(r'^[-–]\s'), None),
]
NOTE_RE = re.compile(r'^[\(\[]?\s*Answers?\b.*\b(written|be)\b', re.I)

def ordinal(key, tok):
    if key == 'n': return int(tok)
    if key == 'a': return ord(tok) - 96
    if key == 'A': return ord(tok) - 64
    if key == 'r': return ROMAN.index(tok) + 1
    if key == 'R': return UROMAN.index(tok) + 1

def styles_of(line):
    """Every numbering style the line could be ('(i)' is both roman one and the letter after h)."""
    out = []
    for name, rx, key in STYLES:
        m = rx.match(line)
        if m:
            out.append((name, key, ordinal(key, m.group(1)) if key else int(m.group(1)) if name.startswith('dec') else None))
    return out

def style_of(line):
    c = styles_of(line)
    return c[0] if c else (None, None, None)

# Fixed outline ranks: a ranked style never nests inside one of equal or lower rank number…
RANK = {'section': 0, 'heading': 1, 'part': 2, 'unit': 2, 'group': 2, 'num': 3, 'dec': 4, 'dec2': 5}

def is_heading(line, nxt):
    """An unnumbered group title: short, no closing punctuation, and the next line opens a list."""
    if nxt is None or NOTE_RE.match(line) or style_of(line)[0] or len(line) > 75 or re.search(r'[.;,]$', line):
        return False
    if line[:1].islower():
        return False
    st, key, n = style_of(nxt)
    return st in ('section', 'part', 'unit', 'group') or bool(key and n == 1)

def short_label(text):
    """Tree label for an item: its title, cut at the first ':' / ';' / sentence end when the line is long."""
    t = text.strip()
    if len(t) <= 90:
        return t.rstrip(':').rstrip()
    for sep, lo in ((':', 8), (';', 8), ('. ', 8), (' – ', 25), (' — ', 25), (' - ', 25)):
        k = t.find(sep)
        if lo <= k <= 90:
            return t[:k].rstrip()
    return t[:80].rsplit(' ', 1)[0].rstrip(',;:') + '…'

def structure(lines_):
    """Logical lines → nested items: {style, lines: [[text, flag]], children}."""
    root = {'style': 'root', 'lines': [], 'children': []}
    stack = [root]                   # stack[-1] is the item that new text attaches to
    last_of = {}                     # (parent, style) → last ordinal among its children
    for k, ln in enumerate(lines_):
        nxt = lines_[k + 1] if k + 1 < len(lines_) else None
        if NOTE_RE.match(ln) or (k and NOTE_RE.match(lines_[k - 1]) and ln.startswith('(') and ln.endswith(')') and len(ln) < 60):
            stack[-1]['lines'].append([ln, 'note']); continue   # "(Answers must be written in Sindhi" + "(Arabic or Devanagari script)"

        cands = styles_of(ln)
        if not cands and is_heading(ln, nxt):
            # Inside an open numbered topic, a title line followed by "(i)…" is a sub-heading of that topic.
            inner = stack[-1]['style'] not in ('root', 'section', 'heading', 'part', 'unit', 'group')
            if inner and style_of(nxt)[0] not in ('section', 'part', 'unit', 'group', 'num', 'pnum'):
                stack[-1]['lines'].append([ln, 'sub']); continue
            cands = [('heading', None, None)]
        if not cands or cands[0][0] in ('bullet', 'dash'):
            stack[-1]['lines'].append([ln, 'li' if cands else None]); continue

        def place(st, n):
            """(depth to cut the stack at, parent) for a new item of style st."""
            if st in RANK:
                r = RANK[st]
                d = max([0] + [i for i in range(1, len(stack)) if stack[i]['style'] in RANK and RANK[stack[i]['style']] < r])
                # 2.1 belongs under "2.", not under an open "1."
                while d and st.startswith('dec') and stack[d]['style'] == 'num' and stack[d]['n'] != n:
                    d = max([0] + [i for i in range(1, d) if stack[i]['style'] in RANK and RANK[stack[i]['style']] < RANK['num']])
                return d + 1, stack[d]
            d = next((i for i in range(len(stack) - 1, 0, -1) if stack[i]['style'] == st), None)
            return (d, stack[d - 1]) if d else (len(stack), stack[-1])

        choice = None
        for st, key, n in cands:          # prefer continuing an open list (… (h) → (i)) over starting one
            depth, parent = place(st, n)
            prev = last_of.get((id(parent), st))
            if key and prev is not None and n == prev + 1:
                choice = (st, key, n, depth, parent); break
        if not choice:
            for st, key, n in cands:
                depth, parent = place(st, n)
                prev = last_of.get((id(parent), st))
                lenient = st in ('num', 'pnum')     # some papers number units from 2 or skip one
                ok = not key or (prev is None and (n == 1 or lenient)) or (prev is not None and (n == prev + 1 or (lenient and n > prev)))
                if ok:
                    choice = (st, key, n, depth, parent); break
        if not choice:
            stack[-1]['lines'].append([ln, None]); continue   # out of sequence: ordinary text
        st, key, n, depth, parent = choice
        if key:
            last_of[(id(parent), st)] = n
        del stack[depth:]
        item = {'style': st, 'n': n, 'lines': [[ln, 'h']], 'children': []}
        parent['children'].append(item)
        stack.append(item)
    return root

def merge_section_titles(item):
    """'Section-A' followed directly by a heading ('Language') → one section titled 'Section-A: Language'."""
    for c in item['children']:
        merge_section_titles(c)
        if c['style'] == 'section' and len(c['lines']) == 1 and c['children'] and c['children'][0]['style'] == 'heading':
            h = c['children'].pop(0)
            c['title'] = c['lines'][0][0] + ': ' + h['lines'][0][0].rstrip(' :')
            c['lines'].extend(h['lines'])
            c['children'][0:0] = h['children']
    return item

KIND = {'section': 'Section', 'heading': 'Part', 'part': 'Part', 'unit': 'Unit', 'group': 'Group'}
MAX_DEPTH = 3   # tree levels below a paper; deeper items stay as indented text inside their parent

def line(d, t, f):
    return [d, t, f] if f else [d, t]

def to_node(item, nid, depth):
    """item → MindMapNode whose `outline` holds its own lines as [depth, text, flag?]."""
    node = {'id': nid, 'outline': [line(depth, t, f) for t, f in item['lines']]}
    def fold(it, d):
        for t, f in it['lines']:
            node['outline'].append(line(d, t, f))
        for c in it['children']:
            fold(c, d + 1)
    kids = []
    for k, c in enumerate(item['children']):
        if depth + 1 > MAX_DEPTH:
            fold(c, depth + 1)
            continue
        child = to_node(c, f'{nid}-{k + 1}', depth + 1)
        kind = KIND.get(c['style']) or ('Topic' if item['style'] in ('root', 'section', 'heading', 'part', 'unit', 'group') else 'Subtopic')
        kids.append({'id': child['id'], 'label': c.get('title') or short_label(c['lines'][0][0]), 'category': 'topic',
                     'kindLabel': kind, 'verbatim': True, **{k2: v for k2, v in child.items() if k2 != 'id'}})
    if kids:
        node['children'] = kids
    return node

def unwrap_title(root):
    """A paper whose whole content sits under one title ("GEOGRAPHY OF INDIA") — that title is the paper's, not a part."""
    if len(root['children']) == 1 and root['children'][0]['style'] == 'heading':
        only = root['children'][0]
        root['lines'] += [[t, 'sub' if f == 'h' else f] for t, f in only['lines']]
        root['children'] = only['children']
    return root

def paper_node(sid, name, roman, block):
    pid = f'{sid}-p{len(roman)}'
    node = to_node(unwrap_title(merge_section_titles(structure(paragraphs(block)))), pid, 0)
    # A paper without numbered structure (e.g. Agriculture): each paragraph is a topic.
    if not node.get('children') and len(node['outline']) >= 3:
        node['children'] = [{'id': f'{pid}-{k + 1}', 'label': short_label(l[1]), 'category': 'topic', 'kindLabel': 'Topic',
                             'verbatim': True, 'outline': [[1, l[1]]]} for k, l in enumerate(node['outline'])]
        node['outline'] = []
    if not node['outline']:
        del node['outline']
    paper = {'id': pid, 'label': f'{title_case(name)} — Paper-{roman}', 'category': 'paper', 'kindLabel': 'Paper',
             'verbatim': True, **{k: v for k, v in node.items() if k != 'id'}}
    for c in paper.get('children', []):
        compact(c)
    return paper

def compact(n):
    """Drop what the app derives for nodes inside a paper (see expandPaper in src/lib/examMindMap.ts):
    id = parent id + '-' + position, category 'topic', verbatim, kind 'Topic', label = first line without ':'."""
    for k in ('id', 'category', 'verbatim'):
        n.pop(k, None)
    if n.get('kindLabel') == 'Topic':
        del n['kindLabel']
    ol = n.get('outline')
    if ol and n.get('label') == ol[0][1].strip().rstrip(':').rstrip():
        del n['label']
    for c in n.get('children', []):
        compact(c)

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
        kids.append(paper_node(sid, name, roman, block[k + 1:end]))
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
        ({'id': 'cse-mains-optional', 'label': f'Paper-VI & Paper-VII: {opt_title}', 'category': 'paper',
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
