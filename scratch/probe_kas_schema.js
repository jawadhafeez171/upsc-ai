require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function testCols() {
  const candidateCols = [
    'node_id', 'secondary_node_ids', 'is_mapping', 'mapping', 
    'domain', 'domain_kannada', 'sub_topic', 'tags', 
    'passage_en', 'passage_kn', 'passage_english', 'passage_kannada'
  ];
  
  for (const col of candidateCols) {
    const val = (col === 'mapping') ? {} : ((col.includes('ids') || col === 'tags') ? [] : ((col === 'is_mapping') ? false : 'test'));
    const testObj = { id: 'test_col_probe', [col]: val };
    const { error } = await supabase.from('kas_questions').insert(testObj);
    if (error) {
      console.log(`Column '${col}': NOT PRESENT (${error.message})`);
    } else {
      console.log(`Column '${col}': EXISTS!`);
      await supabase.from('kas_questions').delete().eq('id', 'test_col_probe');
    }
  }
}
testCols();
