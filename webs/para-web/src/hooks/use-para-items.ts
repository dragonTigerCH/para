import { useContainers } from './use-containers';
import { useInboxContents } from './use-contents';
import { mergeToParaItems } from '@/lib/transformers';
import { ParaItem, ParaCategory } from '@/lib/types';
import { useMemo } from 'react';

/**
 * ParaItem 통합 훅
 * Container와 Content를 가져와서 ParaItem으로 변환
 */

export function useParaItems() {
  const { data: containers = [], isLoading: containersLoading } = useContainers();
  const { data: inboxContents = [], isLoading: inboxLoading } = useInboxContents();

  const items = useMemo(() => {
    return mergeToParaItems(containers, inboxContents);
  }, [containers, inboxContents]);

  return {
    items,
    isLoading: containersLoading || inboxLoading,
  };
}

/**
 * 카테고리별 ParaItem 조회
 */
export function useParaItemsByCategory(category: ParaCategory) {
  const { items, isLoading } = useParaItems();

  const filteredItems = useMemo(() => {
    if (category === 'Pinned') {
      // Pinned는 로컬 스토리지에서 관리
      const pinnedIds = getPinnedIds();
      return items.filter(item => pinnedIds.includes(item.id));
    }

    return items.filter(item => item.category === category);
  }, [items, category]);

  return {
    items: filteredItems,
    isLoading,
  };
}

/**
 * Pinned 항목 관리 (로컬 스토리지)
 */
const PINNED_STORAGE_KEY = 'para-pinned-items';

function getPinnedIds(): string[] {
  if (typeof window === 'undefined') return [];
  const stored = localStorage.getItem(PINNED_STORAGE_KEY);
  return stored ? JSON.parse(stored) : [];
}

export function usePinnedItems() {
  const { items, isLoading } = useParaItems();

  const pinnedIds = getPinnedIds();
  const pinnedItems = useMemo(() => {
    return items.filter(item => pinnedIds.includes(item.id));
  }, [items, pinnedIds]);

  const togglePin = (itemId: string) => {
    const current = getPinnedIds();
    const newPinned = current.includes(itemId)
      ? current.filter(id => id !== itemId)
      : [...current, itemId];

    localStorage.setItem(PINNED_STORAGE_KEY, JSON.stringify(newPinned));
    // Re-render 트리거를 위해 window event 발생
    window.dispatchEvent(new Event('pinned-changed'));
  };

  const isPinned = (itemId: string) => pinnedIds.includes(itemId);

  return {
    pinnedItems,
    togglePin,
    isPinned,
    isLoading,
  };
}

/**
 * 특정 ParaItem 조회
 */
export function useParaItem(id: string) {
  const { items, isLoading } = useParaItems();

  const item = useMemo(() => {
    return items.find(item => item.id === id);
  }, [items, id]);

  return {
    item,
    isLoading,
  };
}
