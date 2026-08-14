const fs = require('fs');
const path = require('path');

const dataDir = path.join(__dirname, '..', 'src', 'data');
const files = fs.readdirSync(dataDir).filter(f => f.endsWith('.json'));

let totalFixed = 0;

files.forEach(file => {
    const filePath = path.join(dataDir, file);
    let rawContent = fs.readFileSync(filePath, 'utf-8');
    
    // Fix broken ightarrow artifacts in raw json text before JSON parsing
    rawContent = rawContent.replace(/\\r\\nightarrow/g, ' \\rightarrow');
    rawContent = rawContent.replace(/\\nightarrow/g, ' \\rightarrow');
    rawContent = rawContent.replace(/([^\\])ightarrow/g, '$1\\rightarrow');
    rawContent = rawContent.replace(/\$ ightarrow\$/g, '$\\rightarrow$');
    rawContent = rawContent.replace(/\$ightarrow\$/g, '$\\rightarrow$');

    const data = JSON.parse(rawContent);
    let fileChanged = false;

    data.forEach((q, idx) => {
        let changed = false;

        const cleanText = (text) => {
            if (!text) return text;
            let cleaned = text;
            
            // Fix double spaces after bullet/number
            cleaned = cleaned.replace(/([A-D]\.)\s{2,}/g, '$1 ');
            
            // Fix currency with spaces like '$ 346 million' or '$ 72 lakhs'
            cleaned = cleaned.replace(/\$\s+(\d+)/g, '$$$1');

            // Fix \rightarrow artifacts
            cleaned = cleaned.replace(/\$ ightarrow\$/g, '$\\rightarrow$');
            cleaned = cleaned.replace(/ightarrow/g, '\\rightarrow');

            // Fix \text{...} inside latex or plain text
            cleaned = cleaned.replace(/\\text\{([^}]+)\}/g, '$1');

            return cleaned;
        };

        const oldQEng = q.question_english;
        const oldExpEng = q.explanation_english;
        const oldQKn = q.question_kannada;
        const oldExpKn = q.explanation_kannada;

        q.question_english = cleanText(q.question_english);
        q.explanation_english = cleanText(q.explanation_english);
        q.question_kannada = cleanText(q.question_kannada);
        q.explanation_kannada = cleanText(q.explanation_kannada);

        // Check specific structural improvements for Match List questions:
        if (q.question_number === 57 && file === 'kas_dec_p2_2024.json') {
            q.question_english = `Match List I with List II:\n\nList I | List II\n--- | ---\nA. Physics | I. MicroRNA and Gene regulation\nB. Medicine | II. Computational protein design\nC. Peace | III. Traumas and fragility of human life\nD. Chemistry | IV. World free of nuclear weapons\nE. Literature | V. Synthesis of quantum dots\n | VI. Nucleoside base modifications\n | VII. Machine learning and artificial neural networks\n\nChoose the correct answer from the options given below:`;
            changed = true;
        }

        // Check specific structural improvement for kas_dec_p2_2024 Q64
        if (q.question_number === 64 && file === 'kas_dec_p2_2024.json') {
            q.question_english = `Which of the following statement/statements is/are correct?\n\nA. The Government of Karnataka has recently launched 'VentuRISE-Global startup Challenge 2024' to recognise, reward and support growth stage startups.\nB. The challenge will focus on Electronics System Design and Manufacturing only.\nC. The winners will share a prize pool of $300,000 and receive mentorship from industry leaders.\nD. It is started by the Department of Electronics, Information Technology and Biotechnology.\n\nChoose the correct option:`;
            changed = true;
        }

        // Check specific structural improvement for kas_dec_p2_2024 Q52
        if (q.question_number === 52 && file === 'kas_dec_p2_2024.json') {
            q.question_english = `Which of the following statements is logically equivalent to "If it rains, I will take an umbrella"?\n\nA. If I take an umbrella, it will rain.\nB. If I do not take an umbrella, it will not rain.\nC. If it does not rain, I will not take an umbrella.\nD. If I do not take an umbrella, it will rain.\n\nChoose the correct answer:`;
            changed = true;
        }

        // Check kas_april_p2_2015 Q66
        if (q.question_number === 66 && file === 'kas_april_p2_2015.json') {
            q.question_english = `Electromagnetic spectrum regions:\n\nA. Visible light\nB. Gamma-rays\nC. Infra-red\nD. Micro-waves\nE. Radio-waves\nF. Ultra-violet\nG. X-rays\n\nPut them in order of increasing wavelength, starting with the shortest wavelength first:`;
            changed = true;
        }

        ['option_1_english', 'option_2_english', 'option_3_english', 'option_4_english'].forEach(optKey => {
            if (q[optKey]) {
                const oldOpt = q[optKey];
                q[optKey] = cleanText(q[optKey]);
                if (q[optKey] !== oldOpt) changed = true;
            }
        });

        if (q.question_english !== oldQEng || q.explanation_english !== oldExpEng || q.question_kannada !== oldQKn || q.explanation_kannada !== oldExpKn || changed) {
            fileChanged = true;
            totalFixed++;
        }
    });

    if (fileChanged) {
        fs.writeFileSync(filePath, JSON.stringify(data, null, 4), 'utf-8');
        console.log(`Updated ${file}`);
    }
});

console.log(`Total questions cleaned/structured: ${totalFixed}`);
