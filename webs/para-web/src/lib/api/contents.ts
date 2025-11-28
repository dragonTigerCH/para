import { apiClient } from './client';
import { Content } from '../types';

export interface CreateContentRequest {
  title: string;
  body: string;
  containerId?: number | null;
}

export interface UpdateContentRequest {
  title?: string;
  body?: string;
  containerId?: number | null;
}

/**
 * Content API
 */
export const contentApi = {
  // 모든 Content 조회
  getAll: async (): Promise<Content[]> => {
    return apiClient.get<Content[]>('/api/contents');
  },

  // Inbox Content 조회 (containerId가 null인 것들)
  getInbox: async (): Promise<Content[]> => {
    return apiClient.get<Content[]>('/api/contents', {
      params: { inbox: true },
    });
  },

  // 특정 Container의 Content 조회
  getByContainer: async (containerId: number): Promise<Content[]> => {
    return apiClient.get<Content[]>('/api/contents', {
      params: { containerId },
    });
  },

  // 특정 Content 조회
  getById: async (id: number): Promise<Content> => {
    return apiClient.get<Content>(`/api/contents/${id}`);
  },

  // Content 생성
  create: async (data: CreateContentRequest): Promise<Content> => {
    return apiClient.post<Content>('/api/contents', data);
  },

  // Content 수정
  update: async (id: number, data: UpdateContentRequest): Promise<Content> => {
    return apiClient.put<Content>(`/api/contents/${id}`, data);
  },

  // Content 삭제
  delete: async (id: number): Promise<void> => {
    return apiClient.delete<void>(`/api/contents/${id}`);
  },

  // Content를 Container로 이동
  moveToContainer: async (contentId: number, containerId: number | null): Promise<Content> => {
    return apiClient.patch<Content>(`/api/contents/${contentId}/move`, { containerId });
  },

  // Content를 Inbox로 이동
  moveToInbox: async (contentId: number): Promise<Content> => {
    return apiClient.patch<Content>(`/api/contents/${contentId}/move`, { containerId: null });
  },
};
