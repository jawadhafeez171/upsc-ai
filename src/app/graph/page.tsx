'use client';
import { useState, useMemo } from 'react';
import Link from 'next/link';
import { 
    Network, Search, BookOpen, Layers, ChevronRight, ChevronDown, 
    Sparkles, CheckCircle2, Filter, ArrowRight, Compass, Share2, 
    Tag, ExternalLink, Bookmark, Hash, Zap
} from 'lucide-react';
import { 
    getKnowledgeGraph, getRootSubjects, getNodeChildren, 
    getNodeAncestors, searchKnowledgeNodes 
} from '@/lib/knowledgeGraph';
import { KnowledgeNode } from '@/types/knowledgeGraph';

const SUBJECT_ICONS: Record<string, string> = {
    'history': '🏛️',
    'art_culture_heritage': '🎨',
    'geography_earth_systems': '🌍',
    'indian_society_social_justice': '🤝',
    'indian_polity_constitution_governance': '⚖️',
    'international_relations_global_institutions': '🌐',
    'indian_economy_development': '📈',
    'environment_ecology_disaster_management': '🌱',
    'science_technology_defence': '🔬',
    'internal_security': '🛡️',
    'ethics_integrity_aptitude': '💡',
    'general_mental_ability_quantitative_aptitude_comprehension': '🧮',
    'educational_psychology_child_development_teaching_pedagogy': '👩‍🏫',
    'language_proficiency_grammar_communication_general_kannada_general_english': '🗣️'
};

type MainExamType = 'all' | 'upsc' | 'kas' | 'ssc';

const EXAM_SUB_FILTERS: Record<MainExamType, { id: string; label: string }[]> = {
    all: [],
    upsc: [
        { id: 'all_upsc', label: 'All UPSC' },
        { id: 'Prelims-GS1', label: 'Prelims GS-1' },
        { id: 'Prelims-CSAT', label: 'Prelims CSAT' },
        { id: 'Mains-GS1', label: 'Mains GS-1' },
        { id: 'Mains-GS2', label: 'Mains GS-2' },
        { id: 'Mains-GS3', label: 'Mains GS-3' },
        { id: 'Mains-GS4', label: 'Mains GS-4' },
    ],
    kas: [
        { id: 'all_kas', label: 'All KAS' },
        { id: 'Prelims-P1', label: 'Prelims Paper 1' },
        { id: 'Prelims-P2', label: 'Prelims Paper 2 (GMA/S&T)' },
        { id: 'Mains-GS1', label: 'Mains GS-1' },
        { id: 'Mains-GS2', label: 'Mains GS-2' },
        { id: 'Mains-GS3', label: 'Mains GS-3' },
        { id: 'Mains-GS4', label: 'Mains GS-4' },
    ],
    ssc: [
        { id: 'all_ssc', label: 'All SSC' },
        { id: 'GA', label: 'General Awareness' },
        { id: 'Quant/Reasoning', label: 'Quant & Reasoning' },
    ]
};

