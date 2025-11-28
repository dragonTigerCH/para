import {
  ParaItem,
  BaseContainer,
  Content,
  ContainerWithAttributes,
  ContainerMode,
} from './types';

/**
 * API 데이터를 프론트엔드 ParaItem으로 변환
 */

// ContainerMode를 ParaCategory로 변환
function containerModeToCategory(mode: ContainerMode): 'Project' | 'Area' | 'Resource' | 'Archive' {
  const map: Record<ContainerMode, 'Project' | 'Area' | 'Resource' | 'Archive'> = {
    PROJECT: 'Project',
    AREA: 'Area',
    RESOURCE: 'Resource',
    ARCHIVE: 'Archive',
  };
  return map[mode];
}

// Container → ParaItem 변환
export function containerToParaItem(data: ContainerWithAttributes): ParaItem {
  const { container, project, area, resource } = data;

  return {
    id: String(container.id),
    name: container.title,
    category: containerModeToCategory(container.currentMode),
    topic: area?.category || resource?.category || '',
    tags: [], // TODO: 백엔드에 태그 기능 추가 필요
    startDate: undefined, // TODO: Project의 createdAt 사용 가능
    endDate: project?.deadline || undefined,
    description: container.description || undefined,
    status: project?.status || area ? '관리중' : resource ? '보관중' : undefined,
    isPinned: false, // 로컬 스토리지에서 관리
  };
}

// Content (Inbox) → ParaItem 변환
export function contentToParaItem(content: Content): ParaItem {
  return {
    id: String(content.id),
    name: content.title,
    category: 'Inbox',
    topic: '',
    tags: [],
    description: content.body.substring(0, 100), // body 일부를 description으로
    status: '미분류',
    isPinned: false,
  };
}

// 여러 Container를 ParaItem 배열로 변환
export function containersToParaItems(containers: ContainerWithAttributes[]): ParaItem[] {
  return containers.map(containerToParaItem);
}

// 여러 Content를 ParaItem 배열로 변환
export function contentsToParaItems(contents: Content[]): ParaItem[] {
  return contents.map(contentToParaItem);
}

// 모든 데이터를 통합하여 ParaItem 배열로 변환
export function mergeToParaItems(
  containers: ContainerWithAttributes[],
  inboxContents: Content[]
): ParaItem[] {
  const containerItems = containersToParaItems(containers);
  const inboxItems = contentsToParaItems(inboxContents);

  return [...containerItems, ...inboxItems];
}

/**
 * ParaItem을 API 요청 형태로 변환 (생성/수정 시)
 */

export function paraItemToContainerPayload(item: ParaItem) {
  return {
    title: item.name,
    description: item.description || null,
    currentMode: item.category.toUpperCase() as ContainerMode,
  };
}

export function paraItemToContentPayload(item: ParaItem) {
  return {
    title: item.name,
    body: item.description || '',
    containerId: null, // Inbox
  };
}
