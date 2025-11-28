// ============================================================================
// Frontend Types (UI용)
// ============================================================================

export interface ParaItem {
  id: string;
  name: string;
  category: 'Project' | 'Area' | 'Resource' | 'Archive' | 'Inbox';
  topic: string;
  tags: string[];
  startDate?: string;
  endDate?: string;
  description?: string;
  status?: string;
  isPinned?: boolean;
}

export type ParaCategory = 'Pinned' | 'Inbox' | 'Project' | 'Area' | 'Resource' | 'Archive';

// ============================================================================
// API Types (백엔드 스키마와 매칭)
// ============================================================================

export type ContainerMode = 'PROJECT' | 'AREA' | 'RESOURCE' | 'ARCHIVE';

export interface BaseContainer {
  id: number;
  title: string;
  description: string | null;
  currentMode: ContainerMode;
  createdAt: string;
  createdBy: number;
  updatedAt: string;
  updatedBy: number;
  deletedAt: string | null;
}

export interface Content {
  id: number;
  title: string;
  body: string;
  containerId: number | null; // null = Inbox
  createdAt: string;
  createdBy: number;
  updatedAt: string;
  updatedBy: number;
}

export interface Project {
  containerId: number;
  deadline: string | null;
  priority: string | null;
  status: string | null;
  active: boolean;
}

export interface Area {
  containerId: number;
  category: string | null;
  reviewCycle: string | null;
  active: boolean;
}

export interface Resource {
  containerId: number;
  category: string | null;
  isFavorite: boolean;
  sourceUrl: string | null;
  active: boolean;
}

export interface Archive {
  containerId: number;
  archivedReason: string;
  archivedAt: string;
  previousMode: string | null;
  active: boolean;
}

// ============================================================================
// API Response Types
// ============================================================================

export interface ContainerWithAttributes {
  container: BaseContainer;
  project?: Project;
  area?: Area;
  resource?: Resource;
  archive?: Archive;
}
