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

async function verify() {
  console.log("=========================================");
  console.log("VERIFYING LIVE upsc_questions IN SUPABASE");
  console.log("=========================================");

  // 1. Total Count
  const { count: totalCount } = await supabase
    .from('upsc_questions')
    .select('id', { count: 'exact', head: true });

  console.log(`\n✅ Total questions in 'upsc_questions': ${totalCount}`);

  // 2. Year-wise counts
  const years = [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011];
  console.log("\n📅 Year-wise Telemetry:");
  for (const yr of years) {
    const { count } = await supabase
      .from('upsc_questions')
      .select('id', { count: 'exact', head: true })
      .eq('year', yr);
    console.log(`   - Year ${yr}: ${count} questions`);
  }

  // 3. Subject-wise counts
  console.log("\n📚 Subject-wise Telemetry:");
  const subjects = [
    'Ancient History', 'Medieval History', 'Art and Culture',
    'Modern History', 'Polity', 'Economics', 'Geography',
    'Environment', 'Science & Technology', 'IR & Current Affairs',
    'General Awareness'
  ];
  for (const sub of subjects) {
    const { count } = await supabase
      .from('upsc_questions')
      .select('id', { count: 'exact', head: true })
      .eq('subject', sub);
    console.log(`   - ${sub}: ${count} questions`);
  }

  // 4. Sample row
  const { data: sample } = await supabase
    .from('upsc_questions')
    .select('*')
    .limit(1);

  console.log("\n🔍 Sample Consolidated Question:");
  console.log(JSON.stringify(sample?.[0], null, 2));
}

verify();
