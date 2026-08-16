const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

const envContent = fs.readFileSync(path.join(__dirname, '..', '.env.local'), 'utf-8');
const env = {};
envContent.split('\n').forEach(line => {
  const [key, ...vals] = line.split('=');
  if (key && vals.length) env[key.trim()] = vals.join('=').trim();
});

const supabase = createClient(env['NEXT_PUBLIC_SUPABASE_URL'], env['NEXT_PUBLIC_SUPABASE_ANON_KEY']);

const LEGACY_TABLES = [
  { table: 'PYQ Ancient History', subject: 'Ancient History' },
  { table: 'PYQ Medieval Hisotry', subject: 'Medieval History' },
  { table: 'PYQ Art and Culture', subject: 'Art and Culture' },
  { table: 'PYQ Modern History', subject: 'Modern History' },
  { table: 'PYQ Polity', subject: 'Polity' },
  { table: 'PYQ Economics', subject: 'Economics' },
  { table: 'PYQ Geography', subject: 'Geography' },
  { table: 'PYQ Environement', subject: 'Environment' },
  { table: 'PYQ Science&Tech', subject: 'Science & Technology' },
  { table: 'PYQ IR and Current Affairs', subject: 'IR & Current Affairs' },
  { table: 'PYQ General Awareness', subject: 'General Awareness' }
];

function sanitizeText(str) {
  if (!str) return '';
  return str
    .replace(/[\ufffd\uFFFD]/g, ' · ')
    .trim();
}

function normalizeDifficulty(diff) {
  if (!diff) return 'medium';
  const d = String(diff).toLowerCase().trim();
  if (d === 'easy') return 'easy';
  if (d === 'hard') return 'hard';
  return 'medium';
}

function normalizeCorrect(ans) {
  if (!ans) return { option: 'a', index: 0 };
  const str = String(ans).toLowerCase().trim();
  if (str === 'b' || str === '1' || str.startsWith('(b)')) return { option: 'b', index: 1 };
  if (str === 'c' || str === '2' || str.startsWith('(c)')) return { option: 'c', index: 2 };
  if (str === 'd' || str === '3' || str.startsWith('(d)')) return { option: 'd', index: 3 };
  return { option: 'a', index: 0 };
}

