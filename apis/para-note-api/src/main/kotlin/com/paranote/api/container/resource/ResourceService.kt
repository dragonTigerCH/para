package com.paranote.api.container.resource

import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

interface ResourceService {
    fun createResource(containerId: Long, category: String?, sourceUrl: String?, isFavorite: Boolean): Resource
    fun getResource(id: Long): Resource?
    fun getResourceByContainer(containerId: Long): Resource?
    fun getActiveResources(): List<Resource>
    fun getFavoriteResources(): List<Resource>
    fun updateResourceCategory(id: Long, category: String?): Resource
    fun updateResourceSourceUrl(id: Long, sourceUrl: String?): Resource
    fun toggleFavorite(id: Long): Resource
    fun activateResource(id: Long): Resource
    fun deactivateResource(id: Long): Resource
    fun deleteResource(id: Long)
}

@Service
@Transactional
class ResourceServiceImpl(
    private val resourceRepository: ResourceRepository
) : ResourceService {

    override fun createResource(containerId: Long, category: String?, sourceUrl: String?, isFavorite: Boolean): Resource {
        val resource = Resource(
            containerId = containerId,
            category = category,
            sourceUrl = sourceUrl,
            isFavorite = isFavorite,
            active = true
        )
        return resourceRepository.save(resource)
    }

    @Transactional(readOnly = true)
    override fun getResource(id: Long): Resource? {
        return resourceRepository.findByIdOrNull(id)
    }

    @Transactional(readOnly = true)
    override fun getResourceByContainer(containerId: Long): Resource? {
        return resourceRepository.findByContainerIdAndActiveTrue(containerId)
    }

    @Transactional(readOnly = true)
    override fun getActiveResources(): List<Resource> {
        return resourceRepository.findByActiveTrue()
    }

    @Transactional(readOnly = true)
    override fun getFavoriteResources(): List<Resource> {
        return resourceRepository.findByIsFavoriteTrue()
    }

    override fun updateResourceCategory(id: Long, category: String?): Resource {
        val resource = resourceRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Resource not found: $id")

        resource.modifiedCategory(category)
        return resourceRepository.save(resource)
    }

    override fun updateResourceSourceUrl(id: Long, sourceUrl: String?): Resource {
        val resource = resourceRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Resource not found: $id")

        resource.modifiedSourceUrl(sourceUrl)
        return resourceRepository.save(resource)
    }

    override fun toggleFavorite(id: Long): Resource {
        val resource = resourceRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Resource not found: $id")

        resource.toggleFavorite()
        return resourceRepository.save(resource)
    }

    override fun activateResource(id: Long): Resource {
        val resource = resourceRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Resource not found: $id")

        resource.activate()
        return resourceRepository.save(resource)
    }

    override fun deactivateResource(id: Long): Resource {
        val resource = resourceRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Resource not found: $id")

        resource.deactivate()
        return resourceRepository.save(resource)
    }

    override fun deleteResource(id: Long) {
        resourceRepository.deleteById(id)
    }
}
