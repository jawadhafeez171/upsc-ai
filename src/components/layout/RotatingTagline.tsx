'use client';
import { useEffect, useState } from 'react';

export default function RotatingTagline({ fontSize = '9px' }: { fontSize?: string }) {
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
            }, 300);
        }, 4000);
        return () => clearInterval(timer);
    }, []);

    const isKannada = tagline.includes("ಸಿದ್ಧತೆ");

    return (
        <div style={{ 
            display: 'flex', 
            alignItems: 'center', 
            gap: '5px', 
            marginTop: '1.5px',
            fontWeight: 700, 
            color: '#4A5D75', 
            textTransform: 'uppercase', 
            letterSpacing: '0.7px',
            height: '14px',
            lineHeight: '14px',
        }}>
            <span style={{ display: 'inline-block', width: '8px', height: '1.5px', background: '#0D5D56', borderRadius: '1px', flexShrink: 0 }}></span>
            <span style={{ 
                transition: 'all 0.3s ease-in-out', 
                opacity: fade ? 1 : 0,
                display: 'inline-block',
                textAlign: 'center',
                fontSize: isKannada ? `calc(${fontSize} + 1.5px)` : fontSize,
            }}>
                {tagline}
            </span>
            <span style={{ display: 'inline-block', width: '8px', height: '1.5px', background: '#B83E11', borderRadius: '1px', flexShrink: 0 }}></span>
        </div>
    );
}
