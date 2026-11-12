'use client';
import { useEffect, useMemo, useRef, useState, type KeyboardEvent, type ReactNode } from 'react';
import Link from 'next/link';
import { ChevronRight, Search, X, ArrowRight } from 'lucide-react';
import './syllabus.css';

export type SyllabusNode = {
    id: string;
    label: string;
    matchLabel?: string;   // English label used to link to practice subjects
    kind: string;            // human label: "Paper", "Subject", "Topic"…
    badge?: string;          // factual exam detail, e.g. "100 MCQs · 200 marks"
    description?: string;
    items?: string[];        // key entities / sub-points
    children?: SyllabusNode[];
};

export type PracticeLink = { href?: string; label?: string; note?: string } | null;

type Strings = {
    search: string; expandAll: string; collapseAll: string; matches: (n: number) => string; noMatches: string;
    pickTopic: string; close: string; inside: string; keyPoints: string; subtopics: (n: number) => string;
};
const STRINGS: Record<'en' | 'kn', Strings> = {
    en: {
        search: 'Search topics', expandAll: 'Expand all', collapseAll: 'Collapse all',
        matches: (n) => `${n} matching ${n === 1 ? 'topic' : 'topics'}`, noMatches: 'No topics match. Try a shorter or different word.',
        pickTopic: 'Select a topic to see what it covers and practise it.', close: 'Close', inside: 'In', keyPoints: 'Key points',
        subtopics: (n) => `${n} ${n === 1 ? 'subtopic' : 'subtopics'}`,
    },
    kn: {
        search: 'ವಿಷಯಗಳನ್ನು ಹುಡುಕಿ', expandAll: 'ಎಲ್ಲವನ್ನೂ ತೆರೆಯಿರಿ', collapseAll: 'ಎಲ್ಲವನ್ನೂ ಮುಚ್ಚಿ',
        matches: (n) => `${n} ಹೊಂದಾಣಿಕೆಯ ವಿಷಯಗಳು`, noMatches: 'ಯಾವುದೇ ವಿಷಯ ಹೊಂದುತ್ತಿಲ್ಲ. ಬೇರೆ ಪದ ಪ್ರಯತ್ನಿಸಿ.',
        pickTopic: 'ವಿವರಗಳನ್ನು ನೋಡಲು ಮತ್ತು ಅಭ್ಯಾಸ ಮಾಡಲು ಒಂದು ವಿಷಯ ಆಯ್ಕೆಮಾಡಿ.', close: 'ಮುಚ್ಚಿ', inside: 'ಇದರಲ್ಲಿ', keyPoints: 'ಮುಖ್ಯ ಅಂಶಗಳು',
        subtopics: (n) => `${n} ಉಪವಿಷಯಗಳು`,
    },
};

function highlight(text: string, q: string): ReactNode {
    if (!q) return text;
    const i = text.toLowerCase().indexOf(q.toLowerCase());
    if (i < 0) return text;
    return <>{text.slice(0, i)}<mark>{text.slice(i, i + q.length)}</mark>{text.slice(i + q.length)}</>;
}

