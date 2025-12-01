'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';

export default function GoogleCallbackPage() {
  const router = useRouter();
  const { loginWithOAuth } = useAuth();

  useEffect(() => {
    // 백엔드가 JSON을 body에 직접 출력했으므로, document.body.textContent에서 파싱
    try {
      const bodyText = document.body.textContent || '';
      const data = JSON.parse(bodyText);

      // 로그인 처리
      loginWithOAuth(data);

      // 홈으로 이동
      router.push('/');
    } catch (error) {
      console.error('Google login error:', error);
      // 에러 발생 시 로그인 페이지로
      router.push('/login?error=google_login_failed');
    }
  }, [loginWithOAuth, router]);

  return null; // 아무것도 렌더링하지 않음
}
