import json
import glob
import os
import sys
from test_reclassification import get_canonical_and_mapping, valid_nids

sys.stdout.reconfigure(encoding='utf-8')

pyq_files = glob.glob('src/data/upsc_pyq/*.json') + glob.glob('src/data/kas_*.json')

migration_stats = {
    'total_files_scanned': 0,
    'total_files_updated': 0,
    'total_questions_migrated': 0,
    'by_file': {},
    'by_category': {}
}

for fpath in sorted(pyq_files):
    fname = os.path.basename(fpath)
    if 'key' in fname or 'explanations' in fname:
        continue
        
    migration_stats['total_files_scanned'] += 1
    
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    if not isinstance(data, list):
        continue
        
    file_modified = False
    migrated_in_file = 0
    
    for q in data:
        res = get_canonical_and_mapping(fname, q)
        if res:
            # Update canonical taxonomy
            old_nid = q.get('node_id')
            q['node_id'] = res['node_id']
            q['subject'] = res['subject']
            q['domain'] = res['domain']
            if 'sub_topic' in res:
                q['sub_topic'] = res['sub_topic']
                
            # Dual-presence mapping facet
            q['is_mapping'] = res.get('is_mapping', False)
            if res.get('is_mapping', False):
                q['mapping'] = res['mapping']
                if 'secondary_node_ids' in res:
                    q['secondary_node_ids'] = res['secondary_node_ids']
                
                # Ensure 'Mapping' tag is present
                tags = q.get('tags', []) or []
                if 'Mapping' not in tags:
                    tags.append('Mapping')
                q['tags'] = tags
                
                cat = res['mapping'].get('category', 'Other')
                migration_stats['by_category'][cat] = migration_stats['by_category'].get(cat, 0) + 1
            else:
                # If explicitly false (anomaly fix)
                q.pop('mapping', None)
                q.pop('secondary_node_ids', None)
                tags = q.get('tags', []) or []
                q['tags'] = [t for t in tags if str(t).lower() != 'mapping']
                
            file_modified = True
            migrated_in_file += 1
            migration_stats['total_questions_migrated'] += 1
            
    if file_modified:
        migration_stats['total_files_updated'] += 1
        migration_stats['by_file'][fname] = migrated_in_file
        with open(fpath, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4, ensure_ascii=False)
        print(f"Updated {fname}: {migrated_in_file} questions migrated.")

print("\n--- Migration Summary ---")
print(f"Total Files Updated: {migration_stats['total_files_updated']}")
print(f"Total Questions Migrated: {migration_stats['total_questions_migrated']}")
print("\nQuestions by Mapping Category:")
for cat, count in sorted(migration_stats['by_category'].items()):
    print(f" - {cat}: {count}")

with open('scratch/geography_mapping_migration_report.json', 'w', encoding='utf-8') as f:
    json.dump(migration_stats, f, indent=2, ensure_ascii=False)
