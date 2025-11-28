package com.paranote.api.content

import com.paranote.api.common.Auditable
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Lob
import jakarta.persistence.Table

/**
 * Content (영속적 실체)
 *
 * PARA 철학: Content는 Container와 독립적으로 존재하며 자유롭게 이동 가능
 * - containerId = null: Inbox (미분류/작업 중) 상태
 * - Container 간 이동 시 Content 자체는 불변
 * - 실행 가능성에 따라 Project/Area/Resource/Archive 간 자유롭게 이동
 */
@Entity
@Table(name = "contents")
class Content(
    title: String,
    body: String,
    containerId: Long? = null,
) : Auditable() {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null
        protected set

    @Column(nullable = false)
    var title: String = title
        protected set

    @Lob
    @Column(nullable = false)
    var body: String = body
        protected set

    @Column
    var containerId: Long? = containerId  // NULL = Inbox, Container.id 참조
        protected set
    init {
        require(title.isNotBlank()) { "Content title must not be blank" }
    }

    /**
     * Content를 특정 Container로 이동
     */
    fun moveToContainer(new: Long?) {
        this.containerId = new
    }

    fun moveToInbox() = moveToContainer(null)

    /**
     * Content 수정
     */
    fun modified(
        newTitle: String? = null,
        newBody: String? = null,
    ) {
        newTitle?.let { this.title = it }
        newBody?.let { this.body = it }
    }

    fun isInInbox(): Boolean = containerId == null
}