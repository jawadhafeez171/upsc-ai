'use client';
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';
import { useAppStore } from '@/lib/store';
import { Mail, Lock, ArrowRight, Eye, EyeOff } from 'lucide-react';

const GoogleIcon = () => (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
        <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
        <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
        <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
    </svg>
);

export default function LoginPage() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [showPass, setShowPass] = useState(false);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const router = useRouter();
    const { user } = useAppStore();

    useEffect(() => {
        if (user) router.replace('/dashboard');
    }, [user, router]);

    const handleGoogleLogin = async () => {
        setLoading(true);
        const { error } = await supabase.auth.signInWithOAuth({
            provider: 'google',
            options: { redirectTo: `${window.location.origin}/dashboard` }
        });
        if (error) { setError(error.message); setLoading(false); }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setError('');
        if (!email || !password) return;
        setLoading(true);
        const { error: authError } = await supabase.auth.signInWithPassword({ email, password });
        if (authError) {
            setError(authError.message === 'Invalid login credentials'
                ? 'Wrong email or password. Please try again.'
                : authError.message);
            setLoading(false);
            return;
        }
        router.push('/dashboard');
    };

    return (
        <div style={{ minHeight: 'calc(100vh - 64px)', display: 'flex' }}>
            {/* Left Brand Panel */}
            <div className="hidden-mobile" style={{
                flex: '1', background: 'linear-gradient(135deg, #0D1628 0%, #070E1C 100%)',
                display: 'flex', flexDirection: 'column', justifyContent: 'center', alignItems: 'center',
                padding: '48px', position: 'relative', overflow: 'hidden',
                borderRight: '1px solid var(--border)',
            }}>
                {/* Glow effects */}
                <div style={{ position: 'absolute', top: '20%', left: '30%', width: 300, height: 300, borderRadius: '50%', background: 'radial-gradient(circle, rgba(242,107,29,0.15) 0%, transparent 70%)', pointerEvents: 'none' }} />
                <div style={{ position: 'absolute', bottom: '20%', right: '20%', width: 200, height: 200, borderRadius: '50%', background: 'radial-gradient(circle, rgba(26,190,170,0.1) 0%, transparent 70%)', pointerEvents: 'none' }} />

                <div style={{ position: 'relative', zIndex: 1, textAlign: 'center', maxWidth: '360px' }}>
                    <div style={{ fontSize: '56px', marginBottom: '24px' }}>🎯</div>
                    <h2 style={{ fontSize: '32px', fontWeight: 900, letterSpacing: '-0.8px', marginBottom: '16px', color: '#EEF2FF' }}>
                        Your prep. <br />
                        <span style={{ background: 'linear-gradient(135deg, #F26B1D, #F59E0B)', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent', backgroundClip: 'text' }}>Elevated.</span>
                    </h2>
                    <p style={{ color: '#94A3B8', fontSize: '15px', lineHeight: 1.7 }}>
                        Join thousands of aspirants who trust MockIQ for their UPSC and KPSC preparation.
                    </p>
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '12px', marginTop: '40px', textAlign: 'left' }}>
                        {['8+ exam formats covered', 'Subject-wise analytics', 'Multilingual support', 'Instant result feedback'].map((item) => (
                            <div key={item} style={{ display: 'flex', alignItems: 'center', gap: '10px', color: '#94A3B8', fontSize: '14px' }}>
                                <span style={{ width: 6, height: 6, borderRadius: '50%', background: 'var(--brand-orange)', flexShrink: 0, boxShadow: '0 0 8px var(--brand-orange)' }} />
                                {item}
                            </div>
                        ))}
                    </div>
                </div>
            </div>

            {/* Right Form Panel */}
            <div style={{
                flex: '1', display: 'flex', alignItems: 'center', justifyContent: 'center',
                padding: '40px 24px',
            }}>
                <div style={{ width: '100%', maxWidth: '400px' }} className="fade-in-up">
                    <div style={{ marginBottom: '36px' }}>
                        <h1 style={{ fontSize: '28px', fontWeight: 800, letterSpacing: '-0.5px', marginBottom: '6px' }}>Welcome back</h1>
                        <p style={{ color: 'var(--text-secondary)', fontSize: '14px' }}>Continue your preparation journey</p>
                    </div>

                    {error && (
                        <div style={{
                            background: 'rgba(244,63,94,0.08)', border: '1px solid rgba(244,63,94,0.25)',
                            borderRadius: '10px', padding: '12px 16px', marginBottom: '20px',
                            fontSize: '14px', color: '#F43F5E',
                        }}>
                            ⚠️ {error}
                        </div>
                    )}

                    <button
                        onClick={handleGoogleLogin}
                        disabled={loading}
                        className="btn btn-secondary"
                        style={{ width: '100%', padding: '12px', fontSize: '14px', display: 'flex', gap: '10px', justifyContent: 'center', marginBottom: '20px' }}
                    >
                        <GoogleIcon />
                        Continue with Google
                    </button>

                    <div style={{ display: 'flex', alignItems: 'center', gap: '12px', marginBottom: '20px' }}>
                        <div style={{ flex: 1, height: '1px', background: 'var(--border)' }} />
                        <span style={{ fontSize: '12px', color: 'var(--text-muted)', fontWeight: 500 }}>or continue with email</span>
                        <div style={{ flex: 1, height: '1px', background: 'var(--border)' }} />
                    </div>

                    <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                        <div>
                            <label style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', display: 'block', marginBottom: '6px' }}>
                                <Mail size={13} style={{ display: 'inline', marginRight: '6px', verticalAlign: 'middle' }} />Email
                            </label>
                            <input
                                className="input"
                                type="email"
                                placeholder="you@example.com"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                                autoComplete="email"
                            />
                        </div>
                        <div>
                            <label style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', display: 'block', marginBottom: '6px' }}>
                                <Lock size={13} style={{ display: 'inline', marginRight: '6px', verticalAlign: 'middle' }} />Password
                            </label>
                            <div style={{ position: 'relative' }}>
                                <input
                                    className="input"
                                    type={showPass ? 'text' : 'password'}
                                    placeholder="••••••••"
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                    required
                                    autoComplete="current-password"
                                    style={{ paddingRight: '44px' }}
                                />
                                <button type="button" onClick={() => setShowPass(!showPass)} style={{ position: 'absolute', right: '12px', top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', cursor: 'pointer', color: 'var(--text-muted)' }}>
                                    {showPass ? <EyeOff size={16} /> : <Eye size={16} />}
                                </button>
                            </div>
                        </div>
                        <button
                            type="submit"
                            className="btn btn-primary"
                            style={{ padding: '14px', fontSize: '15px', marginTop: '4px', width: '100%' }}
                            disabled={loading}
                        >
                            {loading ? '⏳ Signing in…' : <><ArrowRight size={16} /> Sign In</>}
                        </button>
                    </form>

                    <p style={{ textAlign: 'center', marginTop: '28px', fontSize: '13px', color: 'var(--text-muted)' }}>
                        New here?{' '}
                        <Link href="/register" style={{ color: 'var(--brand-orange)', fontWeight: 600, textDecoration: 'none' }}>Create a free account</Link>
                    </p>
                </div>
            </div>
        </div>
    );
}
