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

async function checkSubjects() {
  const { data } = await supabase.from('upsc_questions').select('subject');
  const counts = {};
  (data || []).forEach(r => {
    counts[r.subject] = (counts[r.subject] || 0) + 1;
  });
  console.log("Distinct subjects in upsc_questions:", counts);
}

checkSubjects();
