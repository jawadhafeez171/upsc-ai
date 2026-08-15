import { Metadata } from 'next';
import { supabase } from '@/lib/supabase';
import { EXAMS } from '@/lib/mockData';
import ExamsClient from './ExamsClient';

export const metadata: Metadata = {
    title: 'Competitive Exams Catalog | UPSC, KPSC, KEA, Police, Teaching & Defence Mocks',
    description: 'Comprehensive mock tests and career guides for UPSC CSE, KPSC KAS, KEA VAO, PDO, KSP PSI, KARTET, KSET, and CAPF/CDS. Available in English & Kannada.',
    openGraph: {
        title: 'Exam Mock Test Catalog | MockIQ',
        description: 'Select from UPSC, KPSC, KEA, Police, Teaching, and Defence mock tests. Practice subject-wise or full mocks with syllabus mastery tracking.',
    }
};

export default async function ExamsPage() {
    let examsList = EXAMS;

    try {
        const { data: examsData } = await supabase.from('exams').select('*').order('created_at', { ascending: true });
        if (examsData && examsData.length > 0) {
            // Merge database exams with rich local metadata
            examsList = EXAMS.map(localEx => {
                const dbEx = examsData.find(d => d.id === localEx.id);
                return dbEx ? { ...localEx, ...dbEx } : localEx;
            });
        }
    } catch (e) {
        console.error('Supabase exams fetch fallback to mockData:', e);
    }

    return <ExamsClient initialExams={examsList} />;
}
