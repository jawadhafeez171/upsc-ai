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

    // Hide general navbar on CBT testing screens
    if (pathname?.startsWith('/test/')) return null;

    const handleLogout = () => { logout(); router.push('/'); };

    return (
        <>
            <nav 
                className="navbar-pill"
                style={{
                    background: 'var(--bg-secondary)',
                    border: '1.5px solid var(--border)',
                    boxShadow: 'var(--shadow-card)',
                }}
            >
                {/* Logo */}
                <Link href="/" className="navbar-logo-link">
                    <div style={{
                        width: '34px', height: '34px', overflow: 'hidden',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        borderRadius: '6px',
                        background: '#2563EB',
                        padding: '2px', flexShrink: 0, lineHeight: 0,
                        border: '1px solid #1D4ED8',
                    }}>
                        <img src="/mIQ_logo.png" alt="MockIQ" style={{ height: '26px', width: 'auto', maxWidth: 'none', display: 'block', filter: 'brightness(0) invert(1)' }} />
                    </div>
                    <div className="navbar-logo-text">
                        <div style={{ fontSize: '18px', fontWeight: 900, letterSpacing: '-0.5px', fontFamily: 'Inter, inherit' }}>
                            <span style={{ color: 'var(--text-primary)' }}>MockI</span>
                            <span style={{ color: 'var(--brand-orange)' }}>Q</span>
                        </div>
                        <div className="navbar-tagline-wrapper">
                            <RotatingTagline />
                        </div>
                    </div>
                </Link>

                {/* Desktop nav links */}
                <div style={{ display: 'flex', alignItems: 'center', gap: '4px', background: 'var(--bg-tertiary)', padding: '3px', borderRadius: '8px', border: '1px solid var(--border)' }} className="hidden-mobile">
                    {NAV_LINKS.map((link) => {
                        const active = pathname === link.href || (link.href !== '/' && pathname?.startsWith(link.href));
                        return (
                            <Link key={link.href} href={link.href} style={{
                                padding: '5px 12px', borderRadius: '6px', textDecoration: 'none',
                                fontSize: '12.5px', fontWeight: active ? 800 : 600,
                                color: active ? '#FFFFFF' : 'var(--text-secondary)',
                                background: active ? '#111827' : 'transparent',
                                border: active ? '1px solid #111827' : '1px solid transparent',
                                transition: 'all 0.15s ease',
                                boxShadow: active ? '1px 1px 0px #1E1E1E' : 'none',
                            }}>
                                {t(link.labelKey, language as Language)}
                            </Link>
                        );
                    })}
                </div>

                {/* Right controls */}
                <div className="navbar-actions">
                    {/* Language switcher (desktop) */}
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
                        className="navbar-theme-btn"
                        style={{
                            color: theme === 'dark' ? '#F59E0B' : 'var(--text-secondary)',
                        }}
                    >
                        {theme === 'dark' ? <Sun size={16} /> : <Moon size={16} />}
                    </button>

                    {user ? (
                        <>
                            <Link href="/dashboard" style={{ textDecoration: 'none', display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <div style={{
                                    display: 'flex', alignItems: 'center', gap: '4px',
                                    background: 'rgba(217, 119, 6, 0.12)', border: '1px solid rgba(217, 119, 6, 0.3)',
                                    borderRadius: '20px', padding: '3px 8px', fontSize: '11.5px', fontWeight: 700,
                                    color: 'var(--brand-gold)',
                                }} className="hidden-mobile">
                                    <span>🔥</span> <span>{user.streak || 3}d</span>
                                </div>

                                <div style={{
                                    width: 32, height: 32, borderRadius: '50%',
                                    background: 'linear-gradient(135deg, var(--brand-orange), var(--brand-orange-dim))',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontSize: '13px', fontWeight: 800, color: 'white',
                                    boxShadow: '0 2px 10px rgba(37,99,235,0.3)', flexShrink: 0
                                }}>
                                    {user.name[0].toUpperCase()}
                                </div>
                            </Link>
                            <button onClick={handleLogout} className="btn btn-ghost hidden-mobile" style={{ padding: '6px 10px', fontSize: '13px' }}>
                                <LogOut size={15} /> <span>{t('logout', language as Language)}</span>
                            </button>
                        </>
                    ) : (
                        <Link href="/login" className="btn btn-primary navbar-login-btn" style={{ display: 'inline-flex', alignItems: 'center', gap: '4px', textDecoration: 'none' }}>
                            <LogIn size={13} /> {t('login', language as Language)}
                        </Link>
                    )}

                    {/* Mobile menu toggle */}
                    <button 
                        onClick={() => setMenuOpen(!menuOpen)} 
                        className="navbar-menu-btn"
                        aria-label="Toggle navigation menu"
                    >
                        {menuOpen ? <X size={18} /> : <Menu size={18} />}
                    </button>
                </div>
            </nav>

            {/* Mobile menu */}
            {menuOpen && (
                <div style={{
                    position: 'fixed', top: '60px', left: '10px', right: '10px', zIndex: 49,
                    background: 'var(--bg-secondary)', 
                    border: '1.5px solid var(--border)',
                    borderRadius: '8px',
                    padding: '12px', display: 'flex', flexDirection: 'column', gap: '4px',
                    boxShadow: 'var(--shadow-card)'
                }}>
                    {NAV_LINKS.map((link) => (
                        <Link key={link.href} href={link.href} onClick={() => setMenuOpen(false)} style={{
                            padding: '10px 14px', borderRadius: '6px', textDecoration: 'none',
                            color: pathname === link.href ? '#FFFFFF' : 'var(--text-primary)',
                            fontWeight: 700, fontSize: '13.5px',
                            background: pathname === link.href ? '#111827' : 'transparent',
                            border: pathname === link.href ? '1.5px solid #111827' : '1.5px solid transparent',
                            display: 'flex', alignItems: 'center', gap: '10px',
                        }}>
                            <span>{link.emoji}</span>
                            {t(link.labelKey, language as Language)}
                        </Link>
                    ))}

                    <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', marginTop: '4px' }}>
                        <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)', paddingLeft: '14px', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                            Language / ಭಾಷೆ
                        </div>
                        <div style={{ display: 'flex', gap: '4px', background: 'var(--bg-card)', borderRadius: '8px', padding: '3px', width: 'fit-content', marginLeft: '14px', border: '1px solid var(--border)' }}>
                            {LANGS.map((l) => (
                                <button key={l.code} onClick={() => { setLanguage(l.code); setMenuOpen(false); }} style={{
                                    padding: '5px 12px', borderRadius: '6px', border: 'none', cursor: 'pointer',
                                    fontSize: '12px', fontWeight: 700,
                                    background: language === l.code ? 'var(--brand-orange)' : 'transparent',
                                    color: language === l.code ? 'white' : 'var(--text-secondary)',
                                    transition: 'all 0.15s',
                                }}>{l.label}</button>
                            ))}
                        </div>
                    </div>

                    {user && (
                        <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '10px 14px' }}>
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
