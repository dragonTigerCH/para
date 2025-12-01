'use client';

import Link from 'next/link';
import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { LoginForm } from '@/components/auth/LoginForm';
import { GoogleLoginButton } from '@/components/auth/GoogleLoginButton';
import { useAuth } from '@/contexts/auth-context';

export default function LoginPage() {
  const router = useRouter();
  const { isAuthenticated, isLoading } = useAuth();

  useEffect(() => {
    if (!isLoading && isAuthenticated) {
      router.push('/');
    }
  }, [isAuthenticated, isLoading, router]);

  if (isLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <p className="text-gray-600">로딩 중...</p>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50 px-4">
      <div className="w-full max-w-md space-y-8">
        {/* 로고 */}
        <div className="text-center">
          <div className="flex items-center justify-center gap-2 mb-2">
            <div className="size-12 bg-gray-200 rounded flex items-center justify-center">
              <span className="text-2xl">📚</span>
            </div>
            <h1 className="text-3xl font-bold">PARA</h1>
          </div>
          <p className="text-gray-600">프로젝트 관리 대시보드</p>
        </div>

        {/* 로그인 폼 */}
        <div className="bg-white p-8 rounded-lg shadow-sm border border-gray-200">
          <LoginForm />

          {/* 구분선 */}
          <div className="relative my-6">
            <div className="absolute inset-0 flex items-center">
              <div className="w-full border-t border-gray-300"></div>
            </div>
            <div className="relative flex justify-center text-sm">
              <span className="px-2 bg-white text-gray-500">또는</span>
            </div>
          </div>

          {/* Google 로그인 */}
          <GoogleLoginButton />

          {/* 링크 */}
          <div className="mt-6 text-center text-sm space-x-4">
            <Link href="/signup" className="text-gray-600 hover:text-gray-900 hover:underline">
              회원가입
            </Link>
            <span className="text-gray-300">|</span>
            <Link href="/password/reset" className="text-gray-600 hover:text-gray-900 hover:underline">
              비밀번호 찾기
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
