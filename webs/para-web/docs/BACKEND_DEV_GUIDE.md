# 백엔드 개발자를 위한 프론트엔드 구조 가이드

> 이 문서는 백엔드 개발자가 Next.js 15 + TypeScript 프론트엔드 프로젝트를 이해하기 위한 가이드입니다.

## 📁 프로젝트 구조 (백엔드 비유)

```
para-web/
├── src/
│   ├── app/                    # 라우팅 = Spring의 @Controller
│   │   ├── page.tsx           # GET / → 홈페이지
│   │   ├── category/[category]/page.tsx  # GET /category/{category}
│   │   └── item/[id]/page.tsx            # GET /item/{id}
│   │
│   ├── components/            # 재사용 가능한 UI 컴포넌트 = 공통 유틸리티
│   │   ├── ui/               # 기본 UI 컴포넌트 (버튼, 카드 등)
│   │   └── para/             # 비즈니스 로직이 있는 컴포넌트
│   │
│   ├── lib/                   # 유틸리티 & 비즈니스 로직 = Service 레이어
│   │   ├── api/              # API 클라이언트 = RestTemplate/WebClient
│   │   ├── hooks/            # React Hooks = Service 메서드
│   │   ├── types.ts          # TypeScript 타입 = DTO/Entity
│   │   ├── data.ts           # 목 데이터 = 테스트용 Fixture
│   │   └── transformers.ts   # API → UI 변환 = Mapper
│   │
│   └── guidelines/            # 프로젝트 가이드라인
│
├── tests/                     # E2E 테스트 = 통합 테스트
│   └── e2e/
│       ├── home.spec.ts      # 홈페이지 테스트
│       └── navigation.spec.ts # 네비게이션 테스트
│
├── playwright.config.ts       # 테스트 설정 = application-test.yml
├── package.json              # 의존성 관리 = build.gradle.kts / pom.xml
├── tsconfig.json             # TypeScript 설정 = 컴파일러 옵션
└── next.config.ts            # Next.js 설정 = application.yml

```

---

## 🎯 핵심 개념 (백엔드 용어로 설명)

### 1. **Next.js App Router** = Spring MVC의 @Controller

Next.js는 **파일 시스템 기반 라우팅**을 사용합니다.

#### 백엔드 비유:
```kotlin
// Spring Boot
@RestController
@RequestMapping("/category")
class CategoryController {
    @GetMapping("/{category}")
    fun getCategory(@PathVariable category: String): CategoryView {
        // ...
    }
}
```

#### Next.js 동등 코드:
```typescript
// src/app/category/[category]/page.tsx
export default function CategoryPage({ params }: { params: { category: string } }) {
  // params.category로 경로 파라미터 접근
  return <CategoryDetail category={params.category} />;
}
```

**파일 경로 = URL 경로**
- `src/app/page.tsx` → `/`
- `src/app/category/[category]/page.tsx` → `/category/{category}`
- `src/app/item/[id]/page.tsx` → `/item/{id}`

---

### 2. **React 컴포넌트** = 재사용 가능한 View 템플릿

React 컴포넌트는 **함수**입니다. HTML을 반환하는 함수라고 생각하면 됩니다.

#### 백엔드 비유:
```kotlin
// Kotlin
fun renderUserCard(user: User): String {
    return """
        <div class="card">
            <h2>${user.name}</h2>
            <p>${user.email}</p>
        </div>
    """
}
```

#### React 동등 코드:
```typescript
// TypeScript + React
interface User {
  name: string;
  email: string;
}

function UserCard({ user }: { user: User }) {
  return (
    <div className="card">
      <h2>{user.name}</h2>
      <p>{user.email}</p>
    </div>
  );
}
```

**핵심 차이점:**
- 백엔드: 서버에서 한 번 렌더링
- 프론트엔드: 브라우저에서 **상태 변경 시마다 자동 재렌더링**

---

### 3. **Client vs Server Components**

Next.js 15는 **두 가지 실행 환경**을 제공합니다.

| 구분 | Server Component | Client Component |
|------|------------------|------------------|
| 실행 위치 | 서버 (Node.js) | 브라우저 |
| 백엔드 비유 | SSR (Server-Side Rendering) | SPA (Single Page App) |
| 데이터 접근 | 직접 DB 쿼리 가능 | API 호출 필요 |
| 상태 관리 | 불가능 | 가능 (useState) |
| 이벤트 핸들러 | 불가능 | 가능 (onClick 등) |
| 선언 방법 | 기본값 | `'use client'` 필요 |

