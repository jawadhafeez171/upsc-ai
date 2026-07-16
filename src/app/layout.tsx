import type { Metadata } from 'next';
import './globals.css';
import Navbar from '@/components/layout/Navbar';
import ThemeProvider from '@/components/layout/ThemeProvider';
import AuthProvider from '@/components/layout/AuthProvider';
import { Analytics } from '@vercel/analytics/react';
import RotatingTagline from '@/components/layout/RotatingTagline';

export const metadata: Metadata = {
  title: {
    default: 'MockIQ · Practice Smart, Achieve More',
    template: '%s | MockIQ'
  },
  description: 'Free high-quality mock tests for UPSC CSE, KPSC KAS, PSI, PC, and major competitive exams in English, Hindi, and Kannada. Track your progress, earn badges, and crack your dream exam.',
  icons: {
    icon: [
      { url: '/favicon.ico' },
      { url: '/favicon.png', type: 'image/png' }
    ],
    shortcut: '/favicon.ico',
    apple: '/favicon.png'
  },
  keywords: ['UPSC', 'KPSC', 'KAS', 'PSI', 'PC', 'Mock Test', 'Kannada', 'Hindi', 'Civil Services', 'Exam Prep', 'MockIQ'],
  authors: [{ name: 'MockIQ Team' }],
  creator: 'MockIQ',
  publisher: 'MockIQ',
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  openGraph: {
    type: 'website',
    locale: 'en_IN',
    url: 'https://mockiq.vercel.app',
    siteName: 'MockIQ',
    title: 'MockIQ · Practice Smart, Achieve More',
    description: 'Free mock tests for UPSC and KPSC exams in English, Hindi, and Kannada.',
    images: [
      {
        url: 'https://mockiq.vercel.app/og-image.png',
        width: 1200,
        height: 630,
        alt: 'MockIQ Mock Test Portal',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'MockIQ · Practice Smart, Achieve More',
    description: 'Free mock tests for UPSC and KPSC exams in English, Hindi, and Kannada.',
    creator: '@mockiq',
    images: ['https://mockiq.vercel.app/og-image.png'],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body suppressHydrationWarning style={{ position: 'relative', overflowX: 'hidden' }}>
        <ThemeProvider>
          <AuthProvider>
            <Navbar />
            <main style={{ minHeight: '100vh', paddingTop: '64px' }}>
              {children}
            </main>
            <footer style={{
              borderTop: '1px solid var(--border)',
              padding: '40px 24px',
              background: 'var(--bg-secondary)',
            }}>
              <div style={{ maxWidth: '1080px', margin: '0 auto', display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '16px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                  <div style={{
                    width: '36px', height: '36px', overflow: 'hidden',
                    display: 'flex', alignItems: 'center', justifyContent: 'flex-start',
                    borderRadius: '10px', background: 'rgba(255,255,255,0.06)',
                    padding: '2px', flexShrink: 0, lineHeight: 0,
                    border: '1px solid var(--border)',
                  }}>
                    <img src="/mIQ_logo.png" alt="MockIQ Icon" style={{ height: '32px', width: 'auto', maxWidth: 'none', display: 'block' }} />
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', textAlign: 'left', lineHeight: 1.15 }}>
                    <div style={{ fontSize: '18px', fontWeight: 800, letterSpacing: '-0.5px' }}>
                      <span style={{ color: 'var(--text-primary)' }}>MockI</span>
                      <span style={{ color: 'var(--brand-orange)' }}>Q</span>
                    </div>
                    <RotatingTagline />
                  </div>
                </div>
                <div style={{ fontSize: '13px', color: 'var(--text-muted)', textAlign: 'center' }}>
                  © 2026 MockIQ · Prepare. Practice. Prevail. 🇮🇳
                </div>
                <div style={{ display: 'flex', gap: '24px', flexWrap: 'wrap', justifyContent: 'center' }}>
                  {[
                    { href: '/exams', label: 'Exams' },
                    { href: '/current-affairs', label: 'Current Affairs' },
                    { href: '/leaderboard', label: 'Leaderboard' },
                    { href: '/login', label: 'Sign In' },
                  ].map((link) => (
                    <a key={link.href} href={link.href} className="footer-link">{link.label}</a>
                  ))}
                </div>
              </div>
            </footer>
          </AuthProvider>
        </ThemeProvider>
        <Analytics />
      </body>
    </html>
  );
}

