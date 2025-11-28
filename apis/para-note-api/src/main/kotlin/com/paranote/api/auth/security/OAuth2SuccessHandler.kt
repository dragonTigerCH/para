package com.paranote.api.auth.security

import com.fasterxml.jackson.databind.ObjectMapper
import com.paranote.api.auth.AuthService
import com.paranote.api.auth.AuthToken
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.http.MediaType
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.AuthenticationSuccessHandler
import org.springframework.stereotype.Component

@Component
class OAuth2SuccessHandler(
    private val authService: AuthService,
    private val objectMapper: ObjectMapper
): AuthenticationSuccessHandler {

    override fun onAuthenticationSuccess(
        request: HttpServletRequest,
        response: HttpServletResponse,
        authentication: Authentication
    ) {
        val principal = authentication.principal as SecurityUser

        // OAuth2 로그인 처리 (DB 저장 및 토큰 발급)
        val (accessToken, refreshToken) = authService.oauth2Login(
            identifier = principal.user.identifier,
            social = principal.user.social!!,
            authority = principal.user.authority
        )

        // JSON 응답 생성
        val responseBody = OAuth2LoginResponse(
            access = accessToken,
            refresh = refreshToken,
            tokenType = "Bearer",
            user = UserInfo(
                id = principal.user.id,
                email = principal.user.identifier.value,
                name = principal.user.name,
                authority = principal.user.authority.name
            )
        )

        // HTTP 응답 설정
        response.contentType = MediaType.APPLICATION_JSON_VALUE
        response.characterEncoding = "UTF-8"
        response.status = HttpServletResponse.SC_OK

        // JSON 응답 쓰기
        objectMapper.writeValue(response.writer, responseBody)
    }
}

data class OAuth2LoginResponse(
    val access: AuthToken,
    val refresh: AuthToken,
    val tokenType: String,
    val user: UserInfo
)

data class UserInfo(
    val id: Long?,
    val email: String,
    val name: String?,
    val authority: String
)