#### 예시:
```typescript
// Server Component (기본) - 서버에서만 실행
export default async function ServerPage() {
  const data = await fetch('http://api.example.com/data');
  return <div>{data}</div>;
}

// Client Component - 브라우저에서 실행
'use client';
import { useState } from 'react';

export default function ClientPage() {
  const [count, setCount] = useState(0);
  return <button onClick={() => setCount(count + 1)}>{count}</button>;
}
```

---

### 4. **React Hooks** = 컴포넌트의 생명주기 & 상태 관리

Hooks는 **컴포넌트에 기능을 추가하는 함수**입니다.

#### 주요 Hooks:

##### `useState` = 컴포넌트의 상태 변수
```typescript
// 백엔드 비유: 클래스의 멤버 변수
const [count, setCount] = useState(0);  // int count = 0;
setCount(count + 1);                    // count++;
```

##### `useEffect` = 생명주기 훅 (@PostConstruct)
```typescript
// 백엔드 비유: @PostConstruct, @PreDestroy
useEffect(() => {
  console.log('컴포넌트 마운트됨');  // @PostConstruct
  return () => {
    console.log('컴포넌트 언마운트됨');  // @PreDestroy
  };
}, []);  // 빈 배열 = 한 번만 실행
```

##### `useMemo` / `useCallback` = 캐싱
```typescript
// 백엔드 비유: @Cacheable
const expensiveResult = useMemo(() => {
  return heavyCalculation(data);
}, [data]);  // data가 변경될 때만 재계산
```

---

### 5. **React Query (TanStack Query)** = ORM + 캐싱

React Query는 **서버 상태 관리 라이브러리**입니다.

#### 백엔드 비유:
```kotlin
// Spring Boot + JPA
@Service
class UserService(
    private val userRepository: UserRepository,
    private val cacheManager: CacheManager
) {
    @Cacheable("users")
    fun getUsers(): List<User> {
        return userRepository.findAll()
    }
}
```

#### React Query 동등 코드:
```typescript
// src/hooks/use-users.ts
import { useQuery } from '@tanstack/react-query';

export function useUsers() {
  return useQuery({
    queryKey: ['users'],           // 캐시 키
    queryFn: () => apiClient.get<User[]>('/users'),  // 데이터 fetching
    staleTime: 5 * 60 * 1000,      // 5분간 캐시 유지
  });
}

// 컴포넌트에서 사용
function UserList() {
  const { data, isLoading, error } = useUsers();

  if (isLoading) return <div>로딩중...</div>;
  if (error) return <div>에러 발생</div>;

  return <ul>{data.map(user => <li>{user.name}</li>)}</ul>;
}
```

**자동 기능:**
- 중복 요청 제거 (Deduplication)
- 자동 재시도 (Retry)
- 백그라운드 갱신 (Background Refetch)
- 캐싱 및 무효화 (Cache Invalidation)

---

## 🔄 데이터 흐름 (백엔드 관점)

### 현재 구조 (목 데이터 사용)

```
[브라우저]
    ↓
[page.tsx] ← Server Component
    ↓
[ParaOverview.tsx] ← Client Component ('use client')
    ↓
[mockData] ← 하드코딩된 데이터
    ↓
[화면 렌더링]
```

### 향후 구조 (API 연동)

```
[브라우저]
    ↓
[page.tsx] ← Server Component
    ↓
[ParaOverview.tsx] ← Client Component
    ↓
[useParaItems()] ← React Query Hook
    ↓
[apiClient.get()] ← Fetch API
    ↓
[백엔드 API: GET /api/containers]
    ↓
[transformers.ts] ← API 응답 → UI 모델 변환
    ↓
[화면 렌더링]
```

---

## 📦 주요 파일 설명

### 1. `/src/lib/types.ts` = DTO 정의

```typescript
// ============================================================================
// Frontend Types (UI용 - View Model)
// ============================================================================
export interface ParaItem {
  id: string;
  name: string;
  category: 'Project' | 'Area' | 'Resource' | 'Archive' | 'Inbox';
  topic: string;
  tags: string[];
  // ...
}

// ============================================================================
// API Types (백엔드 스키마와 매칭 - DTO)
// ============================================================================
export interface BaseContainer {
  id: number;
  title: string;
  description: string | null;
  currentMode: ContainerMode;
  createdAt: string;
  // ...
}
```

**백엔드 비유:**
- `ParaItem` = View Model (화면 표시용)
- `BaseContainer` = Entity/DTO (백엔드 API 응답)

---

### 2. `/src/lib/api/client.ts` = RestTemplate/WebClient

```typescript
// 백엔드의 RestTemplate/WebClient와 동일한 역할
export const apiClient = {
  get: <T>(endpoint: string, options?: FetchOptions) =>
    fetchApi<T>(endpoint, { ...options, method: 'GET' }),

  post: <T>(endpoint: string, data?: unknown, options?: FetchOptions) =>
    fetchApi<T>(endpoint, {
      ...options,
      method: 'POST',
      body: data ? JSON.stringify(data) : undefined,
    }),
  // ...
};

// 사용 예시
const containers = await apiClient.get<BaseContainer[]>('/api/containers');
```

