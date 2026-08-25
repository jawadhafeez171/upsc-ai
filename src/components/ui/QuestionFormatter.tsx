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
        let cleanExpr = expr.trim();
        cleanExpr = cleanExpr.replace(/^["']|["']$/g, '');
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

// Utility to clean replacement characters, garbled unicode, and parse bolding & LaTeX
export const parseTextWithFormatting = (lineText: string): React.ReactNode => {
    if (!lineText) return '';

    // 1. Sanitize diamond question marks (\ufffd / \uFFFD) and garbled characters
    let text = lineText
        .replace(/[\ufffd\uFFFD]/g, ' · ')
        .replace(/\\rightarrow/g, ' → ')
        .replace(/\\Rightarrow/g, ' ⇒ ')
        .replace(/\$\s*\\rightarrow\s*\$/g, ' → ')
        .replace(/\$\s*\\Rightarrow\s*\$/g, ' ⇒ ')
        .replace(/\$\s*ightarrow\s*\$/g, ' → ')
        .replace(/\$ ightarrow\$/g, ' → ')
        .replace(/\$ightarrow\$/g, ' → ')
        .replace(/ightarrow/g, ' → ');

    // Normalize spacing around currency symbols (e.g. $ 25 billion -> $25 billion)
    text = text.replace(/\$\s+(\d+[\d,]*(?:\.\d+)?(?:\s*(?:million|billion|trillion|lakh|crore))?)\b/gi, '$$$1');

    // Split text into tokens by LaTeX delimiters: $$display$$, $inline$, or **bold**
    // Match $$...$$, $...$, or **...**
    const tokenRegex = /(\$\$[\s\S]+?\$\$|\$[^$\n]+?\$|\*\*[^*]+?\*\*)/g;

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
                if (part.startsWith('$') && part.endsWith('$') && part.length >= 2) {
                    const mathContent = part.slice(1, -1).trim();
                    // Check if it's purely a currency token without math operators, e.g. $25 billion or $100
                    const isCurrencyOnly = /^\d+(?:,\d+)*(?:\.\d+)?(?:\s*(?:million|billion|trillion|lakh|crore|thousand|USD))?$/i.test(mathContent);
                    if (isCurrencyOnly) {
                        return <span key={index}>${mathContent}</span>;
                    }
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

                return <span key={index}>{part}</span>;
            })}
        </>
    );
};