async function migrate() {
  console.log("==================================================");
  console.log("STARTING UPSC CSE CONSOLIDATION TO upsc_questions");
  console.log("==================================================");

  // 1. Check if upsc_questions table exists
  const { error: checkErr } = await supabase.from('upsc_questions').select('id').limit(1);
  if (checkErr) {
    console.error("\n❌ Target table 'upsc_questions' is not found in Supabase.");
    console.error("Please execute the SQL in 'supabase_migration_upsc_questions.sql' in the Supabase SQL Editor first.\n");
    console.error("Error message:", checkErr.message);
    return;
  }

  console.log("✅ 'upsc_questions' table confirmed in Supabase.");

  let totalMigrated = 0;
  let allRows = [];

  for (const item of LEGACY_TABLES) {
    console.log(`\nFetching questions from "${item.table}" (${item.subject})...`);
    
    // Fetch all rows from legacy table with pagination (in case > 1000)
    let page = 0;
    const pageSize = 1000;
    let hasMore = true;
    let tableRows = [];

    while (hasMore) {
      const { data, error } = await supabase
        .from(item.table)
        .select('*')
        .range(page * pageSize, (page + 1) * pageSize - 1);

      if (error) {
        console.error(`Error reading ${item.table}:`, error.message);
        break;
      }

      if (data && data.length > 0) {
        tableRows.push(...data);
        if (data.length < pageSize) hasMore = false;
        else page++;
      } else {
        hasMore = false;
      }
    }

    console.log(`  Found ${tableRows.length} rows in ${item.table}`);

    for (const r of tableRows) {
      const qKey = r.content_key || `upsc-${item.subject.toLowerCase().replace(/[^a-z0-9]+/g, '-')}-${r['Q No.'] || Math.random().toString(36).substring(2, 8)}`;
      const cleanQ = sanitizeText(r.question_en || r.Question || r.text_en || r.question);
      if (!cleanQ) continue;

      const optA = sanitizeText(r.option_a_en || r['Option A'] || (r.options_en && r.options_en[0]) || 'Option A');
      const optB = sanitizeText(r.option_b_en || r['Option B'] || (r.options_en && r.options_en[1]) || 'Option B');
      const optC = sanitizeText(r.option_c_en || r['Option C'] || (r.options_en && r.options_en[2]) || 'Option C');
      const optD = sanitizeText(r.option_d_en || r['Option D'] || (r.options_en && r.options_en[3]) || 'Option D');

      const optA_hi = r.option_a_hi && r.option_a_hi !== 'None' ? sanitizeText(r.option_a_hi) : null;
      const optB_hi = r.option_b_hi && r.option_b_hi !== 'None' ? sanitizeText(r.option_b_hi) : null;
      const optC_hi = r.option_c_hi && r.option_c_hi !== 'None' ? sanitizeText(r.option_c_hi) : null;
      const optD_hi = r.option_d_hi && r.option_d_hi !== 'None' ? sanitizeText(r.option_d_hi) : null;

      const q_hi = r.question_hi && r.question_hi !== 'None' ? sanitizeText(r.question_hi) : null;
      const exp_hi = r.explanation_hi && r.explanation_hi !== 'None' ? sanitizeText(r.explanation_hi) : null;

      const correctInfo = normalizeCorrect(r['Correct Answer'] || r.correct_option || r.correct);
      const year = parseInt(r.Year || r.year || '2020', 10) || 2020;
      const difficulty = normalizeDifficulty(r.difficulty);
      const explanation = sanitizeText(r.Explanation || r.explanation_correct || r.explanation_en || 'Refer to standard reference sources.');

      allRows.push({
        id: qKey,
        exam_id: 'upsc-cse',
        year: year,
        paper: 1,
        subject: item.subject,
        topic: r['Topic / Section'] || r.syllabus_point || null,
        difficulty: difficulty,
        text_en: cleanQ,
        text_hi: q_hi,
        options_en: [optA, optB, optC, optD],
        options_hi: optA_hi ? [optA_hi, optB_hi, optC_hi, optD_hi] : null,
        correct_index: correctInfo.index,
        correct_option: correctInfo.option,
        explanation_en: explanation,
        explanation_hi: exp_hi,
        image_url: r.explanation_image_url || r.image_url || null,
        source_table: item.table
      });
    }
  }

  console.log(`\nTotal transformed questions ready for insertion: ${allRows.length}`);

  // Deduplicate by ID
  const idMap = new Map();
  const dedupedRows = [];
  for (const row of allRows) {
    if (!idMap.has(row.id)) {
      idMap.set(row.id, true);
      dedupedRows.push(row);
    }
  }
  console.log(`Deduplicated unique questions: ${dedupedRows.length}`);

  // Insert in batches of 100
  const BATCH_SIZE = 100;
  for (let i = 0; i < dedupedRows.length; i += BATCH_SIZE) {
    const chunk = dedupedRows.slice(i, i + BATCH_SIZE);
    const { error: insErr } = await supabase
      .from('upsc_questions')
      .upsert(chunk, { onConflict: 'id' });

    if (insErr) {
      console.error(`Error inserting batch ${i / BATCH_SIZE + 1}:`, insErr.message);
    } else {
      totalMigrated += chunk.length;
      process.stdout.write(`Migrated ${totalMigrated}/${dedupedRows.length} questions...\r`);
    }
  }

  console.log(`\n🎉 MIGRATION COMPLETE! Total ${totalMigrated} questions successfully inserted into 'upsc_questions'.`);
}

migrate();
