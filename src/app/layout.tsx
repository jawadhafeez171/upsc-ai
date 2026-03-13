import type { Metadata } from 'next';
import './globals.css';
import Navbar from '@/components/layout/Navbar';
import ThemeProvider from '@/components/layout/ThemeProvider';
import AuthProvider from '@/components/layout/AuthProvider';

export const metadata: Metadata = {
  title: 'UPSC AI — Mock Test Portal',
  description: 'Free mock tests for UPSC CSE, CAPF, CDS, RBI Grade B, KPSC KAS, PSI, PC and KEA exams in English and Kannada.',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body>
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
      </body>
    </html>
  );
}
