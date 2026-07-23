import React from 'react';

interface QuestionFormatterProps {
    text: string;
}

// Utility to parse bolding (**text**) and clean math/LaTeX arrow characters
const parseTextWithFormatting = (lineText: string): React.ReactNode => {
    if (!lineText) return '';

    // Replace arrow variations first
    let processed = lineText
        .replace(/\$( )?\\rightarrow\$/g, ' → ')
        .replace(/\$( )?ightarrow\$/g, ' → ')
        .replace(/\$( )?\\Rightarrow\$/g, ' → ')
        .replace(/\$( )?ightarrow\$/g, ' → ')
        .replace(/\\rightarrow/g, ' → ')
        .replace(/\\Rightarrow/g, ' → ')
        .replace(/\$\s*ightarrow\$/g, ' → ')
        .replace(/\$\s*rightarrow\$/g, ' → ')
        .replace(/\$ ightarrow\$/g, ' → ')
        .replace(/\$rightarrow\$/g, ' → ');

    // Split by double asterisks for bolding
    const parts = processed.split('**');
    return (
        <>
            {parts.map((part, index) => {
                if (index % 2 === 1) {
                    return <strong key={index} style={{ fontWeight: 700, color: 'var(--text-primary)' }}>{part}</strong>;
                }
                return <span key={index}>{part}</span>;
            })}
        </>
    );
};

export default function QuestionFormatter({ text }: QuestionFormatterProps) {
    if (!text) return null;

    // Split text by lines
    const lines = text.split('\n');
    const elements: React.ReactNode[] = [];
    let currentTableRows: string[][] = [];

    const flushTable = (key: string) => {
        if (currentTableRows.length === 0) return;
        
        // Determine column count from the first row
        const colCount = currentTableRows[0].length;

        // Check if the first cell of the first row starts with a list marker (e.g. I., A., 1., etc.)
        const firstCell = currentTableRows[0][0].trim();
        const isListMarker = /^(I+|[A-Z0-9a-z])\.\s/.test(firstCell);
        const hasHeader = !isListMarker;

        const headerRow = hasHeader ? currentTableRows[0] : null;
        const bodyRows = hasHeader ? currentTableRows.slice(1) : currentTableRows;

        elements.push(
            <div 
                key={`table-${key}`} 
                style={{ 
                    overflowX: 'auto', 
                    margin: '18px 0', 
                    borderRadius: '10px', 
                    border: '1px solid var(--border)',
                    boxShadow: 'var(--shadow-sm)',
                    background: 'var(--bg-card)'
                }}
            >
                <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '13.5px', border: 'none' }}>
                    {headerRow && (
                        <thead>
                            <tr style={{ borderBottom: '1px solid var(--border)', background: 'var(--bg-secondary)' }}>
                                {headerRow.map((cell, cellIdx) => (
                                    <th 
                                        key={`th-${cellIdx}`} 
                                        style={{ 
                                            padding: '12px 16px', 
                                            textAlign: 'left', 
                                            fontWeight: 700, 
                                            color: 'var(--text-primary)',
                                            borderRight: cellIdx < colCount - 1 ? '1px solid var(--border)' : 'none'
                                        }}
                                    >
                                        {parseTextWithFormatting(cell)}
                                    </th>
                                ))}
                            </tr>
                        </thead>
                    )}
                    <tbody>
                        {bodyRows.map((row, rowIdx) => (
                            <tr 
                                key={`tr-${rowIdx}`} 
                                style={{ 
                                    borderBottom: rowIdx === bodyRows.length - 1 ? 'none' : '1px solid var(--border)',
                                    background: rowIdx % 2 === 1 ? 'rgba(0, 0, 0, 0.015)' : 'transparent',
                                    transition: 'background-color 0.15s'
                                }}
                            >
                                {row.map((cell, cellIdx) => (
                                    <td 
                                        key={`td-${cellIdx}`} 
                                        style={{ 
                                            padding: '12px 16px', 
                                            color: 'var(--text-secondary)',
                                            lineHeight: 1.5,
                                            borderRight: cellIdx < colCount - 1 ? '1px solid var(--border)' : 'none'
                                        }}
                                    >
                                        {parseTextWithFormatting(cell)}
                                    </td>
                                ))}
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        );
        currentTableRows = [];
    };

    lines.forEach((line, idx) => {
        if (line.includes('|')) {
            const cells = line.split('|').map(c => c.trim());
            currentTableRows.push(cells);
        } else {
            if (currentTableRows.length > 0) {
                flushTable(`${idx}`);
            }
            const trimmed = line.trim();
            if (trimmed !== '') {
                const isBullet = /^[•*-]\s/.test(trimmed);
                const isListItem = /^[A-Z0-9a-z]\.\s/.test(trimmed) || isBullet || /^\d+\.\s/.test(trimmed);
                
                let contentText = line;
                if (isBullet) {
                    contentText = line.replace(/^\s*[•*-]\s/, '');
                }

                elements.push(
                    <p 
                        key={`line-${idx}`} 
                        style={{ 
                            margin: '0 0 10px 0',
                            paddingLeft: isListItem ? '22px' : '0',
                            textIndent: isListItem ? '-22px' : '0',
                            lineHeight: 1.6,
                            color: 'var(--text-primary)',
                            fontSize: '15px'
                        }}
                    >
                        {isBullet ? <span style={{ marginRight: '8px', color: 'var(--brand-orange)', fontWeight: 'bold' }}>•</span> : null}
                        {parseTextWithFormatting(contentText)}
                    </p>
                );
            } else {
                elements.push(<div key={`space-${idx}`} style={{ height: '8px' }} />);
            }
        }
    });

    if (currentTableRows.length > 0) {
        flushTable('final');
    }

    return <div style={{ display: 'flex', flexDirection: 'column' }}>{elements}</div>;
}
