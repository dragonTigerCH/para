package com.paranote.api.container.area

import org.springframework.data.jpa.repository.JpaRepository

interface AreaRepository : JpaRepository<Area, Long> {
    fun findByContainerId(containerId: Long): Area?
    fun findByActiveTrue(): List<Area>
    fun findByContainerIdAndActiveTrue(containerId: Long): Area?
    fun findByCategory(category: String): List<Area>
    fun findByReviewCycle(reviewCycle: Area.ReviewCycle): List<Area>
}
