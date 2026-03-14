import { MetadataRoute } from 'next';
import { supabase } from '@/lib/supabase';

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
    const baseUrl = 'https://upsc-ai.vercel.app';

    // Static routes
    const routes = [
        '',
        '/exams',
        '/dashboard',
        '/leaderboard',
        '/login',
        '/register',
    ].map((route) => ({
        url: `${baseUrl}${route}`,
        lastModified: new Date(),
    }));

    // Dynamic routes (Exams)
    const { data: exams } = await supabase.from('exams').select('id');
    const examRoutes = (exams || []).map((exam) => ({
        url: `${baseUrl}/exams/${exam.id}`,
        lastModified: new Date(),
    }));

    return [...routes, ...examRoutes];
}
