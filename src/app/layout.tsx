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
            <main style={{ minHeight: '100vh', paddingTop: '76px' }}>
              {children}
            </main>
            <footer style={{
              borderTop: '1px solid var(--border)',
              padding: '32px 24px',
              textAlign: 'center',
              color: 'var(--text-muted)',
              fontSize: '13px',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '12px'
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '10px', textDecoration: 'none' }}>
                {/* Cropped Logo Icon */}
                <div style={{
                  width: '38px',
                  height: '38px',
                  overflow: 'hidden',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'flex-start',
                  borderRadius: '50%',
                  background: '#FAF8F5',
                  padding: '2px',
                  boxShadow: '0 1px 2px rgba(0,0,0,0.05)',
                  flexShrink: 0,
                  lineHeight: 0,
                }}>
                  <img
                    src="/mIQ_logo.png"
                    alt="MockIQ Icon"
                    style={{ height: '32px', width: 'auto', maxWidth: 'none', display: 'block' }}
                  />
                </div>
                
                {/* Text Brand */}
                <div style={{ display: 'flex', flexDirection: 'column', textAlign: 'left', lineHeight: 1.15 }}>
                  <div style={{ fontSize: '20px', fontWeight: 800, letterSpacing: '-0.5px', fontFamily: 'inherit' }}>
                    <span style={{ color: '#082C54' }}>MockI</span>
                    <span style={{ color: '#B83E11' }}>Q</span>
                  </div>
                  <RotatingTagline />
                </div>
              </div>
              <div>© 2026 MockIQ · Prepare. Practice. Prevail. 🇮🇳</div>
            </footer>
          </AuthProvider>
        </ThemeProvider>
        <Analytics />
      </body>
    </html>
  );
}

