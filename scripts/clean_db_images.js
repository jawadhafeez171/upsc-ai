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

async function cleanDatabaseImages() {
  console.log("=========================================");
  console.log("CLEANING INVALID IMAGE_URL STRINGS IN DATABASE");
  console.log("=========================================");

  // Set image_url = null where it equals 'None' or 'No' or 'null' in upsc_questions
  const { data: d1, error: e1 } = await supabase
    .from('upsc_questions')
    .update({ image_url: null })
    .in('image_url', ['None', 'No', 'no', 'none', 'null', 'NULL', 'false', 'N/A', ''])
    .select('id');

  console.log(`Cleaned upsc_questions: ${d1?.length || 0} rows reset to null. Error:`, e1?.message || 'none');

  // Also verify kas_questions
  const { data: d2, error: e2 } = await supabase
    .from('kas_questions')
    .update({ image_url: null })
    .in('image_url', ['None', 'No', 'no', 'none', 'null', 'NULL', 'false', 'N/A', ''])
    .select('id');

  console.log(`Cleaned kas_questions: ${d2?.length || 0} rows reset to null. Error:`, e2?.message || 'none');
}

cleanDatabaseImages();
