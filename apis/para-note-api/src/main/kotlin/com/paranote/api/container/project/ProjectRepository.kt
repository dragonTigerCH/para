package com.paranote.api.container.project

import org.springframework.data.jpa.repository.JpaRepository
import java.time.LocalDate

interface ProjectRepository : JpaRepository<Project, Long> {
    fun findByContainerId(containerId: Long): Project?
    fun findByActiveTrue(): List<Project>
    fun findByContainerIdAndActiveTrue(containerId: Long): Project?
    fun findByDeadlineBefore(deadline: LocalDate): List<Project>
    fun findByPriority(priority: Project.Priority): List<Project>
    fun findByStatus(status: Project.Status): List<Project>
}
