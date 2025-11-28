package com.paranote.api.container.area

import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

interface AreaService {
    fun createArea(containerId: Long, category: String?, reviewCycle: Area.ReviewCycle?): Area
    fun getArea(id: Long): Area?
    fun getAreaByContainer(containerId: Long): Area?
    fun getActiveAreas(): List<Area>
    fun updateAreaCategory(id: Long, category: String?): Area
    fun updateAreaReviewCycle(id: Long, reviewCycle: Area.ReviewCycle?): Area
    fun activateArea(id: Long): Area
    fun deactivateArea(id: Long): Area
    fun deleteArea(id: Long)
}

@Service
@Transactional
class AreaServiceImpl(
    private val areaRepository: AreaRepository
) : AreaService {

    override fun createArea(containerId: Long, category: String?, reviewCycle: Area.ReviewCycle?): Area {
        val area = Area(
            containerId = containerId,
            category = category,
            reviewCycle = reviewCycle,
            active = true
        )
        return areaRepository.save(area)
    }

    @Transactional(readOnly = true)
    override fun getArea(id: Long): Area? {
        return areaRepository.findByIdOrNull(id)
    }

    @Transactional(readOnly = true)
    override fun getAreaByContainer(containerId: Long): Area? {
        return areaRepository.findByContainerIdAndActiveTrue(containerId)
    }

    @Transactional(readOnly = true)
    override fun getActiveAreas(): List<Area> {
        return areaRepository.findByActiveTrue()
    }

    override fun updateAreaCategory(id: Long, category: String?): Area {
        val area = areaRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Area not found: $id")

        area.modifiedCategory(category)
        return areaRepository.save(area)
    }

    override fun updateAreaReviewCycle(id: Long, reviewCycle: Area.ReviewCycle?): Area {
        val area = areaRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Area not found: $id")

        area.modifiedReviewCycle(reviewCycle)
        return areaRepository.save(area)
    }

    override fun activateArea(id: Long): Area {
        val area = areaRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Area not found: $id")

        area.activate()
        return areaRepository.save(area)
    }

    override fun deactivateArea(id: Long): Area {
        val area = areaRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Area not found: $id")

        area.deactivate()
        return areaRepository.save(area)
    }

    override fun deleteArea(id: Long) {
        areaRepository.deleteById(id)
    }
}
