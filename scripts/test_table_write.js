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

async function test() {
  // Test 1: Check if upsc_questions exists
  const { data: d1, error: e1 } = await supabase.from('upsc_questions').select('*').limit(1);
  console.log("upsc_questions table check:", { error: e1?.message, data: d1 });

  // Test 2: Check questions table schema
  const { data: d2, error: e2 } = await supabase.from('questions').select('*').limit(1);
  console.log("questions table check:", { error: e2?.message, sample: d2?.[0] });

  // Test 3: Check kas_questions table schema
  const { data: d3, error: e3 } = await supabase.from('kas_questions').select('*').limit(1);
  console.log("kas_questions table check:", { error: e3?.message, sample: d3?.[0] });
}

test();
