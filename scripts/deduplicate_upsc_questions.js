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

// List of redundant duplicate IDs identified in 2011-2024
const DUPLICATE_IDS_TO_REMOVE = [
  // 2023 duplicates
  'medieval-regional-kingdoms-2023-028',
  'art-culture-2023-063',
  
  // 2016 duplicates
  'science-tech-2016-056',
  
  // 2014 duplicates
  'art-culture-2014-076',
  
  // 2013 duplicates
  'art-culture-2013-047',
  'economics-2013-368',
  
  // 2012 duplicates
  'polity-2012-004',
  
  // 2011 duplicates
  'economics-2011-369',
  'intl-relations-2011-087'
];

async function deduplicate() {
  console.log("==================================================");
  console.log("REMOVING REDUNDANT DUPLICATES FROM upsc_questions");
  console.log("==================================================");

  for (const id of DUPLICATE_IDS_TO_REMOVE) {
    const { error } = await supabase
      .from('upsc_questions')
      .delete()
      .eq('id', id);

    if (error) {
      console.error(`❌ Error deleting ${id}:`, error.message);
    } else {
      console.log(`✅ Deleted redundant duplicate: ${id}`);
    }
  }

  console.log("\nFinished removing duplicates.");
}

deduplicate();
