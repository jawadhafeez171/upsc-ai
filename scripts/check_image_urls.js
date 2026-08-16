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

async function checkImages() {
  console.log("=========================================");
  console.log("CHECKING IMAGE_URL VALUES IN SUPABASE");
  console.log("=========================================");

  // 1. upsc_questions
  const { data: upscImages } = await supabase
    .from('upsc_questions')
    .select('id, image_url')
    .not('image_url', 'is', null);

  console.log(`\nupsc_questions with non-null image_url: ${upscImages?.length || 0}`);
  const upscDistinct = new Set();
  (upscImages || []).forEach(r => upscDistinct.add(r.image_url));
  console.log("upsc_questions distinct image_url values:", Array.from(upscDistinct));

  // 2. kas_questions
  const { data: kasImages } = await supabase
    .from('kas_questions')
    .select('id, image_url')
    .not('image_url', 'is', null);

  console.log(`\nkas_questions with non-null image_url: ${kasImages?.length || 0}`);
  const kasDistinct = new Set();
  (kasImages || []).forEach(r => kasDistinct.add(r.image_url));
  console.log("kas_questions distinct image_url values:", Array.from(kasDistinct).slice(0, 10));
}

checkImages();
