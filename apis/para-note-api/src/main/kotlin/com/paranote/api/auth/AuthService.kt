package com.paranote.api.auth

import com.paranote.api.common.Email
import com.paranote.api.common.Password
import com.paranote.api.common.Social
import com.paranote.api.config.JwtTokenService
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

interface AuthService {
    fun register(
        identifier: Email,
        password: Password,
        name: String?,
        authority: Authority
    ): User

    fun login(
        identifier: Email,
        password: Password
    ): Pair<AuthToken, AuthToken>

    fun logout(token: String)
    fun oauth2Login(
        identifier: Email,
        social: Social,
        authority: Authority,
    ): Pair<AuthToken, AuthToken>
}

@Service
class AuthServiceImpl(
    private val authRepository: AuthRepository,
    private val passwordEncoder: PasswordEncoder,
    private val jwtTokenService: JwtTokenService,
) : AuthService {

    @Transactional
    override fun register(
        identifier: Email,
        password: Password,
        name: String?,
        authority: Authority
    ): User {
        authRepository.findByIdentifier(identifier)?.let {
            throw IllegalArgumentException("Email already exists: ${identifier.value}")
        }
        val encodedPassword = passwordEncoder.encode(password.value)

        return createUser(identifier, Password(encodedPassword), name, null, authority)
            .run { authRepository.save(this) }
    }

    @Transactional
    override fun login(identifier: Email, password: Password): Pair<AuthToken, AuthToken> {
        val user = authRepository.findByIdentifier(identifier)
            ?: throw IllegalArgumentException("User not found: ${identifier.value}")

        // 비밀번호 검증
        if (!passwordEncoder.matches(password.value, user.password.value)) {
            throw IllegalArgumentException("Invalid password")
        }

        val accessToken = jwtTokenService.accessToken(user)
        val refreshToken = jwtTokenService.refreshToken(user)

        return Pair(accessToken, refreshToken)
    }

    @Transactional
    override fun oauth2Login(
        identifier: Email,
        social: Social,
        authority: Authority
    ): Pair<AuthToken, AuthToken> {

        val user = authRepository.findByIdentifier(identifier)
            ?: createUser(identifier, Password(""), null, social, authority)
                .run { authRepository.save(this) }

        val accessToken = jwtTokenService.accessToken(user)
        val refreshToken = jwtTokenService.refreshToken(user)

        return Pair(accessToken, refreshToken)
    }

    @Transactional
    override fun logout(token: String) {
        // JWT는 stateless이므로 서버에서 명시적인 로그아웃 처리는 필요 없음
        // 클라이언트에서 토큰을 삭제하면 됨
        // 필요시 블랙리스트 또는 토큰 무효화 로직을 추가할 수 있음
    }

    private fun createUser(
        identifier: Email,
        password: Password,
        name: String? = null,
        social: Social?,
        authority: Authority
    ): User = User.create(
        identifier = identifier,
        password = password,
        name = name,
        social = social,
        authority = authority
    )

}