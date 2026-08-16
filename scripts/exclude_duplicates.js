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

const DUPLICATE_IDS_TO_EXCLUDE = [
  // 2023 (2 duplicates)
  'art-culture-2023-063',
  'medieval-regional-kingdoms-2023-028',

  // 2016 (2 surplus)
  'intl-relations-2016-171',
  'intl-relations-2016-172',

  // 2014 (1 duplicate)
  'art-culture-2014-076',

  // 2013 (2 duplicates)
  'art-culture-2013-047',
  'economics-2013-368',

  // 2012 (2 duplicates/surplus)
  'polity-2012-004',
  'intl-relations-2012-177',

  // 2011 (2 duplicates)
  'economics-2011-369',
  'intl-relations-2011-087'
];

async function excludeDuplicates() {
  console.log("==================================================");
  console.log("EXCLUDING REDUNDANT DUPLICATES (SET YEAR = -1)");
  console.log("==================================================");

  for (const id of DUPLICATE_IDS_TO_EXCLUDE) {
    const { data, error } = await supabase
      .from('upsc_questions')
      .update({ year: -1 })
      .eq('id', id)
      .select('id');

    if (error) {
      console.error(`❌ Failed to update ${id}:`, error.message);
    } else {
      console.log(`✅ Excluded duplicate: ${id}`);
    }
  }

  console.log("\nFinished excluding duplicates.");
}

excludeDuplicates();
