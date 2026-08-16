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

async function testInsert() {
  const testId = 'test-probe-1';
  const { data, error } = await supabase.from('questions').insert([{
    id: testId,
    exam_id: 'probe',
    text_en: 'Probe test',
    options_en: ['A', 'B', 'C', 'D'],
    correct_index: 0,
    explanation_en: 'Probe explanation',
    subject: 'Probe',
    difficulty: 'easy'
  }]).select();

  console.log("Insert result:", { error: error?.message, data });

  if (!error) {
    // Clean up
    await supabase.from('questions').delete().eq('id', testId);
    console.log("Cleaned up test row.");
  }
}

testInsert();
