import { ParaItem } from './types';

export const mockData: ParaItem[] = [
  {
    id: 'pinned-1',
    name: 'Q4 전략 회의',
    category: 'Project',
    topic: '사업',
    tags: ['긴급', '중요'],
    startDate: 'November 25, 2025',
    endDate: 'November 30, 2025',
    description: '4분기 전략 회의 준비 및 자료 작성',
    status: '진행중',
    isPinned: true
  },
  {
    id: 'pinned-2',
    name: '건강 관리',
    category: 'Area',
    topic: '건강',
    tags: ['중요', '정기'],
    description: '규칙적인 운동과 식단 관리',
    status: '관리중',
    isPinned: true
  },
  {
    id: 'inbox-1',
    name: '새로운 프로젝트 아이디어',
    category: 'Inbox',
    topic: '',
    tags: ['아이디어'],
    description: '분류가 필요한 새로운 프로젝트 아이디어',
    status: '미분류'
  },
  {
    id: 'inbox-2',
    name: '참고 자료 모음',
    category: 'Inbox',
    topic: '',
    tags: [],
    description: '나중에 정리할 참고 자료들',
    status: '미분류'
  },
  {
    id: 'inbox-3',
    name: '회의록',
    category: 'Inbox',
    topic: '',
    tags: ['회의'],
    description: '지난주 회의록 정리 필요',
    status: '미분류'
  },
  {
    id: '1',
    name: 'Template1',
    category: 'Project',
    topic: '사업',
    tags: ['수익', '중요과제'],
    startDate: 'June 17, 2025',
    endDate: 'June 21, 2025',
    description: '유튜브 영상 제작 프로젝트입니다. 콘텐츠 기획부터 편집까지 전체 과정을 포함합니다.',
    status: '진행중'
  },
  {
    id: '2',
    name: 'Template2',
    category: 'Project',
    topic: '공부',
    tags: ['프론트엔드'],
    startDate: 'November 28, 2024',
    endDate: 'January 3, 2025',
    description: '제품 블로그 작성 프로젝트입니다.',
    status: '완료 예정'
  },
  {
    id: '3',
    name: 'Template3',
    category: 'Area',
    topic: '취미',
    tags: ['클라이밍'],
    description: '건강 관리 영역입니다. 규칙적인 운동과 식단 관리가 필요합니다.',
    status: '관리중'
  },
  {
    id: '4',
    name: 'Template4',
    category: 'Area',
    topic: '김양일',
    tags: ['생소'],
    description: '재정 관리 영역입니다. 월별 예산과 지출을 추적합니다.',
    status: '관리중'
  },
  {
    id: '5',
    name: 'Template5',
    category: 'Resource',
    topic: '수익',
    tags: ['미래보험', '혁동플치'],
    description: '디자인 레퍼런스 자료를 모아놓은 공간입니다.',
    status: '보관중'
  },
  {
    id: '6',
    name: 'Template6',
    category: 'Resource',
    topic: '과학',
    tags: ['물리', '고전역학'],
    description: '연구 데이터 및 논문 요약 자료입니다.',
    status: '보관중'
  },
  {
    id: '7',
    name: 'Template5',
    category: 'Archive',
    topic: '',
    tags: [],
    description: '완료된 오프라인 워크숍 프로젝트 자료입니다.',
    status: '보관완료'
  }
];
