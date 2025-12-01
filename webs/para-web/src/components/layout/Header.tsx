'use client';

import Link from 'next/link';
import { useAuth } from '@/contexts/auth-context';
import { Button } from '@/components/ui/button';
import { UserMenu } from '@/components/auth/UserMenu';

export function Header() {
  const { isAuthenticated, isLoading } = useAuth();

  return (
    <header className="bg-white border-b border-gray-200 px-6 py-4">
      <div className="max-w-7xl mx-auto">
        <div className="flex items-center justify-between">
          {/* 로고 */}
          <Link href="/" className="flex items-center gap-2">
            <div className="size-8 bg-gray-200 rounded flex items-center justify-center">
              <span className="text-gray-600">📚</span>
            </div>
            <h1 className="text-xl font-bold">PARA</h1>
          </Link>

          {/* 우측: 로그인 버튼 또는 사용자 메뉴 */}
          <div>
            {isLoading ? (
              <div className="h-10 w-20 bg-gray-100 animate-pulse rounded"></div>
            ) : isAuthenticated ? (
              <UserMenu />
            ) : (
              <Link href="/login">
                <Button>로그인</Button>
              </Link>
            )}
          </div>
        </div>
      </div>
    </header>
  );
}
