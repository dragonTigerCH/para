package com.paranote.api.auth

import java.time.Instant

class AuthToken(
    val token: String,
    val expiration: Instant
)