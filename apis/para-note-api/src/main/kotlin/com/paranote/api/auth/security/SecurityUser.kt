package com.paranote.api.auth.security

import com.paranote.api.auth.User
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.oauth2.core.user.OAuth2User

data class SecurityUser(
    val user: User,
): UserDetails, OAuth2User {

    override fun getAuthorities(): Collection<GrantedAuthority?> {
        val simpleGrantedAuthority = SimpleGrantedAuthority(user.authority.name)
        return listOf(simpleGrantedAuthority)
    }

    override fun getPassword(): String {
        return user.password.value
    }

    override fun getUsername(): String {
        return user.identifier.value
    }

    override fun isAccountNonExpired(): Boolean {
        TODO("Not yet implemented")
    }

    override fun isAccountNonLocked(): Boolean {
        TODO("Not yet implemented")
    }

    override fun isCredentialsNonExpired(): Boolean {
        TODO("Not yet implemented")
    }

    override fun isEnabled(): Boolean {
        TODO("Not yet implemented")
    }

    override fun getAttributes(): Map<String, Any?> = mapOf(
        "id" to user.id,
        "email" to user.identifier,
        "name" to user.name,
    )

    override fun getName(): String? = user.name
}