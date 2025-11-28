package com.paranote.api.auth

import com.paranote.api.common.Auditable
import com.paranote.api.common.Email
import com.paranote.api.common.Password
import com.paranote.api.common.Social
import jakarta.persistence.AttributeOverride
import jakarta.persistence.Column
import jakarta.persistence.Embedded
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table


@Entity
@Table(name = "users")
class User(
    identifier: Email,
    password: Password,
    name: String?,
    social: Social? = null,
    authority: Authority,
): Auditable() {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null
        protected set

    @Embedded
    @AttributeOverride(name = "value", column = Column(name = "identifier"))
    var identifier: Email = identifier
        protected set

    @Embedded
    @AttributeOverride(name = "value", column = Column(name = "password"))
    var password: Password = password
        protected set

    @Column
    var name: String? = name
        protected set

    @Embedded
    @AttributeOverride(name = "provider", column = Column(name = "social_provider"))
    var social: Social? = social
        protected set

    @Enumerated(EnumType.STRING)
    @Column(name = "authorities")
    var authority: Authority = authority
        protected set

    companion object {
        fun create(
            identifier: Email,
            password: Password,
            name: String? = null,
            social: Social? = null,
            authority: Authority,
        ): User {
            return User(
                identifier,
                password,
                name,
                social,
                authority,
            )
        }
    }

}

enum class Authority {
    ROLE_USER,
    ROLE_ADMIN
}
