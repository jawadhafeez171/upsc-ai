'use client';
import { useState, useMemo } from 'react';
import Link from 'next/link';
import { 
    getExamMindMap, MindMapNode 
} from '@/lib/examMindMap';
import { EXAMS } from '@/lib/mockData';
import { 
    ChevronRight, ChevronDown, Sparkles, BookOpen, Layers, 
    Search, Zap, CheckCircle2, Award, Shield, FileText, 
    Maximize2, Minimize2, ZoomIn, ZoomOut, RotateCcw, Compass
} from 'lucide-react';

interface ExamMindMapVisualizerProps {
    initialExamId?: string;
    showExamPicker?: boolean;
}

export default function ExamMindMapVisualizer({ 
    initialExamId = 'upsc-cse', 
    showExamPicker = true 
}: ExamMindMapVisualizerProps) {
    const [selectedExamId, setSelectedExamId] = useState<string>(initialExamId);
    const [selectedNode, setSelectedNode] = useState<MindMapNode | null>(null);
    const [lang, setLang] = useState<'en' | 'kn'>('en');
    const [searchQuery, setSearchQuery] = useState('');
    const [expandedMap, setExpandedMap] = useState<Record<string, boolean>>({});

    const mindMapData = useMemo(() => {
        return getExamMindMap(selectedExamId);
    }, [selectedExamId]);

    // Initialize expanded state for root and direct children
    useMemo(() => {
        const initialExpanded: Record<string, boolean> = { [mindMapData.id]: true };
        if (mindMapData.children) {
            mindMapData.children.forEach(child => {
                initialExpanded[child.id] = true;
                if (child.children) {
                    child.children.slice(0, 2).forEach(grandChild => {
                        initialExpanded[grandChild.id] = true;
                    });
                }
            });
        }
        setExpandedMap(initialExpanded);
        setSelectedNode(mindMapData.children?.[0] || mindMapData);
    }, [mindMapData]);

    const toggleNode = (nodeId: string, e?: React.MouseEvent) => {
        if (e) e.stopPropagation();
        setExpandedMap(prev => ({
            ...prev,
            [nodeId]: !prev[nodeId]
        }));
    };

    const expandAll = () => {
        const all: Record<string, boolean> = {};
        const traverse = (node: MindMapNode) => {
            all[node.id] = true;
            if (node.children) node.children.forEach(traverse);
        };
        traverse(mindMapData);
        setExpandedMap(all);
    };

    const collapseAll = () => {
        setExpandedMap({ [mindMapData.id]: true });
    };

    // Recursive node renderer
    const renderNode = (node: MindMapNode, depth: number = 0) => {
        const hasChildren = node.children && node.children.length > 0;
        const isExpanded = !!expandedMap[node.id];
        const isSelected = selectedNode?.id === node.id;
        const label = lang === 'kn' && node.label_kn ? node.label_kn : node.label;

        // Search match highlight
        const isMatch = searchQuery.trim().length > 0 && (
            label.toLowerCase().includes(searchQuery.toLowerCase()) ||
            (node.entities && node.entities.some(e => e.toLowerCase().includes(searchQuery.toLowerCase())))
        );

        // Node Styling by category level
        let nodeBg = 'var(--bg-primary)';
        let borderColor = 'var(--border)';
        let nodeColor = 'var(--text-primary)';
        let fontSize = '13.5px';
        let fontWeight = 600;
        let padding = '8px 14px';

        if (node.category === 'exam') {
            nodeBg = 'linear-gradient(135deg, rgba(255, 107, 43, 0.15) 0%, rgba(37, 99, 235, 0.15) 100%)';
            borderColor = 'var(--brand-orange)';
            fontSize = '17px';
            fontWeight = 800;
            padding = '14px 20px';
        } else if (node.category === 'stage') {
            nodeBg = 'rgba(245, 158, 11, 0.08)';
            borderColor = 'rgba(245, 158, 11, 0.35)';
            fontSize = '15px';
            fontWeight = 700;
            padding = '10px 16px';
        } else if (node.category === 'paper') {
            nodeBg = 'var(--bg-secondary)';
            borderColor = node.color ? `${node.color}55` : 'var(--border)';
            fontSize = '14.5px';
            fontWeight = 700;
            padding = '10px 16px';
        } else if (node.category === 'domain') {
            nodeBg = 'var(--bg-card)';
            borderColor = isSelected ? 'var(--brand-orange)' : 'var(--border)';
            fontSize = '13.5px';
            fontWeight = 700;
        }

        if (isSelected) {
            borderColor = 'var(--brand-orange)';
            nodeBg = 'rgba(255, 107, 43, 0.12)';
        }

        if (isMatch) {
            borderColor = '#10B981';
            nodeBg = 'rgba(16, 185, 129, 0.15)';
        }

        return (
            <div key={node.id} style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                <div 
                    onClick={() => setSelectedNode(node)}
                    style={{
                        display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                        gap: '10px', background: nodeBg, border: `1.5px solid ${borderColor}`,
                        borderRadius: '12px', padding: padding, cursor: 'pointer',
                        transition: 'all 0.15s ease', boxShadow: isSelected ? '0 2px 10px rgba(255, 107, 43, 0.2)' : 'none'
                    }}
                >
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px', flex: 1, minWidth: 0 }}>
                        {hasChildren && (
                            <button
                                onClick={(e) => toggleNode(node.id, e)}
                                style={{
                                    background: 'none', border: 'none', cursor: 'pointer',
                                    display: 'flex', alignItems: 'center', padding: 0,
                                    color: isExpanded ? 'var(--brand-orange)' : 'var(--text-muted)'
                                }}
                            >
                                {isExpanded ? <ChevronDown size={17} /> : <ChevronRight size={17} />}
                            </button>
                        )}
                        
                        <span style={{ fontSize: fontSize, fontWeight: fontWeight, color: nodeColor, lineHeight: 1.3 }}>
                            {label}
                        </span>

                        {node.badge && (
                            <span style={{ 
                                fontSize: '11px', fontWeight: 800, padding: '2px 8px', borderRadius: '6px',
                                background: 'rgba(13, 148, 136, 0.12)', color: 'var(--brand-teal)',
                                border: '1px solid rgba(13, 148, 136, 0.25)', whiteSpace: 'nowrap'
                            }}>
                                {node.badge}
                            </span>
                        )}

                        {node.weightage && (
                            <span style={{ 
                                fontSize: '10.5px', fontWeight: 800, padding: '2px 6px', borderRadius: '4px',
                                background: node.weightage === 'Very High' ? 'rgba(239, 68, 68, 0.1)' : 'rgba(245, 158, 11, 0.1)',
                                color: node.weightage === 'Very High' ? '#EF4444' : '#F59E0B'
                            }}>
                                {node.weightage} Weightage
                            </span>
                        )}
                    </div>

                    {node.entities && node.entities.length > 0 && (
                        <span style={{ fontSize: '11px', color: 'var(--text-muted)', fontWeight: 600, background: 'var(--bg-tertiary)', padding: '2px 6px', borderRadius: '4px' }}>
                            {node.entities.length} items
                        </span>
                    )}
                </div>

                {/* Sub-branches with connector indentation */}
                {hasChildren && isExpanded && (
                    <div style={{
                        display: 'flex', flexDirection: 'column', gap: '8px',
                        paddingLeft: '24px', marginLeft: '12px',
                        borderLeft: '2px dashed rgba(255, 107, 43, 0.25)'
                    }}>
                        {node.children!.map(child => renderNode(child, depth + 1))}
                    </div>
                )}
            </div>
        );
    };

    return (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
            
            {/* Top Toolbar: Exam Selector, Language & Controls */}
            <div className="card" style={{ padding: '18px 22px', borderRadius: '18px' }}>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'wrap', gap: '14px' }}>
                    
                    {/* Exam Dropdown Picker if enabled */}
                    {showExamPicker && (
                        <div style={{ display: 'flex', alignItems: 'center', gap: '10px', flexWrap: 'wrap' }}>
                            <span style={{ fontSize: '12.5px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase' }}>
                                TARGET EXAM:
                            </span>
                            <select
                                value={selectedExamId}
                                onChange={(e) => setSelectedExamId(e.target.value)}
                                style={{
                                    padding: '8px 14px', borderRadius: '10px',
                                    background: 'var(--bg-primary)', color: 'var(--text-primary)',
                                    border: '1.5px solid var(--brand-orange)', fontSize: '13.5px', fontWeight: 700,
                                    outline: 'none', cursor: 'pointer'
                                }}
                            >
                                <optgroup label="Central / National Examinations">
                                    <option value="upsc-cse">🏛️ UPSC Civil Services (CSE)</option>
                                    <option value="upsc-capf">⚔️ UPSC Central Armed Police Forces (CAPF)</option>
                                    <option value="upsc-cds">⚔️ UPSC Combined Defence Services (CDS)</option>
                                </optgroup>
                                <optgroup label="Karnataka State Examinations">
                                    <option value="kpsc-kas">🅺 KPSC Karnataka Administrative Service (KAS)</option>
                                    <option value="kea-pdo">🌾 KEA Panchayat Development Officer (PDO)</option>
                                    <option value="kea-vao">📜 KEA Village Administrative Officer (VAO)</option>
                                    <option value="ksp-psi">👮 KSP Police Sub-Inspector (PSI)</option>
                                    <option value="ksp-pc">👮 KSP Police Constable (PC)</option>
                                    <option value="kpsc-group-c">📋 KPSC Group C (CTI / ESI / FDA / SDA)</option>
                                    <option value="kartet">👩‍🏫 KARTET (Karnataka Teachers Eligibility)</option>
                                    <option value="karnataka-gpstr">👩‍🏫 Karnataka GPSTR Graduate Teacher</option>
                                    <option value="kea-kset">🎓 KEA Assistant Professor & KSET</option>
                                </optgroup>
                            </select>
                        </div>
                    )}

                    {/* Search & Actions */}
                    <div style={{ display: 'flex', alignItems: 'center', gap: '10px', flexWrap: 'wrap' }}>
                        
                        {/* Search Input */}
                        <div style={{ position: 'relative' }}>
                            <Search size={14} style={{ position: 'absolute', left: '10px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                            <input 
                                type="text"
                                placeholder="Search in mind map..."
                                value={searchQuery}
                                onChange={(e) => setSearchQuery(e.target.value)}
                                style={{
                                    padding: '6px 12px 6px 30px', borderRadius: '8px',
                                    background: 'var(--bg-primary)', color: 'var(--text-primary)',
                                    border: '1px solid var(--border)', fontSize: '12.5px', outline: 'none', width: '180px'
                                }}
                            />
                        </div>

                        {/* Expand / Collapse All */}
                        <div style={{ display: 'flex', gap: '4px' }}>
                            <button
                                onClick={expandAll}
                                title="Expand All Branches"
                                style={{
                                    padding: '6px 10px', borderRadius: '8px', border: '1px solid var(--border)',
                                    background: 'var(--bg-tertiary)', color: 'var(--text-secondary)',
                                    fontSize: '12px', fontWeight: 600, cursor: 'pointer'
                                }}
                            >
                                Expand All
                            </button>
                            <button
                                onClick={collapseAll}
                                title="Collapse All Branches"
                                style={{
                                    padding: '6px 10px', borderRadius: '8px', border: '1px solid var(--border)',
                                    background: 'var(--bg-tertiary)', color: 'var(--text-secondary)',
                                    fontSize: '12px', fontWeight: 600, cursor: 'pointer'
                                }}
                            >
                                Collapse
                            </button>
                        </div>

                        {/* Bilingual Switcher */}
                        <div style={{ display: 'flex', gap: '2px', background: 'var(--bg-tertiary)', padding: '2px', borderRadius: '8px', border: '1px solid var(--border)' }}>
                            <button
                                onClick={() => setLang('en')}
                                style={{
                                    padding: '4px 10px', borderRadius: '6px', border: 'none',
                                    background: lang === 'en' ? 'var(--brand-orange)' : 'transparent',
                                    color: lang === 'en' ? '#FFFFFF' : 'var(--text-secondary)',
                                    fontSize: '11.5px', fontWeight: 700, cursor: 'pointer'
                                }}
                            >
                                EN
                            </button>
                            <button
                                onClick={() => setLang('kn')}
                                style={{
                                    padding: '4px 10px', borderRadius: '6px', border: 'none',
                                    background: lang === 'kn' ? 'var(--brand-orange)' : 'transparent',
                                    color: lang === 'kn' ? '#FFFFFF' : 'var(--text-secondary)',
                                    fontSize: '11.5px', fontWeight: 700, cursor: 'pointer'
                                }}
                            >
                                ಕನ್ನಡ
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            {/* Mind Map Canvas and Detail Sidebar Layout */}
            <div style={{ display: 'grid', gridTemplateColumns: selectedNode ? '1fr 380px' : '1fr', gap: '20px', alignItems: 'start' }}>
                
                {/* Main Mind Map Tree Canvas */}
                <div className="card" style={{ padding: '24px', borderRadius: '18px', overflowX: 'auto' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '20px' }}>
                        <Compass size={18} color="var(--brand-orange)" />
                        <span style={{ fontSize: '13px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                            Interactive Syllabus Tree · Click any branch to inspect
                        </span>
                    </div>

                    {renderNode(mindMapData)}
                </div>

                {/* Right Column: Selected Topic Deep-Dive Sheet */}
                {selectedNode && (
                    <div className="card" style={{ padding: '24px', borderRadius: '18px', position: 'sticky', top: '80px' }}>
                        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '12px' }}>
                            <span style={{ 
                                fontSize: '11px', fontWeight: 800, padding: '3px 8px', borderRadius: '6px',
                                background: 'var(--brand-orange)', color: '#FFFFFF', textTransform: 'uppercase'
                            }}>
                                {selectedNode.category}
                            </span>
                            <button 
                                onClick={() => setSelectedNode(null)}
                                style={{ background: 'none', border: 'none', color: 'var(--text-muted)', cursor: 'pointer', fontSize: '12px', fontWeight: 700 }}
                            >
                                ✕ Close
                            </button>
                        </div>

                        <h3 style={{ fontSize: '17px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '4px', lineHeight: 1.4 }}>
                            {lang === 'kn' && selectedNode.label_kn ? selectedNode.label_kn : selectedNode.label}
                        </h3>

                        {selectedNode.weightage && (
                            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--brand-orange)', marginBottom: '12px' }}>
                                ⭐ Exam Importance: {selectedNode.weightage} Weightage
                            </div>
                        )}

                        {selectedNode.description && (
                            <div style={{ background: 'var(--bg-secondary)', padding: '14px', borderRadius: '12px', marginBottom: '16px' }}>
                                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', marginBottom: '4px' }}>
                                    Syllabus Scope:
                                </div>
                                <p style={{ fontSize: '13px', color: 'var(--text-secondary)', lineHeight: 1.6, margin: 0 }}>
                                    {selectedNode.description}
                                </p>
                            </div>
                        )}

                        {/* High-Yield Entities & Topics List */}
                        {selectedNode.entities && selectedNode.entities.length > 0 && (
                            <div style={{ marginBottom: '20px' }}>
                                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', marginBottom: '8px' }}>
                                    High-Yield Exam Focus & Entities ({selectedNode.entities.length}):
                                </div>
                                <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px' }}>
                                    {selectedNode.entities.map((ent, idx) => (
                                        <span 
                                            key={idx}
                                            style={{
                                                fontSize: '12px', color: 'var(--text-primary)',
                                                background: 'var(--bg-tertiary)', padding: '4px 8px', borderRadius: '6px',
                                                border: '1px solid var(--border)'
                                            }}
                                        >
                                            • {ent}
                                        </span>
                                    ))}
                                </div>
                            </div>
                        )}

                        {/* Direct Practice Launch CTA */}
                        <Link
                            href={`/exams/${selectedExamId}`}
                            style={{
                                width: '100%', padding: '12px', borderRadius: '12px',
                                background: 'var(--brand-orange)', color: '#FFFFFF',
                                fontSize: '14px', fontWeight: 800, border: 'none',
                                display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px',
                                textDecoration: 'none', boxShadow: '0 4px 12px rgba(255, 107, 43, 0.3)'
                            }}
                        >
                            <Zap size={16} />
                            Launch Practice Mock for {selectedExamId.toUpperCase()} ➔
                        </Link>
                    </div>
                )}
            </div>
        </div>
    );
}
