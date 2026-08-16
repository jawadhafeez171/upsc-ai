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

async function findDups(yr) {
  const { data: qs } = await supabase.from('upsc_questions').select('*').eq('year', yr);
  console.log(`\nInspecting Year ${yr} (${qs.length} questions):`);

  for (let i = 0; i < qs.length; i++) {
    for (let j = i + 1; j < qs.length; j++) {
      const q1 = qs[i];
      const q2 = qs[j];
      
      // Check first 40 clean chars of question
      const t1 = q1.text_en.toLowerCase().replace(/[^a-z0-9]/g, '').substring(0, 35);
      const t2 = q2.text_en.toLowerCase().replace(/[^a-z0-9]/g, '').substring(0, 35);
      
      // Or check options
      const optMatch = q1.options_en.join('|').toLowerCase() === q2.options_en.join('|').toLowerCase();

      if (t1 === t2 || optMatch) {
        console.log(`\nPotential Dup Match:`);
        console.log(`  Q1: [${q1.id}] (${q1.subject}) - "${q1.text_en.substring(0, 90)}"`);
        console.log(`  Q2: [${q2.id}] (${q2.subject}) - "${q2.text_en.substring(0, 90)}"`);
      }
    }
  }
}

async function run() {
  await findDups(2016);
  await findDups(2012);
}

run();
