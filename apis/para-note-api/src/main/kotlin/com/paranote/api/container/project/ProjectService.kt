package com.paranote.api.container.project

import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.time.LocalDate

interface ProjectService {
    fun createProject(containerId: Long, deadline: LocalDate?, priority: Project.Priority?, status: Project.Status?): Project
    fun getProject(id: Long): Project?
    fun getProjectByContainer(containerId: Long): Project?
    fun getActiveProjects(): List<Project>
    fun updateProjectDeadline(id: Long, deadline: LocalDate?): Project
    fun updateProjectPriority(id: Long, priority: Project.Priority?): Project
    fun updateProjectStatus(id: Long, status: Project.Status?): Project
    fun activateProject(id: Long): Project
    fun deactivateProject(id: Long): Project
    fun deleteProject(id: Long)
}

@Service
@Transactional
class ProjectServiceImpl(
    private val projectRepository: ProjectRepository
) : ProjectService {

    override fun createProject(
        containerId: Long,
        deadline: LocalDate?,
        priority: Project.Priority?,
        status: Project.Status?
    ): Project {
        val project = Project(
            containerId = containerId,
            deadline = deadline,
            priority = priority,
            status = status,
            active = true
        )
        return projectRepository.save(project)
    }

    @Transactional(readOnly = true)
    override fun getProject(id: Long): Project? {
        return projectRepository.findByIdOrNull(id)
    }

    @Transactional(readOnly = true)
    override fun getProjectByContainer(containerId: Long): Project? {
        return projectRepository.findByContainerIdAndActiveTrue(containerId)
    }

    @Transactional(readOnly = true)
    override fun getActiveProjects(): List<Project> {
        return projectRepository.findByActiveTrue()
    }

    override fun updateProjectDeadline(id: Long, deadline: LocalDate?): Project {
        val project = projectRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Project not found: $id")

        project.modifiedDeadline(deadline)
        return projectRepository.save(project)
    }

    override fun updateProjectPriority(id: Long, priority: Project.Priority?): Project {
        val project = projectRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Project not found: $id")

        project.modifiedPriority(priority)
        return projectRepository.save(project)
    }

    override fun updateProjectStatus(id: Long, status: Project.Status?): Project {
        val project = projectRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Project not found: $id")

        project.modifiedStatus(status)
        return projectRepository.save(project)
    }

    override fun activateProject(id: Long): Project {
        val project = projectRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Project not found: $id")

        project.activate()
        return projectRepository.save(project)
    }

    override fun deactivateProject(id: Long): Project {
        val project = projectRepository.findByIdOrNull(id)
            ?: throw IllegalArgumentException("Project not found: $id")

        project.deactivate()
        return projectRepository.save(project)
    }

    override fun deleteProject(id: Long) {
        projectRepository.deleteById(id)
    }
}
