package com.paranote.api.container.archive

import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.time.Instant

interface ArchiveService {
    fun createArchive(containerId: Long, archivedReason: String, previousMode: String?): Archive
    fun getArchive(id: Long): Archive?
    fun getArchiveByContainer(containerId: Long): Archive?
    fun getActiveArchives(): List<Archive>
    fun getArchivesByDateRange(start: Instant, end: Instant): List<Archive>
    fun activateArchive(id: Long): Archive
    fun deactivateArchive(id: Long): Archive
    fun deleteArchive(id: Long)
}

@Service
@Transactional
class ArchiveServiceImpl(
    private val archiveRepository: ArchiveRepository
) : ArchiveService {

    override fun createArchive(containerId: Long, archivedReason: String, previousMode: String?): Archive {
        val archive = Archive(
            containerId = containerId,
            archivedReason = archivedReason,
            archivedAt = Instant.now(),
            previousMode = previousMode,
            active = true
        )
        return archiveRepository.save(archive)
    }

    @Transactional(readOnly = true)
    override fun getArchive(id: Long): Archive? {
        return archiveRepository.findByIdOrNull(id)
    }

    @Transactional(readOnly = true)
    override fun getArchiveByContainer(containerId: Long): Archive? {
        return archiveRepository.findByContainerIdAndActiveTrue(containerId)
    }

    @Transactional(readOnly = true)
    override fun getActiveArchives(): List<Archive> {
        return archiveRepository.findByActiveTrue()
    }

    @Transactional(readOnly = true)
    override fun getArchivesByDateRange(start: Instant, end: Instant): List<Archive> {
        return archiveRepository.findByArchivedAtBetween(start, end)
    }

    override fun activateArchive(id: Long): Archive {
        val archive = archiveRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Archive not found: $id")

        archive.activate()
        return archiveRepository.save(archive)
    }

    override fun deactivateArchive(id: Long): Archive {
        val archive = archiveRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Archive not found: $id")

        archive.deactivate()
        return archiveRepository.save(archive)
    }

    override fun deleteArchive(id: Long) {
        archiveRepository.deleteById(id)
    }
}
