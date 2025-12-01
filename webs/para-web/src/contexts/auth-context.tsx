'use client';

import { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { User, LoginResponse, OAuth2LoginResponse } from '@/lib/types';
import { getCurrentUser } from '@/lib/api/auth';

interface AuthContextType {
  user: User | null;
  isLoading: boolean;
  login: (response: LoginResponse) => Promise<void>;
  loginWithOAuth: (response: OAuth2LoginResponse) => void;
  logout: () => void;
  isAuthenticated: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  // 초기 로드 시 localStorage에서 토큰 확인
  useEffect(() => {
    const initAuth = async () => {
      const accessToken = localStorage.getItem('access_token');

      if (accessToken) {
        try {
          // 토큰이 있으면 서버에서 사용자 정보 가져오기
          const userData = await getCurrentUser(accessToken);
          setUser(userData);
        } catch (error) {
          console.error('Failed to fetch user data:', error);
          // 토큰이 유효하지 않으면 제거
          localStorage.removeItem('access_token');
          localStorage.removeItem('refresh_token');
        }
      }

      setIsLoading(false);
    };

    initAuth();
  }, []);

  const login = async (response: LoginResponse) => {
    localStorage.setItem('access_token', response.access.token);
    localStorage.setItem('refresh_token', response.refresh.token);

    // 토큰으로 사용자 정보 가져오기
    try {
      const userData = await getCurrentUser(response.access.token);
      setUser(userData);
    } catch (error) {
      console.error('Failed to fetch user data after login:', error);
    }
  };

  const loginWithOAuth = (response: OAuth2LoginResponse) => {
    localStorage.setItem('access_token', response.access.token);
    localStorage.setItem('refresh_token', response.refresh.token);
    setUser(response.user);
  };

  const logout = () => {
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
    setUser(null);
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        isLoading,
        login,
        loginWithOAuth,
        logout,
        isAuthenticated: !!user,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
