import React from 'react';
import katex from 'katex';

interface QuestionFormatterProps {
    text: string;
}

// Helper to check if a string slice contains LaTeX math tokens
const isMathExpression = (str: string): boolean => {
    return /\^|_|\\frac|\\sqrt|\\cdot|\\times|\\min|\\max|\\pm|\\le|\\ge|\\approx|\\neq|\\propto|\\sum|\\int|\\partial|\\alpha|\\beta|\\theta|\\pi|\\in|\\subset|\\cup|\\cap|\\neg|\\rightarrow|\\Rightarrow|[0-9]+(\^|\/)[0-9]+/i.test(str);
};

// Render math or LaTeX safely using KaTeX
const renderKaTeXHtml = (expr: string, displayMode: boolean = false): string => {
    try {
        // Clean up common quirks
        let cleanExpr = expr.trim();
        // Remove outer quotes if wrapped
        cleanExpr = cleanExpr.replace(/^["']|["']$/g, '');
        // Replace \text{...} if it has unescaped characters
        cleanExpr = cleanExpr.replace(/\\text\{([^}]+)\}/g, '\\mathrm{$1}');
        
        return katex.renderToString(cleanExpr, {
            throwOnError: false,
            displayMode: displayMode,
            output: 'htmlAndMathml'
        });
    } catch {
        return expr;
    }
};

// Utility to parse bolding (**text**), LaTeX ($math$), and clean arrow characters
const parseTextWithFormatting = (lineText: string): React.ReactNode => {
    if (!lineText) return '';

    // Normalize arrow representations
    let text = lineText
        .replace(/\\rightarrow/g, ' → ')
        .replace(/\\Rightarrow/g, ' ⇒ ')
        .replace(/\$\s*\\rightarrow\s*\$/g, ' → ')
        .replace(/\$\s*\\Rightarrow\s*\$/g, ' ⇒ ')
        .replace(/\$\s*ightarrow\s*\$/g, ' → ')
        .replace(/\$ ightarrow\$/g, ' → ')
        .replace(/\$ightarrow\$/g, ' → ')
        .replace(/ightarrow/g, ' → ');

    // Normalize spacing around currency symbols (e.g. '$ 346 million' -> '$346 million')
    text = text.replace(/\$\s+(\d+[\d,]*(?:\.\d+)?(?:\s*(?:million|billion|trillion|lakh|crore))?)\b/gi, '$$$1');

    // Split text into tokens by LaTeX delimiters: $$display$$, $inline$, or **bold**
    // Regex matches:
    // 1. $$...$$ (display math)
    // 2. $...$ (inline math, excluding single currency like $300,000)
    // 3. **...** (bold text)
    const tokenRegex = /(\$\$[\s\S]+?\$\$|\$(?!\s*[\d,]+(?:\s*(?:million|billion|trillion|lakh|crore))?\s*(?:[.,!?\s]|$))[^$\n]+?\$|\*\*[^*]+?\*\*)/g;

    const parts = text.split(tokenRegex);

    return (
        <>
            {parts.map((part, index) => {
                if (!part) return null;

                // Display math $$...$$
                if (part.startsWith('$$') && part.endsWith('$$') && part.length > 4) {
                    const mathContent = part.slice(2, -2);
                    const html = renderKaTeXHtml(mathContent, true);
                    return (
                        <span
                            key={index}
                            className="math-display-wrapper"
                            style={{ display: 'block', margin: '8px 0', overflowX: 'auto' }}
                            dangerouslySetInnerHTML={{ __html: html }}
                        />
                    );
                }

                // Inline math $...$
                if (part.startsWith('$') && part.endsWith('$') && part.length > 2) {
                    const mathContent = part.slice(1, -1);
                    const html = renderKaTeXHtml(mathContent, false);
                    return (
                        <span
                            key={index}
                            className="math-inline-wrapper"
                            style={{ display: 'inline-block', verticalAlign: 'middle', margin: '0 2px' }}
                            dangerouslySetInnerHTML={{ __html: html }}
                        />
                    );
                }

                // Bold text **...**
                if (part.startsWith('**') && part.endsWith('**') && part.length > 4) {
                    const boldContent = part.slice(2, -2);
                    return (
                        <strong key={index} style={{ fontWeight: 700, color: 'var(--text-primary)' }}>
                            {parseTextWithFormatting(boldContent)}
                        </strong>
                    );
                }

                // Plain text segment: check if it contains standalone math operators or sub/superscripts
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
    
    if (hasList1 && hasList2 && !text.includes('|')) {
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
            
            const isL1 = /^(List\s*-?\s*I\b|ಪಟ್ಟಿ\s*-?\s*I\b)/i.test(trimmed);
            const isL2 = /^(List\s*-?\s*II\b|ಪಟ್ಟಿ\s*-?\s*II\b)/i.test(trimmed);
            
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
    const lines = processedText.split('\n');
    const elements: React.ReactNode[] = [];
    let currentTableRows: string[][] = [];

    const flushTable = (key: string) => {
        if (currentTableRows.length === 0) return;
        
        const colCount = currentTableRows[0].length;
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
            // Filter out separator lines like "--- | ---"
            if (cells.some(c => /^---+$/.test(c))) {
                return;
            }
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
                const isListItem = /^[A-D]\.\s/.test(trimmed) || 
                                   /^[0-9]+\.\s/.test(trimmed) || 
                                   /^(IX|IV|V?I{1,3})\.\s/i.test(trimmed) ||
                                   /^(Assertion\s*\(A\)|Reason\s*\(R\)|Statement\s*[-I|V|X0-9]+):/i.test(trimmed);
                
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

export function OptionFormatter({ text }: { text: string }) {
    if (!text) return null;
    
    // Check if text has semicolons grouping numbers or sets (e.g. "3, 4, 9; 5, 7, 8; 1, 2, 6")
    if (text.includes(';')) {
        const parts = text.split(';');
        return (
            <span style={{ display: 'inline-flex', flexWrap: 'wrap', alignItems: 'center', gap: '8px', fontSize: '15px' }}>
                {parts.map((part, idx) => (
                    <span key={idx} style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
                        <span style={{
                            fontWeight: 700,
                            letterSpacing: '0.03em',
                            color: 'var(--text-primary)',
                            padding: '3px 10px',
                            borderRadius: '8px',
                            background: 'var(--bg-tertiary)',
                            border: '1px solid var(--border)',
                            fontSize: '14.5px'
                        }}>
                            {parseTextWithFormatting(part.trim())}
                        </span>
                        {idx < parts.length - 1 && (
                            <span style={{
                                color: 'var(--brand-orange)',
                                fontWeight: 800,
                                fontSize: '14px',
                                margin: '0 2px'
                            }}>•</span>
                        )}
                    </span>
                ))}
            </span>
        );
    }

    return (
        <span style={{ fontSize: '15.5px', fontWeight: 600, color: 'var(--text-primary)', lineHeight: 1.6 }}>
            {parseTextWithFormatting(text)}
        </span>
    );
}

