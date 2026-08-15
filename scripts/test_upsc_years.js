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

async function checkYearCounts() {
  const years = [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011];
  for (const yr of years) {
    let yrTotal = 0;
    for (const t of SubjectTableList) {
      const { count } = await supabase.from(t).select('*', { count: 'exact', head: true }).eq('Year', yr);
      yrTotal += (count || 0);
    }
    console.log(`UPSC ${yr}: ${yrTotal} questions in database`);
  }
}

checkYearCounts();
