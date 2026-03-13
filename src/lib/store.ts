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
    addXP: (amount: number) => void;
    checkAndAwardBadges: (session: TestSession) => Badge[];
    updateStreak: () => void;
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

            addXP: (amount) => {
                const user = get().user;
                if (!user) return;
                const newXP = user.xp + amount;
                set({ user: { ...user, xp: newXP, level: computeLevel(newXP) } });
                
                // Fire and forget update to cloud
                profileService.updateXP(user.id, newXP);
            },

            updateStreak: () => {
                const user = get().user;
                if (!user) return;
                const lastActive = new Date(user.last_active);
                const today = new Date();
                const diffDays = Math.floor(
                    (today.setHours(0, 0, 0, 0) - lastActive.setHours(0, 0, 0, 0)) / 86400000
                );
                let newStreak = user.streak;
                if (diffDays === 1) newStreak += 1;
                else if (diffDays > 1) newStreak = 1;

                if (newStreak !== user.streak) {
                    profileService.updateStreak(user.id, newStreak);
                }
                
                set({ user: { ...user, streak: newStreak, last_active: new Date().toISOString() } });
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
