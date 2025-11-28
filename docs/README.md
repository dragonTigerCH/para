# PARA Note App Documentation

## 📱 프로젝트 개요
PARA 방법론을 구현한 개인 생산성 관리 모바일 앱

**PARA란?**
Tiago Forte가 개발한 디지털 정보 조직화 시스템으로, 모든 정보를 **"실행 가능성(Actionability)"** 기준으로 분류합니다.

## 🎯 PARA 4가지 카테고리 (공식 정의)

### **Projects (프로젝트)**
- **정의**: 명확한 목표와 완료 시점이 있는 단기 노력
- **특징**: 끝이 있음, 달성 가능한 목표
- **예시**: 웹페이지 디자인, 컴퓨터 구매, 스페인어 과정 완료, 욕실 리모델링

### **Areas (책임 영역)**
- **정의**: 지속적인 관리가 필요한 장기 책임 영역
- **특징**: 끝이 없음, 계속 유지되어야 하는 상태
- **업무 예시**: 마케팅, 인사, 제품 관리, 연구개발
- **개인 예시**: 건강, 재정, 가족, 주택 관리

### **Resources (자원)**
- **정의**: 관심 있는 주제의 학습 자료 (현재 프로젝트와 무관)
- **특징**: 참고용 지식, 미래에 유용할 자료
- **예시**: 그래픽 디자인, 개인 생산성, 사진, 마케팅 자료, 언어 학습

### **Archives (아카이브)**
- **정의**: 더 이상 활동하지 않지만 미래 참고를 위해 저장하는 정보
- **포함**: 완료된 프로젝트, 비활성 영역, 관심 없는 자원
- **특징**: 언제든 복원 가능

---

## 🏗️ 핵심 아키텍처

### 1. Content Layer Architecture
**핵심 개념**: Content를 독립적인 단위로 관리하여 자유로운 이동 가능
```
Content (영속적 정보) + Container Metadata (영역별 속성) = 유연한 시스템
```

**PARA 원칙 반영**:
- Content는 P/A/R/A 간 자유롭게 이동 (실행 가능성에 따라)
- 이동 이력 추적 및 복원 가능
- Project 완료 시 Archive로 자동 이동 가능
- Content는 독립적으로 존재 (어느 영역에 속하든 불변)

**핵심 원칙**:
- **실행 가능성 기준 조직화**: 현재 수행 중인 작업(Projects)이 최우선
- **Content와 Container의 분리**: Content는 영속적, Metadata는 상황별
- **Soft Delete 방식**: 데이터 보존으로 언제든 복원 가능


### Backend Services (예정)
- RESTful API (Spring Boot + kotlin)
- 동기화 서비스
- 백업 & 복원

---


## 📝 개발 가이드라인

### Git Commit Convention
```
feat: 새로운 기능 추가
fix: 버그 수정
docs: 문서 수정
style: 코드 포맷팅
refactor: 코드 리팩토링
test: 테스트 코드
chore: 빌드 업무 수정
```

### 브랜치 전략
- `main`: 프로덕션 배포
- `develop`: 개발 통합
- `feature/*`: 기능 개발
- `fix/*`: 버그 수정

---

## 📱 주요 화면

| Home | Projects | Areas | Resources |
|------|----------|-------|-----------|
| 대시보드 | 프로젝트 목록 | 관리 영역 | 자료실 |
| 메트릭 카드 | 진행률 표시 | 습관 트래커 | 태그 기반 검색 |
| 오늘의 포커스 | 우선순위 | 진척도 | 필터링 |

## 🔄 Content 이동 플로우 (PARA 원칙)

```
실행 가능성에 따라 자유롭게 이동:

Inbox → Project (실행 가능한 작업으로 구체화)
Project → Area (장기 관리 영역으로 전환)
Project → Archive (완료 또는 보류)
Area → Archive (더 이상 관리 불필요)
Resource → Project (학습 자료를 실제 프로젝트에 활용)
Archive → Any (복원)
```

**핵심**: "현재 실행 중인 작업(Project)"을 중심으로 정보 흐름 설계

---

## 🎯 로드맵

### Phase 1 (MVP)
- [x] 기본 UI 구현
- [x] 데이터 모델 설계
- [ ] 로컬 DB 연동
- [ ] Content CRUD
- [ ] 기본 이동 기능

### Phase 2
- [ ] 동기화 서비스
- [ ] 검색 기능
- [ ] 필터/정렬
- [ ] 드래그 앤 드롭

### Phase 3
- [ ] 클라우드 백업
- [ ] 협업 기능
- [ ] AI 추천

---

## 📚 참고 자료

- [PARA Method](https://fortelabs.co/blog/para/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [MVVM Pattern Guide](https://docs.flutter.dev/app-architecture/guide)
