import type { Metadata } from 'next';
import { Plus_Jakarta_Sans, Outfit, JetBrains_Mono, Noto_Sans_Kannada } from 'next/font/google';
import './globals.css';
import 'katex/dist/katex.min.css';
import Navbar from '@/components/layout/Navbar';
import ThemeProvider from '@/components/layout/ThemeProvider';
import AuthProvider from '@/components/layout/AuthProvider';
import { Analytics } from '@vercel/analytics/react';
import RotatingTagline from '@/components/layout/RotatingTagline';
import { BookOpen } from 'lucide-react';

const sansFont = Plus_Jakarta_Sans({
  subsets: ['latin'],
  weight: ['300', '400', '500', '600', '700', '800'],
  variable: '--font-sans',
  display: 'swap',
});

const displayFont = Outfit({
  subsets: ['latin'],
  weight: ['400', '500', '600', '700', '800', '900'],
  variable: '--font-display',
  display: 'swap',
});

const monoFont = JetBrains_Mono({
  subsets: ['latin'],
  weight: ['400', '500', '600', '700'],
  variable: '--font-mono',
  display: 'swap',
});

const kannadaFont = Noto_Sans_Kannada({
  subsets: ['kannada'],
  weight: ['400', '500', '600', '700'],
  variable: '--font-kannada',
  display: 'swap',
});

export const metadata: Metadata = {
  title: {
    default: 'UPSC AI · 30-Year PYQ Archive & CBT Mock Engine',
    template: '%s | UPSC AI'
  },
  description: 'Official 30-year previous year question archive and authentic computer-based test simulation for UPSC Civil Services Prelims, CSAT, and State PSC examinations.',
  icons: {
    icon: [
      { url: '/favicon.ico' },
      { url: '/favicon.png', type: 'image/png' }
    ],
    shortcut: '/favicon.ico',
    apple: '/favicon.png'
  },
  keywords: ['UPSC', 'KPSC', 'KAS', 'PSI', 'PC', 'Mock Test', 'Kannada', 'Hindi', 'Civil Services', 'Exam Prep', 'UPSC AI', 'PYQ Archive'],
  authors: [{ name: 'UPSC AI Team' }],
  creator: 'UPSC AI',
  publisher: 'UPSC AI',
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  openGraph: {
    type: 'website',
    locale: 'en_IN',
    url: 'https://upsc-ai.vercel.app',
    siteName: 'UPSC AI',
    title: 'UPSC AI · 30-Year PYQ Archive & CBT Mock Engine',
    description: 'Official 30-year previous year question archive and authentic computer-based test simulation for UPSC Civil Services Prelims, CSAT, and State PSC examinations.',
    images: [
      {
        url: 'https://upsc-ai.vercel.app/og-image.png',
        width: 1200,
        height: 630,
        alt: 'UPSC AI Portal',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'UPSC AI · 30-Year PYQ Archive & CBT Mock Engine',
    description: 'Official 30-year previous year question archive and authentic computer-based test simulation for UPSC Civil Services Prelims, CSAT, and State PSC examinations.',
    creator: '@upsc_ai',
    images: ['https://upsc-ai.vercel.app/og-image.png'],
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

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html 
      lang="en" 
      suppressHydrationWarning
      className={`${sansFont.variable} ${displayFont.variable} ${monoFont.variable} ${kannadaFont.variable}`}
    >
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
                    width: '34px', height: '34px', overflow: 'hidden',
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                    borderRadius: '8px', background: '#1E1B4B',
                    padding: '2px', flexShrink: 0, lineHeight: 0,
                    border: '1px solid #312E81',
                    boxShadow: '0 2px 6px rgba(30, 27, 75, 0.25)',
                  }}>
                    <BookOpen size={18} color="#FFFFFF" strokeWidth={2.5} />
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', textAlign: 'left', lineHeight: 1.15 }}>
                    <div style={{ fontSize: '18px', fontWeight: 900, letterSpacing: '-0.5px' }}>
                      <span style={{ color: 'var(--text-primary)' }}>UPSC </span>
                      <span style={{ color: 'var(--brand-orange)' }}>AI</span>
                    </div>
                    <RotatingTagline />
                  </div>
                </div>
                <div style={{ fontSize: '13px', color: 'var(--text-muted)', textAlign: 'center' }}>
                  © 2026 UPSC AI · Dedicated Civil Services Examination Engine.
                </div>
                <div style={{ display: 'flex', gap: '24px', flexWrap: 'wrap', justifyContent: 'center' }}>
                  {[
                    { href: '/exams', label: 'Exams' },
                    { href: '/current-affairs', label: 'Current Affairs' },
                    { href: '/graph', label: 'Knowledge Graph' },
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
