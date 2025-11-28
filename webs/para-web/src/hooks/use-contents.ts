import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { contentApi, CreateContentRequest, UpdateContentRequest } from '@/lib/api/contents';

/**
 * Content 관련 React Query 훅
 */

const QUERY_KEYS = {
  all: ['contents'] as const,
  inbox: ['contents', 'inbox'] as const,
  byId: (id: number) => ['contents', id] as const,
  byContainer: (containerId: number) => ['contents', 'container', containerId] as const,
};

// 모든 Content 조회
export function useContents() {
  return useQuery({
    queryKey: QUERY_KEYS.all,
    queryFn: contentApi.getAll,
  });
}

// Inbox Content 조회
export function useInboxContents() {
  return useQuery({
    queryKey: QUERY_KEYS.inbox,
    queryFn: contentApi.getInbox,
  });
}

// 특정 Container의 Content 조회
export function useContentsByContainer(containerId: number) {
  return useQuery({
    queryKey: QUERY_KEYS.byContainer(containerId),
    queryFn: () => contentApi.getByContainer(containerId),
    enabled: !!containerId,
  });
}

// 특정 Content 조회
export function useContent(id: number) {
  return useQuery({
    queryKey: QUERY_KEYS.byId(id),
    queryFn: () => contentApi.getById(id),
    enabled: !!id,
  });
}

// Content 생성
export function useCreateContent() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (data: CreateContentRequest) => contentApi.create(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.inbox });
    },
  });
}

// Content 수정
export function useUpdateContent() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, data }: { id: number; data: UpdateContentRequest }) =>
      contentApi.update(id, data),
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.byId(variables.id) });
    },
  });
}

// Content 삭제
export function useDeleteContent() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (id: number) => contentApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.inbox });
    },
  });
}

// Content를 Container로 이동
export function useMoveContent() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ contentId, containerId }: { contentId: number; containerId: number | null }) =>
      contentApi.moveToContainer(contentId, containerId),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.all });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.inbox });
    },
  });
}