// Intelligently pre-process raw text: converts inline statements, List I/II, pair matching, and tabular rows into markdown tables
function preProcessQuestionText(text: string): string {
    if (!text) return '';
    
    // Normalize diamond question marks
    let normalized = text.replace(/[\ufffd\uFFFD]/g, ' | ');

    // 0. Split inline premises, numbered statements, and final question prompts ONLY when crammed on single lines
    normalized = normalized
        // Newline after intro premise colon (e.g. "Consider the following statements: 1. ...")
        .replace(/(consider the following statements?|consider the following pairs?|consider the following events?|consider the following items?|consider the following:?|statements?:|pairs?:|following:)\s+(?=(?:[1-9]|I|A)\.\s+|Statement\s*1)/gi, '$1\n')
        // Newline before inline numbered statements only after sentence punctuation
        .replace(/([.;])\s+(?=(?:[1-9]|10)\.\s+[A-Z0-9])/g, '$1\n')
        // Newline before roman numerals after punctuation
        .replace(/([.;])\s+(?=(?:IX|IV|V?I{1,3})\.\s+[A-Z0-9])/gi, '$1\n')
        // Newline before Statement / S1 / S2 / Conclusion / Question labels
        .replace(/([.;])\s+(?=(?:Assertion\s*\(A\)|Reason\s*\(R\)|Statement\s*[-I|V|X\d]+|S[1-4]|Conclusion\s*[-I|V|X\d]+|Question):)/gi, '$1\n')
        // Newline before closing question prompts after punctuation
        .replace(/([.;])\s+(?=(?:Which of the statements? given above|Which of the pairs? given above|Which of the above statements?|Which of the above pairs?|Which of the above is\/are|Which one of the following|How many of the above pairs?|How many of the statements? given above|In which of the above rows|Select the correct answer using the code given below|Select the correct answer|Choose the correct|ಮೇಲಿನ ಹೇಳಿಕೆಗಳಲ್ಲಿ ಯಾವುದು|ಮೇಲಿನವುಗಳಲ್ಲಿ ಯಾವುದು))/gi, '$1\n');

    // 1. Check for multi-column pair rows like "1. Chandraketugarh | Odisha | Trading Port town"
    const rawLines = normalized.split('\n');
    const processedLines: string[] = [];
    let pairBlock: { num: string; cols: string[] }[] = [];

    const flushPairBlock = () => {
        if (pairBlock.length === 0) return;
        const maxCols = Math.max(...pairBlock.map(p => p.cols.length));
        if (maxCols >= 2) {
            // Determine headers
            const headers = maxCols === 3 
                ? ['No.', 'Place / Item', 'State / Region', 'Feature / Description']
                : ['No.', 'Item / Entity', 'Attribute / Matched Feature'];
            
            processedLines.push(headers.join(' | '));
            processedLines.push(headers.map(() => '---').join(' | '));
            for (const row of pairBlock) {
                const rowCells = [row.num, ...row.cols];
                while (rowCells.length < headers.length) rowCells.push('');
                processedLines.push(rowCells.join(' | '));
            }
        } else {
            for (const row of pairBlock) {
                processedLines.push(`${row.num}. ${row.cols.join(' · ')}`);
            }
        }
        pairBlock = [];
    };

    for (let i = 0; i < rawLines.length; i++) {
        const line = rawLines[i].trim();
        // Match numbered rows with pipe or tab or multiple spaces separating 2+ items
        const numMatch = line.match(/^(\d+)\.\s+(.+)$/);
        if (numMatch) {
            const num = numMatch[1];
            const content = numMatch[2];
            // Split by pipe | or tabs or 2+ spaces
            let parts: string[] = [];
            if (content.includes('|')) {
                parts = content.split('|').map(s => s.trim()).filter(Boolean);
            } else if (content.includes('\t')) {
                parts = content.split('\t').map(s => s.trim()).filter(Boolean);
            } else if (/\s{3,}/.test(content)) {
                parts = content.split(/\s{3,}/).map(s => s.trim()).filter(Boolean);
            }

            if (parts.length >= 2) {
                pairBlock.push({ num, cols: parts });
                continue;
            }
        }

        flushPairBlock();
        processedLines.push(line);
    }
    flushPairBlock();

    const intermediateText = processedLines.join('\n');

    // 2. Check if List I and List II are present in the text
    const hasList1 = /(List\s*-?\s*I\b|ಪಟ್ಟಿ\s*-?\s*I\b)/i.test(intermediateText);
    const hasList2 = /(List\s*-?\s*II\b|ಪಟ್ಟಿ\s*-?\s*II\b)/i.test(intermediateText);
    
    if (hasList1 && hasList2 && !intermediateText.includes('|')) {
        const lines = intermediateText.split('\n');
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
    
    return intermediateText;
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
                    margin: '16px 0', 
                    borderRadius: '12px', 
                    border: '1px solid var(--border)',
                    boxShadow: 'var(--shadow-sm)',
                    background: 'var(--bg-card)'
                }}
            >
                <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '13.5px', border: 'none' }}>
                    {headerRow && (
                        <thead>
                            <tr style={{ borderBottom: '1.5px solid var(--border)', background: 'var(--bg-secondary)' }}>
                                {headerRow.map((cell, cellIdx) => (
                                    <th 
                                        key={`th-${cellIdx}`} 
                                        style={{ 
                                            padding: '10px 14px', 
                                            textAlign: 'left', 
                                            fontWeight: 800, 
                                            fontSize: '12.5px',
                                            textTransform: 'uppercase',
                                            letterSpacing: '0.04em',
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
                                    background: rowIdx % 2 === 1 ? 'rgba(255, 255, 255, 0.02)' : 'transparent',
                                    transition: 'background-color 0.15s'
                                }}
                            >
                                {row.map((cell, cellIdx) => (
                                    <td 
                                        key={`td-${cellIdx}`} 
                                        style={{ 
                                            padding: '11px 14px', 
                                            color: cellIdx === 0 && /^\d+\.?$/.test(cell.trim()) ? 'var(--brand-orange)' : 'var(--text-secondary)',
                                            fontWeight: cellIdx === 0 ? 700 : 500,
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
            if (cells.some(c => /^---+$/.test(c))) {
                return;
            }
            currentTableRows.push(cells);
        } else {
            if (currentTableRows.length > 0) {
                flushTable(`${idx}`);
            }
            const trimmed = line.trim();
            if (trimmed !== '') {
                const isBullet = /^[•*-]\s/.test(trimmed);
                const isStatementLabel = /^(S[1-4]|Statement\s*[-I|V|X0-9]*|Conclusion\s*[-I|V|X0-9]*|Question|Statements|Conclusions):/i.test(trimmed);
                const isListItem = /^[A-D]\.\s/.test(trimmed) || 
                                   /^[0-9]+\.\s/.test(trimmed) || 
                                   /^(IX|IV|V?I{1,3})\.\s/i.test(trimmed) ||
                                   /^(Assertion\s*\(A\)|Reason\s*\(R\)|Statement\s*[-I|V|X0-9]+):/i.test(trimmed) ||
                                   /^S[1-4]:/i.test(trimmed);
                
                const isPrompt = /^(Which of the statements?|Which of the pairs?|Which of the above|Which one of the|What are the|What is the|How many of the|In which of the|Select the correct|Choose the correct|उपर्युक्त|निम्नलिखित|ಮೇಲಿನ ಹೇಳಿಕೆಗಳಲ್ಲಿ|ಮೇಲಿನವುಗಳಲ್ಲಿ)/i.test(trimmed);

                let contentText = line;
                if (isBullet) {
                    contentText = line.replace(/^\s*[•*-]\s/, '');
                }

                elements.push(
                    <p 
                        key={`line-${idx}`} 
                        style={{ 
                            margin: isPrompt ? '14px 0 6px 0' : isStatementLabel ? '6px 0 6px 0' : '0 0 10px 0',
                            paddingLeft: isListItem && !isStatementLabel ? '22px' : '0',
                            textIndent: isListItem && !isStatementLabel ? '-22px' : '0',
                            lineHeight: 1.65,
                            color: isPrompt ? 'var(--text-primary)' : isStatementLabel ? 'var(--text-primary)' : isListItem ? 'var(--text-secondary)' : 'var(--text-primary)',
                            fontSize: '15px',
                            fontWeight: isPrompt ? 700 : isStatementLabel ? 600 : isListItem ? 500 : 500
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

// ═══════════════════════════════════════════════════════════════
// DEDICATED EXPLANATION FORMATTER FOR UPSC CSE & KPSC KAS
// ═══════════════════════════════════════════════════════════════
interface ExplanationFormatterProps {
    text: string;
}

export function ExplanationFormatter({ text }: ExplanationFormatterProps) {
    if (!text) return null;

    // Clean diamond question marks
    let cleanText = text.replace(/[\ufffd\uFFFD]/g, ' · ');

    // Match statement or pair delimiters like "Pair 1 incorrect:", "Pair 2 correct:", "Statement 1 is correct:", "Option (a):"
    const segmentRegex = /(?:^|\s*)(Pair\s*\d+(?:\s+is\s+)?(?:\s*correct|\s*incorrect|\s*correctly matched|\s*incorrectly matched)?[:\.\-]|Statement\s*[-I|V|X\d]+(?:\s+is\s+)?(?:\s*correct|\s*incorrect|\s*true|\s*false)?[:\.\-]|Option\s*\([a-d]\)(?:\s+is\s+)?(?:\s*correct|\s*incorrect)?[:\.\-]|Why\s+Option\s+[A-D]\s+is\s+Correct:?|Hence,\s+option\s+\([a-d]\)\s+is\s+correct[:\.]?|Correct\s+Answer:?)/gi;

    // Check if the explanation has multiple structured parts
    const matches = Array.from(cleanText.matchAll(segmentRegex));

    if (matches.length >= 2) {
        const segments: { label: string; content: string; isCorrect?: boolean; isIncorrect?: boolean }[] = [];
        
        let lastIndex = 0;
        let currentLabel = '';

        for (let i = 0; i < matches.length; i++) {
            const m = matches[i];
            const matchIndex = m.index || 0;
            const matchText = m[0].trim();

            if (i > 0 && currentLabel) {
                const chunk = cleanText.substring(lastIndex, matchIndex).trim();
                const lowerLabel = currentLabel.toLowerCase();
                const isCorrect = lowerLabel.includes('correct') && !lowerLabel.includes('incorrect');
                const isIncorrect = lowerLabel.includes('incorrect') || lowerLabel.includes('false');
                segments.push({ label: currentLabel, content: chunk, isCorrect, isIncorrect });
            } else if (i === 0 && matchIndex > 0) {
                // Header intro before first pair
                const intro = cleanText.substring(0, matchIndex).trim();
                if (intro) {
                    segments.push({ label: '', content: intro });
                }
            }

            currentLabel = matchText;
            lastIndex = matchIndex + m[0].length;
        }

        if (currentLabel) {
            const chunk = cleanText.substring(lastIndex).trim();
            const lowerLabel = currentLabel.toLowerCase();
            const isCorrect = lowerLabel.includes('correct') && !lowerLabel.includes('incorrect');
            const isIncorrect = lowerLabel.includes('incorrect') || lowerLabel.includes('false');
            segments.push({ label: currentLabel, content: chunk, isCorrect, isIncorrect });
        }

        return (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '10px', marginTop: '6px' }}>
                {segments.map((seg, idx) => {
                    if (!seg.label) {
                        return (
                            <p key={idx} style={{ margin: '0 0 6px 0', fontSize: '14px', lineHeight: 1.6, color: 'var(--text-secondary)' }}>
                                {parseTextWithFormatting(seg.content)}
                            </p>
                        );
                    }

                    const isGreen = seg.isCorrect;
                    const isRed = seg.isIncorrect;

                    const badgeBg = isGreen ? 'rgba(16, 185, 129, 0.15)' : isRed ? 'rgba(225, 29, 72, 0.15)' : 'var(--bg-tertiary)';
                    const badgeBorder = isGreen ? 'rgba(16, 185, 129, 0.35)' : isRed ? 'rgba(225, 29, 72, 0.35)' : 'var(--border)';
                    const badgeColor = isGreen ? '#10B981' : isRed ? '#F43F5E' : 'var(--brand-orange)';

                    return (
                        <div 
                            key={idx}
                            style={{
                                padding: '12px 16px',
                                borderRadius: '10px',
                                background: 'var(--bg-secondary)',
                                border: '1px solid var(--border)',
                                display: 'flex',
                                flexDirection: 'column',
                                gap: '6px',
                                transition: 'all 0.15s'
                            }}
                        >
                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <span style={{
                                    fontSize: '12px',
                                    fontWeight: 800,
                                    padding: '3px 10px',
                                    borderRadius: '6px',
                                    background: badgeBg,
                                    border: `1px solid ${badgeBorder}`,
                                    color: badgeColor,
                                    letterSpacing: '0.02em',
                                    textTransform: 'uppercase'
                                }}>
                                    {isGreen ? '✅ ' : isRed ? '❌ ' : '📌 '}
                                    {seg.label.replace(/[:\.\-]$/, '')}
                                </span>
                            </div>
                            <div style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.65 }}>
                                {parseTextWithFormatting(seg.content)}
                            </div>
                        </div>
                    );
                })}
            </div>
        );
    }

    // Default fallback: break paragraphs cleanly
    return (
        <div style={{ fontSize: '14px', lineHeight: 1.65, color: 'var(--text-secondary)' }}>
            <QuestionFormatter text={cleanText} />
        </div>
    );
}
