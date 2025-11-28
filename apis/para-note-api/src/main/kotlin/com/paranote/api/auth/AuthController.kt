package com.paranote.api.auth

import com.paranote.api.common.Email
import com.paranote.api.common.Password
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/auth")
class AuthController(
    private val authService: AuthService,
) {

    @PostMapping("/login")
    fun login(
        @RequestBody loginRequest: LoginRequest,
    ): ResponseEntity<JwtResponse> {
        val (access, refresh) = authService.login(Email(loginRequest.username), Password(loginRequest.password))
        return ResponseEntity.ok(JwtResponse(access, refresh))
    }

    @PostMapping("/register")
    fun register(
        @RequestBody registrationRequest: RegistrationRequest
    ): ResponseEntity<UserResponse> {
        val stored = authService.register(
            Email(registrationRequest.username),
            Password(registrationRequest.password),
            registrationRequest.name,
            Authority.ROLE_USER
        )
        return ResponseEntity.ok(UserResponse.from(stored))
    }

}

data class LoginRequest(
    val username: String,
    val password: String
)

data class JwtResponse(
    val access: AuthToken,
    val refresh: AuthToken,
    val type: String = "Bearer"
)

data class RegistrationRequest(
    val username: String,
    val password: String,
    val name: String? = null,
)

data class UserResponse(
    val id: Long,
    val name: String?,
    val email: String,
    val authority: Authority,
) {
    companion object {
        fun from(user: User): UserResponse {
            return UserResponse(
                user.id!!,
                user.name,
                user.identifier.value,
                user.authority
            )
        }
    }
}