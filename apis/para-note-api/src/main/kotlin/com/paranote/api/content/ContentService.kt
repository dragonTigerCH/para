package com.paranote.api.content

import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

interface ContentService {
    fun createContent(title: String, body: String, containerId: Long?, userId: Long): Content
    fun getContent(id: Long): Content?
    fun getUserContents(userId: Long): List<Content>
    fun getInboxContents(userId: Long): List<Content>
    fun getContainerContents(containerId: Long): List<Content>
    fun updateContent(id: Long, title: String?, body: String?, userId: Long): Content
    fun moveContentToContainer(contentId: Long, containerId: Long?, userId: Long): Content
    fun deleteContent(id: Long)
}

@Service
@Transactional
class ContentServiceImpl(
    private val contentRepository: ContentRepository
) : ContentService {

    override fun createContent(title: String, body: String, containerId: Long?, userId: Long): Content {
        val content = Content(
            title = title,
            body = body,
            containerId = containerId
        )
        return contentRepository.save(content)
    }

    @Transactional(readOnly = true)
    override fun getContent(id: Long): Content? {
        return contentRepository.findByIdOrNull(id)
    }

    @Transactional(readOnly = true)
    override fun getUserContents(userId: Long): List<Content> {
        return contentRepository.findByCreatedBy(userId)
    }

    @Transactional(readOnly = true)
    override fun getInboxContents(userId: Long): List<Content> {
        return contentRepository.findByCreatedByAndContainerIdIsNull(userId)
    }

    @Transactional(readOnly = true)
    override fun getContainerContents(containerId: Long): List<Content> {
        return contentRepository.findByContainerId(containerId)
    }

    override fun updateContent(id: Long, title: String?, body: String?, userId: Long): Content {
        val content = contentRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Content not found: $id")

        content.modified(newTitle = title, newBody = body)


        return contentRepository.save(content)
    }

    override fun moveContentToContainer(contentId: Long, containerId: Long?, userId: Long): Content {
        val content = contentRepository.findByIdOrNull(contentId)
            ?: throw IllegalArgumentException("Content not found: $contentId")

        content.moveToContainer(containerId)

        return contentRepository.save(content)
    }

    override fun deleteContent(id: Long) {
        contentRepository.deleteById(id)
    }
}
