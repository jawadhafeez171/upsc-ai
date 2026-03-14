import { Metadata } from 'next';
import { supabase } from '@/lib/supabase';
import ExamsClient from './ExamsClient';

export const metadata: Metadata = {
    title: 'Exam Catalog | Practice UPSC & KPSC Mock Tests',
    description: 'Browse our collection of free mock tests for UPSC, KPSC, PSI, and other competitive exams. Available in English and Kannada.',
    openGraph: {
        title: 'Exam Mock Test Catalog | UPSC AI',
        description: 'Select from a wide range of UPSC and KPSC mock tests. Practice subject-wise or full mocks.',
    }
};

export default async function ExamsPage() {
    // Fetch initial exams on the server
    const { data: examsData } = await supabase.from('exams').select('*').order('created_at', { ascending: true });

    return <ExamsClient initialExams={examsData || []} />;
}
