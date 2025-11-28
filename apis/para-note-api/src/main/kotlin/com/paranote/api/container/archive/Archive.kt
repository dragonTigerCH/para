package com.paranote.api.container.archive

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table
import java.time.Instant

/**
 * Archive - Container의 Archive 모드 속성
 *
 * PARA 원칙: Archives는 더 이상 활동하지 않지만 미래 참고를 위해 저장하는 정보
 * - 완료된 프로젝트, 비활성 영역, 관심 없는 자원
 * - 언제든 복원 가능 (이전 모드로 되돌릴 수 있음)
 */
@Entity
@Table(name = "archives")
class Archive(
    containerId: Long,
    archivedReason: String,
    archivedAt: Instant = Instant.now(),
    previousMode: String? = null,
    active: Boolean = true
) {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null
        protected set

    @Column(nullable = false)
    var containerId: Long = containerId
        protected set

    @Column(nullable = false)
    var archivedReason: String = archivedReason
        protected set

    @Column(nullable = false)
    var archivedAt: Instant = archivedAt
        protected set

    @Column
    var previousMode: String? = previousMode  // 복원 시 참고 (사용자 정의)
        protected set

    @Column(nullable = false)
    var active: Boolean = active
        protected set
    init {
        require(archivedReason.isNotBlank()) {
            "Archived reason must not be blank"
        }
    }

    fun activate() {
        this.active = true
    }

    fun deactivate() {
        this.active = false
    }
}