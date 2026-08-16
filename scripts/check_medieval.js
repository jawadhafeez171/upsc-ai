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

async function checkMedieval() {
  const { data, error } = await supabase.from('PYQ Medieval Hisotry').select('*').limit(5);
  console.log("PYQ Medieval Hisotry sample:", data?.[0]);
  
  const { data: upscMed } = await supabase.from('upsc_questions').select('*').ilike('source_table', '%Medieval%').limit(5);
  console.log("upsc_questions Medieval sample:", upscMed);
}

checkMedieval();
