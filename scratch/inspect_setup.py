import sys, json

def main():
    sys.stdout.reconfigure(encoding='utf-8')
    with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
        kg = json.load(f)

    print('ROOT SUBJECTS in knowledge_graph.json:')
    for sid in kg['rootSubjectIds']:
        node = kg['nodes'][sid]
        print(f"{sid}: name='{node['name']}', children={len(node.get('childrenIds', []))}")

    print('\nChecking knowledge_graph_civil_services.json:')
    with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
        kg_cs = json.load(f)
    print('Root subjects in CS:', kg_cs.get('rootSubjectIds'))

if __name__ == '__main__':
    main()
