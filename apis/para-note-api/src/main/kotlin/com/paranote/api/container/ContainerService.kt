package com.paranote.api.container

import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

interface ContainerService {
    fun createContainer(title: String, description: String?, mode: ContainerMode, userId: Long): BaseContainer
    fun getContainer(id: Long): BaseContainer?
    fun getUserContainers(userId: Long): List<BaseContainer>
    fun getContainersByMode(userId: Long, mode: ContainerMode): List<BaseContainer>
    fun updateContainer(id: Long, title: String?, description: String?, userId: Long): BaseContainer
    fun changeContainerMode(id: Long, newMode: ContainerMode, userId: Long): BaseContainer
    fun deleteContainer(id: Long)
}

@Service
@Transactional
class ContainerServiceImpl(
    private val containerRepository: ContainerRepository
) : ContainerService {

    override fun createContainer(title: String, description: String?, mode: ContainerMode, userId: Long): BaseContainer {
        val container = BaseContainer(
            title = title,
            description = description,
            currentMode = mode
        )
        return containerRepository.save(container)
    }

    @Transactional(readOnly = true)
    override fun getContainer(id: Long): BaseContainer? {
        return containerRepository.findByIdOrNull(id)
    }

    @Transactional(readOnly = true)
    override fun getUserContainers(userId: Long): List<BaseContainer> {
        return containerRepository.findByCreatedBy(userId)
    }

    @Transactional(readOnly = true)
    override fun getContainersByMode(userId: Long, mode: ContainerMode): List<BaseContainer> {
        return containerRepository.findByCreatedByAndCurrentMode(userId, mode)
    }

    override fun updateContainer(id: Long, title: String?, description: String?, userId: Long): BaseContainer {
        val container = containerRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Container not found: $id")

        title?.let { container.modifiedTitle(it) }
        description?.let { container.modifiedDescription(it) }

        return containerRepository.save(container)
    }

    override fun changeContainerMode(id: Long, newMode: ContainerMode, userId: Long): BaseContainer {
        val container = containerRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Container not found: $id")

        container.changeMode(newMode)


        return containerRepository.save(container)
    }

    override fun deleteContainer(id: Long) {
        containerRepository.deleteById(id)
    }
}
