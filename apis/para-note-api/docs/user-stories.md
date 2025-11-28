# PARA Note API - User Stories

> 현재 도메인 모델을 기반으로 작성된 사용자 스토리 초안입니다.

## 1. 인증 및 사용자 관리

### US-001: 회원가입
**As a** 신규 사용자
**I want to** 이메일과 비밀번호로 회원가입하고 싶다
**So that** PARA 노트 앱을 사용할 수 있다

**Acceptance Criteria:**
- [ ] 이메일, 비밀번호로 회원가입 가능
- [ ] 이메일 중복 검증
- [ ] 비밀번호 최소 8자 이상
- [ ] 회원가입 시 userId 생성

**API:**
```
POST /api/v1/auth/signup
{
  "email": "user@example.com",
  "password": "password123",
  "name": "홍길동"
}
```

---

### US-002: 로그인
**As a** 등록된 사용자
**I want to** 이메일과 비밀번호로 로그인하고 싶다
**So that** 내 노트에 접근할 수 있다

**Acceptance Criteria:**
- [ ] 이메일/비밀번호로 로그인
- [ ] JWT 토큰 발급
- [ ] 토큰 만료시간 설정

**API:**
```
POST /api/v1/auth/login
{
  "email": "user@example.com",
  "password": "password123"
}

Response:
{
  "accessToken": "eyJhbGc...",
  "refreshToken": "eyJhbGc...",
  "userId": 1
}
```

---

### US-003: 토큰 갱신
**As a** 로그인한 사용자
**I want to** 액세스 토큰이 만료되면 갱신하고 싶다
**So that** 다시 로그인하지 않고 계속 사용할 수 있다

**API:**
```
POST /api/v1/auth/refresh
{
  "refreshToken": "eyJhbGc..."
}
```

---

## 2. Content 관리 (Inbox)

### US-101: Content 생성
**As a** 사용자
**I want to** 빠르게 아이디어를 메모하고 싶다
**So that** 나중에 정리할 수 있도록 Inbox에 저장할 수 있다

**Domain Model:**
```kotlin
Content.create(title, body, userId)
// → containerId = null (Inbox)
```

**Acceptance Criteria:**
- [ ] title, body만으로 Content 생성 가능
- [ ] 기본적으로 Inbox에 저장됨 (containerId = null)
- [ ] title은 필수, body는 선택
- [ ] 생성 시각과 생성자 자동 기록

**API:**
```
POST /api/v1/contents
{
  "title": "새로운 아이디어",
  "body": "나중에 정리할 내용"
}

Response:
{
  "id": 1,
  "title": "새로운 아이디어",
  "body": "나중에 정리할 내용",
  "containerId": null,
  "isInInbox": true,
  "createdAt": "2025-11-14T12:00:00Z",
  "createdBy": 1
}
```

---

### US-102: Inbox 조회
**As a** 사용자
**I want to** 아직 정리하지 않은 모든 Content를 보고 싶다
**So that** 어떤 것들을 분류해야 하는지 알 수 있다

**Acceptance Criteria:**
- [ ] containerId가 null인 모든 Content 조회
- [ ] 최신순으로 정렬
- [ ] 페이징 지원

**API:**
```
GET /api/v1/contents/inbox?page=0&size=20

Response:
{
  "contents": [
    {
      "id": 1,
      "title": "새로운 아이디어",
      "body": "내용...",
      "createdAt": "2025-11-14T12:00:00Z"
    }
  ],
  "totalElements": 5,
  "totalPages": 1
}
```

---

### US-103: Content 수정
**As a** 사용자
**I want to** Content의 제목이나 내용을 수정하고 싶다
**So that** 더 명확하게 표현할 수 있다

**Domain Model:**
```kotlin
content.modified(newTitle = "수정된 제목", newBody = "수정된 내용", modifiedBy = userId)
```

**API:**
```
PATCH /api/v1/contents/{contentId}
{
  "title": "수정된 제목",
  "body": "수정된 내용"
}
```

---

### US-104: Content 삭제
**As a** 사용자
**I want to** 더 이상 필요없는 Content를 삭제하고 싶다
**So that** 깔끔하게 관리할 수 있다

**API:**
```
DELETE /api/v1/contents/{contentId}
```

---

## 3. Container 관리 (프로젝트/영역/자료)

### US-201: 프로젝트 생성
**As a** 사용자
**I want to** 새로운 프로젝트를 만들고 싶다
**So that** 특정 목표를 위한 작업들을 모을 수 있다