**백엔드 비유:**
```kotlin
// Kotlin + Spring RestTemplate
val restTemplate = RestTemplate()
val containers = restTemplate.getForObject(
    "/api/containers",
    Array<BaseContainer>::class.java
)
```

---

### 3. `/src/lib/transformers.ts` = Mapper/Converter

API 응답을 UI 모델로 변환합니다.

```typescript
// API 응답 → UI 모델 변환
export function containerToParaItem(data: ContainerWithAttributes): ParaItem {
  const { container, project, area, resource } = data;

  return {
    id: String(container.id),
    name: container.title,
    category: containerModeToCategory(container.currentMode),
    topic: area?.category || resource?.category || '',
    tags: [],
    endDate: project?.deadline || undefined,
    // ...
  };
}
```

**백엔드 비유:**
```kotlin
// Kotlin Mapper
class ContainerMapper {
    fun toParaItem(data: ContainerWithAttributes): ParaItem {
        return ParaItem(
            id = data.container.id.toString(),
            name = data.container.title,
            category = containerModeToCategory(data.container.currentMode),
            // ...
        )
    }
}
```

**왜 변환이 필요한가?**
- 백엔드 스키마 변경이 프론트엔드에 직접 영향을 주지 않도록
- UI에 최적화된 데이터 구조 사용
- 여러 API 응답을 하나의 UI 모델로 병합 가능

---

### 4. `/src/hooks/use-para-items.ts` = Service 메서드

```typescript
export function useParaItems() {
  // 여러 API 호출을 병렬로 실행
  const { data: containers = [], isLoading: containersLoading } = useContainers();
  const { data: inboxContents = [], isLoading: inboxLoading } = useInboxContents();

  // 데이터 병합
  const items = useMemo(() => {
    return mergeToParaItems(containers, inboxContents);
  }, [containers, inboxContents]);

  return { items, isLoading: containersLoading || inboxLoading };
}
```

**백엔드 비유:**
```kotlin
@Service
class ParaService(
    private val containerRepository: ContainerRepository,
    private val contentRepository: ContentRepository
) {
    fun getParaItems(): List<ParaItem> {
        // 병렬 실행
        val containers = async { containerRepository.findAll() }
        val inboxContents = async { contentRepository.findByContainerIdIsNull() }

        // 데이터 병합
        return mergeToParaItems(
            containers.await(),
            inboxContents.await()
        )
    }
}
```

---

## 🧪 테스트 (Playwright E2E)

Playwright는 **브라우저 자동화 테스트 도구**입니다.

**백엔드 비유:** RestAssured, MockMvc (통합 테스트)

```typescript
// tests/e2e/home.spec.ts
test('페이지가 정상적으로 로드되어야 함', async ({ page }) => {
  // Given: 홈페이지 접속
  await page.goto('/');

  // Then: 헤더 타이틀 확인
  await expect(page.locator('h1')).toContainText('PARA Table Template');
});
```

**백엔드 동등 테스트:**
```kotlin
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class HomePageTest {
    @Test
    fun `페이지가 정상적으로 로드되어야 함`() {
        // Given
        val response = restTemplate.getForEntity("/", String::class.java)

        // Then
        assertThat(response.statusCode).isEqualTo(HttpStatus.OK)
        assertThat(response.body).contains("PARA Table Template")
    }
}
```

---

## 🚀 실행 방법

### 개발 서버 실행
```bash
npm run dev        # localhost:3000에서 실행 (Hot Reload)
```

### 프로덕션 빌드
```bash
npm run build      # TypeScript 컴파일 + 최적화
npm run start      # 프로덕션 서버 실행
```

### 테스트 실행
```bash
npm test           # E2E 테스트 (헤드리스 모드)
npm run test:ui    # UI 모드 (브라우저 보면서 테스트)
npm run test:headed # 브라우저 창 열고 테스트
```

---

## 📚 의존성 관리 (package.json)

`package.json`은 **build.gradle.kts 또는 pom.xml**과 동일한 역할입니다.

```json
{
  "dependencies": {
    "next": "16.0.3",                      // 프레임워크 (= Spring Boot)
    "react": "19.2.0",                     // UI 라이브러리
    "@tanstack/react-query": "^5.90.10",   // 서버 상태 관리 (= JPA)
    "@radix-ui/react-*": "^1.x.x",         // UI 컴포넌트 라이브러리
  },
  "devDependencies": {
    "@playwright/test": "^1.56.1",         // E2E 테스트 (= Selenium)
    "typescript": "^5",                    // 타입 체크 (= Kotlin 컴파일러)
    "tailwindcss": "^4"                    // CSS 프레임워크
  }
}
```

