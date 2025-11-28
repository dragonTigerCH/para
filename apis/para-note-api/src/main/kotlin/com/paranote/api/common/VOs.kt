package com.paranote.api.common

import jakarta.persistence.Embeddable
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated

@Embeddable
class Email(
    val value: String
)

@Embeddable
class Password(
    val value: String
)

@Embeddable
class Social(
    @Enumerated(EnumType.STRING) val provider: Provider,
) {
    enum class Provider {
        GOOGLE,
    }
}