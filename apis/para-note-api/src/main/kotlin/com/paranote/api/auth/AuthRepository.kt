package com.paranote.api.auth

import com.paranote.api.common.Email
import org.springframework.data.jpa.repository.JpaRepository


interface AuthRepository: JpaRepository<User, Long> {
    fun findByIdentifier(value: Email): User?
}