**Domain Model:**
```kotlin
// 1. Container 생성
BaseContainer.create(title, description, ContainerMode.PROJECT, userId)

// 2. Project 속성 생성
Project(containerId, deadline, priority, status)
```

**Acceptance Criteria:**
- [ ] Container와 Project가 함께 생성됨
- [ ] title은 필수
- [ ] deadline, priority, status는 선택
- [ ] 빈 프로젝트 생성 가능 (Content 없이)

**API:**
```
POST /api/v1/containers/projects
{
  "title": "블로그 운영",
  "description": "개인 기술 블로그 시작",
  "deadline": "2025-12-31",
  "priority": "긴급",
  "status": "진행중"
}

Response:
{
  "containerId": 1,
  "title": "블로그 운영",
  "currentMode": "PROJECT",
  "project": {
    "deadline": "2025-12-31",
    "priority": "긴급",
    "status": "진행중"
  },
  "contentCount": 0
}
```

---

### US-202: 영역(Area) 생성
**As a** 사용자
**I want to** 지속적으로 관리할 영역을 만들고 싶다
**So that** 장기적인 책임 영역을 추적할 수 있다

**API:**
```
POST /api/v1/containers/areas
{
  "title": "건강 관리",
  "description": "운동, 식단, 수면",
  "category": "개인",
  "reviewCycle": "WEEKLY"
}
```

---

### US-203: 자료(Resource) 생성
**As a** 사용자
**I want to** 참고 자료 모음집을 만들고 싶다
**So that** 관심 주제의 자료들을 한 곳에 모을 수 있다

**API:**
```
POST /api/v1/containers/resources
{
  "title": "디자인 참고 자료",
  "category": "그래픽 디자인",
  "sourceUrl": "https://example.com"
}
```

---

### US-204: 내 모든 프로젝트 조회
**As a** 사용자
**I want to** 내가 진행 중인 모든 프로젝트를 보고 싶다
**So that** 어떤 프로젝트들이 있는지 한눈에 볼 수 있다

**Acceptance Criteria:**
- [ ] currentMode가 PROJECT인 Container 조회
- [ ] Project 속성도 함께 조회
- [ ] 각 Container의 Content 개수 포함

**API:**
```
GET /api/v1/containers/projects

Response:
{
  "projects": [
    {
      "containerId": 1,
      "title": "블로그 운영",
      "currentMode": "PROJECT",
      "project": {
        "deadline": "2025-12-31",
        "priority": "긴급",
        "status": "진행중"
      },
      "contentCount": 5
    }
  ]
}
```

---

### US-205: Container 상세 조회
**As a** 사용자
**I want to** 특정 프로젝트/영역의 상세 정보를 보고 싶다
**So that** 어떤 Content들이 있는지 확인할 수 있다

**Acceptance Criteria:**
- [ ] Container 정보
- [ ] 현재 모드의 속성 (Project/Area/Resource)
- [ ] 해당 Container에 속한 모든 Content 목록

**API:**
```
GET /api/v1/containers/{containerId}

Response:
{
  "containerId": 1,
  "title": "블로그 운영",
  "description": "개인 기술 블로그",
  "currentMode": "PROJECT",
  "project": {
    "deadline": "2025-12-31",
    "priority": "긴급",
    "status": "진행중"
  },
  "contents": [
    {
      "id": 10,
      "title": "첫 포스트 아이디어",
      "body": "PARA 방법론 소개"
    },
    {
      "id": 11,
      "title": "디자인 시안",
      "body": "메인 페이지 레이아웃"
    }
  ]
}
```

---

### US-206: Container 수정
**As a** 사용자
**I want to** Container의 제목이나 설명을 수정하고 싶다
**So that** 더 명확한 이름으로 관리할 수 있다

**Domain Model:**
```kotlin
container.modifiedTitle("새 제목", userId)
container.modifiedDescription("새 설명", userId)
```

**API:**
```
PATCH /api/v1/containers/{containerId}
{
  "title": "기술 블로그 운영",
  "description": "Kotlin & Spring 블로그"
}
```

---

### US-207: Project 속성 수정
**As a** 사용자
**I want to** 프로젝트의 마감일이나 우선순위를 변경하고 싶다
**So that** 상황에 맞게 조정할 수 있다

