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

async function checkSpecific() {
  const years = [2016, 2012];
  for (const yr of years) {
    const { count } = await supabase.from('upsc_questions').select('id', { count: 'exact', head: true }).eq('year', yr);
    console.log(`Year ${yr} current count: ${count}`);
  }
}

checkSpecific();
