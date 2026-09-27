const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error("Error: Supabase environment variables are missing from .env.local");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);
const DATA_DIR = path.join(__dirname, '..', 'src', 'data');

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

async function seedFile(filename) {
    const filePath = path.join(DATA_DIR, filename);
    const rawData = fs.readFileSync(filePath, 'utf8');
    const questions = JSON.parse(rawData);

    // Parse year, month, paper from filename as fallback
    const yearMatch = filename.match(/\d{4}/);
    const paperMatch = filename.match(/p(\d)/i);
    const monthMatch = filename.match(/(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*/i);

    const fileYear = yearMatch ? parseInt(yearMatch[0]) : 2024;
    const filePaper = paperMatch ? parseInt(paperMatch[1]) : 1;
    const fileMonth = normalizeMonth(monthMatch ? monthMatch[0] : 'december');

    const mappedQuestions = questions.map((q) => {
        const qNum = q.question_number || q.number || 1;
        const correctIndex = parseInt(q.key_answer) - 1;

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

        const qYear = q.year !== undefined ? parseInt(q.year) : fileYear;
        const qMonth = q.month !== undefined ? normalizeMonth(q.month) : fileMonth;
        const qPaper = q.paper !== undefined ? parseInt(q.paper) : filePaper;

        return {
            id: `kpsc-kas-${qYear}-${qMonth}-p${qPaper}-q${qNum}`,
            exam_id: 'kpsc-kas',
            text_en: q.question_english || q.question || '',
            text_kn: q.question_kannada || '',
            options_en: optionsEn,
            options_kn: optionsKn,
            correct_index: isNaN(correctIndex) ? 0 : correctIndex,
            explanation_en: q.explanation_english || q.explanation || 'No explanation available.',
            explanation_kn: q.explanation_kannada || 'ವಿವರಣೆ ಲಭ್ಯವಿಲ್ಲ.',
            subject: q.subject || 'General Studies',
            subject_kannada: q.subject_kannada || null,
            domain: q.domain || null,
            domain_kannada: q.domain_kannada || null,
            sub_topic: q.sub_topic || null,
            sub_topic_kannada: q.sub_topic_kannada || null,
            node_id: q.node_id || null,
            secondary_node_ids: q.secondary_node_ids || [],
            is_mapping: Boolean(q.is_mapping),
            mapping: q.mapping || null,
            tags: q.tags || [],
            passage_en: q.passage_english || null,
            passage_kn: q.passage_kannada || null,
            difficulty: (q.difficulty || 'medium').toLowerCase(),
            image_url: q.image_url || null,
            year: qYear,
            month: qMonth,
            paper: qPaper
        };
    });

    const BATCH_SIZE = 50;
    for (let i = 0; i < mappedQuestions.length; i += BATCH_SIZE) {
        const batch = mappedQuestions.slice(i, i + BATCH_SIZE);
        const { error } = await supabase
            .from('kas_questions')
            .upsert(batch, { onConflict: 'id' });

        if (error) {
            console.error(`Error uploading batch ${i / BATCH_SIZE + 1} of ${filename}:`, error.message);
            throw error;
        }
    }

    console.log(`✓ Seeded ${mappedQuestions.length} questions from ${filename}`);
    return mappedQuestions.length;
}

async function main() {
    const files = fs.readdirSync(DATA_DIR).filter(f => f.endsWith('.json') && f.startsWith('kas_')).sort();
    console.log(`Starting migration of ${files.length} KAS files to 'kas_questions' table...`);

    let totalUploaded = 0;
    for (const file of files) {
        const count = await seedFile(file);
        totalUploaded += count;
    }

    console.log(`\n🎉 Successfully seeded all ${totalUploaded} questions across ${files.length} files to 'kas_questions'!`);
}

if (require.main === module) {
    main().catch(err => {
        console.error("Migration halted due to error:", err.message);
        process.exit(1);
    });
}

module.exports = { seedFile };
