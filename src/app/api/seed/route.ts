import { NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';
import { EXAMS, QUESTIONS } from '@/lib/mockData';

export async function GET() {
    try {
        console.log('Starting exact data migration...');

        // 1. Insert Exams
        const { error: examsError } = await supabase
            .from('exams')
            .upsert(EXAMS.map(ex => ({
                id: ex.id,
                title: ex.name,
                description: ex.description,
                topics: ex.subjects,
                difficulty: 'mixed', // mock data doesn't have exam-level difficulty, default to mixed
                time_minutes: 120,    // default to 120 mins
                total_questions: 100, // default to 100
            })));

        if (examsError) {
            console.error('Error seeding exams:', examsError);
            return NextResponse.json({ error: 'Failed to seed exams', details: examsError }, { status: 500 });
        }

        // 2. Insert Questions
        const { error: questionsError } = await supabase
            .from('questions')
            .upsert(QUESTIONS.map(q => ({
                id: q.id,
                exam_id: q.exam_id,
                text_en: q.text,
                text_hi: null,
                text_kn: q.text_kn || null,
                options_en: q.options.map(o => o.text),
                options_hi: [],
                options_kn: q.options.map(o => o.text_kn || ''),
                correct_index: q.options.findIndex(o => o.id === q.correct),
                explanation_en: q.explanation,
                explanation_hi: null,
                explanation_kn: q.explanation_kn || null,
                subject: q.subject,
                difficulty: q.difficulty,
            })));

        if (questionsError) {
            console.error('Error seeding questions:', questionsError);
            return NextResponse.json({ error: 'Failed to seed questions', details: questionsError }, { status: 500 });
        }

        return NextResponse.json({ success: true, message: `Successfully seeded ${EXAMS.length} exams and ${QUESTIONS.length} questions.` });
    } catch (err: any) {
        return NextResponse.json({ error: 'Unexpected error', details: err.message }, { status: 500 });
    }
}
