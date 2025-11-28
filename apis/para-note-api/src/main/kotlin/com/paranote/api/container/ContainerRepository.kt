package com.paranote.api.container

import org.springframework.data.jpa.repository.JpaRepository

interface ContainerRepository : JpaRepository<BaseContainer, Long> {
    fun findByCreatedBy(userId: Long): List<BaseContainer>
    fun findByCurrentMode(mode: ContainerMode): List<BaseContainer>
    fun findByCreatedByAndCurrentMode(userId: Long, mode: ContainerMode): List<BaseContainer>
}
