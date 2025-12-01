import { LoginRequest, LoginResponse, OAuth2LoginResponse } from '../types';

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8080';

/**
 * 이메일/비밀번호 로그인
 */
export async function login(username: string, password: string): Promise<LoginResponse> {
  const response = await fetch(`${API_BASE_URL}/api/auth/login`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ username, password } as LoginRequest),
  });

  if (!response.ok) {
    const error = await response.json().catch(() => ({ message: '로그인에 실패했습니다.' }));
    throw new Error(error.message || '로그인에 실패했습니다.');
  }

  return response.json();
}

/**
 * Google OAuth 로그인 (백엔드 리다이렉트 사용)
 */
export function redirectToGoogleLogin() {
  window.location.href = `${API_BASE_URL}/oauth2/authorization/google`;
}

/**
 * 현재 인증된 사용자 정보 가져오기
 */
export async function getCurrentUser(token: string) {
  const response = await fetch(`${API_BASE_URL}/api/users/me`, {
    method: 'GET',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json',
    },
  });

  if (!response.ok) {
    throw new Error('사용자 정보를 가져오는데 실패했습니다.');
  }

  return response.json();
}