export default function KnowledgeGraphPage() {
    const graph = getKnowledgeGraph();
    const rootSubjects = getRootSubjects();

    const [selectedExam, setSelectedExam] = useState<MainExamType>('all');
    const [subFilter, setSubFilter] = useState<string>('all_upsc');
    const [searchQuery, setSearchQuery] = useState('');
    const [selectedNode, setSelectedNode] = useState<KnowledgeNode | null>(null);
    const [expandedNodes, setExpandedNodes] = useState<Record<string, boolean>>({
        [rootSubjects[0]?.id || 'history']: true
    });

    const handleMainExamChange = (exam: MainExamType) => {
        setSelectedExam(exam);
        if (exam === 'upsc') setSubFilter('all_upsc');
        else if (exam === 'kas') setSubFilter('all_kas');
        else if (exam === 'ssc') setSubFilter('all_ssc');
        else setSubFilter('');
    };

    const toggleExpand = (nodeId: string) => {
        setExpandedNodes(prev => ({
            ...prev,
            [nodeId]: !prev[nodeId]
        }));
    };

    // Filter root subjects based on exam & sub-filter
    const filteredSubjects = useMemo(() => {
        if (selectedExam === 'all') return rootSubjects;

        return rootSubjects.filter(sub => {
            const tags = sub.examTags[selectedExam];
            if (!tags || tags.length === 0) return false;
            
            if (!subFilter || subFilter.startsWith('all_')) return true;
            return tags.includes(subFilter);
        });
    }, [rootSubjects, selectedExam, subFilter]);

    // Real-time search results
    const searchResults = useMemo(() => {
        if (!searchQuery.trim()) return [];
        return searchKnowledgeNodes(searchQuery, {
            exam: selectedExam === 'all' ? undefined : selectedExam,
            limit: 15
        });
    }, [searchQuery, selectedExam]);

    const activeNodeAncestors = useMemo(() => {
        if (!selectedNode) return [];
        return getNodeAncestors(selectedNode.id);
    }, [selectedNode]);

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '100vh', paddingTop: '80px', paddingBottom: '80px' }}>
            <div style={{ maxWidth: '1240px', margin: '0 auto', padding: '0 24px' }}>
                
                {/* Hero Header */}
                <div style={{ textAlign: 'center', marginBottom: '36px' }}>
                    <div style={{ 
                        display: 'inline-flex', alignItems: 'center', gap: '8px', 
                        padding: '6px 16px', borderRadius: '9999px', 
                        background: 'rgba(255, 107, 43, 0.1)', border: '1px solid rgba(255, 107, 43, 0.25)',
                        color: 'var(--brand-orange)', fontSize: '13px', fontWeight: 700, marginBottom: '14px'
                    }}>
                        <Network size={15} />
                        Canonical Knowledge Engine v2.0
                    </div>
                    <h1 style={{ fontSize: 'clamp(28px, 4vw, 42px)', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '12px', letterSpacing: '-0.02em' }}>
                        Universal Syllabus & Knowledge Graph
                    </h1>
                    <p style={{ fontSize: '16px', color: 'var(--text-secondary)', maxWidth: '720px', margin: '0 auto 24px', lineHeight: 1.6 }}>
                        Explore <strong>{graph.stats.totalNodes} structured syllabus nodes</strong> mapped with exact exam projections across UPSC CSE, KPSC KAS, and SSC.
                    </p>

                    {/* Stats Pill Row */}
                    <div style={{ display: 'flex', justifyContent: 'center', flexWrap: 'wrap', gap: '12px', marginBottom: '28px' }}>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: 'var(--brand-orange)' }}>🏛️ {graph.stats.byLevel.subjects}</span> Subjects
                        </div>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: 'var(--brand-teal)' }}>📁 {graph.stats.byLevel.domains}</span> Domains
                        </div>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: '#8B5CF6' }}>🎯 {graph.stats.byLevel.topics}</span> Core Topics
                        </div>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: '#10B981' }}>💎 {graph.stats.byLevel.entities}</span> High-Yield Entities
                        </div>
                    </div>

                    {/* Search & Exam Filter Bar */}
                    <div style={{ 
                        maxWidth: '820px', margin: '0 auto', 
                        display: 'flex', flexDirection: 'column', gap: '14px',
                        background: 'var(--bg-card)', padding: '16px', borderRadius: '18px',
                        border: '1px solid var(--border)', boxShadow: 'var(--shadow-sm)'
                    }}>
                        {/* Search Input */}
                        <div style={{ position: 'relative' }}>
                            <Search size={18} style={{ position: 'absolute', left: '16px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                            <input 
                                type="text"
                                placeholder="Search any topic, dynasty, act, scheme, river, or entity (e.g. Dholavira, Article 371J, Cauvery, Monetary Policy)..."
                                value={searchQuery}
                                onChange={(e) => setSearchQuery(e.target.value)}
                                style={{
                                    width: '100%', padding: '12px 16px 12px 46px',
                                    borderRadius: '12px', border: '1px solid var(--border)',
                                    background: 'var(--bg-primary)', color: 'var(--text-primary)',
                                    fontSize: '14.5px', outline: 'none'
                                }}
                            />
                            {searchQuery && (
                                <button 
                                    onClick={() => setSearchQuery('')}
                                    style={{
                                        position: 'absolute', right: '14px', top: '50%', transform: 'translateY(-50%)',
                                        background: 'none', border: 'none', color: 'var(--text-muted)', cursor: 'pointer', fontSize: '12px', fontWeight: 600
                                    }}
                                >
                                    Clear
                                </button>
                            )}
                        </div>

                        {/* Exam Filter Tabs */}
                        <div style={{ display: 'flex', flexWrap: 'wrap', alignItems: 'center', justifyContent: 'center', gap: '8px' }}>
                            <span style={{ fontSize: '12.5px', fontWeight: 700, color: 'var(--text-muted)', marginRight: '6px' }}>EXAM:</span>
                            {[
                                { id: 'all', label: 'All Knowledge', count: graph.stats.totalNodes },
                                { id: 'upsc', label: 'UPSC CSE', count: graph.stats.byExam.upsc },
                                { id: 'kas', label: 'KPSC KAS', count: graph.stats.byExam.kas },
                                { id: 'ssc', label: 'SSC CGL', count: graph.stats.byExam.ssc }
                            ].map((tab) => {
                                const isActive = selectedExam === tab.id;
                                return (
                                    <button
                                        key={tab.id}
                                        onClick={() => handleMainExamChange(tab.id as MainExamType)}
                                        style={{
                                            padding: '7px 16px', borderRadius: '10px',
                                            fontSize: '13.5px', fontWeight: 700,
                                            cursor: 'pointer', transition: 'all 0.2s',
                                            background: isActive ? 'var(--brand-orange)' : 'var(--bg-tertiary)',
                                            color: isActive ? '#FFFFFF' : 'var(--text-secondary)',
                                            border: isActive ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                            boxShadow: isActive ? '0 2px 8px rgba(255, 107, 43, 0.3)' : 'none'
                                        }}
                                    >
                                        {tab.label} ({tab.count})
                                    </button>
                                );
                            })}
                        </div>

                        {/* Granular Paper Sub-Filters (Prelims vs Mains) */}
                        {selectedExam !== 'all' && EXAM_SUB_FILTERS[selectedExam]?.length > 0 && (
                            <div style={{ 
                                display: 'flex', flexWrap: 'wrap', alignItems: 'center', justifyContent: 'center', gap: '6px',
                                paddingTop: '10px', borderTop: '1px solid var(--border)'
                            }}>
                                <span style={{ fontSize: '11.5px', fontWeight: 700, color: 'var(--text-muted)', marginRight: '4px' }}>PAPER:</span>
                                {EXAM_SUB_FILTERS[selectedExam].map((sub) => {
                                    const isSubActive = subFilter === sub.id;
                                    return (
                                        <button
                                            key={sub.id}
                                            onClick={() => setSubFilter(sub.id)}
                                            style={{
                                                padding: '4px 10px', borderRadius: '8px',
                                                fontSize: '12px', fontWeight: 700,
                                                cursor: 'pointer', transition: 'all 0.15s',
                                                background: isSubActive ? 'var(--brand-teal)' : 'var(--bg-primary)',
                                                color: isSubActive ? '#FFFFFF' : 'var(--text-secondary)',
                                                border: isSubActive ? '1px solid var(--brand-teal)' : '1px solid var(--border)',
                                                boxShadow: isSubActive ? '0 2px 6px rgba(13, 148, 136, 0.25)' : 'none'
                                            }}
                                        >
                                            {sub.label}
                                        </button>
                                    );
                                })}
                            </div>
                        )}
                    </div>
                </div>

                {/* Main Content Layout */}
                <div style={{ display: 'grid', gridTemplateColumns: selectedNode ? '1fr 400px' : '1fr', gap: '24px', alignItems: 'start' }}>
                    
                    {/* Left Column: Search Results OR Subject Tree */}
                    <div>
                        {searchQuery.trim().length > 0 ? (
                            <div className="card" style={{ padding: '24px' }}>
                                <div style={{ fontSize: '15px', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '16px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                                    <Search size={16} color="var(--brand-orange)" />
                                    Search Results for "{searchQuery}" ({searchResults.length})
                                </div>
                                {searchResults.length === 0 ? (
                                    <div style={{ padding: '40px 20px', textAlign: 'center', color: 'var(--text-muted)' }}>
                                        No syllabus nodes matching "{searchQuery}" found. Try another keyword.
                                    </div>
                                ) : (
                                    <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                                        {searchResults.map((node) => (
                                            <div 
                                                key={node.id}
                                                onClick={() => setSelectedNode(node)}
                                                style={{
                                                    padding: '14px 18px', borderRadius: '12px',
                                                    background: selectedNode?.id === node.id ? 'rgba(255, 107, 43, 0.08)' : 'var(--bg-primary)',
                                                    border: selectedNode?.id === node.id ? '1.5px solid var(--brand-orange)' : '1px solid var(--border)',
                                                    cursor: 'pointer', transition: 'all 0.15s'
                                                }}
                                            >
                                                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '4px' }}>
                                                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                        <span style={{ fontSize: '12px', padding: '2px 8px', borderRadius: '6px', background: 'var(--bg-tertiary)', fontWeight: 700, color: 'var(--brand-orange)' }}>
                                                            {node.levelName}
                                                        </span>
                                                        <span style={{ fontSize: '15px', fontWeight: 700, color: 'var(--text-primary)' }}>
                                                            {node.name}
                                                        </span>
                                                    </div>
                                                    <ChevronRight size={16} color="var(--text-muted)" />
                                                </div>
                                                <div style={{ fontSize: '12.5px', color: 'var(--text-muted)' }}>
                                                    {node.subject}
                                                </div>
                                                {node.description && (
                                                    <div style={{ fontSize: '13px', color: 'var(--text-secondary)', marginTop: '6px', lineHeight: 1.5 }}>
                                                        {node.description}
                                                    </div>
                                                )}
                                            </div>
                                        ))}
                                    </div>
                                )}
                            </div>
                        ) : (
                            /* Hierarchical Subject Accordion */
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                                {filteredSubjects.map((subject, sIdx) => {
                                    const isExpanded = !!expandedNodes[subject.id];
                                    const icon = SUBJECT_ICONS[subject.slug] || '📚';
                                    const domains = getNodeChildren(subject.id);

                                    return (
                                        <div 
                                            key={subject.id} 
                                            className="card" 
                                            style={{ 
                                                borderRadius: '16px', overflow: 'hidden',
                                                border: isExpanded ? '1px solid rgba(255, 107, 43, 0.4)' : '1px solid var(--border)',
                                                boxShadow: isExpanded ? 'var(--shadow-md)' : 'var(--shadow-sm)',
                                                transition: 'all 0.2s'
                                            }}
                                        >
                                            {/* Subject Header */}
                                            <div 
                                                onClick={() => toggleExpand(subject.id)}
                                                style={{
                                                    padding: '18px 24px', cursor: 'pointer',
                                                    display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                                                    background: isExpanded ? 'var(--bg-secondary)' : 'transparent',
                                                    borderBottom: isExpanded ? '1px solid var(--border)' : 'none'
                                                }}
                                            >
                                                <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>
                                                    <div style={{ 
                                                        width: '42px', height: '42px', borderRadius: '12px',
                                                        background: 'var(--bg-tertiary)', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                                        fontSize: '20px'
                                                    }}>
                                                        {icon}
                                                    </div>
                                                    <div>
                                                        <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--brand-orange)', letterSpacing: '0.05em' }}>
                                                            PILLAR {sIdx + 1}
                                                        </div>
                                                        <div style={{ fontSize: '17px', fontWeight: 800, color: 'var(--text-primary)' }}>
                                                            {subject.name}
                                                        </div>
                                                    </div>
                                                </div>

                                                <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                                                    <div style={{ display: 'flex', gap: '6px' }}>
                                                        {subject.examTags.upsc && (
                                                            <span style={{ fontSize: '11px', fontWeight: 700, padding: '2px 8px', borderRadius: '6px', background: 'rgba(59, 130, 246, 0.1)', color: '#3B82F6' }}>
                                                                UPSC
                                                            </span>
                                                        )}
                                                        {subject.examTags.kas && (
                                                            <span style={{ fontSize: '11px', fontWeight: 700, padding: '2px 8px', borderRadius: '6px', background: 'rgba(16, 185, 129, 0.1)', color: '#10B981' }}>
                                                                KAS
                                                            </span>
                                                        )}
                                                        {subject.examTags.ssc && (
                                                            <span style={{ fontSize: '11px', fontWeight: 700, padding: '2px 8px', borderRadius: '6px', background: 'rgba(139, 92, 246, 0.1)', color: '#8B5CF6' }}>
                                                                SSC
                                                            </span>
                                                        )}
                                                    </div>
                                                    <span style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-muted)' }}>
                                                        {domains.length} domains
                                                    </span>
                                                    {isExpanded ? <ChevronDown size={18} color="var(--brand-orange)" /> : <ChevronRight size={18} color="var(--text-muted)" />}
                                                </div>
                                            </div>

                                            {/* Expanded Domains and Topics */}
                                            {isExpanded && (
                                                <div style={{ padding: '20px 24px', display: 'flex', flexDirection: 'column', gap: '14px' }}>
                                                    {domains.map((domain) => {
                                                        const isDomainExpanded = !!expandedNodes[domain.id];
                                                        const topics = getNodeChildren(domain.id);

                                                        return (
                                                            <div 
                                                                key={domain.id} 
                                                                style={{ 
                                                                    borderRadius: '12px', border: '1px solid var(--border)',
                                                                    background: 'var(--bg-card-solid)', overflow: 'hidden'
                                                                }}
                                                            >
                                                                {/* Domain Row */}
                                                                <div 
                                                                    onClick={() => toggleExpand(domain.id)}
                                                                    style={{
                                                                        padding: '12px 18px', cursor: 'pointer',
                                                                        display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                                                                        background: isDomainExpanded ? 'var(--bg-tertiary)' : 'transparent'
                                                                    }}
                                                                >
                                                                    <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                                                                        <Layers size={16} color="var(--brand-teal)" />
                                                                        <span style={{ fontSize: '15px', fontWeight: 700, color: 'var(--text-primary)' }}>
                                                                            {domain.name}
                                                                        </span>
                                                                        <span style={{ fontSize: '12px', color: 'var(--text-muted)' }}>
                                                                            ({topics.length} topics)
                                                                        </span>
                                                                    </div>
                                                                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                                        <button 
                                                                            onClick={(e) => { e.stopPropagation(); setSelectedNode(domain); }}
                                                                            style={{
                                                                                fontSize: '11px', fontWeight: 700, padding: '3px 8px', borderRadius: '6px',
                                                                                background: 'none', border: '1px solid var(--border)', color: 'var(--text-secondary)', cursor: 'pointer'
                                                                            }}
                                                                        >
                                                                            Inspect
                                                                        </button>
                                                                        {isDomainExpanded ? <ChevronDown size={15} color="var(--brand-teal)" /> : <ChevronRight size={15} color="var(--text-muted)" />}
                                                                    </div>
                                                                </div>

                                                                {/* Topics List under Domain */}
                                                                {isDomainExpanded && (
                                                                    <div style={{ padding: '12px 18px', borderTop: '1px solid var(--border)', background: 'var(--bg-primary)' }}>
                                                                        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '10px' }}>
                                                                            {topics.map((topic) => {
                                                                                const entities = getNodeChildren(topic.id);
                                                                                const isSelected = selectedNode?.id === topic.id;

                                                                                return (
                                                                                    <div
                                                                                        key={topic.id}
                                                                                        onClick={() => setSelectedNode(topic)}
                                                                                        style={{
                                                                                            padding: '12px 14px', borderRadius: '10px',
                                                                                            background: isSelected ? 'rgba(255, 107, 43, 0.1)' : 'var(--bg-card)',
                                                                                            border: isSelected ? '1.5px solid var(--brand-orange)' : '1px solid var(--border)',
                                                                                            cursor: 'pointer', transition: 'all 0.15s',
                                                                                            display: 'flex', flexDirection: 'column', justifyContent: 'space-between'
                                                                                        }}
                                                                                    >
                                                                                        <div style={{ fontSize: '13.5px', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '6px' }}>
                                                                                            {topic.name}
                                                                                        </div>
                                                                                        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', fontSize: '11.5px', color: 'var(--text-muted)' }}>
                                                                                            <span>{entities.length} subtopics / entities</span>
                                                                                            <span style={{ color: 'var(--brand-orange)', fontWeight: 600 }}>View ➔</span>
                                                                                        </div>
                                                                                    </div>
                                                                                );
                                                                            })}
                                                                        </div>
                                                                    </div>
                                                                )}
                                                            </div>
                                                        );
                                                    })}
                                                </div>
                                            )}
                                        </div>
                                    );
                                })}
                            </div>
                        )}
                    </div>

                    {/* Right Column: Node Inspector Drawer */}
                    {selectedNode && (
                        <div 
                            className="card" 
                            style={{ 
                                position: 'sticky', top: '100px',
                                padding: '24px', borderRadius: '18px',
                                border: '1.5px solid var(--brand-orange)',
                                boxShadow: '0 12px 32px rgba(255, 107, 43, 0.12)'
                            }}
                        >
                            {/* Drawer Header */}
                            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '16px' }}>
                                <span style={{ 
                                    fontSize: '11px', fontWeight: 800, padding: '3px 10px', borderRadius: '9999px',
                                    background: 'rgba(255, 107, 43, 0.12)', color: 'var(--brand-orange)', letterSpacing: '0.05em'
                                }}>
                                    {selectedNode.levelName.toUpperCase()}
                                </span>
                                <button 
                                    onClick={() => setSelectedNode(null)}
                                    style={{ background: 'none', border: 'none', color: 'var(--text-muted)', cursor: 'pointer', fontSize: '18px' }}
                                >
                                    ✕
                                </button>
                            </div>

                            {/* Title */}
                            <h3 style={{ fontSize: '19px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '8px', lineHeight: 1.3 }}>
                                {selectedNode.name}
                            </h3>

                            {/* Ancestors Breadcrumbs */}
                            <div style={{ display: 'flex', flexWrap: 'wrap', alignItems: 'center', gap: '4px', fontSize: '12px', color: 'var(--text-muted)', marginBottom: '16px' }}>
                                {activeNodeAncestors.map((anc) => (
                                    <span key={anc.id} style={{ display: 'inline-flex', alignItems: 'center', gap: '4px' }}>
                                        <span style={{ cursor: 'pointer', textDecoration: 'underline' }} onClick={() => setSelectedNode(anc)}>
                                            {anc.name}
                                        </span>
                                        <span>/</span>
                                    </span>
                                ))}
                                <span style={{ color: 'var(--brand-orange)', fontWeight: 600 }}>{selectedNode.name}</span>
                            </div>

                            {/* Exam Tags */}
                            <div style={{ marginBottom: '20px' }}>
                                <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '6px' }}>
                                    EXAM APPLICABILITY
                                </div>
                                <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px' }}>
                                    {selectedNode.examTags.upsc && (
                                        <span style={{ fontSize: '11.5px', fontWeight: 700, padding: '3px 8px', borderRadius: '6px', background: 'rgba(59, 130, 246, 0.12)', color: '#3B82F6' }}>
                                            🏛️ UPSC: {selectedNode.examTags.upsc.join(', ')}
                                        </span>
                                    )}
                                    {selectedNode.examTags.kas && (
                                        <span style={{ fontSize: '11.5px', fontWeight: 700, padding: '3px 8px', borderRadius: '6px', background: 'rgba(16, 185, 129, 0.12)', color: '#10B981' }}>
                                            🅺 KPSC KAS: {selectedNode.examTags.kas.join(', ')}
                                        </span>
                                    )}
                                    {selectedNode.examTags.ssc && (
                                        <span style={{ fontSize: '11.5px', fontWeight: 700, padding: '3px 8px', borderRadius: '6px', background: 'rgba(139, 92, 246, 0.12)', color: '#8B5CF6' }}>
                                            📋 SSC: {selectedNode.examTags.ssc.join(', ')}
                                        </span>
                                    )}
                                </div>
                            </div>

                            {/* Description / Entity details */}
                            {selectedNode.description && (
                                <div style={{ marginBottom: '20px' }}>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '6px' }}>
                                        HIGH-YIELD CORE CONTENT
                                    </div>
                                    <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.6, background: 'var(--bg-secondary)', padding: '12px', borderRadius: '10px' }}>
                                        {selectedNode.description}
                                    </p>
                                </div>
                            )}

                            {/* Child entities list */}
                            {selectedNode.childrenIds.length > 0 && (
                                <div style={{ marginBottom: '20px' }}>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '8px' }}>
                                        CHILD TOPICS / ENTITIES ({selectedNode.childrenIds.length})
                                    </div>
                                    <div style={{ display: 'flex', flexDirection: 'column', gap: '6px', maxHeight: '200px', overflowY: 'auto' }}>
                                        {getNodeChildren(selectedNode.id).map((child) => (
                                            <div 
                                                key={child.id}
                                                onClick={() => setSelectedNode(child)}
                                                style={{
                                                    padding: '8px 12px', borderRadius: '8px',
                                                    background: 'var(--bg-tertiary)', fontSize: '13px',
                                                    fontWeight: 600, color: 'var(--text-primary)',
                                                    cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'space-between'
                                                }}
                                            >
                                                <span>{child.name}</span>
                                                <ChevronRight size={14} color="var(--text-muted)" />
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            )}

                            {/* Action CTA */}
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', marginTop: '12px' }}>
                                <Link 
                                    href={`/exams`}
                                    style={{
                                        display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px',
                                        padding: '12px 16px', borderRadius: '12px',
                                        background: 'var(--brand-orange)', color: '#FFFFFF',
                                        fontSize: '14px', fontWeight: 700, textDecoration: 'none',
                                        boxShadow: '0 4px 14px rgba(255, 107, 43, 0.3)'
                                    }}
                                >
                                    <Zap size={16} />
                                    Practice Tests in this Subject
                                </Link>
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}
