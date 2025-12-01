package com.paranote.api.user

import com.paranote.api.auth.UserResponse
import com.paranote.api.auth.security.SecurityUser
import org.springframework.http.ResponseEntity
import org.springframework.security.core.annotation.AuthenticationPrincipal
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/users")
class UserController {

    @GetMapping("/me")
    fun me(
        @AuthenticationPrincipal authUser: SecurityUser
    ): ResponseEntity<UserResponse> {
        return ResponseEntity.ok(UserResponse.from(authUser.user))
    }
}