'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { BookOpen, Newspaper, Trophy, LogIn, LogOut, Menu, X, Sun, Moon, LayoutDashboard } from 'lucide-react';
import { Language } from '@/types';
import { t } from '@/lib/i18n';
import { useTheme } from '@/components/layout/ThemeProvider';
import RotatingTagline from './RotatingTagline';

const NAV_LINKS = [
    { href: '/', labelKey: 'home', icon: BookOpen, emoji: '🏠' },
    { href: '/exams', labelKey: 'exams', icon: BookOpen, emoji: '📚' },
    { href: '/current-affairs', labelKey: 'currentAffairs', icon: Newspaper, emoji: '📰' },
    { href: '/leaderboard', labelKey: 'leaderboard', icon: Trophy, emoji: '🏆' },
];

const LANGS: { code: Language; label: string }[] = [
    { code: 'en', label: 'EN' },
    { code: 'hi', label: 'हि' },
    { code: 'kn', label: 'ಕ' },
];

export default function Navbar() {
    const pathname = usePathname();
    const router = useRouter();
    const { user, logout, language, setLanguage } = useAppStore();
    const [menuOpen, setMenuOpen] = useState(false);
    const { theme, toggleTheme } = useTheme();

    const handleLogout = () => { logout(); router.push('/'); };

    return (
        <>
            <nav style={{
                position: 'fixed', top: '12px', left: '50%', transform: 'translateX(-50%)', zIndex: 50,
                width: 'calc(100% - 32px)', maxWidth: '1240px',
                background: 'var(--nav-bg)',
                backdropFilter: 'blur(20px)',
                WebkitBackdropFilter: 'blur(20px)',
                border: '1px solid var(--border)',
                borderRadius: '16px',
                height: '60px',
                display: 'flex', alignItems: 'center', padding: '0 20px',
                justifyContent: 'space-between',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.12)',
                transition: 'all 0.3s ease',
            }}>
                {/* Logo */}
                <Link href="/" style={{ display: 'flex', alignItems: 'center', gap: '10px', textDecoration: 'none', flexShrink: 0 }}>
                    <div style={{
                        width: '36px', height: '36px', overflow: 'hidden',
                        display: 'flex', alignItems: 'center', justifyContent: 'flex-start',
                        borderRadius: '10px',
                        background: theme === 'dark' ? 'rgba(255,255,255,0.08)' : '#F0EDE8',
                        padding: '2px', flexShrink: 0, lineHeight: 0,
                        border: '1px solid var(--border)',
                    }}>
                        <img src="/mIQ_logo.png" alt="MockIQ" style={{ height: '32px', width: 'auto', maxWidth: 'none', display: 'block' }} />
                    </div>
                    <div style={{ display: 'flex', flexDirection: 'column', lineHeight: 1.15 }}>
                        <div style={{ fontSize: '19px', fontWeight: 800, letterSpacing: '-0.5px', fontFamily: 'Inter, inherit' }}>
                            <span style={{ color: 'var(--text-primary)' }}>MockI</span>
                            <span style={{ color: 'var(--brand-orange)' }}>Q</span>
                        </div>
                        <RotatingTagline />
                    </div>
                </Link>

                {/* Desktop nav links */}
                <div style={{ display: 'flex', alignItems: 'center', gap: '4px', background: 'var(--bg-card)', padding: '4px', borderRadius: '12px', border: '1px solid var(--border)' }} className="hidden-mobile">
                    {NAV_LINKS.map((link) => {
                        const active = pathname === link.href || (link.href !== '/' && pathname?.startsWith(link.href));
                        return (
                            <Link key={link.href} href={link.href} style={{
                                padding: '6px 14px', borderRadius: '8px', textDecoration: 'none',
                                fontSize: '13px', fontWeight: active ? 700 : 500,
                                color: active ? 'white' : 'var(--text-secondary)',
                                background: active ? 'var(--brand-orange)' : 'transparent',
                                transition: 'all 0.2s ease',
                                boxShadow: active ? '0 2px 10px rgba(37,99,235,0.3)' : 'none',
                            }}>
                                {t(link.labelKey, language as Language)}
                            </Link>
                        );
                    })}
                </div>

                {/* Right controls */}
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                    {/* Language switcher */}
                    <div className="hidden-mobile" style={{ display: 'flex', gap: '2px', background: 'var(--bg-card)', borderRadius: '10px', padding: '3px', border: '1px solid var(--border)' }}>
                        {LANGS.map((l) => (
                            <button key={l.code} onClick={() => setLanguage(l.code)} style={{
                                padding: '4px 10px', borderRadius: '7px', border: 'none', cursor: 'pointer',
                                fontSize: '12px', fontWeight: 700,
                                background: language === l.code ? 'var(--brand-orange)' : 'transparent',
                                color: language === l.code ? 'white' : 'var(--text-secondary)',
                                transition: 'all 0.15s ease',
                            }}>{l.label}</button>
                        ))}
                    </div>

                    {/* Theme toggle */}
                    <button
                        onClick={toggleTheme}
                        title={theme === 'dark' ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
                        style={{
                            width: 36, height: 36, borderRadius: '10px',
                            background: 'var(--bg-card)', border: '1px solid var(--border)',
                            cursor: 'pointer',
                            display: 'flex', alignItems: 'center', justifyContent: 'center',
                            color: theme === 'dark' ? '#F59E0B' : 'var(--text-secondary)',
                            transition: 'all 0.2s', flexShrink: 0,
                        }}
                    >
                        {theme === 'dark' ? <Sun size={16} /> : <Moon size={16} />}
                    </button>

                    {user ? (
                        <>
                            <Link href="/dashboard" style={{ textDecoration: 'none', display: 'flex', alignItems: 'center', gap: '10px' }}>
                                <div style={{
                                    display: 'flex', alignItems: 'center', gap: '6px',
                                    background: 'rgba(217, 119, 6, 0.12)', border: '1px solid rgba(217, 119, 6, 0.3)',
                                    borderRadius: '20px', padding: '4px 10px', fontSize: '12px', fontWeight: 700,
                                    color: 'var(--brand-gold)',
                                }} className="hidden-mobile">
                                    <span>🔥</span> <span>{user.streak || 3}d</span>
                                </div>

                                <div style={{
                                    width: 36, height: 36, borderRadius: '50%',
                                    background: 'linear-gradient(135deg, var(--brand-orange), var(--brand-orange-dim))',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontSize: '14px', fontWeight: 800, color: 'white',
                                    boxShadow: '0 2px 12px rgba(37,99,235,0.4)',
                                }}>
                                    {user.name[0].toUpperCase()}
                                </div>
                            </Link>
                            <button onClick={handleLogout} className="btn btn-ghost hidden-mobile" style={{ padding: '6px 10px', fontSize: '13px' }}>
                                <LogOut size={15} /> <span>{t('logout', language as Language)}</span>
                            </button>
                        </>
                    ) : (
                        <Link href="/login" className="btn btn-primary" style={{ padding: '7px 16px', fontSize: '13px', borderRadius: '10px' }}>
                            <LogIn size={14} /> {t('login', language as Language)}
                        </Link>
                    )}

                    {/* Mobile menu toggle */}
                    <button onClick={() => setMenuOpen(!menuOpen)} style={{ background: 'none', border: 'none', color: 'var(--text-primary)', cursor: 'pointer', display: 'none', padding: '4px' }} className="show-mobile">
                        {menuOpen ? <X size={22} /> : <Menu size={22} />}
                    </button>
                </div>
            </nav>

            {/* Mobile menu */}
            {menuOpen && (
                <div style={{
                    position: 'fixed', top: '64px', left: 0, right: 0, zIndex: 49,
                    background: 'var(--nav-bg)', backdropFilter: 'blur(24px)',
                    WebkitBackdropFilter: 'blur(24px)',
                    borderBottom: '1px solid var(--border)',
                    padding: '12px', display: 'flex', flexDirection: 'column', gap: '4px',
                }}>
                    {NAV_LINKS.map((link) => (
                        <Link key={link.href} href={link.href} onClick={() => setMenuOpen(false)} style={{
                            padding: '12px 14px', borderRadius: '10px', textDecoration: 'none',
                            color: 'var(--text-primary)', fontWeight: 500, fontSize: '15px',
                            background: pathname === link.href ? 'var(--bg-card)' : 'transparent',
                            border: '1px solid transparent',
                            display: 'flex', alignItems: 'center', gap: '10px',
                        }}>
                            <span>{link.emoji}</span>
                            {t(link.labelKey, language as Language)}
                        </Link>
                    ))}

                    <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', marginTop: '4px' }}>
                        <div style={{ fontSize: '11px', fontWeight: 600, color: 'var(--text-muted)', paddingLeft: '14px', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                            Language
                        </div>
                        <div style={{ display: 'flex', gap: '4px', background: 'var(--bg-card)', borderRadius: '8px', padding: '3px', width: 'fit-content', marginLeft: '14px', border: '1px solid var(--border)' }}>
                            {LANGS.map((l) => (
                                <button key={l.code} onClick={() => { setLanguage(l.code); setMenuOpen(false); }} style={{
                                    padding: '6px 14px', borderRadius: '6px', border: 'none', cursor: 'pointer',
                                    fontSize: '12px', fontWeight: 600,
                                    background: language === l.code ? 'var(--brand-orange)' : 'transparent',
                                    color: language === l.code ? 'white' : 'var(--text-secondary)',
                                    transition: 'all 0.15s',
                                }}>{l.label}</button>
                            ))}
                        </div>
                    </div>

                    {user && (
                        <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '12px 14px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                                <div style={{
                                    width: 32, height: 32, borderRadius: '50%',
                                    background: 'linear-gradient(135deg, var(--brand-orange), var(--brand-orange-dim))',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontSize: '14px', fontWeight: 700, color: 'white',
                                }}>
                                    {user.name[0].toUpperCase()}
                                </div>
                                <div>
                                    <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-primary)', lineHeight: 1 }}>{user.name}</div>
                                    <div style={{ fontSize: '11px', color: 'var(--brand-orange)', lineHeight: 1, marginTop: '2px' }}>{user.xp} XP</div>
                                </div>
                            </div>
                            <button onClick={() => { handleLogout(); setMenuOpen(false); }} className="btn btn-danger" style={{ padding: '6px 10px', fontSize: '12px' }}>
                                <LogOut size={12} /> {t('logout', language as Language)}
                            </button>
                        </div>
                    )}
                </div>
            )}
        </>
    );
}
