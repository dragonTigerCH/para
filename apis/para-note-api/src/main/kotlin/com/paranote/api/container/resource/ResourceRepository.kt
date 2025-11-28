package com.paranote.api.container.resource

import org.springframework.data.jpa.repository.JpaRepository

interface ResourceRepository : JpaRepository<Resource, Long> {
    fun findByContainerId(containerId: Long): Resource?
    fun findByActiveTrue(): List<Resource>
    fun findByContainerIdAndActiveTrue(containerId: Long): Resource?
    fun findByCategory(category: String): List<Resource>
    fun findByIsFavoriteTrue(): List<Resource>
}
