'use client';
import { useEffect } from 'react';
import { supabase } from '@/lib/supabase';
import { useAppStore } from '@/lib/store';
import { User } from '@/types';
import { profileService } from '@/lib/profileService';

function supabaseUserToAppUser(sbUser: NonNullable<Awaited<ReturnType<typeof supabase.auth.getUser>>['data']['user']>): User {
    return {
        id: sbUser.id,
        name: sbUser.user_metadata?.name ?? sbUser.email?.split('@')[0] ?? 'Aspirant',
        email: sbUser.email ?? '',
        xp: 0,
        level: 'Aspirant',
        streak: 0,
        last_active: new Date().toISOString(),
        badges: [],
        language: 'en',
    };
}

export default function AuthProvider({ children }: { children: React.ReactNode }) {
    const { setUser, user } = useAppStore();

    useEffect(() => {
        const syncUserWithProfile = async (sessionUser: any) => {
            const stored = useAppStore.getState().user;
            const userName = sessionUser.user_metadata?.name ?? sessionUser.email?.split('@')[0] ?? 'Aspirant';
            const profile = await profileService.fetchProfile(sessionUser.id, userName);
            
            if (profile) {
                setUser({
                    id: sessionUser.id,
                    name: sessionUser.user_metadata?.name ?? sessionUser.email?.split('@')[0] ?? 'Aspirant',
                    email: sessionUser.email ?? '',
                    xp: profile.xp,
                    level: profile.level,
                    streak: profile.streak,
                    last_active: stored?.id === sessionUser.id ? stored!.last_active : new Date().toISOString(),
                    badges: stored?.id === sessionUser.id ? stored!.badges : [],
                    language: stored?.id === sessionUser.id ? stored!.language : 'en',
                });
            } else if (stored && stored.id === sessionUser.id) {
                setUser({ ...stored, email: sessionUser.email ?? stored.email });
            } else {
                setUser(supabaseUserToAppUser(sessionUser));
            }
        };

        // 1. Restore session on mount
        supabase.auth.getSession().then(({ data: { session } }) => {
            if (session?.user) {
                document.cookie = `sb-auth=true; path=/; max-age=31536000; SameSite=Lax`;
                syncUserWithProfile(session.user);
            } else {
                document.cookie = `sb-auth=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT`;
                setUser(null);
            }
        });

        // 2. Listen for sign-in / sign-out events
        const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
            if (session?.user) {
                document.cookie = `sb-auth=true; path=/; max-age=31536000; SameSite=Lax`;
                syncUserWithProfile(session.user);
            } else {
                document.cookie = `sb-auth=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT`;
                setUser(null);
            }
        });

        return () => subscription.unsubscribe();
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    return <>{children}</>;
}
