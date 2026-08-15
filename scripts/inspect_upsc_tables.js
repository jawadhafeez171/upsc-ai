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

const SubjectTableMap = {
  'Ancient History': 'PYQ Ancient History',
  'Medieval History': 'PYQ Medieval Hisotry',
  'Art and Culture': 'PYQ Art and Culture',
  'Modern History': 'PYQ Modern History',
  'Polity': 'PYQ Polity',
  'Economics': 'PYQ Economics',
  'Geography': 'PYQ Geography',
  'Environment': 'PYQ Environement',
  'Science & Technology': 'PYQ Science&Tech',
  'IR and Current Affairs': 'PYQ IR and Current Affairs',
  'General Awareness': 'PYQ General Awareness'
};

async function testTables() {
  console.log("Checking Supabase tables for UPSC CSE...");
  let total = 0;
  for (const [sub, table] of Object.entries(SubjectTableMap)) {
    const { count, error, data } = await supabase.from(table).select('*', { count: 'exact' }).limit(1);
    if (error) {
      console.log(`❌ Table "${table}" (${sub}): Error ->`, error.message);
    } else {
      console.log(`✅ Table "${table}" (${sub}): ${count} rows`);
      total += (count || 0);
      if (data && data.length > 0) {
        console.log(`   Sample columns in "${table}":`, Object.keys(data[0]));
      }
    }
  }
  console.log(`\nTotal questions across UPSC tables: ${total}`);

  // Also check if there are other tables in Supabase
  const otherTables = ['kas_questions', 'questions', 'upsc_questions', 'pyq_questions'];
  for (const t of otherTables) {
    const { count, error } = await supabase.from(t).select('*', { count: 'exact', head: true });
    if (!error) {
      console.log(`Table "${t}": ${count} rows`);
    }
  }
}

testTables();
