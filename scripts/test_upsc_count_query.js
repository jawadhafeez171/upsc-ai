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

async function checkCounts() {
  console.log("Checking count with head: true vs count: exact...");
  
  for (const tableName of SubjectTableList) {
    const { count: c1, error: e1 } = await supabase.from(tableName).select('*', { count: 'exact', head: true });
    const { count: c2, error: e2 } = await supabase.from(tableName).select('content_key', { count: 'exact', head: true });
    console.log(`${tableName} -> select('*'): ${c1} (err: ${e1?.message}), select('content_key'): ${c2} (err: ${e2?.message})`);
  }

  // Check Year data types
  const { data: sampleYears } = await supabase.from('PYQ Ancient History').select('Year, difficulty').limit(10);
  console.log("\nSample Years in Ancient History:", sampleYears);
}

checkCounts();
