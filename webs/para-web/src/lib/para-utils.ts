import { ParaCategory } from './types';

export function getCategoryColor(category: string): string {
  switch (category) {
    case 'Pinned':
      return 'text-yellow-700 bg-yellow-50 border-yellow-200';
    case 'Inbox':
      return 'text-gray-700 bg-gray-50 border-gray-200';
    case 'Project':
      return 'text-purple-700 bg-purple-50 border-purple-200';
    case 'Area':
      return 'text-green-700 bg-green-50 border-green-200';
    case 'Resource':
      return 'text-blue-700 bg-blue-50 border-blue-200';
    case 'Archive':
      return 'text-red-700 bg-red-50 border-red-200';
    default:
      return 'text-gray-700 bg-gray-50 border-gray-200';
  }
}

export function getCategoryDescription(category: ParaCategory): string {
  switch (category) {
    case 'Pinned':
      return '자주 사용하는 항목을 여기에 고정하세요';
    case 'Inbox':
      return '아직 분류되지 않은 새로운 항목들';
    case 'Project':
      return '마감일이 정해진 완료를 목표로 하는 작업';
    case 'Area':
      return '장기적으로 관리해야 하는 삶의 영역';
    case 'Resource':
      return '필요할 때 참고할 수 있는 정보 창고';
    case 'Archive':
      return '완료되었거나 더 이상 활성 상태가 아닌 자료';
  }
}

export function getCategoryIcon(category: ParaCategory): string {
  switch (category) {
    case 'Pinned':
      return '📌';
    case 'Inbox':
      return '📥';
    case 'Project':
      return '📋';
    case 'Area':
      return '🗂️';
    case 'Resource':
      return '📚';
    case 'Archive':
      return '📦';
  }
}

// PARA 핵심 카테고리 (Project, Area, Resource, Archive)
export const PARA_CATEGORIES: ParaCategory[] = [
  'Project',
  'Area',
  'Resource',
  'Archive'
];