export default function SyllabusTree({ roots, lang = 'en', practiceFor, initiallyExpandedDepth = 1, emptyNote }: {
    roots: SyllabusNode[];
    lang?: 'en' | 'kn';
    practiceFor: (node: SyllabusNode, path: SyllabusNode[]) => PracticeLink;
    initiallyExpandedDepth?: number;
    emptyNote?: ReactNode;
}) {
    const t = STRINGS[lang];
    const [query, setQuery] = useState('');
    const [expanded, setExpanded] = useState<Set<string>>(new Set());
    const [selectedId, setSelectedId] = useState<string | null>(null);
    const [focusedId, setFocusedId] = useState<string | null>(null);
    const [sheetOpen, setSheetOpen] = useState(false);
    const treeRef = useRef<HTMLUListElement>(null);
    const detailRef = useRef<HTMLHeadingElement>(null);

    // Index: parent links and paths
    const index = useMemo(() => {
        const parent = new Map<string, string | null>();
        const byId = new Map<string, SyllabusNode>();
        const depthOf = new Map<string, number>();
        const walk = (n: SyllabusNode, p: string | null, d: number) => {
            parent.set(n.id, p); byId.set(n.id, n); depthOf.set(n.id, d);
            n.children?.forEach((c) => walk(c, n.id, d + 1));
        };
        roots.forEach((r) => walk(r, null, 0));
        return { parent, byId, depthOf };
    }, [roots]);
    const pathOf = (id: string) => {
        const out: SyllabusNode[] = [];
        let cur: string | null | undefined = index.parent.get(id);
        while (cur) { out.unshift(index.byId.get(cur)!); cur = index.parent.get(cur); }
        return out;
    };

    // Reset when the tree changes (another exam or view)
    useEffect(() => {
        const open = new Set<string>();
        const walk = (n: SyllabusNode, d: number) => { if (d < initiallyExpandedDepth && n.children?.length) { open.add(n.id); n.children.forEach((c) => walk(c, d + 1)); } };
        roots.forEach((r) => walk(r, 0));
        setExpanded(open);
        setSelectedId(null);
        setFocusedId(roots[0]?.id ?? null);
        setQuery('');
        setSheetOpen(false);
    }, [roots, initiallyExpandedDepth]);

    // Search: which nodes match, and which ancestors must show
    const q = query.trim();
    const search = useMemo(() => {
        if (!q) return null;
        const ql = q.toLowerCase();
        const hits = new Set<string>();
        const keep = new Set<string>();
        index.byId.forEach((n, id) => {
            const hay = `${n.label} ${n.badge ?? ''} ${(n.items ?? []).join(' ')} ${n.description ?? ''}`.toLowerCase();
            if (hay.includes(ql)) {
                hits.add(id);
                let cur: string | null | undefined = id;
                while (cur) { keep.add(cur); cur = index.parent.get(cur); }
            }
        });
        return { hits, keep };
    }, [q, index]);

    const isOpen = (id: string) => (search ? search.keep.has(id) && [...(index.byId.get(id)?.children ?? [])].some((c) => search.keep.has(c.id)) : expanded.has(id));
    const visibleChildren = (n: SyllabusNode) => (n.children ?? []).filter((c) => !search || search.keep.has(c.id));

    // Flattened visible order for keyboard navigation
    const visible = useMemo(() => {
        const out: string[] = [];
        const walk = (n: SyllabusNode) => {
            if (search && !search.keep.has(n.id)) return;
            out.push(n.id);
            if (isOpen(n.id)) visibleChildren(n).forEach(walk);
        };
        roots.forEach(walk);
        return out;
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [roots, expanded, search]);

    useEffect(() => {
        if (focusedId && !visible.includes(focusedId)) setFocusedId(visible[0] ?? null);
    }, [visible, focusedId]);

    const focusNode = (id: string) => {
        setFocusedId(id);
        requestAnimationFrame(() => treeRef.current?.querySelector<HTMLElement>(`[data-id="${CSS.escape(id)}"]`)?.focus());
    };
    const toggle = (id: string, open?: boolean) => setExpanded((prev) => {
        const next = new Set(prev);
        const want = open ?? !next.has(id);
        if (want) next.add(id); else next.delete(id);
        return next;
    });
    const select = (id: string) => {
        setSelectedId(id);
        setFocusedId(id);
        setSheetOpen(true);
    };

    const onKeyDown = (e: KeyboardEvent<HTMLUListElement>) => {
        const id = focusedId;
        if (!id) return;
        const i = visible.indexOf(id);
        const node = index.byId.get(id);
        const hasKids = !!node && visibleChildren(node).length > 0;
        switch (e.key) {
            case 'ArrowDown': e.preventDefault(); if (i < visible.length - 1) focusNode(visible[i + 1]); break;
            case 'ArrowUp': e.preventDefault(); if (i > 0) focusNode(visible[i - 1]); break;
            case 'Home': e.preventDefault(); focusNode(visible[0]); break;
            case 'End': e.preventDefault(); focusNode(visible[visible.length - 1]); break;
            case 'ArrowRight':
                e.preventDefault();
                if (hasKids && !isOpen(id)) toggle(id, true);
                else if (hasKids) focusNode(visibleChildren(node!)[0].id);
                break;
            case 'ArrowLeft': {
                e.preventDefault();
                const p = index.parent.get(id);
                if (hasKids && isOpen(id) && !search) toggle(id, false);
                else if (p) focusNode(p);
                break;
            }
            case 'Enter': case ' ': e.preventDefault(); select(id); break;
            default:
                if (e.key.length === 1 && /\S/.test(e.key)) {
                    const k = e.key.toLowerCase();
                    const order = [...visible.slice(i + 1), ...visible.slice(0, i + 1)];
                    const hit = order.find((v) => index.byId.get(v)?.label.toLowerCase().startsWith(k));
                    if (hit) focusNode(hit);
                }
        }
    };

    useEffect(() => { if (sheetOpen && selectedId) detailRef.current?.focus(); }, [sheetOpen, selectedId]);

    const expandAll = () => { const all = new Set<string>(); index.byId.forEach((n, id) => { if (n.children?.length) all.add(id); }); setExpanded(all); };
    const collapseAll = () => setExpanded(new Set(roots.map((r) => r.id)));

    const renderNode = (n: SyllabusNode, depth: number): ReactNode => {
        if (search && !search.keep.has(n.id)) return null;
        const kids = visibleChildren(n);
        const open = kids.length > 0 && isOpen(n.id);
        const total = n.children?.length ?? 0;
        return (
            <li
                key={n.id}
                role="treeitem"
                className="st-item"
                data-id={n.id}
                aria-level={depth + 1}
                aria-expanded={total > 0 ? open : undefined}
                aria-selected={selectedId === n.id}
                tabIndex={focusedId === n.id ? 0 : -1}
                onFocus={(e) => { if (e.target === e.currentTarget) setFocusedId(n.id); }}
            >
                <div
                    className="st-row"
                    data-level={Math.min(depth, 3)}
                    style={{ ['--depth' as string]: depth, ['--guide' as string]: depth > 0 ? 'block' : 'none' }}
                    onClick={() => {
                        if (total > 0) { toggle(n.id); setSelectedId(n.id); setFocusedId(n.id); }
                        else select(n.id);
                    }}
                >
                    <span className={`st-caret${total > 0 ? '' : ' st-caret-blank'}`} aria-hidden="true"><ChevronRight size={16} /></span>
                    <span className="st-label">
                        {highlight(n.label, q)}
                        {n.badge && <span className="st-meta">{n.badge}</span>}
                    </span>
                    {total > 0 && !open && <span className="st-count" aria-hidden="true">{t.subtopics(total)}</span>}
                </div>
                {open && <ul role="group">{kids.map((c) => renderNode(c, depth + 1))}</ul>}
            </li>
        );
    };

    const selected = selectedId ? index.byId.get(selectedId) : null;
    const selPath = selected ? pathOf(selected.id) : [];
    const practice = selected ? practiceFor(selected, selPath) : null;

    if (!roots.length) return <div className="st-panel st-empty">{emptyNote}</div>;

    return (
        <div className="st">
            <div className="st-panel">
                <div className="st-tools">
                    <label className="st-search">
                        <Search size={17} aria-hidden="true" />
                        <span className="sr-only">{t.search}</span>
                        <input type="search" value={query} onChange={(e) => setQuery(e.target.value)} placeholder={t.search} />
                    </label>
                    {!search && <>
                        <button type="button" className="st-btn" onClick={expandAll}>{t.expandAll}</button>
                        <button type="button" className="st-btn" onClick={collapseAll}>{t.collapseAll}</button>
                    </>}
                    <p className="st-status" aria-live="polite">{search ? (search.hits.size ? t.matches(search.hits.size) : t.noMatches) : ''}</p>
                </div>
                {search && search.hits.size === 0 ? null : (
                    <ul ref={treeRef} role="tree" aria-label="Syllabus" className="st-tree" onKeyDown={onKeyDown}>
                        {roots.map((r) => renderNode(r, 0))}
                    </ul>
                )}
            </div>

            <div className="st-panel st-detail-wrap" data-open={sheetOpen && selected ? '' : undefined}>
                {selected ? (
                    <div className="st-detail" role="region" aria-labelledby="st-detail-h">
                        <button type="button" className="st-btn st-close" onClick={() => setSheetOpen(false)} aria-label={t.close}><X size={18} aria-hidden="true" /></button>
                        <p className="st-detail-kind">{selected.kind}</p>
                        <h3 id="st-detail-h" ref={detailRef} tabIndex={-1}>{selected.label}</h3>
                        {selPath.length > 0 && <p className="st-path">{t.inside}: {selPath.map((p) => p.label).join(' › ')}</p>}
                        {selected.badge && <p className="st-badge">{selected.badge}</p>}
                        {selected.description && <p className="st-desc">{selected.description}</p>}
                        {!!selected.items?.length && <>
                            <p className="st-items-h">{t.keyPoints}</p>
                            <ul className="st-items">{selected.items.map((it, i) => <li key={i}>{it}</li>)}</ul>
                        </>}
                        {practice && (
                            <div className="st-cta">
                                {practice.href && <Link href={practice.href} className="st-btn st-btn-primary">{practice.label} <ArrowRight size={16} aria-hidden="true" /></Link>}
                                {practice.note && <p>{practice.note}</p>}
                            </div>
                        )}
                    </div>
                ) : (
                    <p className="st-detail-empty">{t.pickTopic}</p>
                )}
            </div>
        </div>
    );
}