**Domain Model:**
```kotlin
project.modifiedDeadline(newDeadline)
project.modifiedPriority(newPriority)
project.modifiedStatus(newStatus)
```

**API:**
```
PATCH /api/v1/containers/{containerId}/project
{
  "deadline": "2026-01-31",
  "priority": "보통",
  "status": "완료"
}
```

---

## 4. Content와 Container 연결

### US-301: Inbox의 Content를 Container로 이동
**As a** 사용자
**I want to** Inbox에 있는 Content를 프로젝트에 배치하고 싶다
**So that** 정리된 상태로 관리할 수 있다

**Domain Model:**
```kotlin
content.moveToContainer(containerId, userId)
```

**Acceptance Criteria:**
- [ ] Inbox(containerId=null)에서 특정 Container로 이동
- [ ] Content의 title, body는 변경되지 않음
- [ ] 여러 Content를 한 번에 이동 가능

**API:**
```
POST /api/v1/contents/{contentId}/move
{
  "containerId": 1
}

또는 일괄 이동:
POST /api/v1/contents/bulk-move
{
  "contentIds": [1, 2, 3],
  "containerId": 1
}
```

---

### US-302: Content를 다른 Container로 이동
**As a** 사용자
**I want to** Content를 프로젝트A에서 프로젝트B로 옮기고 싶다
**So that** 더 적합한 곳으로 재배치할 수 있다

**Domain Model:**
```kotlin
content.moveToContainer(newContainerId, userId)
```

**API:**
```
POST /api/v1/contents/{contentId}/move
{
  "containerId": 2
}
```

---

### US-303: Content를 다시 Inbox로 이동
**As a** 사용자
**I want to** Content를 Container에서 다시 Inbox로 빼고 싶다
**So that** 나중에 다시 분류할 수 있다

**Domain Model:**
```kotlin
content.moveToContainer(null, userId)
```

**API:**
```
POST /api/v1/contents/{contentId}/move
{
  "containerId": null
}
```

---

## 5. Container Transformation (PARA 핵심 기능)

### US-401: 프로젝트를 영역으로 전환
**As a** 사용자
**I want to** 완료된 프로젝트를 지속 관리하는 영역으로 바꾸고 싶다
**So that** 프로젝트가 끝나도 계속 관리할 수 있다

**시나리오:**
```
"블로그 운영" 프로젝트 (마감일: 2025-12-31)
→ 블로그 런칭 완료!
→ "블로그 운영" 영역으로 전환 (지속 관리)
→ 기존 Content들은 그대로 유지
```

**Domain Model:**
```kotlin
// 1. Container 모드 변경
container.changeMode(ContainerMode.AREA, userId)

// 2. Project 비활성화
project.deactivate()

// 3. Area 생성 및 활성화
Area.create(containerId, category, reviewCycle)
```

**Acceptance Criteria:**
- [ ] Container의 currentMode가 PROJECT → AREA로 변경
- [ ] Project 속성은 active=false (보존됨, 삭제 안 됨)
- [ ] Area 속성 새로 생성 (active=true)
- [ ] 모든 Content의 containerId는 그대로 유지
- [ ] Content 수정 없이 Container만 변경

**API:**
```
POST /api/v1/containers/{containerId}/transform
{
  "targetMode": "AREA",
  "areaAttributes": {
    "category": "콘텐츠 제작",
    "reviewCycle": "WEEKLY"
  }
}

Response:
{
  "containerId": 1,
  "title": "블로그 운영",
  "currentMode": "AREA",
  "area": {
    "category": "콘텐츠 제작",
    "reviewCycle": "WEEKLY",
    "active": true
  },
  "previousMode": {
    "mode": "PROJECT",
    "project": {
      "deadline": "2025-12-31",
      "priority": "긴급",
      "status": "완료",
      "active": false  // 보존됨!
    }
  },
  "contentCount": 5  // Content는 그대로!
}
```

---

### US-402: 영역을 프로젝트로 전환
**As a** 사용자
**I want to** 영역에서 구체적인 목표가 생겨서 프로젝트로 바꾸고 싶다
**So that** 마감일을 설정하고 집중할 수 있다

**시나리오:**
```
"건강 관리" 영역
→ "마라톤 완주"라는 구체적 목표 생김
→ "마라톤 준비" 프로젝트로 전환 (마감일: 대회 날짜)
```

**API:**
```
POST /api/v1/containers/{containerId}/transform
{
  "targetMode": "PROJECT",
  "projectAttributes": {
    "deadline": "2026-04-20",
    "priority": "긴급",
    "status": "진행중"
  }
}
```

