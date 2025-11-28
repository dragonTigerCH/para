# TDD Plan - PARA Note API

## 현재 진행 상황
이 문서는 TDD 방식으로 PARA Note API를 개발하기 위한 테스트 계획입니다.

## Phase 1: Core Domain Models (진행중)

### 1. Content Domain Model
- [ ] Content 생성 테스트 (title 필수, body 선택)
- [ ] Content를 Container로 이동하는 테스트
- [ ] Content를 Inbox로 이동하는 테스트 (containerId = null)
- [ ] Content 수정 테스트 (modified 메서드)
- [ ] Content isDraft 상태 변경 테스트

### 2. BaseContainer Domain Model
- [ ] BaseContainer 생성 테스트 (title 필수)
- [ ] BaseContainer 모드 변경 테스트 (changeMode)
- [ ] BaseContainer title 수정 테스트
- [ ] BaseContainer description 수정 테스트
- [ ] BaseContainer soft delete 테스트
- [ ] BaseContainer restore 테스트

### 3. Project Domain Model
- [ ] Project 생성 테스트 (containerId 연결)
- [ ] Project deadline 수정 테스트
- [ ] Project priority 수정 테스트
- [ ] Project status 수정 테스트
- [ ] Project activate/deactivate 테스트

### 4. Area Domain Model
- [ ] Area 생성 테스트
- [ ] Area category 수정 테스트
- [ ] Area reviewCycle 수정 테스트
- [ ] Area activate/deactivate 테스트

### 5. Resource Domain Model
- [ ] Resource 생성 테스트
- [ ] Resource category 수정 테스트
- [ ] Resource favorite 토글 테스트
- [ ] Resource sourceUrl 수정 테스트
- [ ] Resource activate/deactivate 테스트

### 6. Archive Domain Model
- [ ] Archive 생성 테스트 (previousMode 포함)
- [ ] Archive archivedReason 수정 테스트
- [ ] Archive activate/deactivate 테스트

## Phase 2: Container Transformation (핵심 기능)

### 7. Container Mode Transformation
- [ ] Project → Area 전환 테스트 (데이터 보존)
- [ ] Area → Project 전환 테스트 (이전 데이터 복원)
- [ ] Project → Archive 전환 테스트
- [ ] Archive → Project 복원 테스트 (previousMode 사용)
- [ ] Area → Archive 전환 테스트
- [ ] Archive → Area 복원 테스트

## Phase 3: Repository Layer

### 8. ContentRepository
- [ ] Content 저장 테스트
- [ ] Content ID로 조회 테스트
- [ ] Inbox Content 조회 테스트 (containerId = null)
- [ ] Container별 Content 조회 테스트
- [ ] Content 삭제 테스트

### 9. ContainerRepository
- [ ] BaseContainer 저장 테스트
- [ ] BaseContainer ID로 조회 테스트
- [ ] 사용자별 Container 조회 테스트
- [ ] 모드별 Container 조회 테스트
- [ ] Container soft delete 테스트

### 10. ProjectRepository
- [ ] Project 저장 테스트
- [ ] containerId로 Project 조회 테스트
- [ ] active Project만 조회 테스트

### 11. AreaRepository
- [ ] Area 저장 테스트
- [ ] containerId로 Area 조회 테스트
- [ ] active Area만 조회 테스트

## Phase 4: Service Layer

### 12. ContentService
- [ ] Content 생성 서비스 테스트
- [ ] Content 수정 서비스 테스트
- [ ] Content를 Container로 이동 서비스 테스트
- [ ] Inbox Content 조회 서비스 테스트

### 13. ContainerService
- [ ] Container + Project 생성 서비스 테스트
- [ ] Container + Area 생성 서비스 테스트
- [ ] Container 수정 서비스 테스트
- [ ] Container 삭제 서비스 테스트

### 14. ContainerTransformationService (핵심)
- [ ] Container 모드 전환 서비스 테스트
- [ ] 전환 시 이전 속성 비활성화 테스트
- [ ] 복원 시 이전 데이터 복원 테스트
- [ ] Container 히스토리 조회 서비스 테스트

## Phase 5: API Layer

### 15. AuthController
- [ ] 회원가입 API 테스트
- [ ] 로그인 API 테스트
- [ ] 토큰 갱신 API 테스트

### 16. ContentController
- [ ] POST /api/v1/contents (Content 생성) API 테스트
- [ ] GET /api/v1/contents/inbox (Inbox 조회) API 테스트
- [ ] PATCH /api/v1/contents/{id} (Content 수정) API 테스트
- [ ] DELETE /api/v1/contents/{id} (Content 삭제) API 테스트
- [ ] POST /api/v1/contents/{id}/move (Container 이동) API 테스트

### 17. ContainerController
- [ ] POST /api/v1/containers/projects (프로젝트 생성) API 테스트
- [ ] POST /api/v1/containers/areas (영역 생성) API 테스트
- [ ] GET /api/v1/containers/projects (프로젝트 목록) API 테스트
- [ ] GET /api/v1/containers/{id} (Container 상세) API 테스트
- [ ] PATCH /api/v1/containers/{id} (Container 수정) API 테스트
- [ ] POST /api/v1/containers/{id}/transform (모드 전환) API 테스트

## 현재 작업
다음 미완료 테스트부터 시작합니다.

## TDD 원칙
1. Red: 실패하는 테스트 먼저 작성
2. Green: 테스트를 통과시키는 최소한의 코드 작성
3. Refactor: 중복 제거 및 코드 개선
4. 구조적 변경과 동작 변경을 분리하여 커밋
