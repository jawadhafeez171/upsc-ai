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
            
            // Handle missing profile or RLS gracefully by forcing a local fallback
            if (error || !data) {
                console.warn('[ProfileService] Profile not found or error. Falling back/creating default.', error?.message || error?.code || 'Unknown Error');
                
                // Create a default profile row if possible
                const newProfile = { id: userId, xp: 0, current_streak: 0, level_name: 'Aspirant', name: userName || 'Aspirant' };
                supabase.from('profiles').upsert(newProfile).then(({ error: upsertErr }) => {
                    if (upsertErr) console.warn('[ProfileService] Background upsert failed', upsertErr);
                });
                
                return { xp: 0, streak: 0, level: 'Aspirant' as User['level'], name: userName || 'Aspirant' };
            }

            // If the name in DB is missing but we have it from Auth, sync it back
            if ((!data.name || data.name === 'Aspirant') && userName && userName !== 'Aspirant') {
                supabase.from('profiles').update({ name: userName }).eq('id', userId).then();
            }

            return {
                xp: data.xp || 0,
                streak: data.current_streak || 0,
                level: (data.level_name as User['level']) || 'Aspirant',
                name: data.name || userName || 'Aspirant'
            };
        } catch (err) {
            console.error('[ProfileService] Fatal crash in fetchProfile:', err);
            return { xp: 0, streak: 0, level: 'Aspirant' as User['level'], name: userName || 'Aspirant' };
        }
    },

    /**
     * Push XP and level changes to the database
     */
    async updateXP(userId: string, newXP: number) {
        const { error } = await supabase.from('profiles').update({
            xp: newXP,
            level_name: computeLevel(newXP)
        }).eq('id', userId);
        
        if (error) console.error('Error updating XP in Supabase:', error);
    },

    /**
     * Push Streak changes to the database
     */
    async updateStreak(userId: string, newStreak: number) {
        // Also keep track of longest_streak optionally, but basic update for now
        const { error } = await supabase.rpc('update_user_streak', { user_id: userId, new_streak: newStreak }).then(async (res) => {
            // If RPC doesn't exist, fallback to simple update
            if (res.error?.code === '42883') {
               return await supabase.from('profiles').update({ current_streak: newStreak }).eq('id', userId);
            }
            return res;
        });

        if (error) console.error('Error updating streak:', error);
    }
};