---

### US-403: 프로젝트를 아카이브로 전환
**As a** 사용자
**I want to** 완료된 프로젝트를 보관하고 싶다
**So that** 나중에 참고할 수 있지만 활성 목록에서는 숨길 수 있다

**Domain Model:**
```kotlin
container.changeMode(ContainerMode.ARCHIVE, userId)
project.deactivate()
Archive.create(
    containerId,
    archivedReason = "프로젝트 성공적으로 완료",
    previousMode = "PROJECT"
)
```

**API:**
```
POST /api/v1/containers/{containerId}/archive
{
  "reason": "프로젝트 성공적으로 완료"
}

Response:
{
  "containerId": 1,
  "currentMode": "ARCHIVE",
  "archive": {
    "archivedReason": "프로젝트 성공적으로 완료",
    "archivedAt": "2025-11-14T12:00:00Z",
    "previousMode": "PROJECT"
  }
}
```

---

### US-404: 아카이브를 이전 모드로 복원
**As a** 사용자
**I want to** 아카이브한 Container를 다시 활성화하고 싶다
**So that** 다시 작업할 수 있다

**Domain Model:**
```kotlin
// Archive의 previousMode 확인
val previousMode = archive.previousMode

// 이전 모드로 복원
container.changeMode(previousMode, userId)
archive.deactivate()
project.activate() // 이전 데이터 그대로!
```

**Acceptance Criteria:**
- [ ] Archive의 previousMode를 참고하여 복원
- [ ] 이전 모드의 모든 속성이 그대로 복원됨
- [ ] Content도 그대로 유지

**API:**
```
POST /api/v1/containers/{containerId}/restore

Response:
{
  "containerId": 1,
  "currentMode": "PROJECT",
  "project": {
    "deadline": "2025-12-31",  // 복원된 이전 데이터!
    "priority": "긴급",
    "status": "완료",
    "active": true
  }
}
```

---

### US-405: Container의 변환 히스토리 조회
**As a** 사용자
**I want to** 이 Container가 어떻게 변화했는지 보고 싶다
**So that** 이전 상태를 확인할 수 있다

**Acceptance Criteria:**
- [ ] Project, Area, Resource, Archive의 모든 속성 조회
- [ ] active=false인 것도 포함 (히스토리)
- [ ] 시간순으로 정렬

**API:**
```
GET /api/v1/containers/{containerId}/history

Response:
{
  "containerId": 1,
  "title": "블로그 운영",
  "currentMode": "AREA",
  "history": [
    {
      "mode": "PROJECT",
      "active": false,
      "attributes": {
        "deadline": "2025-12-31",
        "priority": "긴급",
        "status": "완료"
      }
    },
    {
      "mode": "AREA",
      "active": true,
      "attributes": {
        "category": "콘텐츠 제작",
        "reviewCycle": "WEEKLY"
      }
    }
  ]
}
```

---

## 6. 검색 및 필터링

### US-501: Content 전체 검색
**As a** 사용자
**I want to** 제목이나 본문으로 Content를 검색하고 싶다
**So that** 원하는 정보를 빠르게 찾을 수 있다

**API:**
```
GET /api/v1/contents/search?q=PARA&page=0&size=20

Response:
{
  "contents": [
    {
      "id": 10,
      "title": "PARA 방법론",
      "body": "Projects, Areas, Resources, Archives...",
      "containerId": 1,
      "containerTitle": "블로그 운영",
      "highlightedText": "...PARA 방법론은..."
    }
  ]
}
```

---

### US-502: Container 필터링
**As a** 사용자
**I want to** 특정 조건으로 Container를 필터링하고 싶다
**So that** 원하는 것만 볼 수 있다

**Acceptance Criteria:**
- [ ] 모드별 필터 (PROJECT, AREA, RESOURCE, ARCHIVE)
- [ ] 마감일 임박 순 정렬
- [ ] 우선순위별 필터

**API:**
```
GET /api/v1/containers?mode=PROJECT&priority=긴급&sort=deadline,asc

Response:
{
  "containers": [
    {
      "containerId": 1,
      "title": "블로그 운영",
      "currentMode": "PROJECT",
      "project": {
        "deadline": "2025-12-15",
        "priority": "긴급"
      }
    }
  ]
}
```

---

## 7. 대시보드 및 통계

