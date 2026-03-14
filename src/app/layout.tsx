import type { Metadata } from 'next';
import './globals.css';
import Navbar from '@/components/layout/Navbar';
import ThemeProvider from '@/components/layout/ThemeProvider';
import AuthProvider from '@/components/layout/AuthProvider';
import { Analytics } from '@vercel/analytics/react';

export const metadata: Metadata = {
  title: {
    default: 'UPSC AI · Free Mock Test Portal',
    template: '%s | UPSC AI'
  },
  description: 'Free high-quality mock tests for UPSC CSE, KPSC KAS, PSI, PC, and major competitive exams in English, Hindi, and Kannada. Track your progress, earn badges, and crack your dream exam.',
  keywords: ['UPSC', 'KPSC', 'KAS', 'PSI', 'PC', 'Mock Test', 'Kannada', 'Hindi', 'Civil Services', 'Exam Prep', 'UPSC AI'],
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
    title: 'UPSC AI · Mock Test Portal',
    description: 'Free mock tests for UPSC and KPSC exams in English, Hindi, and Kannada.',
    images: [
      {
        url: 'https://upsc-ai.vercel.app/og-image.png',
        width: 1200,
        height: 630,
        alt: 'UPSC AI Mock Test Portal',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'UPSC AI · Mock Test Portal',
    description: 'Free mock tests for UPSC and KPSC exams in English, Hindi, and Kannada.',
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

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body suppressHydrationWarning>
        <ThemeProvider>
          <AuthProvider>
            <Navbar />
            <main style={{ minHeight: '100vh', paddingTop: '64px' }}>
              {children}
            </main>
            <footer style={{
              borderTop: '1px solid var(--border)',
              padding: '24px',
              textAlign: 'center',
              color: 'var(--text-muted)',
              fontSize: '13px',
            }}>
              © 2026 UPSC AI · Mock Test Portal · Built for Aspirants 🇮🇳
            </footer>
          </AuthProvider>
        </ThemeProvider>
        <Analytics />
      </body>
    </html>
  );
}
