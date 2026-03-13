require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');

const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY);

// Since we can't easily require TypeScript files in raw node without ts-node,
// let's read the mockData.ts file and extract the JSON directly via a quick regex.
const fileContent = fs.readFileSync('./src/lib/mockData.ts', 'utf8');

const examsMatch = fileContent.match(/export const mockExams: Exam\[\] = (\[[\s\S]*?\]);\n/);
const questionsMatch = fileContent.match(/export const mockQuestions: Question\[\] = (\[[\s\S]*?\]);\n/);

if (!examsMatch || !questionsMatch) {
  console.error("Could not parse mockData JSON.");
  process.exit(1);
}

// Convert string to runnable code to get the array
const mockExams = eval(examsMatch[1]);
const mockQuestions = eval(questionsMatch[1]);

async function seed() {
  console.log("Seeding exams...");
  const { error: eError } = await supabase.from('exams').upsert(
    mockExams.map(ex => ({
      id: ex.id,
      title: ex.title,
      description: ex.description,
      topics: ex.topics,
      difficulty: ex.difficulty,
      time_minutes: ex.timeMinutes,
      total_questions: ex.totalQuestions,
    }))
  );
  if (eError) { console.error("Exams Error:", eError); } else { console.log("Exams OK"); }

  console.log("Seeding questions...");
  const { error: qError } = await supabase.from('questions').upsert(
      mockQuestions.map(q => ({
          id: q.id,
          exam_id: q.examId,
          text_en: q.text.en,
          text_hi: q.text.hi || null,
          text_kn: q.text.kn || null,
          options_en: q.options.en,
          options_hi: q.options.hi || [],
          options_kn: q.options.kn || [],
          correct_index: q.correctIndex,
          explanation_en: q.explanation.en,
          explanation_hi: q.explanation.hi || null,
          explanation_kn: q.explanation.kn || null,
          subject: q.subject,
          difficulty: q.difficulty,
      }))
  );
  if (qError) { console.error("Questions Error:", qError); } else { console.log("Questions OK"); }
}

seed();
