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

async function analyze() {
  console.log("==================================================");
  console.log("ANALYZING YEAR ANOMALIES & DUPLICATES IN upsc_questions");
  console.log("==================================================");

  let allQs = [];
  let page = 0;
  const pageSize = 1000;
  while (true) {
    const { data, error } = await supabase
      .from('upsc_questions')
      .select('id, year, subject, text_en, source_table')
      .range(page * pageSize, (page + 1) * pageSize - 1);
    if (error || !data || data.length === 0) break;
    allQs = allQs.concat(data);
    if (data.length < pageSize) break;
    page++;
  }

  console.log(`Fetched ${allQs.length} total questions from upsc_questions.`);

  const byYear = {};
  for (const q of allQs) {
    if (!byYear[q.year]) byYear[q.year] = [];
    byYear[q.year].push(q);
  }

  const sortedYears = Object.keys(byYear).map(Number).sort((a, b) => b - a);

  console.log("\nBreakdown by Year:");
  for (const yr of sortedYears) {
    const qs = byYear[yr];
    console.log(`\n--- YEAR ${yr} (Total: ${qs.length}) ---`);

    const textMap = new Map();
    const duplicates = [];

    for (const q of qs) {
      // Normalize text: lowercase, remove non-alphanumeric, first 80 chars
      const normText = (q.text_en || '').toLowerCase().replace(/[^a-z0-9]/g, '').substring(0, 80);
      if (textMap.has(normText)) {
        duplicates.push({
          q1: textMap.get(normText),
          q2: q,
          normText
        });
      } else {
        textMap.set(normText, q);
      }
    }

    if (duplicates.length > 0) {
      console.log(`  🚨 Found ${duplicates.length} duplicate/overlapping questions in Year ${yr}:`);
      duplicates.forEach((d, idx) => {
        console.log(`    [#${idx+1}] ID 1: ${d.q1.id} (Subject: ${d.q1.subject}, Table: ${d.q1.source_table})`);
        console.log(`         ID 2: ${d.q2.id} (Subject: ${d.q2.subject}, Table: ${d.q2.source_table})`);
        console.log(`         Snippet: "${d.q1.text_en.substring(0, 70)}..."`);
      });
    } else {
      console.log(`  ✅ No duplicate question text detected in Year ${yr}.`);
    }

    const subDist = {};
    for (const q of qs) {
      subDist[q.subject] = (subDist[q.subject] || 0) + 1;
    }
    console.log(`  Subject distribution:`, subDist);
  }
}

analyze();
