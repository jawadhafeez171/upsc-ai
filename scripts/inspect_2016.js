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

async function inspect2016() {
  const { data: qs } = await supabase
    .from('upsc_questions')
    .select('id, year, subject, text_en, options_en, source_table')
    .eq('year', 2016);

  console.log(`2016 has ${qs.length} questions:`);
  
  // Find overlaps with other questions in 2016
  for (let i = 0; i < qs.length; i++) {
    for (let j = i + 1; j < qs.length; j++) {
      const q1 = qs[i];
      const q2 = qs[j];
      const s1 = q1.text_en.toLowerCase().replace(/[^a-z0-9]/g, '');
      const s2 = q2.text_en.toLowerCase().replace(/[^a-z0-9]/g, '');
      
      // Dice coefficient or substring overlap
      if (s1.includes(s2.substring(0, 40)) || s2.includes(s1.substring(0, 40))) {
        console.log(`\nOverlap found:`);
        console.log(`Q1 [${q1.id}] (${q1.subject}, ${q1.source_table}): ${q1.text_en.substring(0, 80)}`);
        console.log(`Q2 [${q2.id}] (${q2.subject}, ${q2.source_table}): ${q2.text_en.substring(0, 80)}`);
      }
    }
  }
}

inspect2016();
