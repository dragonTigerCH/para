package com.paranote.api.container.resource

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id

/**
 * Resource - Container의 Resource 모드 속성
 *
 * PARA 원칙: Resources는 관심 있는 주제의 학습 자료 (현재 프로젝트와 무관)
 * - 참고용 지식, 미래에 유용할 자료
 * - 예시: 그래픽 디자인, 개인 생산성, 사진, 마케팅 자료
 */
@Entity
class Resource(
    containerId: Long,
    category: String? = null,
    isFavorite: Boolean = false,
    sourceUrl: String? = null,
    active: Boolean = true
) {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null

    @Column(nullable = false)
    var containerId: Long = containerId
        protected set

    @Column
    var category: String? = category      // 사용자 정의 (예: "아티클", "책", "동영상")
        protected set

    @Column(nullable = false)
    var isFavorite: Boolean = isFavorite
        protected set

    @Column
    var sourceUrl: String? = sourceUrl
        protected set

    @Column(nullable = false)
    var active: Boolean = active
        protected set
    fun modifiedCategory(newCategory: String?) {
        this.category = newCategory
    }

    fun modifiedSourceUrl(newSourceUrl: String?) {
        this.sourceUrl = newSourceUrl
    }

    fun toggleFavorite() {
        this.isFavorite = !this.isFavorite
    }

    fun activate() {
        this.active = true
    }

    fun deactivate() {
        this.active = false
    }

    enum class Category {

    }
}