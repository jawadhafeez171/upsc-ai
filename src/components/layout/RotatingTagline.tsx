'use client';
import { useAppStore } from '@/lib/store';

/**
 * Brand tagline under the logo. Shown in the reader's interface language
 * (Kannada for Kannada readers, English otherwise) rather than rotating scripts.
 */
export default function RotatingTagline({ fontSize = '11px' }: { fontSize?: string }) {
    const { language } = useAppStore();
    const tagline = language === 'kn' ? 'ಸಿದ್ಧತೆ. ಅಭ್ಯಾಸ. ವಿಜಯ.' : 'Prepare. Practise. Prevail.';

    return (
        <div
            lang={language === 'kn' ? 'kn' : 'en'}
            style={{
                marginTop: '2px',
                fontSize,
                fontWeight: 700,
                color: 'var(--text-muted)',
                letterSpacing: language === 'kn' ? 0 : '0.06em',
                textTransform: language === 'kn' ? 'none' : 'uppercase',
                lineHeight: '16px',
                whiteSpace: 'nowrap',
                userSelect: 'none',
            }}
        >
            {tagline}
        </div>
    );
}
