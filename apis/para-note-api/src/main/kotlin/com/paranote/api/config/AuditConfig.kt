package com.paranote.api.config

import com.paranote.api.auth.security.SecurityUser
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.domain.AuditorAware
import org.springframework.data.jpa.repository.config.EnableJpaAuditing
import org.springframework.security.core.context.SecurityContextHolder
import java.util.*

@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
class AuditConfig {

    @Bean
    fun auditorProvider(): AuditorAware<Long> {
        return AuditorAware {
            val authentication = SecurityContextHolder.getContext().authentication

            // 인증되지 않은 경우 (회원가입, OAuth2 초기 로그인 등)
            if (authentication == null || !authentication.isAuthenticated || authentication.principal == "anonymousUser") {
                return@AuditorAware Optional.of(0L) // 시스템 사용자 ID
            }

            // 인증된 사용자
            when (val principal = authentication.principal) {
                is SecurityUser -> Optional.ofNullable(principal.user.id)
                else -> Optional.of(0L)
            }
        }
    }
}
