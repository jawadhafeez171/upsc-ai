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
const CSAT_DIR = path.join(__dirname, '..', 'src', 'data', 'upsc_pyq', 'csat');

async function seedCsat() {
    console.log("Checking connection to Supabase...");
    const { count: initialCount } = await supabase
        .from('csat_pyq')
        .select('*', { count: 'exact', head: true });
    
    console.log(`Current rows in 'csat_pyq': ${initialCount}`);

    console.log("Clearing existing entries from 'csat_pyq'...");
    const { error: delError } = await supabase
        .from('csat_pyq')
        .delete()
        .neq('id', 'dummy_id_to_clear_all');

    if (delError) {
        console.error("Error clearing csat_pyq:", delError.message);
        throw delError;
    }
    console.log("Table 'csat_pyq' cleared successfully.");

    const files = fs.readdirSync(CSAT_DIR).filter(f => f.endsWith('.json')).sort();
    console.log(`Found ${files.length} CSAT files to seed:`, files);

    let totalUploaded = 0;

    for (const filename of files) {
        const filePath = path.join(CSAT_DIR, filename);
        const questions = JSON.parse(fs.readFileSync(filePath, 'utf8'));

        const records = questions.map(q => {
            const qNum = q.question_number;
            const yr = q.year;
            return {
                id: `csat-${yr}-q${qNum}`,
                question_number: qNum,
                year: yr,
                paper: q.paper || 2,
                exam_id: 'upsc-cse',
                node_id: q.node_id || null,
                subject: q.subject || 'General Mental Ability, Quantitative Aptitude & Comprehension',
                subject_hindi: q.subject_hindi || 'सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता',
                domain: q.domain || null,
                domain_hindi: q.domain_hindi || null,
                sub_topic: q.sub_topic || null,
                sub_topic_hindi: q.sub_topic_hindi || null,
                difficulty: (q.difficulty || 'medium').toLowerCase(),
                tags: q.tags || [],
                question_english: q.question_english || '',
                question_hindi: q.question_hindi || null,
                option_a_english: q.option_a_english || '',
                option_b_english: q.option_b_english || '',
                option_c_english: q.option_c_english || '',
                option_d_english: q.option_d_english || '',
                option_a_hindi: q.option_a_hindi || null,
                option_b_hindi: q.option_b_hindi || null,
                option_c_hindi: q.option_c_hindi || null,
                option_d_hindi: q.option_d_hindi || null,
                key_answer: (q.key_answer || 'A').toUpperCase(),
                explanation_english: q.explanation_english || 'No explanation available.',
                explanation_hindi: q.explanation_hindi || null,
                image_url: q.image_url || null,
                passage_english: q.passage_english || null,
                passage_hindi: q.passage_hindi || null
            };
        });

        const BATCH_SIZE = 50;
        for (let i = 0; i < records.length; i += BATCH_SIZE) {
            const batch = records.slice(i, i + BATCH_SIZE);
            const { error: insertError } = await supabase
                .from('csat_pyq')
                .upsert(batch, { onConflict: 'id' });

            if (insertError) {
                console.error(`Error uploading batch in ${filename}:`, insertError.message);
                throw insertError;
            }
        }

        totalUploaded += records.length;
        console.log(`✓ Seeded ${records.length} questions from ${filename} (cumulative: ${totalUploaded})`);
    }

    console.log(`\n🎉 All ${totalUploaded} questions across ${files.length} CSAT files seeded successfully!`);

    // Verify final count
    const { count: finalCount } = await supabase
        .from('csat_pyq')
        .select('*', { count: 'exact', head: true });

    console.log(`Final verified rows in 'csat_pyq': ${finalCount}`);
}

if (require.main === module) {
    seedCsat().catch(err => {
        console.error("CSAT Seeding failed:", err.message);
        process.exit(1);
    });
}

module.exports = { seedCsat };
