import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { containerApi, CreateContainerRequest, UpdateContainerRequest } from '@/lib/api/containers';
import { ContainerMode } from '@/lib/types';

/**
 * Container 관련 React Query 훅
 */

const QUERY_KEYS = {
  all: ['containers'] as const,
  byId: (id: number) => ['containers', id] as const,
  byMode: (mode: ContainerMode) => ['containers', 'mode', mode] as const,
};

// 모든 Container 조회
export function useContainers() {
  return useQuery({
    queryKey: QUERY_KEYS.all,
    queryFn: containerApi.getAll,
  });
}

// 특정 Container 조회
export function useContainer(id: number) {
  return useQuery({
    queryKey: QUERY_KEYS.byId(id),
    queryFn: () => containerApi.getById(id),
    enabled: !!id,
  });
}

// 모드별 Container 조회
export function useContainersByMode(mode: ContainerMode) {
  return useQuery({
    queryKey: QUERY_KEYS.byMode(mode),
    queryFn: () => containerApi.getByMode(mode),
  });
}

// Container 생성
export function useCreateContainer() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (data: CreateContainerRequest) => containerApi.create(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
    },
  });
}

// Container 수정
export function useUpdateContainer() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, data }: { id: number; data: UpdateContainerRequest }) =>
      containerApi.update(id, data),
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.byId(variables.id) });
    },
  });
}

// Container 삭제
export function useDeleteContainer() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (id: number) => containerApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
    },
  });
}

// Container 모드 변경
export function useChangeContainerMode() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, mode }: { id: number; mode: ContainerMode }) =>
      containerApi.changeMode(id, mode),
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.byId(variables.id) });
    },
  });
}
