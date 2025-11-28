package com.paranote.api.container

import com.paranote.api.common.Auditable
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Enumerated
import jakarta.persistence.EnumType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table

/**
 * Container - PARA의 핵심 컨테이너
 *
 * PARA 철학: 문서는 실행 가능성에 따라 자유롭게 이동하며 "살아있는" 상태를 유지
 * - currentMode를 변경하여 PROJECT ↔ AREA ↔ RESOURCE ↔ ARCHIVE 간 전환
 * - 각 모드별 속성(attrs)은 별도 테이블에 영구 보존
 * - 모드 변경 시 이전 모드의 속성은 비활성화(active=false)되지만 삭제되지 않음
 */
@Entity
@Table(name = "base_containers")
class BaseContainer(
    title: String,
    description: String? = null,
    currentMode: ContainerMode,
) : Auditable() {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null
        protected set

    @Column(nullable = false)
    var title: String = title
        protected set

    @Column
    var description: String? = description
        protected set

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    var currentMode: ContainerMode = currentMode
        protected set
    init {
        require(title.isNotBlank()) { "Container title must not be blank" }
    }

    /**
     * 모드 변경 (Container Transformation)
     * 기존 속성은 보존되며, 새로운 모드의 속성만 활성화됨
     */
    fun changeMode(newMode: ContainerMode) {
        this.currentMode = newMode
    }

    fun modifiedTitle(newTitle: String) {
        this.title = newTitle
    }

    fun modifiedDescription(new: String?) {
        this.description = new
    }

    fun isProject(): Boolean = currentMode == ContainerMode.PROJECT
    fun isArea(): Boolean = currentMode == ContainerMode.AREA
    fun isResource(): Boolean = currentMode == ContainerMode.RESOURCE
    fun isArchive(): Boolean = currentMode == ContainerMode.ARCHIVE
}

enum class ContainerMode {
    PROJECT,   // 명확한 deadline이 있는 단기 목표
    AREA,      // 지속적인 관리가 필요한 영역
    RESOURCE,  // 참고 자료 (미래에 유용할 자료)
    ARCHIVE    // 완료/보관된 항목
}
