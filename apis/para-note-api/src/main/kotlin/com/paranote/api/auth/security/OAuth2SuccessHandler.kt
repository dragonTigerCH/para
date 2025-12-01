package com.paranote.api.auth.security

import com.fasterxml.jackson.databind.ObjectMapper
import com.paranote.api.auth.AuthService
import com.paranote.api.auth.AuthToken
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.MediaType
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.AuthenticationSuccessHandler
import org.springframework.stereotype.Component

@Component
class OAuth2SuccessHandler(
    private val authService: AuthService,
    private val objectMapper: ObjectMapper,
    @Value("\${app.frontend.url}")
    private val url: String
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
            name = principal.user.name,
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

        // JSON을 Base64로 인코딩 (URL safe, UTF-8)
        val jsonData = objectMapper.writeValueAsString(responseBody)
        val encodedData = java.util.Base64.getUrlEncoder().encodeToString(jsonData.toByteArray(Charsets.UTF_8))

        // 프론트엔드 콜백 페이지로 리다이렉트 (fragment 사용)
        val redirectUrl = "$url/auth/callback#data=$encodedData"
        response.sendRedirect(redirectUrl)
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