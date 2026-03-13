'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { BookOpen, Newspaper, Trophy, LogIn, LogOut, Menu, X, Sun, Moon } from 'lucide-react';
import { Language } from '@/types';
import { useTheme } from '@/components/layout/ThemeProvider';

const NAV_LINKS = [
    { href: '/', label: 'Home', icon: BookOpen },
    { href: '/exams', label: 'Exams', icon: BookOpen },
    { href: '/current-affairs', label: 'Current Affairs', icon: Newspaper },
    { href: '/leaderboard', label: 'Leaderboard', icon: Trophy },
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
        <nav style={{
            position: 'fixed', top: 0, left: 0, right: 0, zIndex: 50,
            background: 'var(--nav-bg)', backdropFilter: 'blur(12px)',
            borderBottom: '1px solid var(--border)', height: '64px',
            display: 'flex', alignItems: 'center', padding: '0 24px',
            justifyContent: 'space-between',
        }}>
            {/* Logo */}
            <Link href="/" style={{ display: 'flex', alignItems: 'center', gap: '10px', textDecoration: 'none' }}>
                <div style={{
                    width: 36, height: 36, borderRadius: '10px',
                    background: 'linear-gradient(135deg, #6366F1, #8B5CF6)',
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                    fontSize: '18px',
                }}>🎯</div>
                <span style={{ fontWeight: 800, fontSize: '18px', letterSpacing: '-0.5px' }} className="gradient-text">
                    UPSC AI
                </span>
            </Link>

            {/* Desktop nav */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }} className="hidden-mobile">
                {NAV_LINKS.map((link) => {
                    const active = pathname === link.href || (link.href !== '/' && pathname?.startsWith(link.href));
                    return (
                        <Link key={link.href} href={link.href} style={{
                            padding: '8px 14px', borderRadius: '8px', textDecoration: 'none',
                            fontSize: '14px', fontWeight: 500,
                            color: active ? 'var(--text-primary)' : 'var(--text-secondary)',
                            background: active ? 'rgba(99, 102, 241, 0.15)' : 'transparent',
                            transition: 'all 0.2s',
                        }}>
                            {link.label}
                        </Link>
                    );
                })}
            </div>

            {/* Right: lang switcher + theme toggle + auth */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                {/* Language switcher */}
                <div style={{ display: 'flex', gap: '2px', background: 'var(--bg-card)', borderRadius: '8px', padding: '3px', border: '1px solid var(--border)' }}>
                    {LANGS.map((l) => (
                        <button key={l.code} onClick={() => setLanguage(l.code)} style={{
                            padding: '4px 10px', borderRadius: '6px', border: 'none', cursor: 'pointer',
                            fontSize: '12px', fontWeight: 600,
                            background: language === l.code ? 'linear-gradient(135deg, #6366F1, #8B5CF6)' : 'transparent',
                            color: language === l.code ? 'white' : 'var(--text-secondary)',
                            transition: 'all 0.2s',
                        }}>{l.label}</button>
                    ))}
                </div>

                {/* Theme toggle */}
                <button
                    onClick={toggleTheme}
                    title={theme === 'dark' ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
                    style={{
                        width: 36, height: 36, borderRadius: '10px', border: '1px solid var(--border)',
                        background: 'var(--bg-card)', cursor: 'pointer',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        color: theme === 'dark' ? '#F59E0B' : '#6366F1',
                        transition: 'all 0.25s ease',
                        flexShrink: 0,
                    }}
                >
                    {theme === 'dark' ? <Sun size={16} /> : <Moon size={16} />}
                </button>

                {user ? (
                    <>
                        <Link href="/dashboard" style={{ textDecoration: 'none', display: 'flex', alignItems: 'center', gap: '8px' }}>
                            <div style={{
                                width: 34, height: 34, borderRadius: '50%',
                                background: 'linear-gradient(135deg, #6366F1, #8B5CF6)',
                                display: 'flex', alignItems: 'center', justifyContent: 'center',
                                fontSize: '14px', fontWeight: 700, color: 'white',
                            }}>
                                {user.name[0].toUpperCase()}
                            </div>
                            <div className="hidden-mobile">
                                <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-primary)', lineHeight: 1 }}>{user.name.split(' ')[0]}</div>
                                <div style={{ fontSize: '11px', color: 'var(--accent-amber)', lineHeight: 1 }}>{user.xp} XP</div>
                            </div>
                        </Link>
                        <button onClick={handleLogout} className="btn btn-secondary" style={{ padding: '8px 12px', fontSize: '13px' }}>
                            <LogOut size={14} /> <span className="hidden-mobile">Logout</span>
                        </button>
                    </>
                ) : (
                    <Link href="/login" className="btn btn-primary" style={{ padding: '8px 16px', fontSize: '13px' }}>
                        <LogIn size={14} /> Login
                    </Link>
                )}

                {/* Mobile menu toggle */}
                <button onClick={() => setMenuOpen(!menuOpen)} style={{ background: 'none', border: 'none', color: 'var(--text-primary)', cursor: 'pointer', display: 'none' }} className="show-mobile">
                    {menuOpen ? <X size={24} /> : <Menu size={24} />}
                </button>
            </div>

            {/* Mobile menu */}
            {menuOpen && (
                <div style={{
                    position: 'absolute', top: '64px', left: 0, right: 0,
                    background: 'var(--bg-secondary)', borderBottom: '1px solid var(--border)',
                    padding: '16px', display: 'flex', flexDirection: 'column', gap: '4px',
                }}>
                    {NAV_LINKS.map((link) => (
                        <Link key={link.href} href={link.href} onClick={() => setMenuOpen(false)} style={{
                            padding: '12px 16px', borderRadius: '8px', textDecoration: 'none',
                            color: 'var(--text-primary)', fontWeight: 500, fontSize: '15px',
                            background: pathname === link.href ? 'rgba(99, 102, 241, 0.15)' : 'transparent',
                        }}>
                            {link.label}
                        </Link>
                    ))}
                </div>
            )}

            <style>{`
        @media (max-width: 768px) {
          .hidden-mobile { display: none !important; }
          .show-mobile { display: flex !important; }
        }
        .show-mobile { display: none; }
      `}</style>
        </nav>
    );
}
