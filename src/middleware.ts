import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

export function middleware(req: NextRequest) {
    // We check for the generic sb-auth cookie set by our AuthProvider
    const isAuth = req.cookies.has('sb-auth');
    const { pathname } = req.nextUrl;

    // Define protected and auth routes
    const isProtectedRoute = pathname.startsWith('/dashboard') || pathname.startsWith('/test/') || pathname.startsWith('/results/');
    const isAuthRoute = pathname === '/login' || pathname === '/register';

    // Redirect unauthenticated users to login
    if (isProtectedRoute && !isAuth) {
        return NextResponse.redirect(new URL('/login', req.url));
    }

    // Redirect authenticated users away from login/register
    if (isAuthRoute && isAuth) {
        return NextResponse.redirect(new URL('/dashboard', req.url));
    }

    return NextResponse.next();
}

// Only run middleware on these specific routes to save performance
export const config = {
    matcher: ['/dashboard/:path*', '/test/:path*', '/results/:path*', '/login', '/register'],
};
