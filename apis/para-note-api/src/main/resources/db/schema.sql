
-- ============================================================================
-- PARA Note App - Container Transformation Model
-- ============================================================================
--
-- PARA 철학: 문서는 실행 가능성에 따라 자유롭게 이동하며 "살아있는" 상태를 유지
-- - Container는 current_mode를 변경하여 PROJECT/AREA/RESOURCE/ARCHIVE 간 전환
-- - 각 모드별 속성은 별도 테이블에 영구 보존
-- - 모드 변경 시 이전 모드의 속성은 비활성화(active=false)되지만 삭제되지 않음
--
-- ============================================================================

-- para 스키마 생성
CREATE SCHEMA IF NOT EXISTS para;

-- ============================================================================
-- Users: 사용자 정보
-- ============================================================================
CREATE TABLE IF NOT EXISTS para.users (
    id BIGSERIAL PRIMARY KEY,
    identifier VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255),
    name VARCHAR(100) NOT NULL,
    social_provider VARCHAR(50),
    authorities VARCHAR(255) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by BIGINT NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_by BIGINT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_users_identifier ON para.users(identifier);
CREATE INDEX IF NOT EXISTS idx_users_social_provider ON para.users(social_provider) WHERE social_provider IS NOT NULL;

COMMENT ON TABLE para.users IS '사용자 정보';
COMMENT ON COLUMN para.users.identifier IS '로그인 ID (이메일 또는 소셜 ID)';
COMMENT ON COLUMN para.users.password IS '비밀번호 (소셜 로그인 시 NULL)';
COMMENT ON COLUMN para.users.social_provider IS '소셜 로그인 제공자 (google, github 등)';

