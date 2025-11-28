# PARA Web - Next.js 15 Project Guidelines

## General Guidelines

* **Component Organization**: 컴포넌트는 역할별로 명확히 분리 (UI / Domain / Page)
* **File Naming**:
  - 컴포넌트: PascalCase (ParaOverview.tsx)
  - 유틸/훅: kebab-case (para-utils.ts, use-category.ts)
  - 타입: PascalCase interfaces (ParaItem, CategoryType)
* **Import Order**: Next.js > React > Third-party > Local components > Types > Utils
* **Server vs Client**: 기본은 Server Component, 상태/이벤트 필요시만 'use client'

## Code Style

* **TypeScript**: strict mode, any 타입 금지
* **Tailwind**: className은 cn() 유틸리티 사용
* **Props**: interface로 명시적 타입 정의
* **Functions**: 화살표 함수보다 function 선언 (RSC 호환성)

## PARA Domain Rules

* **Categories**: Pinned, Inbox, Project, Area, Resource, Archive (순서 고정)
* **Category Colors**:
  - Pinned: yellow (text-yellow-700 bg-yellow-50 border-yellow-200)
  - Inbox: gray (text-gray-700 bg-gray-50 border-gray-200)
  - Project: purple (text-purple-700 bg-purple-50 border-purple-200)
  - Area: green (text-green-700 bg-green-50 border-green-200)
  - Resource: blue (text-blue-700 bg-blue-50 border-blue-200)
  - Archive: red (text-red-700 bg-red-50 border-red-200)
* **Date Format**: "November 25, 2025" (기존 형식 유지)

## Component Guidelines

* **Button**: shadcn/ui Button 컴포넌트 사용, variant는 default/ghost/outline
* **Badge**: Category는 색상 배지, Topic은 outline, Tags는 secondary
* **Layout**: max-w-7xl 컨테이너, p-6 패딩

## API Integration

* **Data Fetching**: React Query 사용 (캐싱, 자동 refetch)
* **API Client**: lib/api/client.ts에서 제공하는 apiClient 사용
* **Type Transformation**: API 타입 → ParaItem 변환 (transformers.ts)
* **Pinned Items**: 로컬 스토리지 관리 (use-para-items.ts)

## Folder Structure

```
src/
├── app/                      # Next.js App Router
│   ├── layout.tsx
│   ├── page.tsx
│   ├── category/[category]/page.tsx
│   └── item/[id]/page.tsx
├── components/
│   ├── para/                 # PARA 도메인 컴포넌트
│   │   ├── ParaOverview.tsx
│   │   ├── CategoryDetail.tsx
│   │   └── ItemDetail.tsx
│   ├── providers/            # React providers
│   └── ui/                   # shadcn/ui 컴포넌트
├── hooks/
│   ├── use-containers.ts     # Container API 훅
│   ├── use-contents.ts       # Content API 훅
│   └── use-para-items.ts     # 통합 ParaItem 훅
├── lib/
│   ├── api/                  # API 클라이언트
│   │   ├── client.ts
│   │   ├── containers.ts
│   │   └── contents.ts
│   ├── types.ts              # 모든 타입 정의
│   ├── data.ts               # Mock 데이터
│   ├── transformers.ts       # API ↔ ParaItem 변환
│   ├── para-utils.ts         # PARA 도메인 로직
│   └── utils.ts              # cn() 등 범용 유틸
└── guidelines/
    ├── Guidelines.md         # 템플릿 가이드라인
    └── ProjectGuidelines.md  # 프로젝트 가이드라인 (이 파일)
```

## Development Workflow

1. **Mock 데이터 개발**: 현재는 lib/data.ts의 mockData 사용
2. **백엔드 연동**:
   - page.tsx의 TODO 주석 참고
   - mockData → useParaItems() 훅으로 교체
   - 환경변수 NEXT_PUBLIC_API_URL 설정
3. **새 기능 추가**:
   - API 타입 추가 (lib/types.ts)
   - API 클라이언트 추가 (lib/api/*.ts)
   - React Query 훅 추가 (hooks/*.ts)
   - 컴포넌트에서 사용

## Best Practices

* 모든 페이지는 'use client'로 시작 (동적 라우팅 사용)
* API 호출은 직접하지 말고 hooks를 통해서만
* 타입은 lib/types.ts에 집중 관리
* 도메인 로직은 lib/para-utils.ts에 분리
* 컴포넌트는 최대한 presentational하게 작성
