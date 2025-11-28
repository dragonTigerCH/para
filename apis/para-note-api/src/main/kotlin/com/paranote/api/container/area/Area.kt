package com.paranote.api.container.area

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Enumerated
import jakarta.persistence.EnumType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table

/**
 * Area - Container의 Area 모드 속성
 *
 * PARA 원칙: Areas는 지속적인 관리가 필요한 장기 책임 영역
 * - 끝이 없으며, 계속 유지되어야 하는 상태
 * - 업무: 마케팅, 인사, 제품 관리
 * - 개인: 건강, 재정, 가족, 주택 관리
 */
@Entity
@Table(name = "areas")
class Area(
    containerId: Long,
    category: String? = null,
    reviewCycle: ReviewCycle? = null,
    active: Boolean = true
) {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null
        protected set

    @Column(nullable = false)
    var containerId: Long = containerId
        protected set

    @Column
    var category: String? = category      // 사용자 정의 (예: "건강", "재정", "커리어")
        protected set

    @Enumerated(EnumType.STRING)
    @Column
    var reviewCycle: ReviewCycle? = reviewCycle   // 사용자 정의 (예: "매일", "주간", "월간")
        protected set

    @Column(nullable = false)
    var active: Boolean = active
        protected set
    fun modifiedCategory(newCategory: String?) {
        this.category = newCategory
    }

    fun modifiedReviewCycle(newReviewCycle: ReviewCycle?) {
        this.reviewCycle = newReviewCycle
    }

    fun activate() {
        this.active = true
    }

    fun deactivate() {
        this.active = false
    }

    enum class ReviewCycle {
        DAILY, WEEKLY, MONTHLY
    }

}