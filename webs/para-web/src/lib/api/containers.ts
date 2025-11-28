import { apiClient } from './client';
import { BaseContainer, ContainerWithAttributes, ContainerMode } from '../types';

export interface CreateContainerRequest {
  title: string;
  description?: string | null;
  currentMode: ContainerMode;
}

export interface UpdateContainerRequest {
  title?: string;
  description?: string | null;
  currentMode?: ContainerMode;
}

/**
 * Container API
 */
export const containerApi = {
  // 모든 Container 조회
  getAll: async (): Promise<ContainerWithAttributes[]> => {
    return apiClient.get<ContainerWithAttributes[]>('/api/containers');
  },

  // 특정 Container 조회
  getById: async (id: number): Promise<ContainerWithAttributes> => {
    return apiClient.get<ContainerWithAttributes>(`/api/containers/${id}`);
  },

  // 모드별 Container 조회
  getByMode: async (mode: ContainerMode): Promise<ContainerWithAttributes[]> => {
    return apiClient.get<ContainerWithAttributes[]>('/api/containers', {
      params: { mode },
    });
  },

  // Container 생성
  create: async (data: CreateContainerRequest): Promise<BaseContainer> => {
    return apiClient.post<BaseContainer>('/api/containers', data);
  },

  // Container 수정
  update: async (id: number, data: UpdateContainerRequest): Promise<BaseContainer> => {
    return apiClient.put<BaseContainer>(`/api/containers/${id}`, data);
  },

  // Container 삭제 (Soft Delete)
  delete: async (id: number): Promise<void> => {
    return apiClient.delete<void>(`/api/containers/${id}`);
  },

  // Container 모드 변경
  changeMode: async (id: number, mode: ContainerMode): Promise<BaseContainer> => {
    return apiClient.patch<BaseContainer>(`/api/containers/${id}/mode`, { mode });
  },
};
