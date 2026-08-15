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

const SubjectTableList = [
  'PYQ Ancient History',
  'PYQ Medieval Hisotry',
  'PYQ Art and Culture',
  'PYQ Modern History',
  'PYQ Polity',
  'PYQ Economics',
  'PYQ Geography',
  'PYQ Environement',
  'PYQ Science&Tech',
  'PYQ IR and Current Affairs',
  'PYQ General Awareness'
];

async function checkDifficulties() {
  for (const t of SubjectTableList) {
    const { data } = await supabase.from(t).select('difficulty');
    const diffs = {};
    (data || []).forEach(r => {
      diffs[r.difficulty] = (diffs[r.difficulty] || 0) + 1;
    });
    console.log(`${t}:`, diffs);
  }
}

checkDifficulties();
