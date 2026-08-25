'use client';
import { useState, useMemo } from 'react';
import Link from 'next/link';
import { 
    Network, Search, BookOpen, Layers, ChevronRight, ChevronDown, 
    Sparkles, CheckCircle2, Filter, ArrowRight, Compass, Share2, 
    Tag, ExternalLink, Bookmark, Hash, Zap, Award, Shield, 
    GraduationCap, Building, Landmark, Users, BrainCircuit
} from 'lucide-react';
import { 
    getKnowledgeGraph, getRootSubjects, getNodeChildren, 
    getNodeAncestors, searchKnowledgeNodes 
} from '@/lib/knowledgeGraph';
import { KnowledgeNode, KnowledgeGraphStream } from '@/types/knowledgeGraph';
import ExamMindMapVisualizer from '@/components/graph/ExamMindMapVisualizer';

const SUBJECT_ICONS: Record<string, string> = {
    // Civil Services
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
    // Teaching & Education
    'child_development_educational_psychology': '🧠',
    'theories_of_learning_motivation_cognition': '💡',
    'inclusive_education_diverse_learners_special_needs': '🤝',
    'pedagogical_strategies_curriculum_assessment': '📊',
    'subject_specific_pedagogies': '📚',
    'national_policies_and_higher_education_research_aptitude': '🎓',
    'educational_psychology_child_development_teaching_pedagogy': '👩‍🏫',
    // State Languages
    'language_proficiency_grammar_communication': '🗣️',
    'language_proficiency_grammar_communication_general_kannada_general_english': '🗣️'
};

const STREAM_DEFINITIONS: {
    id: KnowledgeGraphStream;
    label: string;
    icon: string;
    badge: string;
    color: string;
    description: string;
}[] = [
    {
        id: 'civil_services',
        label: 'Civil Services (UPSC & KPSC)',
        icon: '🏛️',
        badge: '760 Nodes · 12 Pillars',
        color: 'var(--brand-orange)',
        description: 'Comprehensive General Studies, Mapping & CSAT for UPSC CSE & KPSC KAS'
    },
    {
        id: 'teaching',
        label: 'Teaching & Education',
        icon: '👩‍🏫',
        badge: '90 Nodes · 6 Domains',
        color: '#8B5CF6',
        description: 'Child Development, Educational Psychology, Pedagogy & Research Aptitude (KARTET, CTET, GPSTR, HSTR, KSET, UGC-NET)'
    },
    {
        id: 'languages',
        label: 'State Languages & Dept Exams',
        icon: '🗣️',
        badge: '29 Nodes · 2 Languages',
        color: 'var(--brand-teal)',
        description: 'General Kannada & General English Grammar, Syntax & Vocabulary for FDA, SDA, CTI, VAO & PSI'
    },
    {
        id: 'all',
        label: 'Unified Master Graph',
        icon: '🌐',
        badge: '815 Nodes Total',
        color: '#10B981',
        description: 'Master knowledge federation across all civil services, teaching, and departmental curricula'
    }
];

type MainExamType = 'all' | 'upsc' | 'kas' | 'teaching' | 'karnataka_state' | 'police' | 'ssc';

const MAIN_EXAM_TABS: { id: MainExamType; label: string; icon: string; streams: KnowledgeGraphStream[] }[] = [
    { id: 'all', label: 'All Stream Knowledge', icon: '🌐', streams: ['civil_services', 'teaching', 'languages', 'all'] },
    { id: 'upsc', label: 'UPSC CSE', icon: '🏛️', streams: ['civil_services', 'all'] },
    { id: 'kas', label: 'KPSC KAS', icon: '🅺', streams: ['civil_services', 'all'] },
    { id: 'teaching', label: 'Teaching (TET/KSET/NET)', icon: '👩‍🏫', streams: ['teaching', 'all'] },
    { id: 'karnataka_state', label: 'Karnataka State (PDO/VAO/CTI)', icon: '🌾', streams: ['civil_services', 'languages', 'all'] },
    { id: 'police', label: 'Police & Defence (PSI/CAPF)', icon: '⚔️', streams: ['civil_services', 'all'] },
    { id: 'ssc', label: 'SSC CGL', icon: '🏢', streams: ['civil_services', 'all'] },
];

