package com.paranote.api.auth

import com.paranote.api.auth.security.SecurityUser
import com.paranote.api.container.ContainerMode
import com.paranote.api.container.ContainerService
import org.springframework.http.ResponseEntity
import org.springframework.security.core.annotation.AuthenticationPrincipal
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/test")
class TestController(
    private val containerService: ContainerService
) {

    @PostMapping("/container")
    fun createContainer(
        @RequestBody request: CreateContainerRequest,
        @AuthenticationPrincipal securityUser: SecurityUser
    ): ResponseEntity<*> {
        val container = containerService.createContainer(
            title = request.title,
            description = request.description,
            mode = request.mode,
            userId = securityUser.user.id!!
        )
        return ResponseEntity.ok(mapOf(
            "id" to container.id,
            "title" to container.title,
            "mode" to container.currentMode,
            "createdBy" to container.createdBy,
            "createdAt" to container.createdAt
        ))
    }

}

data class CreateContainerRequest(
    val title: String,
    val description: String?,
    val mode: ContainerMode
)