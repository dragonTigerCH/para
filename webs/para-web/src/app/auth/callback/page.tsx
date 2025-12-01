'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { OAuth2LoginResponse } from '@/lib/types';

export default function AuthCallbackPage() {
  const router = useRouter();

  useEffect(() => {
    const handleCallback = () => {
      try {
        // URL fragment에서 data 추출
        const hash = window.location.hash.substring(1); // # 제거
        const params = new URLSearchParams(hash);
        const encodedData = params.get('data');

        if (!encodedData) {
          console.error('No data in fragment');
          router.push('/login?error=no_data');
          return;
        }

        // Base64 디코딩 (UTF-8)
        const binaryString = atob(encodedData);
        const bytes = new Uint8Array(binaryString.length);
        for (let i = 0; i < binaryString.length; i++) {
          bytes[i] = binaryString.charCodeAt(i);
        }
        const jsonData = new TextDecoder('utf-8').decode(bytes);
        const response: OAuth2LoginResponse = JSON.parse(jsonData);

        // localStorage에 토큰 저장
        localStorage.setItem('access_token', response.access.token);
        localStorage.setItem('refresh_token', response.refresh.token);
        localStorage.setItem('user', JSON.stringify(response.user));

        // 홈으로 리다이렉트
        router.push('/');
      } catch (error) {
        console.error('OAuth2 callback failed:', error);
        router.push('/login?error=callback_failed');
      }
    };

    handleCallback();
  }, [router]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="text-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-gray-900 mx-auto mb-4"></div>
        <p className="text-gray-600">로그인 처리 중...</p>
      </div>
    </div>
  );
}
