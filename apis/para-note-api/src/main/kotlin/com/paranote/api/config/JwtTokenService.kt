package com.paranote.api.config

import com.paranote.api.auth.AuthToken
import com.paranote.api.auth.User
import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.security.oauth2.jose.jws.MacAlgorithm
import org.springframework.security.oauth2.jwt.JwsHeader
import org.springframework.security.oauth2.jwt.JwtClaimsSet
import org.springframework.security.oauth2.jwt.JwtEncoder
import org.springframework.security.oauth2.jwt.JwtEncoderParameters
import org.springframework.stereotype.Service
import java.time.Duration
import java.time.Instant


@ConfigurationProperties("jwt")
data class JWTProperties(
    val secret: String,
    val accessExpiration: Duration,
    val refreshExpiration: Duration,
)

@Service
@EnableConfigurationProperties(JWTProperties::class)
class JwtTokenService(
    private val jwtEncoder: JwtEncoder,
    val jwtProperties: JWTProperties,
) {

    fun accessToken(user: User): AuthToken = generateToken(user, jwtProperties.accessExpiration)
    fun refreshToken(user: User): AuthToken = generateToken(user, jwtProperties.refreshExpiration)

    private fun generateToken(user: User, expiration: Duration): AuthToken {
        val now = Instant.now()
        val expiry = now.plus(expiration)

        // JwtClaimsSet 생성
        val claims = JwtClaimsSet.builder()
            .issuer("paranote")
            .issuedAt(now)
            .expiresAt(expiry)
            .subject(user.identifier.value)
            .claim("scope", user.authority.name)
            .build()

        // JWS 헤더에 알고리즘 명시
        val jwsHeader = JwsHeader.with(MacAlgorithm.HS256).build()

        // Spring Security의 JwtEncoder로 JWT 발급
        val token = jwtEncoder.encode(JwtEncoderParameters.from(jwsHeader, claims)).tokenValue
        return AuthToken(
            token = token,
            expiration = expiry
        )
    }
}
