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

async function findSurplus() {
  const surplusYears = [2023, 2016, 2014, 2013, 2012, 2011];

  for (const yr of surplusYears) {
    const { data: qs } = await supabase
      .from('upsc_questions')
      .select('id, subject, text_en, options_en, source_table')
      .eq('year', yr);

    console.log(`\n================ YEAR ${yr} (${qs.length} Qs) ================`);

    // Match questions with identical texts (or almost identical)
    for (let i = 0; i < qs.length; i++) {
      for (let j = i + 1; j < qs.length; j++) {
        const q1 = qs[i];
        const q2 = qs[j];
        const s1 = q1.text_en.toLowerCase().replace(/[^a-z0-9]/g, '').substring(0, 50);
        const s2 = q2.text_en.toLowerCase().replace(/[^a-z0-9]/g, '').substring(0, 50);
        if (s1 === s2) {
          console.log(`Duplicate found:`);
          console.log(`  Q1: [${q1.id}] (${q1.subject}) - "${q1.text_en.substring(0, 60)}"`);
          console.log(`  Q2: [${q2.id}] (${q2.subject}) - "${q2.text_en.substring(0, 60)}"`);
        }
      }
    }
  }
}

findSurplus();
