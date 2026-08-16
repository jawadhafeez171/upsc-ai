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

async function auditMissing() {
  console.log("==================================================");
  console.log("AUDITING ALL YEARS IN upsc_questions (2011 - 2024)");
  console.log("==================================================");

  // 1. Check if any questions have invalid years or years outside 2011-2024
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

  console.log(`Total questions fetched: ${allQs.length}`);

  const yearCounts = {};
  for (const q of allQs) {
    yearCounts[q.year] = (yearCounts[q.year] || 0) + 1;
  }

  console.log("\nAll Year Counts in Database:");
  Object.keys(yearCounts).sort((a, b) => b - a).forEach(yr => {
    console.log(`  - Year ${yr}: ${yearCounts[yr]} questions`);
  });

  console.log("\nDeep Dive on Deficit for 2011-2024 (Target: Exactly 100 Qs/Year):");
  for (let yr = 2024; yr >= 2011; yr--) {
    const count = yearCounts[yr] || 0;
    const diff = 100 - count;
    if (diff > 0) {
      console.log(`  ⚠️ Year ${yr}: Has ${count} questions (${diff} MISSING)`);
    } else if (diff < 0) {
      console.log(`  ⚠️ Year ${yr}: Has ${count} questions (${Math.abs(diff)} SURPLUS / Duplicates)`);
    } else {
      console.log(`  ✅ Year ${yr}: Exactly 100 questions`);
    }
  }
}

auditMissing();
