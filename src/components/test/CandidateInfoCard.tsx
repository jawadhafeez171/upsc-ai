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
        : 'IQ';

    return (
        <div className="cbt-box" style={{ padding: '12px 14px', marginBottom: '14px', display: 'flex', alignItems: 'center', gap: '12px' }}>
            {/* Initials Avatar Badge */}
            <div style={{
                width: '42px',
                height: '42px',
                background: '#111827',
                color: '#FFFFFF',
                borderRadius: '4px',
                border: '1.5px solid #111827',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontSize: '15px',
                fontWeight: 900,
                letterSpacing: '0.05em',
                flexShrink: 0
            }}>
                {initials}
            </div>

            {/* Candidate Details */}
            <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '6px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 800, color: '#111827', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                        {name || 'Aspirant Candidate'}
                    </div>
                    <span style={{
                        background: '#DCFCE7',
                        color: '#15803D',
                        border: '1px solid #86EFAC',
                        fontSize: '9.5px',
                        fontWeight: 900,
                        padding: '1px 5px',
                        borderRadius: '3px',
                        letterSpacing: '0.04em'
                    }}>
                        LIVE
                    </span>
                </div>

                <div style={{ fontSize: '10.5px', color: '#6B7280', fontFamily: 'var(--cbt-font-mono)', marginTop: '1px' }}>
                    ID: {candidateId}
                </div>

                <div style={{ fontSize: '10.5px', fontWeight: 700, color: '#B45309', display: 'flex', alignItems: 'center', gap: '4px', marginTop: '2px' }}>
                    <span style={{ width: '6px', height: '6px', background: '#D97706', display: 'inline-block' }} />
                    <span style={{ textTransform: 'uppercase' }}>TARGET: {targetExam}</span>
                </div>
            </div>
        </div>
    );
}
