package com.paranote.api.content

import org.springframework.data.jpa.repository.JpaRepository

interface ContentRepository : JpaRepository<Content, Long> {
    fun findByCreatedBy(userId: Long): List<Content>
    fun findByContainerId(containerId: Long): List<Content>
    fun findByContainerIdIsNull(): List<Content>  // Inbox
    fun findByCreatedByAndContainerId(userId: Long, containerId: Long): List<Content>
    fun findByCreatedByAndContainerIdIsNull(userId: Long): List<Content>  // User's Inbox
}