### US-601: 대시보드 요약 조회
**As a** 사용자
**I want to** 내 작업 현황을 한눈에 보고 싶다
**So that** 무엇을 먼저 해야 할지 결정할 수 있다

**API:**
```
GET /api/v1/dashboard

Response:
{
  "inbox": {
    "count": 12,
    "recentContents": [...]
  },
  "projects": {
    "active": 3,
    "urgent": 1,
    "dueThisWeek": 2
  },
  "areas": {
    "count": 5,
    "needReview": 2
  },
  "resources": {
    "count": 10,
    "favorites": 3
  },
  "archives": {
    "count": 15
  }
}
```

---

## 8. 추가 기능 (Future)

### US-701: Content에 태그 추가
**As a** 사용자
**I want to** Content에 태그를 추가하고 싶다
**So that** 더 세밀하게 분류할 수 있다

### US-702: Container 간 Content 일괄 이동
**As a** 사용자
**I want to** 여러 Content를 한 번에 다른 Container로 옮기고 싶다
**So that** 대량 정리 작업을 효율적으로 할 수 있다

### US-703: 즐겨찾기 기능
**As a** 사용자
**I want to** 자주 쓰는 Container를 즐겨찾기하고 싶다
**So that** 빠르게 접근할 수 있다

### US-704: 알림 기능
**As a** 사용자
**I want to** 프로젝트 마감일이 가까워지면 알림을 받고 싶다
**So that** 놓치지 않을 수 있다

---

## 우선순위

### Phase 1 (MVP) - 필수 기능
- ✅ US-001~003: 인증
- ✅ US-101~104: Content 기본 CRUD
- ✅ US-201, 204, 205: Container 생성 및 조회
- ✅ US-301: Content를 Container로 이동
- ✅ US-401: 프로젝트 → 영역 전환 (핵심!)

### Phase 2 - 완성도 향상
- US-202, 203: Area, Resource 생성
- US-206, 207: Container 수정
- US-302, 303: Content 이동 고급 기능
- US-402~404: 다양한 모드 전환
- US-501, 502: 검색 및 필터링

### Phase 3 - 사용자 경험 개선
- US-405: 히스토리 조회
- US-601: 대시보드
- US-701~704: 추가 편의 기능

---

## API 구조 요약

```
/api/v1
├── /auth
│   ├── POST /signup
│   ├── POST /login
│   └── POST /refresh
│
├── /contents
│   ├── POST /                      # Content 생성
│   ├── GET /inbox                  # Inbox 조회
│   ├── GET /{contentId}            # Content 조회
│   ├── PATCH /{contentId}          # Content 수정
│   ├── DELETE /{contentId}         # Content 삭제
│   ├── POST /{contentId}/move      # Container로 이동
│   ├── POST /bulk-move             # 일괄 이동
│   └── GET /search                 # 검색
│
├── /containers
│   ├── POST /projects              # 프로젝트 생성
│   ├── POST /areas                 # 영역 생성
│   ├── POST /resources             # 자료 생성
│   ├── GET /projects               # 내 모든 프로젝트
│   ├── GET /areas                  # 내 모든 영역
│   ├── GET /resources              # 내 모든 자료
│   ├── GET /archives               # 내 모든 아카이브
│   ├── GET /{containerId}          # Container 상세
│   ├── PATCH /{containerId}        # Container 수정
│   ├── DELETE /{containerId}       # Container 삭제
│   ├── PATCH /{containerId}/project   # Project 속성 수정
│   ├── POST /{containerId}/transform  # 모드 전환 (핵심!)
│   ├── POST /{containerId}/archive    # 아카이브
│   ├── POST /{containerId}/restore    # 복원
│   └── GET /{containerId}/history     # 히스토리
│
└── /dashboard
    └── GET /                       # 대시보드 요약
```

---

## 다음 단계

1. **인증 모듈 구현**
   - Spring Security + JWT
   - User 도메인 모델
   - UserRepository, AuthService

2. **Controller 레이어 구현**
   - ContentController
   - ContainerController
   - Request/Response DTO 정의

3. **Repository 레이어 구현**
   - JPA Entity 매핑
   - Repository 인터페이스
   - QueryDSL (검색 기능)

4. **Service 레이어 구현**
   - ContentService
   - ContainerService
   - ContainerTransformationService (핵심!)

5. **통합 테스트**
   - API 테스트
   - Container Transformation 시나리오 테스트
