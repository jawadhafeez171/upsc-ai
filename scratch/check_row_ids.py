import json

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

ids = set()
duplicates = []

for q in questions:
    exam_name = q.get('exam_name', '')
    yr = q.get('year', 0)
    qn = q.get('question_number', 0)
    
    if 'APFC' in exam_name and 'EO/AO' in exam_name:
        pcode = 'eoao-apfc'
    elif 'APFC' in exam_name:
        pcode = 'apfc'
    elif 'EO/AO' in exam_name:
        pcode = 'eoao'
    else:
        pcode = 'gen'
        
    row_id = f"epfo-{pcode}-{yr}-q{qn}"
    if row_id in ids:
        duplicates.append(row_id)
    ids.add(row_id)

print(f"Total questions: {len(questions)}")
print(f"Unique row IDs: {len(ids)}")
print(f"Duplicates: {len(duplicates)}")
