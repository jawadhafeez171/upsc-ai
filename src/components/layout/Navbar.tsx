'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { BookOpen, Newspaper, Trophy, LogIn, LogOut, Menu, X, Sun, Moon } from 'lucide-react';
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
        <nav style={{
            position: 'fixed', top: 0, left: 0, right: 0, zIndex: 50,
            background: 'var(--nav-bg)', backdropFilter: 'blur(16px)',
            borderBottom: '1px solid var(--border)', height: '68px',
            display: 'flex', alignItems: 'center', padding: '0 20px',
            justifyContent: 'space-between',
        }}>
            {/* Logo */}
            <Link href="/" style={{ display: 'flex', alignItems: 'center', gap: '12px', textDecoration: 'none' }}>
                {/* Cropped Logo Icon */}
                <div style={{
                    width: '42px',
                    height: '42px',
                    overflow: 'hidden',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'flex-start',
                    borderRadius: '50%',
                    background: '#FAF8F5',
                    padding: '2px',
                    boxShadow: '0 1px 3px rgba(0,0,0,0.06)',
                    flexShrink: 0,
                    lineHeight: 0,
                }}>
                    <img
                        src="/mIQ_logo.png"
                        alt="MockIQ Icon"
                        style={{ height: '38px', width: 'auto', maxWidth: 'none', display: 'block' }}
                    />
                </div>
                
                {/* Text Brand */}
                <div style={{ display: 'flex', flexDirection: 'column', lineHeight: 1.15 }}>
                    <div style={{ fontSize: '22px', fontWeight: 800, letterSpacing: '-0.5px', fontFamily: 'inherit' }}>
                        <span style={{ color: '#082C54' }}>MockI</span>
                        <span style={{ color: '#B83E11' }}>Q</span>
                    </div>
                    <RotatingTagline />
                </div>
            </Link>

            {/* Desktop nav */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '2px' }} className="hidden-mobile">
                {NAV_LINKS.map((link) => {
                    const active = pathname === link.href || (link.href !== '/' && pathname?.startsWith(link.href));
                    return (
                        <Link key={link.href} href={link.href} style={{
                            padding: '6px 12px', borderRadius: '8px', textDecoration: 'none',
                            fontSize: '14px', fontWeight: 500,
                            color: active ? 'var(--text-primary)' : 'var(--text-secondary)',
                            background: active ? 'var(--bg-secondary)' : 'transparent',
                            transition: 'all 0.15s',
                        }}>
                            {t(link.labelKey, language as Language)}
                        </Link>
                    );
                })}
            </div>

            {/* Right controls */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                {/* Language switcher */}
                <div className="hidden-mobile" style={{ display: 'flex', gap: '2px', background: 'var(--bg-secondary)', borderRadius: '8px', padding: '3px' }}>
                    {LANGS.map((l) => (
                        <button key={l.code} onClick={() => setLanguage(l.code)} style={{
                            padding: '4px 10px', borderRadius: '6px', border: 'none', cursor: 'pointer',
                            fontSize: '12px', fontWeight: 600,
                            background: language === l.code ? 'var(--brand-orange)' : 'transparent',
                            color: language === l.code ? 'white' : 'var(--text-secondary)',
                            transition: 'all 0.15s',
                        }}>{l.label}</button>
                    ))}
                </div>

                {/* Theme toggle */}
                <button
                    onClick={toggleTheme}
                    title={theme === 'dark' ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
                    style={{
                        width: 34, height: 34, borderRadius: '8px',
                        background: 'var(--bg-secondary)', border: 'none', cursor: 'pointer',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        color: theme === 'dark' ? '#F59E0B' : 'var(--text-secondary)',
                        transition: 'all 0.2s', flexShrink: 0,
                    }}
                >
                    {theme === 'dark' ? <Sun size={15} /> : <Moon size={15} />}
                </button>

                {user ? (
                    <>
                        <Link href="/dashboard" style={{ textDecoration: 'none', display: 'flex', alignItems: 'center', gap: '8px' }}>
                            <div style={{
                                width: 32, height: 32, borderRadius: '50%',
                                background: 'var(--accent-peach)',
                                display: 'flex', alignItems: 'center', justifyContent: 'center',
                                fontSize: '14px', fontWeight: 700, color: '#8B4513',
                            }}>
                                {user.name[0].toUpperCase()}
                            </div>
                            <div className="hidden-mobile">
                                <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-primary)', lineHeight: 1.2 }}>{user.name.split(' ')[0]}</div>
                                <div style={{ fontSize: '11px', color: 'var(--brand-orange)', lineHeight: 1 }}>{user.xp} XP</div>
                            </div>
                        </Link>
                        <button onClick={handleLogout} className="btn btn-secondary hidden-mobile" style={{ padding: '6px 12px', fontSize: '13px' }}>
                            <LogOut size={14} /> <span>{t('logout', language as Language)}</span>
                        </button>
                    </>
                ) : (
                    <Link href="/login" className="btn btn-primary" style={{ padding: '6px 14px', fontSize: '13px' }}>
                        <LogIn size={14} /> {t('login', language as Language)}
                    </Link>
                )}

                {/* Mobile menu toggle */}
                <button onClick={() => setMenuOpen(!menuOpen)} style={{ background: 'none', border: 'none', color: 'var(--text-primary)', cursor: 'pointer', display: 'none' }} className="show-mobile">
                    {menuOpen ? <X size={22} /> : <Menu size={22} />}
                </button>
            </div>

            {/* Mobile menu */}
            {menuOpen && (
                <div style={{
                    position: 'absolute', top: '68px', left: 0, right: 0,
                    background: 'var(--bg-card)', borderBottom: '1px solid var(--border)',
                    padding: '12px', display: 'flex', flexDirection: 'column', gap: '4px',
                    boxShadow: 'var(--shadow-card)',
                }}>
                    {NAV_LINKS.map((link) => (
                        <Link key={link.href} href={link.href} onClick={() => setMenuOpen(false)} style={{
                            padding: '10px 14px', borderRadius: '8px', textDecoration: 'none',
                            color: 'var(--text-primary)', fontWeight: 500, fontSize: '15px',
                            background: pathname === link.href ? 'var(--bg-secondary)' : 'transparent',
                            display: 'flex', alignItems: 'center', gap: '10px',
                        }}>
                            <span>{link.emoji}</span>
                            {t(link.labelKey, language as Language)}
                        </Link>
                    ))}
                    
                    {/* Language switcher */}
                    <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', marginTop: '4px' }}>
                        <div style={{ fontSize: '12px', fontWeight: 500, color: 'var(--text-muted)', paddingLeft: '14px', marginBottom: '6px' }}>
                            {language === 'kn' ? 'ಭಾಷೆಯನ್ನು ಆರಿಸಿ' : language === 'hi' ? 'भाषा चुनें' : 'Choose Language'}
                        </div>
                        <div style={{ display: 'flex', gap: '4px', background: 'var(--bg-secondary)', borderRadius: '8px', padding: '3px', width: 'fit-content', marginLeft: '14px' }}>
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
                        <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '10px 14px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <div style={{
                                    width: 30, height: 30, borderRadius: '50%',
                                    background: 'var(--accent-peach)',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontSize: '12px', fontWeight: 700, color: '#8B4513',
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