-- ============================================================================
-- Container: PARA의 핵심 컨테이너
-- ============================================================================
CREATE TABLE IF NOT EXISTS para.containers (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    current_mode VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by BIGINT NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_by BIGINT NOT NULL,
    deleted_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_containers_current_mode ON para.containers(current_mode) WHERE deleted_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_containers_deleted ON para.containers(deleted_at);

COMMENT ON TABLE para.containers IS 'PARA 컨테이너: current_mode를 변경하여 PROJECT/AREA/RESOURCE/ARCHIVE 간 전환';
COMMENT ON COLUMN para.containers.current_mode IS '현재 모드 (사용자 정의 가능)';
COMMENT ON COLUMN para.containers.deleted_at IS 'Soft delete timestamp';

-- ============================================================================
-- Projects: Project 모드 속성
-- PARA 원칙: Projects는 명확한 완료 시점(deadline)과 달성 가능한 목표가 있어야 함
-- ============================================================================
CREATE TABLE IF NOT EXISTS para.projects (
    container_id BIGINT PRIMARY KEY REFERENCES para.containers(id) ON DELETE CASCADE,
    deadline DATE,
    priority VARCHAR(50),
    status VARCHAR(50),
    active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE INDEX IF NOT EXISTS idx_projects_active ON para.projects(container_id) WHERE active = TRUE;
CREATE INDEX IF NOT EXISTS idx_projects_deadline ON para.projects(deadline) WHERE active = TRUE;

COMMENT ON TABLE para.projects IS 'Project 모드 속성 (active=false일 때도 보존됨)';
COMMENT ON COLUMN para.projects.active IS 'Container가 PROJECT 모드일 때 TRUE';
COMMENT ON COLUMN para.projects.priority IS '우선순위 (사용자 정의)';
COMMENT ON COLUMN para.projects.status IS '상태 (사용자 정의)';

-- ============================================================================
-- Areas: Area 모드 속성
-- PARA 원칙: Areas는 지속적인 관리가 필요한 장기 책임 영역
-- ============================================================================
CREATE TABLE IF NOT EXISTS para.areas (
    container_id BIGINT PRIMARY KEY REFERENCES para.containers(id) ON DELETE CASCADE,
    category VARCHAR(100),
    review_cycle VARCHAR(50),
    active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE INDEX IF NOT EXISTS idx_areas_active ON para.areas(container_id) WHERE active = TRUE;
CREATE INDEX IF NOT EXISTS idx_areas_category ON para.areas(category) WHERE active = TRUE;

COMMENT ON TABLE para.areas IS 'Area 모드 속성 (active=false일 때도 보존됨)';
COMMENT ON COLUMN para.areas.active IS 'Container가 AREA 모드일 때 TRUE';
COMMENT ON COLUMN para.areas.category IS '영역 카테고리 (사용자 정의)';
COMMENT ON COLUMN para.areas.review_cycle IS '리뷰 주기 (사용자 정의)';

-- ============================================================================
-- Resources: Resource 모드 속성
-- PARA 원칙: Resources는 관심 있는 주제의 학습 자료 (현재 프로젝트와 무관)
-- ============================================================================
CREATE TABLE IF NOT EXISTS para.resources (
    container_id BIGINT PRIMARY KEY REFERENCES para.containers(id) ON DELETE CASCADE,
    category VARCHAR(100),
    is_favorite BOOLEAN NOT NULL DEFAULT FALSE,
    source_url TEXT,
    active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE INDEX IF NOT EXISTS idx_resources_active ON para.resources(container_id) WHERE active = TRUE;
CREATE INDEX IF NOT EXISTS idx_resources_favorite ON para.resources(is_favorite) WHERE active = TRUE AND is_favorite = TRUE;

COMMENT ON TABLE para.resources IS 'Resource 모드 속성 (active=false일 때도 보존됨)';
COMMENT ON COLUMN para.resources.active IS 'Container가 RESOURCE 모드일 때 TRUE';
COMMENT ON COLUMN para.resources.category IS '자료 카테고리 (사용자 정의)';

-- ============================================================================
-- Archives: Archive 모드 속성
-- PARA 원칙: Archives는 더 이상 활동하지 않지만 미래 참고를 위해 저장하는 정보
-- ============================================================================
CREATE TABLE IF NOT EXISTS para.archives (
    container_id BIGINT PRIMARY KEY REFERENCES para.containers(id) ON DELETE CASCADE,
    archived_reason TEXT NOT NULL,
    archived_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    previous_mode VARCHAR(50) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE INDEX IF NOT EXISTS idx_archives_active ON para.archives(container_id) WHERE active = TRUE;
CREATE INDEX IF NOT EXISTS idx_archives_previous_mode ON para.archives(previous_mode) WHERE active = TRUE;

COMMENT ON TABLE para.archives IS 'Archive 모드 속성 (active=false일 때도 보존됨)';
COMMENT ON COLUMN para.archives.active IS 'Container가 ARCHIVE 모드일 때 TRUE';
COMMENT ON COLUMN para.archives.previous_mode IS '복원 시 참고할 이전 모드';

-- ============================================================================
-- Contents: Container와 독립적으로 존재하는 콘텐츠
-- PARA 철학: Content는 Container 간 자유롭게 이동 가능
-- ============================================================================
CREATE TABLE IF NOT EXISTS para.contents (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    container_id BIGINT REFERENCES para.containers(id) ON DELETE SET NULL,
    is_draft BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by BIGINT NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_by BIGINT NOT NULL
);

-- Inbox: container_id가 NULL인 Content
CREATE INDEX IF NOT EXISTS idx_contents_inbox ON para.contents(container_id) WHERE container_id IS NULL;
CREATE INDEX IF NOT EXISTS idx_contents_container ON para.contents(container_id) WHERE container_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_contents_created_at ON para.contents(created_at);

COMMENT ON TABLE para.contents IS 'Container와 독립적인 콘텐츠 (container_id=NULL은 Inbox)';
COMMENT ON COLUMN para.contents.container_id IS 'NULL = Inbox (미분류), 값 있음 = Container 소속';
