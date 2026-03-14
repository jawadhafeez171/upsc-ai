import { supabase } from './supabase';
import { User } from '@/types';

// Helper to determine rank name based on XP
export function computeLevel(xp: number): User['level'] {
    if (xp >= 3000) return 'Legend';
    if (xp >= 1500) return 'Expert';
    if (xp >= 500) return 'Scholar';
    return 'Aspirant';
}

export const profileService = {
    /**
     * Fetch the user's latest stats from the database
     */
    async fetchProfile(userId: string, userName?: string) {
        try {
            const { data, error } = await supabase.from('profiles').select('*').eq('id', userId).single();
            
            if (error || !data) {
                console.warn('[ProfileService] Profile not found or error. Falling back/creating default.', error?.message || error?.code || 'Unknown Error');
                
                const newProfile = { id: userId, xp: 0, current_streak: 0, level_name: 'Aspirant', name: userName || 'Aspirant' };
                supabase.from('profiles').upsert(newProfile).then(({ error: upsertErr }) => {
                    if (upsertErr) console.warn('[ProfileService] Background upsert failed', upsertErr);
                });
                
                return { xp: 0, streak: 0, level: 'Aspirant' as User['level'], name: userName || 'Aspirant', badges: [], last_active: new Date().toISOString() };
            }

            if ((!data.name || data.name === 'Aspirant') && userName && userName !== 'Aspirant') {
                supabase.from('profiles').update({ name: userName }).eq('id', userId).then();
            }

            return {
                xp: data.xp || 0,
                streak: data.current_streak || 0,
                level: (data.level_name as User['level']) || 'Aspirant',
                name: data.name || userName || 'Aspirant',
                badges: data.badges || [],
                last_active: data.last_test_at || data.created_at
            };
        } catch (err) {
            console.error('[ProfileService] Fatal crash in fetchProfile:', err);
            return { xp: 0, streak: 0, level: 'Aspirant' as User['level'], name: userName || 'Aspirant', badges: [], last_active: new Date().toISOString() };
        }
    },

    /**
     * Update XP, Streak, and Badges after a test
     */
    async updateProgress(userId: string, xpEarned: number, currentXP: number, currentStreak: number, lastTestAt: string) {
        const now = new Date();
        const lastDate = lastTestAt ? new Date(lastTestAt) : null;
        
        let newStreak = currentStreak;
        
        if (!lastDate || currentStreak === 0) {
            newStreak = 1;
        } else {
            const isToday = now.toDateString() === lastDate.toDateString();
            const isYesterday = new Date(now.getTime() - 86400000).toDateString() === lastDate.toDateString();
            
            if (!isToday) {
                if (isYesterday) {
                    newStreak += 1;
                } else {
                    newStreak = 1; // Streak broken
                }
            }
        }

        const newXP = currentXP + xpEarned;
        const newLevel = computeLevel(newXP);

        const { error } = await supabase.from('profiles').update({
            xp: newXP,
            level_name: newLevel,
            current_streak: newStreak,
            last_test_at: now.toISOString()
        }).eq('id', userId);
        
        if (error) console.error('Error updating progress in Supabase:', error);
        return { newXP, newStreak, newLevel };
    }
};