const EXAM_SUB_FILTERS: Record<MainExamType, { id: string; label: string }[]> = {
    all: [],
    upsc: [
        { id: 'all_upsc', label: 'All UPSC (Prelims & Mains)' },
        { id: 'Prelims-GS1', label: 'Prelims GS-1 (History, Polity, Geo, Econ, Env, S&T)' },
        { id: 'Prelims-CSAT', label: 'Prelims CSAT (GMA, Reasoning, Quant)' },
        { id: 'Mains-GS1', label: 'Mains GS-1 (Heritage, History, Geography, Society)' },
        { id: 'Mains-GS2', label: 'Mains GS-2 (Governance, Constitution, Polity, IR)' },
        { id: 'Mains-GS3', label: 'Mains GS-3 (Economy, Env, S&T, Security, DM)' },
        { id: 'Mains-GS4', label: 'Mains GS-4 (Ethics, Integrity & Aptitude)' },
    ],
    kas: [
        { id: 'all_kas', label: 'All KAS' },
        { id: 'Prelims-P1', label: 'Prelims Paper 1 (Polity, History, Economy, Karnataka)' },
        { id: 'Prelims-P2', label: 'Prelims Paper 2 (GMA, Science & Tech, Environment)' },
        { id: 'Mains-GS1', label: 'Mains GS-1 (History & Cultural Heritage of Karnataka)' },
        { id: 'Mains-GS2', label: 'Mains GS-2 (Polity, Administration & Panchayat Raj)' },
        { id: 'Mains-GS3', label: 'Mains GS-3 (Science & Karnataka Resources)' },
        { id: 'Mains-GS4', label: 'Mains GS-4 (Ethics & Public Service Values)' },
        { id: 'Compulsory-Lang', label: 'Compulsory Kannada & English' },
    ],
    teaching: [
        { id: 'all_teaching', label: 'All Teaching & Pedagogy' },
        { id: 'kartet', label: 'KARTET / CTET (Primary & Upper Primary)' },
        { id: 'gpstr', label: 'GPSTR (Graduate Primary Teacher)' },
        { id: 'kset', label: 'KSET / UGC NET (Paper 1 Teaching & Research)' },
        { id: 'cdp', label: 'Child Development & Learning (Piaget, Vygotsky, Kohlberg)' },
        { id: 'inclusive', label: 'Inclusive Education & CWSN (Dyslexia, ADHD, SEDGs)' },
        { id: 'pedagogy', label: 'Pedagogical Strategies & Bloom Taxonomy' },
        { id: 'assessment', label: 'Assessment & Evaluation (CCE, Formative, Diagnostic)' },
        { id: 'nep_rte', label: 'NEP 2020 & RTE Act 2009' },
    ],
    karnataka_state: [
        { id: 'all_karnataka_state', label: 'All Karnataka State Services' },
        { id: 'pdo', label: 'KEA PDO (Karnataka Gram Swaraj, 21 Chapters & Schemes)' },
        { id: 'vao', label: 'KEA VAO (Village Administration & Land Revenue)' },
        { id: 'cti', label: 'KPSC CTI (Commercial Tax & GST Compliance)' },
        { id: 'fda_sda', label: 'KPSC FDA / SDA (Secretariat & Office Management)' },
        { id: 'kannada', label: 'General Kannada Grammar & Literature (ಕನ್ನಡ ವ್ಯಾಕರಣ)' },
        { id: 'english', label: 'General English Grammar & Syntax' },
    ],
    police: [
        { id: 'all_police', label: 'All Police & Defence Cadres' },
        { id: 'psi', label: 'KSP PSI (Sub-Inspector Paper 1 & Paper 2 GS)' },
        { id: 'capf', label: 'UPSC CAPF (Assistant Commandant Paramilitary & Internal Security)' },
        { id: 'cds', label: 'UPSC CDS (Indian Army, Navy, Air Force Academies)' },
        { id: 'internal_security', label: 'Border Management, Counter-Terrorism & Cyber' },
    ],
    ssc: [
        { id: 'all_ssc', label: 'All SSC Tiers' },
        { id: 'GA', label: 'General Awareness (Tier 1 & Tier 2)' },
        { id: 'Quant/Reasoning', label: 'Quantitative Aptitude & Logical Reasoning' },
        { id: 'English', label: 'English Language & Comprehension' },
        { id: 'Computer', label: 'Computer Awareness & Cyber Literacy' },
    ]
};