### 의존성 설치
```bash
npm install              # package.json 기준으로 설치
npm install <package>    # 새 패키지 설치
npm update              # 패키지 업데이트
```

---

## 🔑 핵심 용어 정리

| 프론트엔드 용어 | 백엔드 비유 | 설명 |
|----------------|------------|------|
| Component | View 템플릿 / 함수 | UI를 반환하는 함수 |
| Props | 메서드 파라미터 | 컴포넌트에 전달되는 데이터 |
| State | 멤버 변수 | 컴포넌트 내부 상태 |
| Hook | 라이프사이클 메서드 | 컴포넌트에 기능 추가 |
| React Query | ORM + 캐싱 | 서버 데이터 관리 |
| Client Component | Controller | 사용자 이벤트 처리 |
| Server Component | SSR | 서버에서 HTML 생성 |
| API Client | RestTemplate | HTTP 요청 라이브러리 |
| Transformer | Mapper | DTO ↔ Entity 변환 |
| Playwright | Selenium | 브라우저 자동화 테스트 |

---

## 🎓 학습 로드맵 (백엔드 개발자용)

### 1주차: 기본 개념
- [ ] React 컴포넌트와 JSX 문법
- [ ] Props와 State 이해
- [ ] 파일 기반 라우팅 (App Router)

### 2주차: 상태 관리
- [ ] useState, useEffect 사용법
- [ ] Client vs Server Component 차이
- [ ] React Query 기본 사용법

### 3주차: 실전 개발
- [ ] API 연동 (fetch, axios)
- [ ] 에러 핸들링
- [ ] 로딩 상태 처리

### 4주차: 테스트 & 배포
- [ ] Playwright E2E 테스트 작성
- [ ] 빌드 & 배포 프로세스
- [ ] 성능 최적화 기초

---

## 🔗 참고 자료

- [Next.js 공식 문서](https://nextjs.org/docs)
- [React 공식 문서](https://react.dev)
- [TanStack Query](https://tanstack.com/query/latest)
- [Playwright 공식 문서](https://playwright.dev)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)

---

## ❓ 자주 묻는 질문 (FAQ)

### Q1: 왜 useState를 사용하나요? 그냥 변수로 하면 안되나요?
**A:** 일반 변수는 값이 변경되어도 화면이 **재렌더링되지 않습니다**. `useState`는 값 변경 시 자동으로 화면을 업데이트합니다.

```typescript
// ❌ 작동 안 함 (화면 업데이트 안 됨)
let count = 0;
count++; // 화면 변화 없음

// ✅ 작동함 (화면 자동 업데이트)
const [count, setCount] = useState(0);
setCount(count + 1); // 화면 자동 재렌더링
```

### Q2: 'use client'를 언제 써야 하나요?
**A:** 다음 경우에만 사용합니다:
- onClick, onChange 등 **이벤트 핸들러**가 필요할 때
- useState, useEffect 등 **React Hooks**를 사용할 때
- 브라우저 API (localStorage, window 등)를 사용할 때

기본은 **Server Component**를 사용하고, 필요할 때만 'use client'를 추가하세요.

### Q3: async/await은 모든 컴포넌트에서 사용 가능한가요?
**A:** 아닙니다.
- **Server Component**: `async/await` 사용 가능 ✅
- **Client Component**: 직접 사용 불가, React Query 등 사용 ❌

```typescript
// ✅ Server Component
export default async function Page() {
  const data = await fetch('...');
  return <div>{data}</div>;
}

// ❌ Client Component (에러 발생)
'use client';
export default async function Page() {  // Error!
  const data = await fetch('...');
}

// ✅ Client Component (올바른 방법)
'use client';
export default function Page() {
  const { data } = useQuery({ ... });  // React Query 사용
  return <div>{data}</div>;
}
```

### Q4: TypeScript의 타입은 런타임에 검증되나요?
**A:** **아닙니다**. TypeScript는 **컴파일 타임**에만 타입을 검사합니다. 런타임에는 일반 JavaScript로 동작합니다.

```typescript
interface User {
  name: string;
  age: number;
}

// 컴파일 타임: 타입 에러 발생 ✅
const user: User = { name: "John" }; // Error: 'age' is missing

// 런타임: 타입 검사 없음 ❌
const apiResponse = await fetch('/api/user');
const user = await apiResponse.json(); // User 타입이지만 검증 안 됨!
```

API 응답은 **런타임 검증 라이브러리**(Zod, Yup 등)를 사용하세요.

---

**마지막 업데이트:** 2025-11-24
