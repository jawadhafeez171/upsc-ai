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

async function cleanSurplus() {
  const idsToRemove = [
    'intl-relations-2016-171',
    'intl-relations-2016-172',
    'intl-relations-2012-177',
    'economics-2012-313'
  ];

  for (const id of idsToRemove) {
    await supabase.from('upsc_questions').delete().eq('id', id);
    console.log(`Deleted surplus: ${id}`);
  }
}

cleanSurplus();
