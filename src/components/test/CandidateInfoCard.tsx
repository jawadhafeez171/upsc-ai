'use client';
import React from 'react';

interface CandidateInfoCardProps {
    name: string;
    candidateId: string;
    targetExam: string;
}

export default function CandidateInfoCard({
    name,
    candidateId,
    targetExam
}: CandidateInfoCardProps) {
    const initials = name
        ? name.split(' ').map((p) => p[0]).join('').slice(0, 2).toUpperCase()
        : 'UA';

    return (
        <div className="cbt-box" style={{ padding: '12px 14px', marginBottom: '14px', display: 'flex', alignItems: 'center', gap: '12px' }}>
            {/* Initials Avatar Badge */}
            <div style={{
                width: '40px',
                height: '40px',
                background: '#1E1B4B',
                color: '#FFFFFF',
                borderRadius: '8px',
                border: '1.5px solid #312E81',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontSize: '14px',
                fontWeight: 900,
                letterSpacing: '0.05em',
                flexShrink: 0
            }}>
                {initials}
            </div>

            {/* Candidate Details */}
            <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '6px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 800, color: 'var(--text-primary, #0F172A)', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                        {name || 'Aspirant Candidate'}
                    </div>
                </div>

                <div style={{ fontSize: '10.5px', color: 'var(--text-muted, #64748B)', fontFamily: 'var(--cbt-font-mono)', marginTop: '2px' }}>
                    ID: {candidateId}
                </div>

                <div style={{ fontSize: '10.5px', fontWeight: 700, color: '#B45309', display: 'flex', alignItems: 'center', gap: '4px', marginTop: '2px' }}>
                    <span style={{ width: '6px', height: '6px', borderRadius: '50%', background: '#D97706', display: 'inline-block' }} />
                    <span style={{ textTransform: 'uppercase' }}>TARGET: {targetExam}</span>
                </div>
            </div>
        </div>
    );
}
