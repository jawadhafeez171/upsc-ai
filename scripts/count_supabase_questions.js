const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

const envContent = fs.readFileSync(path.join(__dirname, '..', '.env.local'), 'utf-8');
const env = {};
envContent.split('\n').forEach(line => {
  const [key, ...vals] = line.split('=');
  if (key && vals.length) {
    env[key.trim()] = vals.join('=').trim();
  }
});

const supabase = createClient(env['NEXT_PUBLIC_SUPABASE_URL'], env['NEXT_PUBLIC_SUPABASE_ANON_KEY']);

async function inspectSchemaAndQuestions() {
  const { data, error } = await supabase
    .from('questions')
    .select('*');

  if (error) {
    console.error("Error:", error);
    return;
  }

  console.log(`Total questions fetched: ${data.length}`);
  if (data.length > 0) {
    console.log("Sample question keys:", Object.keys(data[0]));
    console.log("Sample record:", JSON.stringify(data[0], null, 2));

    const testIdCounts = {};
    for (const q of data) {
      const tid = q.test_id || q.testId || 'unknown';
      testIdCounts[tid] = (testIdCounts[tid] || 0) + 1;
    }
    console.log("\nBreakdown by test_id:", testIdCounts);
  }

  // Check tests table as well
  const { data: tests, error: testErr } = await supabase.from('tests').select('*');
  if (!testErr && tests) {
    console.log(`\nTotal tests in 'tests' table: ${tests.length}`);
    console.log("Tests list:", tests.map(t => ({ id: t.id, title: t.title_en || t.title, questions_count: t.total_questions || t.totalQuestions })));
  }
}

inspectSchemaAndQuestions();
