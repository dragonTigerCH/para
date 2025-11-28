package com.paranote.api.container.archive

import org.springframework.data.jpa.repository.JpaRepository
import java.time.Instant

interface ArchiveRepository : JpaRepository<Archive, Long> {
    fun findByContainerId(containerId: Long): Archive?
    fun findByActiveTrue(): List<Archive>
    fun findByContainerIdAndActiveTrue(containerId: Long): Archive?
    fun findByArchivedAtBetween(start: Instant, end: Instant): List<Archive>
    fun findByPreviousMode(previousMode: String): List<Archive>
}
