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

async function inspectRecentYears() {
  console.log("=========================================");
  console.log("DETAILED INSPECTION: YEARS 2011 TO 2024");
  console.log("=========================================");

  for (let yr = 2024; yr >= 2011; yr--) {
    const { data: qs } = await supabase
      .from('upsc_questions')
      .select('id, year, subject, text_en, options_en, source_table')
      .eq('year', yr);

    console.log(`\n================ YEAR ${yr} (${qs.length} Questions) ================`);

    // Check duplicate texts by exact match or high similarity
    const map = new Map();
    const dups = [];

    for (const q of qs) {
      const simplified = q.text_en.trim().toLowerCase().replace(/\s+/g, ' ');
      if (map.has(simplified)) {
        dups.push({ original: map.get(simplified), current: q });
      } else {
        map.set(simplified, q);
      }
    }

    if (dups.length > 0) {
      console.log(`🚨 EXACT TEXT DUPLICATES (${dups.length}):`);
      for (const d of dups) {
        console.log(`   - ID1: ${d.original.id} (${d.original.subject}) vs ID2: ${d.current.id} (${d.current.subject})`);
        console.log(`     Text: "${d.original.text_en.substring(0, 100)}..."`);
      }
    } else {
      console.log(`✅ No exact text duplicates.`);
    }

    // Check cross-subject overlap (e.g. same core question phrase)
    const shortPhraseMap = new Map();
    const partialDups = [];
    for (const q of qs) {
      // first 60 alphanumeric characters
      const key = q.text_en.toLowerCase().replace(/[^a-z0-9]/g, '').substring(0, 60);
      if (shortPhraseMap.has(key)) {
        const prev = shortPhraseMap.get(key);
        if (prev.id !== q.id) {
          partialDups.push({ original: prev, current: q });
        }
      } else {
        shortPhraseMap.set(key, q);
      }
    }

    if (partialDups.length > dups.length) {
      console.log(`⚠️ PARTIAL/NEAR DUPLICATES (${partialDups.length}):`);
      for (const d of partialDups) {
        console.log(`   - ID1: ${d.original.id} (${d.original.subject}) vs ID2: ${d.current.id} (${d.current.subject})`);
        console.log(`     Text 1: "${d.original.text_en.substring(0, 90)}..."`);
        console.log(`     Text 2: "${d.current.text_en.substring(0, 90)}..."`);
      }
    }
  }
}

inspectRecentYears();
