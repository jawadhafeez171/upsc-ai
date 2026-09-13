'use client';

import React, { useState } from 'react';
import { BookOpen, Layers, ChevronDown, ChevronUp } from 'lucide-react';
import QuestionFormatter from '@/components/ui/QuestionFormatter';

interface PassageCardProps {
    passage?: string;
    passage_kn?: string;
    passage_hi?: string;
    group_label?: string;
    activeLang?: 'en' | 'kn' | 'hi';
    compact?: boolean;
}

export default function PassageCard({
    passage,
    passage_kn,
    passage_hi,
    group_label,
    activeLang = 'en',
    compact = false
}: PassageCardProps) {
    const [collapsed, setCollapsed] = useState(false);

    const text = (activeLang === 'kn' && passage_kn?.trim()) 
        ? passage_kn.trim() 
        : (activeLang === 'hi' && passage_hi?.trim()) 
            ? passage_hi.trim() 
            : (passage?.trim() || passage_kn?.trim() || '');

    if (!text) return null;

    const isKannada = activeLang === 'kn' && !!passage_kn;
    const title = isKannada ? 'ನಿರ್ದೇಶನಗಳು / ಸಂದರ್ಭ' : 'Directions / Context';
    const groupBadgeText = isKannada && group_label 
        ? group_label.replace('Linked Questions', 'ಸಂಬಂಧಿತ ಪ್ರಶ್ನೆಗಳು') 
        : group_label;

    return (
        <div
            style={{
                marginBottom: compact ? '14px' : '20px',
                borderRadius: '12px',
                border: '1px solid var(--border)',
                borderLeft: '4px solid var(--brand-orange)',
                background: 'var(--bg-secondary)',
                boxShadow: 'var(--shadow-sm)',
                overflow: 'hidden',
                transition: 'all 0.2s ease'
            }}
        >
            {/* Header */}
            <div
                onClick={() => setCollapsed(!collapsed)}
                style={{
                    padding: compact ? '8px 14px' : '10px 18px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    background: 'rgba(245, 158, 11, 0.06)',
                    borderBottom: collapsed ? 'none' : '1px solid var(--border)',
                    cursor: 'pointer',
                    userSelect: 'none'
                }}
            >
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    <BookOpen size={16} color="var(--brand-orange)" />
                    <span style={{ fontSize: '12px', fontWeight: 800, color: 'var(--text-primary)', letterSpacing: '0.02em', textTransform: 'uppercase' }}>
                        {title}
                    </span>
                    {groupBadgeText && (
                        <span
                            style={{
                                display: 'inline-flex',
                                alignItems: 'center',
                                gap: '4px',
                                fontSize: '11px',
                                fontWeight: 700,
                                padding: '2px 8px',
                                borderRadius: '6px',
                                background: 'rgba(37, 99, 235, 0.12)',
                                color: 'var(--brand-teal, #2563eb)',
                                border: '1px solid rgba(37, 99, 235, 0.2)'
                            }}
                        >
                            <Layers size={11} />
                            {groupBadgeText}
                        </span>
                    )}
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '4px', color: 'var(--text-muted)', fontSize: '11px' }}>
                    <span>{collapsed ? 'Show' : 'Hide'}</span>
                    {collapsed ? <ChevronDown size={14} /> : <ChevronUp size={14} />}
                </div>
            </div>

            {/* Passage Body */}
            {!collapsed && (
                <div
                    style={{
                        padding: compact ? '12px 14px' : '16px 20px',
                        fontSize: compact ? '13px' : '14px',
                        lineHeight: 1.65,
                        color: 'var(--text-secondary)'
                    }}
                >
                    <QuestionFormatter text={text} />
                </div>
            )}
        </div>
    );
}
