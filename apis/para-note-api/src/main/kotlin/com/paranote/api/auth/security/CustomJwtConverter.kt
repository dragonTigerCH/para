package com.paranote.api.auth.security

import com.paranote.api.auth.AuthRepository
import com.paranote.api.common.Email
import org.springframework.core.convert.converter.Converter
import org.springframework.security.authentication.AbstractAuthenticationToken
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.oauth2.jwt.Jwt
import org.springframework.stereotype.Component

@Component
class CustomJwtConverter(
    private val authRepository: AuthRepository
) : Converter<Jwt, AbstractAuthenticationToken> {

    override fun convert(jwt: Jwt): AbstractAuthenticationToken {
        val user = authRepository.findByIdentifier(Email(jwt.subject)) ?: throw IllegalArgumentException("User not found: ${jwt.subject}")
        val principal = SecurityUser(user)
        val authorities = SimpleGrantedAuthority(user.authority.name)

        return UsernamePasswordAuthenticationToken(principal, null, listOf(authorities))
    }
}
