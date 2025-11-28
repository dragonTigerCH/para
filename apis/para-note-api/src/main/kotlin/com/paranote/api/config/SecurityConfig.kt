package com.paranote.api.config

import com.nimbusds.jose.JWSAlgorithm
import com.nimbusds.jose.jwk.JWKSet
import com.nimbusds.jose.jwk.OctetSequenceKey
import com.nimbusds.jose.jwk.source.ImmutableJWKSet
import com.nimbusds.jose.jwk.source.JWKSource
import com.nimbusds.jose.proc.SecurityContext
import com.paranote.api.auth.security.CustomJwtConverter
import com.paranote.api.auth.security.CustomOAuth2UserService
import com.paranote.api.auth.security.OAuth2SuccessHandler
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Lazy
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.http.SessionCreationPolicy
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.oauth2.jwt.JwtDecoder
import org.springframework.security.oauth2.jwt.JwtEncoder
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder
import org.springframework.security.web.SecurityFilterChain
import javax.crypto.SecretKey
import javax.crypto.spec.SecretKeySpec

@Configuration
@EnableWebSecurity
@EnableConfigurationProperties(JWTProperties::class)
class SecurityConfig(
    val jwtProperties: JWTProperties,
    private val customJwtConverter: CustomJwtConverter,
    private val customOAuth2UserService: CustomOAuth2UserService,
    @Lazy private val oAuth2SuccessHandler: OAuth2SuccessHandler,
) {

    @Bean
    fun filterChain(http: HttpSecurity): SecurityFilterChain {
        http
            .csrf { it.disable() }
            .httpBasic { it.disable() }
            .formLogin { it.disable() }
            .authorizeHttpRequests { auth ->
                auth
                    .requestMatchers("/api/auth/**").permitAll()
                    .requestMatchers("/api/admin/**").hasRole("ADMIN")
                    .anyRequest().authenticated()
            }
            .oauth2ResourceServer { oauth2 ->
                oauth2.jwt {
                    it.jwtAuthenticationConverter(customJwtConverter)
                }
            }
            .oauth2Login {
                it.userInfoEndpoint { endpoint ->
                    endpoint.userService(customOAuth2UserService)
                }
                it.successHandler(oAuth2SuccessHandler)
            }
            .sessionManagement { session ->
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            }

        return http.build()
    }

    // Spring Security의 JwtEncoder (JWT 발급용)
    @Bean
    fun jwtEncoder(): JwtEncoder {
        val secretBytes = jwtProperties.secret.toByteArray(Charsets.UTF_8)
        require(secretBytes.size >= 32) { "JWT secret must be at least 256 bits (32 bytes), but was ${secretBytes.size} bytes" }

        // OctetSequenceKey를 사용하여 명시적으로 HS256 알고리즘 지정
        val jwk = OctetSequenceKey.Builder(secretBytes)
            .keyID("paranote")
            .algorithm(JWSAlgorithm.HS256)
            .build()

        val jwkSet = JWKSet(jwk)
        val jwkSource: JWKSource<SecurityContext> = ImmutableJWKSet(jwkSet)
        return NimbusJwtEncoder(jwkSource)
    }

    // Spring Security의 JwtDecoder (JWT 검증용)
    @Bean
    fun jwtDecoder(): JwtDecoder {
        val secretKey: SecretKey = SecretKeySpec(jwtProperties.secret.toByteArray(Charsets.UTF_8), "HmacSHA256")
        return NimbusJwtDecoder.withSecretKey(secretKey).build()
    }

    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder()
    }


}