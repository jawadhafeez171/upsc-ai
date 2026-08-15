'use client';
import { useEffect, useState } from 'react';

export default function RotatingTagline({ fontSize = '8.5px' }: { fontSize?: string }) {
    const [tagline, setTagline] = useState("PREPARE. PRACTICE. PREVAIL.");
    const [fade, setFade] = useState(true);

    useEffect(() => {
        const timer = setInterval(() => {
            setFade(false);
            setTimeout(() => {
                setTagline(prev => 
                    prev === "PREPARE. PRACTICE. PREVAIL." 
                        ? "ಸಿದ್ಧತೆ. ಅಭ್ಯಾಸ. ವಿಜಯ." 
                        : "PREPARE. PRACTICE. PREVAIL."
                );
                setFade(true);
            }, 250);
        }, 4000);
        return () => clearInterval(timer);
    }, []);

    return (
        <div style={{ 
            display: 'flex', 
            alignItems: 'center', 
            justifyContent: 'flex-start',
            gap: '4px', 
            marginTop: '2px',
            fontWeight: 700, 
            color: '#64748B', 
            textTransform: 'uppercase', 
            letterSpacing: '0.6px',
            height: '14px',
            width: '175px',
            minWidth: '175px',
            maxWidth: '175px',
            flexShrink: 0,
            overflow: 'hidden',
            whiteSpace: 'nowrap',
            lineHeight: '14px',
            userSelect: 'none',
        }}>
            <span style={{ display: 'inline-block', width: '6px', height: '1.5px', background: '#0D9488', borderRadius: '1px', flexShrink: 0 }} />
            <div style={{ 
                width: '150px',
                minWidth: '150px',
                maxWidth: '150px',
                textAlign: 'left',
                overflow: 'hidden',
                textOverflow: 'ellipsis',
                display: 'flex',
                alignItems: 'center',
                flexShrink: 0,
            }}>
                <span style={{ 
                    transition: 'opacity 0.25s ease-in-out', 
                    opacity: fade ? 1 : 0,
                    fontSize: fontSize,
                    display: 'inline-block',
                    width: '100%',
                    whiteSpace: 'nowrap',
                    letterSpacing: '0.5px'
                }}>
                    {tagline}
                </span>
            </div>
            <span style={{ display: 'inline-block', width: '6px', height: '1.5px', background: '#FF6B2B', borderRadius: '1px', flexShrink: 0 }} />
        </div>
    );
}
