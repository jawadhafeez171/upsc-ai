'use client';
import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import { User, TestSession, Language, Badge } from '@/types';
import { ALL_BADGES } from '@/lib/mockData';
import { supabase } from '@/lib/supabase';
import { profileService } from '@/lib/profileService';

interface AppState {
    // Auth
    user: User | null;
    setUser: (user: User | null) => void;
    logout: () => void;
    // Language
    language: Language;
    setLanguage: (lang: Language) => void;
    // Active test session
    activeSession: TestSession | null;
    setActiveSession: (session: TestSession | null) => void;
    // Past sessions
    completedSessions: TestSession[];
    addCompletedSession: (session: TestSession) => void;
    // XP / Gamification
    syncProgress: (xpEarned: number, session: TestSession) => Promise<Badge[]>;
    checkAndAwardBadges: (session: TestSession) => Badge[];
}

function computeLevel(xp: number): User['level'] {
    if (xp >= 3000) return 'Legend';
    if (xp >= 1500) return 'Expert';
    if (xp >= 500) return 'Scholar';
    return 'Aspirant';
}

export const useAppStore = create<AppState>()(
    persist(
        (set, get) => ({
            user: null,
            language: 'en',
            activeSession: null,
            completedSessions: [],

            setUser: (user) => set({ user }),

            logout: () => {
                supabase.auth.signOut();
                set({ user: null, activeSession: null });
            },

            setLanguage: (lang) => {
                set({ language: lang });
                const user = get().user;
                if (user) set({ user: { ...user, language: lang } });
            },

            setActiveSession: (session) => set({ activeSession: session }),

            addCompletedSession: (session) =>
                set((state) => ({ completedSessions: [session, ...state.completedSessions] })),

            syncProgress: async (xpEarned, session) => {
                const user = get().user;
                if (!user) return [];
                
                // 1. Update core stats in Supabase
                const result = await profileService.updateProgress(
                    user.id, 
                    xpEarned, 
                    user.xp, 
                    user.streak, 
                    user.last_active
                );
                
                // 2. Local badge evaluation
                const earnedBadges = get().checkAndAwardBadges(session);
                
                // 3. Update local state
                const updatedUser = { 
                    ...user, 
                    xp: result.newXP, 
                    streak: result.newStreak, 
                    level: result.newLevel, 
                    last_active: new Date().toISOString(),
                    badges: [...user.badges, ...earnedBadges]
                };
                
                // 4. If badges were earned, update cloud again
                if (earnedBadges.length > 0) {
                    await supabase.from('profiles').update({ badges: updatedUser.badges }).eq('id', user.id);
                }

                set({ user: updatedUser });
                return earnedBadges;
            },

            checkAndAwardBadges: (session) => {
                const user = get().user;
                if (!user) return [];
                const earned: Badge[] = [];
                const existingTypes = new Set(user.badges.map((b) => b.type));

                const addBadge = (type: string) => {
                    if (!existingTypes.has(type)) {
                        const def = ALL_BADGES.find((b) => b.type === type);
                        if (def) earned.push({ ...def, earned_at: new Date().toISOString() });
                    }
                };

                // First test
                if (get().completedSessions.length === 0) addBadge('first-test');
                // Perfect score
                const pct = session.score! / session.total_marks! * 100;
                if (pct === 100) addBadge('perfect-score');
                // Streak badges
                if (user.streak >= 7) addBadge('streak-7');
                if (user.streak >= 30) addBadge('streak-30');
                // Kannada test
                if (session.config.language === 'kn') addBadge('multilingual');

                if (earned.length > 0) {
                    set({ user: { ...user, badges: [...user.badges, ...earned] } });
                }
                return earned;
            },
        }),
        {
            name: 'upsc-ai-store',
            partialize: (state) => ({
                user: state.user,
                language: state.language,
                completedSessions: state.completedSessions,
            }),
        }
    )
);
