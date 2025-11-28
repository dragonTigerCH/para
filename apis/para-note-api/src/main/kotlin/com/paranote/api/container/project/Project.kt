package com.paranote.api.container.project

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Enumerated
import jakarta.persistence.EnumType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table
import java.time.LocalDate

/**
 * Project - Container의 Project 모드 속성
 *
 * PARA 원칙: Projects는 명확한 완료 시점(deadline)과 달성 가능한 목표가 있어야 함
 * - Container가 PROJECT 모드일 때 active=true
 * - 다른 모드로 전환 시 active=false로 비활성화되지만 데이터는 보존
 * - 다시 PROJECT 모드로 돌아오면 active=true로 재활성화
 */
@Entity
@Table(name = "projects")
class Project(
    containerId: Long,
    deadline: LocalDate? = null,
    priority: Priority? = null,
    status: Status? = null,
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
    var deadline: LocalDate? = deadline
        protected set

    @Enumerated(EnumType.STRING)
    @Column
    var priority: Priority? = priority
        protected set

    @Enumerated(EnumType.STRING)
    @Column
    var status: Status? = status
        protected set

    @Column(nullable = false)
    var active: Boolean = active
        protected set
    fun modifiedDeadline(newDeadline: LocalDate?) {
        this.deadline = newDeadline
    }

    fun modifiedPriority(new: Priority?) {
        this.priority = new
    }

    fun modifiedStatus(new: Status?) {
        this.status = new
    }

    fun activate() {
        this.active = true
    }

    fun deactivate() {
        this.active = false
    }

    enum class Priority {
        HIGH, NORMAL, LOW
    }

    enum class Status {
        DONE, IN_PROGRESS, CANCELED
    }
}