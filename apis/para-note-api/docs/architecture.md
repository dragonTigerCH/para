# PARA Note API - Architecture Documentation

## 1. Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    CONTAINERS ||--o| PROJECTS : "has"
    CONTAINERS ||--o| AREAS : "has"
    CONTAINERS ||--o| RESOURCES : "has"
    CONTAINERS ||--o| ARCHIVES : "has"
    CONTAINERS ||--o{ CONTENTS : "contains"

    CONTAINERS {
        bigserial id PK
        varchar title
        text description
        varchar current_mode "PROJECT|AREA|RESOURCE|ARCHIVE"
        timestamptz created_at
        bigint created_by
        timestamptz updated_at
        bigint updated_by
        timestamptz deleted_at "soft delete"
    }

    PROJECTS {
        bigint container_id PK,FK
        date deadline
        varchar priority "사용자 정의"
        varchar status "사용자 정의"
        boolean active "현재 모드 여부"
    }

    AREAS {
        bigint container_id PK,FK
        varchar category "사용자 정의"
        varchar review_cycle "사용자 정의"
        boolean active "현재 모드 여부"
    }

    RESOURCES {
        bigint container_id PK,FK
        varchar category "사용자 정의"
        boolean is_favorite
        text source_url
        boolean active "현재 모드 여부"
    }

    ARCHIVES {
        bigint container_id PK,FK
        text archived_reason
        timestamptz archived_at
        varchar previous_mode "복원 시 참고"
        boolean active "현재 모드 여부"
    }

    CONTENTS {
        bigserial id PK
        varchar title
        text body
        varchar type "사용자 정의"
        bigint container_id FK "NULL = Inbox"
        boolean is_draft
        timestamptz created_at
        bigint created_by
        timestamptz updated_at
        bigint updated_by
    }
```

## 2. Container Transformation Sequence Diagram

### 2.1 Project → Area → Project (데이터 보존)

```mermaid
sequenceDiagram
    participant User
    participant Container
    participant Project
    participant Area

    Note over Container,Project: 초기 상태: PROJECT 모드
    Container->>Container: currentMode = PROJECT
    Project->>Project: active = true<br/>deadline = 2025-12-31<br/>priority = "긴급"

    User->>Container: changeMode(AREA)
    Container->>Container: currentMode = AREA
    Container->>Project: deactivate()
    Project->>Project: active = false<br/>(데이터는 보존됨!)

    Container->>Area: create()
    Area->>Area: active = true<br/>category = "커리어"

    Note over Container,Area: AREA 모드로 전환 완료

    User->>Container: changeMode(PROJECT)
    Container->>Container: currentMode = PROJECT
    Container->>Area: deactivate()
    Area->>Area: active = false<br/>(데이터는 보존됨!)

    Container->>Project: activate()
    Project->>Project: active = true<br/>이전 데이터 복원!<br/>deadline = 2025-12-31<br/>priority = "긴급"

    Note over Container,Project: PROJECT 모드로 복귀<br/>이전 데이터 완전 복원!
```

### 2.2 Project → Archive → Project (복원 시나리오)

```mermaid
sequenceDiagram
    participant User
    participant Container
    participant Project
    participant Archive

    Note over Container,Project: 초기 상태: PROJECT 완료
    Container->>Container: currentMode = PROJECT
    Project->>Project: active = true<br/>status = "완료"

    User->>Container: changeMode(ARCHIVE)
    Container->>Container: currentMode = ARCHIVE
    Container->>Project: deactivate()
    Project->>Project: active = false

    Container->>Archive: create(previousMode = "PROJECT")
    Archive->>Archive: active = true<br/>previousMode = "PROJECT"<br/>archivedReason = "완료"

    Note over Container,Archive: ARCHIVE 모드

    User->>Archive: 복원 요청
    Archive->>Container: changeMode(PROJECT)
    Container->>Container: currentMode = PROJECT

    Container->>Archive: deactivate()
    Archive->>Archive: active = false

    Container->>Project: activate()
    Project->>Project: active = true<br/>이전 상태 복원

    Note over Container,Project: PROJECT 모드로 복원
```

## 3. Domain Model Class Diagram

```mermaid
classDiagram
    class BaseContainer {
        +Long? id
        +String title
        +String? description
        +ContainerMode currentMode
        +Instant createdAt
        +Long createdBy
        +Instant updatedAt
        +Long updatedBy
        +Instant? deletedAt
        +changeMode(newMode, updatedBy) BaseContainer
        +updateTitle(newTitle, updatedBy) BaseContainer
        +updateDescription(newDesc, updatedBy) BaseContainer
        +softDelete(deletedBy) BaseContainer
        +restore(restoredBy) BaseContainer
        +isProject() Boolean
        +isArea() Boolean
        +isResource() Boolean
        +isArchive() Boolean
    }

    class Project {
        +Long containerId
        +LocalDate? deadline
        +String? priority
        +String? status
        +Boolean active
        +updateDeadline(newDeadline) Project
        +updatePriority(newPriority) Project
        +updateStatus(newStatus) Project
        +activate() Project
        +deactivate() Project
    }

    class Area {
        +Long containerId
        +String? category
        +String? reviewCycle
        +Boolean active
        +updateCategory(newCategory) Area
        +updateReviewCycle(newCycle) Area
        +activate() Area
        +deactivate() Area
    }

    class Resource {
        +Long containerId
        +String? category
        +Boolean isFavorite
        +String? sourceUrl
        +Boolean active
        +updateCategory(newCategory) Resource
        +toggleFavorite() Resource
        +updateSourceUrl(newUrl) Resource
        +activate() Resource
        +deactivate() Resource
    }

    class Archive {
        +Long containerId
        +String archivedReason
        +Instant archivedAt
        +String? previousMode
        +Boolean active
        +updateArchivedReason(newReason) Archive
        +activate() Archive
        +deactivate() Archive
    }

    class Content {
        +Long? id
        +String title
        +String body
        +ContentType type
        +Long? containerId
        +Boolean isDraft
        +Instant createdAt
        +Long createdBy
        +Instant updatedAt
        +Long updatedBy
        +moveTo(newContainerId, updatedBy) Content
        +moveToInbox(updatedBy) Content
        +isInInbox() Boolean
        +publish(updatedBy) Content
    }

    class ContainerMode {
        <<enumeration>>
        PROJECT
        AREA
        RESOURCE
        ARCHIVE
    }

    class ContentType {
        <<enumeration>>
        NOTE
        TASK
        BOOKMARK
        DOCUMENT
    }

    BaseContainer "1" --> "0..1" Project : has
    BaseContainer "1" --> "0..1" Area : has
    BaseContainer "1" --> "0..1" Resource : has
    BaseContainer "1" --> "0..1" Archive : has
    BaseContainer "1" --> "0..*" Content : contains
    BaseContainer --> ContainerMode : uses
    Content --> ContentType : uses
```

## 4. Container Transformation State Machine

```mermaid
stateDiagram-v2
    [*] --> PROJECT : 새 프로젝트 생성
    [*] --> AREA : 새 영역 생성
    [*] --> RESOURCE : 새 자료 생성

    PROJECT --> AREA : 장기 관리 영역으로 전환
    PROJECT --> ARCHIVE : 프로젝트 완료
    PROJECT --> RESOURCE : 참고 자료로 전환

    AREA --> PROJECT : 구체적 목표 설정
    AREA --> ARCHIVE : 영역 종료
    AREA --> RESOURCE : 자료로 전환

    RESOURCE --> PROJECT : 실행 가능한 프로젝트로
    RESOURCE --> AREA : 지속 관리 영역으로
    RESOURCE --> ARCHIVE : 더 이상 필요 없음

    ARCHIVE --> PROJECT : 프로젝트 재시작
    ARCHIVE --> AREA : 영역 재활성화
    ARCHIVE --> RESOURCE : 자료로 복원

    note right of PROJECT
        active = true인 Project 속성
        deadline, priority, status
    end note

    note right of AREA
        active = true인 Area 속성
        category, reviewCycle
    end note

    note right of RESOURCE
        active = true인 Resource 속성
        category, isFavorite, sourceUrl
    end note

    note right of ARCHIVE
        active = true인 Archive 속성
        previousMode로 복원 가능
    end note
```

## 5. Content Flow Diagram

```mermaid
flowchart TD
    Start([새 Content 생성]) --> Inbox[Inbox<br/>container_id = NULL]

    Inbox -->|분류| ToProject[Project Container로 이동]
    Inbox -->|분류| ToArea[Area Container로 이동]
    Inbox -->|분류| ToResource[Resource Container로 이동]

    ToProject --> ProjectContainer[PROJECT Container]
    ToArea --> AreaContainer[AREA Container]
    ToResource --> ResourceContainer[RESOURCE Container]

    ProjectContainer -->|Container 모드 변경| AreaContainer
    AreaContainer -->|Container 모드 변경| ResourceContainer
    ResourceContainer -->|Container 모드 변경| ProjectContainer

    ProjectContainer -->|Container 모드 변경| ArchiveContainer[ARCHIVE Container]
    AreaContainer -->|Container 모드 변경| ArchiveContainer
    ResourceContainer -->|Container 모드 변경| ArchiveContainer

    ArchiveContainer -->|복원| ProjectContainer
    ArchiveContainer -->|복원| AreaContainer
    ArchiveContainer -->|복원| ResourceContainer

    ProjectContainer -->|재분류| Inbox
    AreaContainer -->|재분류| Inbox
    ResourceContainer -->|재분류| Inbox
    ArchiveContainer -->|재분류| Inbox

    style Inbox fill:#f9f,stroke:#333,stroke-width:4px
    style ArchiveContainer fill:#ddd,stroke:#333,stroke-width:2px
```

## 6. 핵심 설계 원칙

### 6.1 Container Transformation Model
- **단일 Container**: 하나의 Container가 여러 모드 간 전환
- **속성 보존**: 모드 변경 시 이전 속성은 `active=false`로 비활성화되지만 삭제되지 않음
- **완벽한 복원**: 이전 모드로 돌아갈 때 모든 데이터 그대로 복원
- **히스토리 추적**: 모든 모드별 속성이 영구 보존되어 변경 이력 확인 가능

### 6.2 Content Independence
- **Container 독립성**: Content는 Container와 독립적으로 존재
- **자유로운 이동**: Container 간 자유롭게 이동 가능 (`moveTo`)
- **Inbox 패턴**: `container_id = NULL`인 Content는 미분류 상태 (Inbox)
- **Container 모드 무관**: Container의 모드 변경이 Content에 영향 없음

### 6.3 User-Defined Flexibility
- **유연한 카테고리**: category, priority, status 등 모두 사용자 정의 가능
- **Enum 제약 없음**: DB 레벨에서 CHECK constraint 없음
- **확장 가능**: 새로운 모드나 속성 추가 용이

### 6.4 PARA Philosophy
- **Projects**: 명확한 목표와 기한이 있는 작업
- **Areas**: 지속적인 관리가 필요한 책임 영역
- **Resources**: 관심 주제의 참고 자료
- **Archives**: 비활성화되었지만 보존된 정보

## 7. 주요 사용 시나리오

### 7.1 새 프로젝트 시작
1. Container 생성 (`currentMode = PROJECT`)
2. Project 속성 설정 (deadline, priority, status)
3. Content 생성 및 Container 연결

### 7.2 프로젝트 → 영역 전환
1. Container의 `currentMode`를 AREA로 변경
2. Project 속성 `active = false` (데이터 보존!)
3. Area 속성 생성 (`active = true`)
4. Content는 그대로 유지 (container_id 변경 없음)

### 7.3 프로젝트 완료 → 아카이브
1. Project `status = "완료"` 업데이트
2. Container의 `currentMode`를 ARCHIVE로 변경
3. Archive 속성 생성 (`previousMode = "PROJECT"`)
4. 나중에 `previousMode`를 참고하여 복원 가능

### 7.4 Inbox에서 분류
1. Content 생성 시 `container_id = NULL` (Inbox)
2. 적절한 Container로 이동 (`moveTo(containerId)`)
3. Container의 모드에 따라 자동 분류
