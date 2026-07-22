const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
    console.error("Error: Supabase environment variables are missing from .env.local");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseAnonKey);

const DATA_DIR = path.join(__dirname, 'src', 'data');

// Month normalizer
function normalizeMonth(m) {
    if (!m) return 'december';
    const month = m.toLowerCase();
    if (month.startsWith('jan')) return 'january';
    if (month.startsWith('feb')) return 'february';
    if (month.startsWith('mar')) return 'march';
    if (month.startsWith('apr')) return 'april';
    if (month.startsWith('may')) return 'may';
    if (month.startsWith('jun')) return 'june';
    if (month.startsWith('jul')) return 'july';
    if (month.startsWith('aug')) return 'august';
    if (month.startsWith('sep')) return 'september';
    if (month.startsWith('oct')) return 'october';
    if (month.startsWith('nov')) return 'november';
    if (month.startsWith('dec')) return 'december';
    return month;
}

async function migrateFile(filename) {
    const filePath = path.join(DATA_DIR, filename);
    console.log(`Processing file: ${filename}`);

    // Parse year, month, paper from filename
    const yearMatch = filename.match(/\b\d{4}\b/);
    const paperMatch = filename.match(/p(\d)/i);
    const monthMatch = filename.match(/(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*/i);

    const year = yearMatch ? parseInt(yearMatch[0]) : 2025;
    const paper = paperMatch ? parseInt(paperMatch[1]) : 1;
    const month = normalizeMonth(monthMatch ? monthMatch[0] : 'december');

    console.log(`Extracted metadata -> Year: ${year}, Month: ${month}, Paper: ${paper}`);

    let rawData;
    try {
        rawData = fs.readFileSync(filePath, 'utf8');
    } catch (err) {
        console.error(`Error reading file ${filename}:`, err.message);
        return;
    }

    let questions;
    try {
        questions = JSON.parse(rawData);
    } catch (err) {
        console.error(`Error parsing JSON in ${filename}:`, err.message);
        return;
    }

    if (!Array.isArray(questions)) {
        console.error(`Error: JSON content in ${filename} is not an array`);
        return;
    }

    console.log(`Found ${questions.length} questions to migrate.`);

    const mappedQuestions = questions.map((q) => {
        const qNum = q.question_number || 1;
        const correctIndex = parseInt(q.key_answer) - 1;

        // Build option arrays
        const optionsEn = [
            q.option_1_english || '',
            q.option_2_english || '',
            q.option_3_english || '',
            q.option_4_english || ''
        ].filter(Boolean);

        const optionsKn = [
            q.option_1_kannada || '',
            q.option_2_kannada || '',
            q.option_3_kannada || '',
            q.option_4_kannada || ''
        ].filter(Boolean);

        const qYear = q.year !== undefined ? parseInt(q.year) : year;
        const qMonth = q.month !== undefined ? normalizeMonth(q.month) : month;
        const qPaper = q.paper !== undefined ? parseInt(q.paper) : paper;

        return {
            id: `kpsc-kas-${qYear}-${qMonth}-p${qPaper}-q${qNum}`,
            exam_id: 'kpsc-kas',
            text_en: q.question_english || '',
            text_kn: q.question_kannada || '',
            options_en: optionsEn,
            options_kn: optionsKn,
            correct_index: isNaN(correctIndex) ? 0 : correctIndex,
            explanation_en: q.explanation_english || 'No explanation available.',
            explanation_kn: q.explanation_kannada || 'ವಿವರಣೆ ಲಭ್ಯವಿಲ್ಲ.',
            subject: q.subject || 'General Knowledge',
            difficulty: q.difficulty || 'medium',
            year: qYear,
            month: qMonth,
            paper: qPaper
        };
    });

    // Batch upsert to Supabase
    const BATCH_SIZE = 25;
    for (let i = 0; i < mappedQuestions.length; i += BATCH_SIZE) {
        const batch = mappedQuestions.slice(i, i + BATCH_SIZE);
        console.log(`Uploading batch ${i / BATCH_SIZE + 1}...`);
        
        const { error } = await supabase
            .from('kas_questions')
            .upsert(batch, { onConflict: 'id' });

        if (error) {
            console.error(`Error uploading batch:`, error.message);
            console.error(`Please ensure the 'kas_questions' table is created and RLS is disabled or has write permissions.`);
            return false;
        }
    }

    console.log(`Successfully migrated ${mappedQuestions.length} questions from ${filename} to 'kas_questions' table.`);
    return true;
}

async function main() {
    if (!fs.existsSync(DATA_DIR)) {
        console.error(`Data directory not found at: ${DATA_DIR}`);
        process.exit(1);
    }

    const files = fs.readdirSync(DATA_DIR).filter(f => f.endsWith('.json') && f.startsWith('kas_'));
    if (files.length === 0) {
        console.log("No KPSC KAS JSON files found in src/data directory.");
        process.exit(0);
    }

    console.log(`Found ${files.length} KAS files to migrate:`, files);

    for (const file of files) {
        const success = await migrateFile(file);
        if (!success) {
            console.error("Migration failed for file:", file);
            process.exit(1);
        }
    }

    console.log("All migrations completed successfully! 🎉");
}

main();