export default function KnowledgeGraphPage() {
    const [selectedStream, setSelectedStream] = useState<KnowledgeGraphStream>('civil_services');
    const [viewMode, setViewMode] = useState<'mindmap' | 'tree'>('mindmap');
    const [selectedExam, setSelectedExam] = useState<MainExamType>('all');
    const [subFilter, setSubFilter] = useState<string>('');
    const [searchQuery, setSearchQuery] = useState('');
    const [selectedNode, setSelectedNode] = useState<KnowledgeNode | null>(null);

    const graph = useMemo(() => getKnowledgeGraph(selectedStream), [selectedStream]);
    const rootSubjects = useMemo(() => getRootSubjects(selectedStream), [selectedStream]);

    const [expandedNodes, setExpandedNodes] = useState<Record<string, boolean>>({});

    // Reset expanded nodes when stream changes
    useMemo(() => {
        if (rootSubjects.length > 0) {
            setExpandedNodes({ [rootSubjects[0].id]: true });
        }
        setSelectedNode(null);
    }, [rootSubjects]);

    const handleStreamChange = (stream: KnowledgeGraphStream) => {
        setSelectedStream(stream);
        if (stream === 'civil_services') {
            setSelectedExam('upsc');
            setSubFilter('all_upsc');
        } else if (stream === 'teaching') {
            setSelectedExam('teaching');
            setSubFilter('all_teaching');
        } else if (stream === 'languages') {
            setSelectedExam('karnataka_state');
            setSubFilter('all_karnataka_state');
        } else {
            setSelectedExam('all');
            setSubFilter('');
        }
    };

    const handleMainExamChange = (exam: MainExamType) => {
        setSelectedExam(exam);
        if (exam === 'upsc') setSubFilter('all_upsc');
        else if (exam === 'kas') setSubFilter('all_kas');
        else if (exam === 'teaching') setSubFilter('all_teaching');
        else if (exam === 'karnataka_state') setSubFilter('all_karnataka_state');
        else if (exam === 'police') setSubFilter('all_police');
        else if (exam === 'ssc') setSubFilter('all_ssc');
        else setSubFilter('');
    };

    const toggleExpand = (nodeId: string) => {
        setExpandedNodes(prev => ({
            ...prev,
            [nodeId]: !prev[nodeId]
        }));
    };

    // Deep node match checker for exam filters
    const checkNodeMatchesExam = (node: KnowledgeNode): boolean => {
        if (selectedExam === 'all') return true;

        if (selectedExam === 'upsc') {
            const tags = node.examTags.upsc;
            if (!tags || tags.length === 0) return false;
            if (!subFilter || subFilter === 'all_upsc') return true;
            return tags.includes(subFilter);
        }

        if (selectedExam === 'kas') {
            const tags = node.examTags.kas;
            if (!tags || tags.length === 0) return false;
            if (!subFilter || subFilter === 'all_kas') return true;
            if (subFilter === 'Compulsory-Lang') {
                return tags.includes('Compulsory-Lang') || node.subjectId.includes('language_proficiency');
            }
            return tags.includes(subFilter);
        }

        if (selectedExam === 'teaching') {
            if (selectedStream === 'teaching') return true;
            const isPedagogy = node.subjectId === 'educational_psychology_child_development_teaching_pedagogy' || node.subjectId.includes('teaching') || node.subjectId.includes('pedagogy');
            const hasTeachingTag = (node.examTags.teaching && node.examTags.teaching.length > 0) ||
                                  (node.examTags.kset && node.examTags.kset.length > 0) ||
                                  (node.examTags.ugc_net && node.examTags.ugc_net.length > 0);

            if (!isPedagogy && !hasTeachingTag) return false;
            if (!subFilter || subFilter === 'all_teaching') return true;

            const textLow = `${node.name} ${node.description || ''} ${(node.entities || []).join(' ')}`.toLowerCase();
            if (subFilter === 'kartet') return textLow.includes('kartet') || textLow.includes('primary') || isPedagogy;
            if (subFilter === 'gpstr') return textLow.includes('gpstr') || textLow.includes('teacher') || isPedagogy;
            if (subFilter === 'kset') return textLow.includes('kset') || textLow.includes('higher education') || textLow.includes('research');
            if (subFilter === 'cdp') return textLow.includes('piaget') || textLow.includes('vygotsky') || textLow.includes('kohlberg') || textLow.includes('development');
            if (subFilter === 'inclusive') return textLow.includes('inclusive') || textLow.includes('dyslexia') || textLow.includes('cwsn') || textLow.includes('special needs');
            if (subFilter === 'pedagogy') return textLow.includes('bloom') || textLow.includes('method') || textLow.includes('pedagog');
            if (subFilter === 'assessment') return textLow.includes('cce') || textLow.includes('evaluation') || textLow.includes('assessment') || textLow.includes('rubric');
            if (subFilter === 'nep_rte') return textLow.includes('nep') || textLow.includes('rte') || textLow.includes('article 21a') || textLow.includes('policy');
            return true;
        }

        if (selectedExam === 'karnataka_state') {
            if (selectedStream === 'languages') return true;
            const isLang = node.subjectId.includes('language_proficiency');
            const isPanchayat = node.slug.includes('panchayat') || node.slug.includes('gram_swaraj') || node.name.includes('Panchayat');
            const hasStateTag = (node.examTags.kea && node.examTags.kea.length > 0) ||
                               (node.examTags.kpsc && node.examTags.kpsc.length > 0) ||
                               (node.examTags.state_psc && node.examTags.state_psc.length > 0);

            if (!isLang && !isPanchayat && !hasStateTag && !node.examTags.kas) return false;
            if (!subFilter || subFilter === 'all_karnataka_state') return true;

            const textLow = `${node.name} ${node.description || ''} ${(node.entities || []).join(' ')}`.toLowerCase();
            if (subFilter === 'pdo') return textLow.includes('panchayat') || textLow.includes('gram swaraj') || textLow.includes('rural') || textLow.includes('mgnregs');
            if (subFilter === 'vao') return textLow.includes('revenue') || textLow.includes('tahsildar') || textLow.includes('land') || textLow.includes('bhoomi') || textLow.includes('kannada');
            if (subFilter === 'cti') return textLow.includes('tax') || textLow.includes('gst') || textLow.includes('commercial') || isLang;
            if (subFilter === 'fda_sda') return textLow.includes('secretariat') || textLow.includes('administration') || isLang;
            if (subFilter === 'kannada') return textLow.includes('kannada') || textLow.includes('ವ್ಯಾಕರಣ') || textLow.includes('ಸಾಹಿತ್ಯ');
            if (subFilter === 'english') return textLow.includes('english') || textLow.includes('grammar') || textLow.includes('syntax') || textLow.includes('vocabulary');
            return true;
        }

        if (selectedExam === 'police') {
            const isSecurity = node.subjectId === 'internal_security';
            const isDefence = node.subjectId.includes('science_technology_defence') && (node.slug.includes('defence') || node.name.includes('Defence'));
            const hasPoliceTag = (node.examTags.ksp && node.examTags.ksp.length > 0) ||
                                (node.examTags.capf && node.examTags.capf.length > 0) ||
                                (node.examTags.cds && node.examTags.cds.length > 0);

            if (!isSecurity && !isDefence && !hasPoliceTag && !node.examTags.kas && !node.examTags.upsc) return false;
            if (!subFilter || subFilter === 'all_police') return true;

            const textLow = `${node.name} ${node.description || ''} ${(node.entities || []).join(' ')}`.toLowerCase();
            if (subFilter === 'psi') return textLow.includes('psi') || textLow.includes('police') || textLow.includes('translation') || isSecurity;
            if (subFilter === 'capf') return textLow.includes('paramilitary') || textLow.includes('bsf') || textLow.includes('crpf') || textLow.includes('border') || isSecurity;
            if (subFilter === 'cds') return textLow.includes('army') || textLow.includes('navy') || textLow.includes('air force') || isDefence;
            if (subFilter === 'internal_security') return isSecurity || textLow.includes('cyber') || textLow.includes('terrorism') || textLow.includes('extremism');
            return true;
        }

        if (selectedExam === 'ssc') {
            const tags = node.examTags.ssc;
            if (!tags || tags.length === 0) return false;
            if (!subFilter || subFilter === 'all_ssc') return true;
            if (subFilter === 'English') return node.subjectId.includes('language_proficiency') && node.name.includes('English');
            if (subFilter === 'Computer') return node.slug.includes('computer') || node.name.includes('Computer');
            return tags.includes(subFilter);
        }

        return true;
    };

    // Filter root subjects based on exam & sub-filter
    const filteredSubjects = useMemo(() => {
        if (selectedExam === 'all') return rootSubjects;

        return rootSubjects.filter(sub => {
            if (checkNodeMatchesExam(sub)) return true;
            const children = getNodeChildren(sub.id, selectedStream);
            return children.some(ch => {
                if (checkNodeMatchesExam(ch)) return true;
                const topics = getNodeChildren(ch.id, selectedStream);
                return topics.some(tp => checkNodeMatchesExam(tp));
            });
        });
    }, [rootSubjects, selectedExam, subFilter, selectedStream]);

    // Real-time search results within stream
    const searchResults = useMemo(() => {
        if (!searchQuery.trim()) return [];
        return searchKnowledgeNodes(searchQuery, {
            stream: selectedStream,
            exam: selectedExam === 'all' ? undefined : selectedExam,
            limit: 20
        });
    }, [searchQuery, selectedExam, selectedStream]);

    const activeNodeAncestors = useMemo(() => {
        if (!selectedNode) return [];
        return getNodeAncestors(selectedNode.id, selectedStream);
    }, [selectedNode, selectedStream]);

    const visibleExamTabs = useMemo(() => {
        return MAIN_EXAM_TABS.filter(t => t.streams.includes(selectedStream));
    }, [selectedStream]);

    const activeStreamInfo = useMemo(() => {
        return STREAM_DEFINITIONS.find(s => s.id === selectedStream) || STREAM_DEFINITIONS[0];
    }, [selectedStream]);

    const initialMindMapExam = useMemo(() => {
        if (selectedStream === 'teaching') return 'kartet';
        if (selectedStream === 'languages') return 'kpsc-cti';
        return 'upsc-cse';
    }, [selectedStream]);

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '100vh', paddingTop: '80px', paddingBottom: '80px' }}>
            <div style={{ maxWidth: '1280px', margin: '0 auto', padding: '0 24px' }}>
                
                {/* Hero Header */}
                <div style={{ textAlign: 'center', marginBottom: '32px' }}>
                    <div style={{ 
                        display: 'inline-flex', alignItems: 'center', gap: '8px', 
                        padding: '6px 16px', borderRadius: '9999px', 
                        background: 'rgba(255, 107, 43, 0.1)', border: '1px solid rgba(255, 107, 43, 0.25)',
                        color: 'var(--brand-orange)', fontSize: '13px', fontWeight: 700, marginBottom: '14px'
                    }}>
                        <Network size={15} />
                        Modular Examination Knowledge Graph Architecture
                    </div>
                    <h1 style={{ fontSize: 'clamp(28px, 4vw, 42px)', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '12px', letterSpacing: '-0.02em' }}>
                        {activeStreamInfo.label}
                    </h1>
                    <p style={{ fontSize: '16px', color: 'var(--text-secondary)', maxWidth: '820px', margin: '0 auto 24px', lineHeight: 1.6 }}>
                        {activeStreamInfo.description}. Exploring <strong>{graph.stats.total_nodes || graph.stats.totalNodes} canonical nodes</strong> structured for precision learning and exam-accurate mastery.
                    </p>

                    {/* Stream Selection Ribbon */}
                    <div style={{ 
                        display: 'flex', justifyContent: 'center', flexWrap: 'wrap', gap: '10px', 
                        maxWidth: '960px', margin: '0 auto 28px',
                        background: 'var(--bg-card)', padding: '8px', borderRadius: '16px',
                        border: '1px solid var(--border)', boxShadow: 'var(--shadow-sm)'
                    }}>
                        {STREAM_DEFINITIONS.map(stream => {
                            const isSelected = selectedStream === stream.id;
                            return (
                                <button
                                    key={stream.id}
                                    onClick={() => handleStreamChange(stream.id)}
                                    style={{
                                        display: 'flex', alignItems: 'center', gap: '8px',
                                        padding: '10px 18px', borderRadius: '12px', cursor: 'pointer',
                                        fontSize: '13.5px', fontWeight: 700, transition: 'all 0.2s',
                                        background: isSelected ? 'var(--brand-orange)' : 'transparent',
                                        color: isSelected ? '#FFFFFF' : 'var(--text-secondary)',
                                        border: isSelected ? '1px solid var(--brand-orange)' : '1px solid transparent',
                                        boxShadow: isSelected ? '0 4px 12px rgba(255, 107, 43, 0.3)' : 'none'
                                    }}
                                >
                                    <span>{stream.icon}</span>
                                    <span>{stream.label}</span>
                                    <span style={{ 
                                        fontSize: '11px', opacity: 0.9, 
                                        background: isSelected ? 'rgba(0,0,0,0.2)' : 'var(--bg-tertiary)', 
                                        padding: '2px 8px', borderRadius: '6px' 
                                    }}>
                                        {stream.badge.split('·')[0].trim()}
                                    </span>
                                </button>
                            );
                        })}
                    </div>

                    {/* Stats Pill Row */}
                    <div style={{ display: 'flex', justifyContent: 'center', flexWrap: 'wrap', gap: '12px', marginBottom: '24px' }}>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: 'var(--brand-orange)' }}>🏛️ {graph.stats.level_1_subjects || graph.stats.byLevel?.subjects || rootSubjects.length}</span> Pillars
                        </div>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: 'var(--brand-teal)' }}>📁 {graph.stats.level_2_domains || graph.stats.byLevel?.domains || 0}</span> Core Domains
                        </div>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: '#8B5CF6' }}>🎯 {graph.stats.level_3_topics || graph.stats.byLevel?.topics || 0}</span> Syllabi Topics
                        </div>
                        <div className="card" style={{ padding: '8px 16px', display: 'flex', alignItems: 'center', gap: '8px', fontSize: '13.5px', fontWeight: 600 }}>
                            <span style={{ color: '#10B981' }}>💎 {graph.stats.total_nodes || graph.stats.totalNodes}</span> Total Nodes
                        </div>
                    </div>

                    {/* View Mode Switcher: Exam Mind Map vs Canonical Tree */}
                    <div style={{ display: 'flex', justifyContent: 'center', gap: '10px' }}>
                        <button
                            onClick={() => setViewMode('mindmap')}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '8px',
                                padding: '10px 22px', borderRadius: '12px', cursor: 'pointer',
                                fontSize: '14px', fontWeight: 800, transition: 'all 0.2s',
                                background: viewMode === 'mindmap' ? 'var(--brand-orange)' : 'var(--bg-tertiary)',
                                color: viewMode === 'mindmap' ? '#FFFFFF' : 'var(--text-secondary)',
                                border: viewMode === 'mindmap' ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                boxShadow: viewMode === 'mindmap' ? '0 4px 14px rgba(255, 107, 43, 0.35)' : 'none'
                            }}
                        >
                            <BrainCircuit size={17} />
                            Exam-Tailored Mind Map
                        </button>

                        <button
                            onClick={() => setViewMode('tree')}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '8px',
                                padding: '10px 22px', borderRadius: '12px', cursor: 'pointer',
                                fontSize: '14px', fontWeight: 800, transition: 'all 0.2s',
                                background: viewMode === 'tree' ? 'var(--brand-teal)' : 'var(--bg-tertiary)',
                                color: viewMode === 'tree' ? '#FFFFFF' : 'var(--text-secondary)',
                                border: viewMode === 'tree' ? '1px solid var(--brand-teal)' : '1px solid var(--border)',
                                boxShadow: viewMode === 'tree' ? '0 4px 14px rgba(13, 148, 136, 0.35)' : 'none'
                            }}
                        >
                            <Layers size={17} />
                            Structured Syllabus Explorer
                        </button>
                    </div>
                </div>

                {/* ═══════════════════════════════════════════════════════════════
                    VIEW 1: EXAM-TAILORED MIND MAP MODE
                ═══════════════════════════════════════════════════════════════ */}
                {viewMode === 'mindmap' && (
                    <div>
                        <ExamMindMapVisualizer initialExamId={initialMindMapExam} showExamPicker={true} />
                    </div>
                )}

                {/* ═══════════════════════════════════════════════════════════════
                    VIEW 2: STRUCTURED SYLLABUS TREE & SEARCH MODE
                ═══════════════════════════════════════════════════════════════ */}
                {viewMode === 'tree' && (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
                        {/* Stream-Filtered Exam Filter Bar */}
                        <div style={{ 
                            maxWidth: '960px', margin: '0 auto', width: '100%',
                            display: 'flex', flexDirection: 'column', gap: '14px',
                            background: 'var(--bg-card)', padding: '18px 20px', borderRadius: '20px',
                            border: '1px solid var(--border)', boxShadow: 'var(--shadow-sm)'
                        }}>
                            {/* Search Input */}
                            <div style={{ position: 'relative' }}>
                                <Search size={18} style={{ position: 'absolute', left: '16px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                <input 
                                    type="text"
                                    placeholder="Search any topic, act, theory, river, scheme or rule within this knowledge stream..."
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

                            {/* Top-Level Exam Selection Pills */}
                            <div>
                                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.06em', marginBottom: '8px', textAlign: 'left' }}>
                                    Examination Projections for {activeStreamInfo.label}:
                                </div>
                                <div style={{ display: 'flex', flexWrap: 'wrap', alignItems: 'center', gap: '8px' }}>
                                    {visibleExamTabs.map((tab) => {
                                        const isActive = selectedExam === tab.id;

                                        return (
                                            <button
                                                key={tab.id}
                                                onClick={() => handleMainExamChange(tab.id)}
                                                style={{
                                                    padding: '8px 14px', borderRadius: '12px',
                                                    fontSize: '13px', fontWeight: 700,
                                                    cursor: 'pointer', transition: 'all 0.15s',
                                                    background: isActive ? 'var(--brand-orange)' : 'var(--bg-tertiary)',
                                                    color: isActive ? '#FFFFFF' : 'var(--text-secondary)',
                                                    border: isActive ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                                    boxShadow: isActive ? '0 2px 8px rgba(255, 107, 43, 0.3)' : 'none',
                                                    display: 'inline-flex', alignItems: 'center', gap: '6px'
                                                }}
                                            >
                                                <span>{tab.icon}</span>
                                                <span>{tab.label}</span>
                                            </button>
                                        );
                                    })}
                                </div>
                            </div>

                            {/* Granular Paper Sub-Filters */}
                            {selectedExam !== 'all' && EXAM_SUB_FILTERS[selectedExam]?.length > 0 && (
                                <div style={{ 
                                    display: 'flex', flexWrap: 'wrap', alignItems: 'center', gap: '6px',
                                    paddingTop: '12px', borderTop: '1px solid var(--border)'
                                }}>
                                    <span style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-muted)', marginRight: '4px', textTransform: 'uppercase' }}>PAPER / DOMAIN:</span>
                                    {EXAM_SUB_FILTERS[selectedExam].map((sub) => {
                                        const isSubActive = subFilter === sub.id;
                                        return (
                                            <button
                                                key={sub.id}
                                                onClick={() => setSubFilter(sub.id)}
                                                style={{
                                                    padding: '5px 12px', borderRadius: '8px',
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
                                                No syllabus nodes matching "{searchQuery}" found in this stream. Try searching another keyword or switch stream.
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
                                            const domains = getNodeChildren(subject.id, selectedStream).filter(d => checkNodeMatchesExam(d) || getNodeChildren(d.id, selectedStream).some(t => checkNodeMatchesExam(t)));

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
                                                    {/* Subject Pillar Header */}
                                                    <div 
                                                        onClick={() => toggleExpand(subject.id)}
                                                        style={{
                                                            padding: '18px 22px', display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                                                            cursor: 'pointer', background: isExpanded ? 'var(--bg-secondary)' : 'transparent',
                                                            borderBottom: isExpanded ? '1px solid var(--border)' : 'none'
                                                        }}
                                                    >
                                                        <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                                                            <span style={{ fontSize: '24px' }}>{icon}</span>
                                                            <div>
                                                                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                                    <span style={{ fontSize: '11px', fontWeight: 800, color: 'var(--brand-orange)', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                                                                        PILLAR {sIdx + 1}
                                                                    </span>
                                                                    {subject.examTags[selectedExam === 'all' ? (selectedStream === 'teaching' ? 'teaching' : 'upsc') : selectedExam] && (
                                                                        <span style={{ fontSize: '11px', fontWeight: 700, color: 'var(--brand-teal)', background: 'rgba(13, 148, 136, 0.1)', padding: '2px 6px', borderRadius: '4px' }}>
                                                                            {subject.examTags[selectedExam === 'all' ? (selectedStream === 'teaching' ? 'teaching' : 'upsc') : selectedExam]?.slice(0, 2).join(', ')}
                                                                        </span>
                                                                    )}
                                                                </div>
                                                                <h2 style={{ fontSize: '17px', fontWeight: 800, color: 'var(--text-primary)', margin: '2px 0 0' }}>
                                                                    {subject.name}
                                                                </h2>
                                                            </div>
                                                        </div>

                                                        <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                                                            <span style={{ fontSize: '12.5px', color: 'var(--text-muted)', fontWeight: 600 }}>
                                                                {domains.length} Core Domains
                                                            </span>
                                                            {isExpanded ? <ChevronDown size={20} color="var(--brand-orange)" /> : <ChevronRight size={20} color="var(--text-muted)" />}
                                                        </div>
                                                    </div>

                                                    {/* Expanded Domains and Topics Tree */}
                                                    {isExpanded && (
                                                        <div style={{ padding: '20px 22px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
                                                            {domains.map((domain) => {
                                                                const topics = getNodeChildren(domain.id, selectedStream).filter(t => checkNodeMatchesExam(t));
                                                                const isDomainExpanded = !!expandedNodes[domain.id];

                                                                return (
                                                                    <div 
                                                                        key={domain.id}
                                                                        style={{
                                                                            background: 'var(--bg-primary)', borderRadius: '12px',
                                                                            border: '1px solid var(--border)', overflow: 'hidden'
                                                                        }}
                                                                    >
                                                                        {/* Domain Header */}
                                                                        <div 
                                                                            onClick={() => toggleExpand(domain.id)}
                                                                            style={{
                                                                                padding: '12px 16px', display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                                                                                cursor: 'pointer', background: 'var(--bg-tertiary)'
                                                                            }}
                                                                        >
                                                                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                                                                                <Layers size={16} color="var(--brand-teal)" />
                                                                                <span style={{ fontSize: '14.5px', fontWeight: 700, color: 'var(--text-primary)' }}>
                                                                                    {domain.name}
                                                                                </span>
                                                                            </div>
                                                                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                                                <span style={{ fontSize: '11.5px', color: 'var(--text-muted)' }}>
                                                                                    {topics.length} topics
                                                                                </span>
                                                                                {isDomainExpanded ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
                                                                            </div>
                                                                        </div>

                                                                        {/* Topic List */}
                                                                        {isDomainExpanded && (
                                                                            <div style={{ padding: '12px', display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                                                                {topics.map((topic) => {
                                                                                    const isSelected = selectedNode?.id === topic.id;
                                                                                    return (
                                                                                        <div
                                                                                            key={topic.id}
                                                                                            onClick={() => setSelectedNode(topic)}
                                                                                            style={{
                                                                                                padding: '10px 14px', borderRadius: '8px', cursor: 'pointer',
                                                                                                background: isSelected ? 'rgba(255, 107, 43, 0.12)' : 'var(--bg-card)',
                                                                                                border: isSelected ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                                                                                display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                                                                                                transition: 'all 0.15s'
                                                                                            }}
                                                                                        >
                                                                                            <div>
                                                                                                <div style={{ fontSize: '13.5px', fontWeight: 700, color: 'var(--text-primary)' }}>
                                                                                                    {topic.name}
                                                                                                </div>
                                                                                                {topic.entities && topic.entities.length > 0 && (
                                                                                                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: '4px', marginTop: '6px' }}>
                                                                                                        {topic.entities.slice(0, 3).map((ent, eIdx) => (
                                                                                                            <span key={eIdx} style={{ fontSize: '11px', color: 'var(--text-muted)', background: 'var(--bg-tertiary)', padding: '2px 6px', borderRadius: '4px' }}>
                                                                                                                {ent}
                                                                                                            </span>
                                                                                                        ))}
                                                                                                        {topic.entities.length > 3 && (
                                                                                                            <span style={{ fontSize: '11px', color: 'var(--brand-teal)' }}>
                                                                                                                +{topic.entities.length - 3} more
                                                                                                            </span>
                                                                                                        )}
                                                                                                    </div>
                                                                                                )}
                                                                                            </div>
                                                                                            <ChevronRight size={15} color={isSelected ? 'var(--brand-orange)' : 'var(--text-muted)'} />
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
                                            );
                                        })}
                                    </div>
                                )}
                            </div>

                            {/* Right Column: Node Details & Syllabus Deep-Dive Panel */}
                            {selectedNode && (
                                <div className="card" style={{ padding: '24px', position: 'sticky', top: '80px', borderRadius: '18px' }}>
                                    <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '14px' }}>
                                        <span style={{ fontSize: '11.5px', fontWeight: 800, padding: '3px 8px', borderRadius: '6px', background: 'var(--brand-orange)', color: '#FFFFFF', textTransform: 'uppercase' }}>
                                            {selectedNode.levelName}
                                        </span>
                                        <button 
                                            onClick={() => setSelectedNode(null)} 
                                            style={{ background: 'none', border: 'none', color: 'var(--text-muted)', cursor: 'pointer', fontSize: '13px', fontWeight: 700 }}
                                        >
                                            ✕ Close
                                        </button>
                                    </div>

                                    <h3 style={{ fontSize: '18px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '8px', lineHeight: 1.4 }}>
                                        {selectedNode.name}
                                    </h3>

                                    {/* Ancestor Breadcrumbs */}
                                    <div style={{ display: 'flex', alignItems: 'center', flexWrap: 'wrap', gap: '6px', fontSize: '12px', color: 'var(--text-muted)', marginBottom: '16px' }}>
                                        {activeNodeAncestors.map((anc, aIdx) => (
                                            <span key={anc.id} style={{ display: 'inline-flex', alignItems: 'center', gap: '4px' }}>
                                                <span>{anc.name}</span>
                                                {aIdx < activeNodeAncestors.length - 1 && <span>➔</span>}
                                            </span>
                                        ))}
                                    </div>

                                    {/* Description */}
                                    {selectedNode.description && (
                                        <div style={{ background: 'var(--bg-secondary)', padding: '14px', borderRadius: '12px', marginBottom: '16px' }}>
                                            <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', marginBottom: '4px' }}>
                                                Syllabus Scope & Context:
                                            </div>
                                            <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.6, margin: 0 }}>
                                                {selectedNode.description}
                                            </p>
                                        </div>
                                    )}

                                    {/* Exam Projections Tags */}
                                    <div style={{ marginBottom: '16px' }}>
                                        <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', marginBottom: '8px' }}>
                                            Exam Syllabus Projections:
                                        </div>
                                        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px' }}>
                                            {Object.entries(selectedNode.examTags).map(([examKey, tags]) => {
                                                if (!tags || tags.length === 0) return null;
                                                return (
                                                    <span 
                                                        key={examKey}
                                                        style={{ 
                                                            fontSize: '11.5px', fontWeight: 700, padding: '3px 8px', borderRadius: '6px',
                                                            background: 'rgba(13, 148, 136, 0.1)', color: 'var(--brand-teal)',
                                                            border: '1px solid rgba(13, 148, 136, 0.25)' 
                                                        }}
                                                    >
                                                        {examKey.toUpperCase()}: {tags.join(', ')}
                                                    </span>
                                                );
                                            })}
                                        </div>
                                    </div>

                                    {/* Key Entities & Sub-Topics */}
                                    {selectedNode.entities && selectedNode.entities.length > 0 && (
                                        <div style={{ marginBottom: '20px' }}>
                                            <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', marginBottom: '8px' }}>
                                                Key Entities, Dates & Articles:
                                            </div>
                                            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px' }}>
                                                {selectedNode.entities.map((ent, idx) => (
                                                    <span key={idx} style={{ fontSize: '12px', color: 'var(--text-primary)', background: 'var(--bg-tertiary)', padding: '4px 8px', borderRadius: '6px', border: '1px solid var(--border)' }}>
                                                        {ent}
                                                    </span>
                                                ))}
                                            </div>
                                        </div>
                                    )}

                                    {/* Launch Practice Drill CTA */}
                                    <Link
                                        href={selectedStream === 'teaching' ? '/exams/kartet' : '/exams/upsc-cse'}
                                        style={{
                                            width: '100%', padding: '12px', borderRadius: '10px',
                                            background: 'var(--brand-orange)', color: '#FFFFFF',
                                            fontSize: '14px', fontWeight: 800, border: 'none',
                                            display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px',
                                            textDecoration: 'none', boxShadow: '0 4px 12px rgba(255, 107, 43, 0.3)'
                                        }}
                                    >
                                        <Zap size={16} />
                                        Practice PYQs On This Topic ➔
                                    </Link>
                                </div>
                            )}
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
}
