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

function preProcessQuestionText(text: string): string {
    if (!text) return '';
    
    // Check if List I and List II are present in the text
    const hasList1 = /(List\s*-?\s*I\b|ಪಟ್ಟಿ\s*-?\s*I\b)/i.test(text);
    const hasList2 = /(List\s*-?\s*II\b|ಪಟ್ಟಿ\s*-?\s*II\b)/i.test(text);
    
    if (hasList1 && hasList2) {
        const lines = text.split('\n');
        let list1Items: string[] = [];
        let list2Items: string[] = [];
        let list1Header = 'List I';
        let list2Header = 'List II';
        let otherLinesBefore: string[] = [];
        let otherLinesAfter: string[] = [];
        let state: 'before' | 'list1' | 'list2' | 'after' = 'before';
        
        for (let line of lines) {
            const trimmed = line.trim();
            if (trimmed === '') {
                if (state === 'before') {
                    otherLinesBefore.push(line);
                } else if (state === 'after') {
                    otherLinesAfter.push(line);
                }
                continue;
            }
            
            const isL1 = /^(List\s*-?\s*I\b|ಪಟ್ಟಿ\s*-?\s*I\b)/i.test(trimmed) && !trimmed.includes('|');
            const isL2 = /^(List\s*-?\s*II\b|ಪಟ್ಟಿ\s*-?\s*II\b)/i.test(trimmed) && !trimmed.includes('|');
            
            if (isL1) {
                state = 'list1';
                const match = trimmed.match(/^(List\s*-?\s*I\b|ಪಟ್ಟಿ\s*-?\s*I\b)/i);
                if (match) list1Header = match[1];
                
                const rest = trimmed.replace(/^(List\s*-?\s*I\b|ಪಟ್ಟಿ\s*-?\s*I\b):?\s*/i, '');
                list1Items = rest.split(/,\s*(?=[A-Z]\.\s|[A-Z]\s)/i).map(x => x.trim()).filter(Boolean);
            } else if (isL2) {
                state = 'list2';
                const match = trimmed.match(/^(List\s*-?\s*II\b|ಪಟ್ಟಿ\s*-?\s*II\b)/i);
                if (match) list2Header = match[1];
                
                const rest = trimmed.replace(/^(List\s*-?\s*II\b|ಪಟ್ಟಿ\s*-?\s*II\b):?\s*/i, '');
                list2Items = rest.split(/,\s*(?=[I|V|X]+\.\s|[I|V|X]+\s)/i).map(x => x.trim()).filter(Boolean);
            } else {
                if (state === 'before') {
                    otherLinesBefore.push(line);
                } else {
                    state = 'after';
                    otherLinesAfter.push(line);
                }
            }
        }
        
        if (list1Items.length > 0 || list2Items.length > 0) {
            const maxLen = Math.max(list1Items.length, list2Items.length);
            const tableLines: string[] = [];
            tableLines.push(`${list1Header} | ${list2Header}`);
            tableLines.push(`--- | ---`);
            for (let i = 0; i < maxLen; i++) {
                const item1 = list1Items[i] || '';
                const item2 = list2Items[i] || '';
                tableLines.push(`${item1} | ${item2}`);
            }
            
            return [
                ...otherLinesBefore,
                '',
                ...tableLines,
                '',
                ...otherLinesAfter
            ].join('\n');
        }
    }
    
    return text;
}

export default function QuestionFormatter({ text }: QuestionFormatterProps) {
    if (!text) return null;

    const processedText = preProcessQuestionText(text);
    // Split text by lines
    const lines = processedText.split('\n');
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
                const trimmed = line.trim();
                const isListMarker = /^[A-Z0-9a-z]\.\s/.test(trimmed) || 
                                     /^[•*-]\s/.test(trimmed) || 
                                     /^\d+\.\s/.test(trimmed) || 
                                     /^(IX|IV|V?I{1,3})\.\s/i.test(trimmed);
                                     
                if (currentTableRows[0].length === 2 && isListMarker && trimmed.includes(':')) {
                    const colonIdx = trimmed.indexOf(':');
                    const col1 = trimmed.substring(0, colonIdx).trim();
                    const col2 = trimmed.substring(colonIdx + 1).trim();
                    currentTableRows.push([col1, col2]);
                    return;
                }
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
