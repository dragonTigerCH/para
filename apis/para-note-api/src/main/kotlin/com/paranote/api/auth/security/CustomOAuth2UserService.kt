package com.paranote.api.auth.security

import com.paranote.api.auth.Authority
import com.paranote.api.auth.User
import com.paranote.api.common.Email
import com.paranote.api.common.Password
import com.paranote.api.common.Social
import org.slf4j.LoggerFactory
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService
import org.springframework.security.oauth2.core.user.OAuth2User
import org.springframework.stereotype.Service

@Service
class CustomOAuth2UserService: OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    private val logger = LoggerFactory.getLogger(javaClass)

    override fun loadUser(userRequest: OAuth2UserRequest): OAuth2User {
        val oAuth2User = DefaultOAuth2UserService().loadUser(userRequest)
        val attributes = oAuth2User.attributes

        logger.debug("OAuth2 attributes: $attributes")

        val provider = Social.Provider.valueOf(userRequest.clientRegistration.registrationId.uppercase())
        val oauthUser = when(provider) {
            Social.Provider.GOOGLE -> User.create(
                identifier = Email(attributes["email"].toString()),
                password = Password(attributes["sub"].toString()),
                name = attributes["name"].toString(),
                social = Social(provider),
                authority = Authority.ROLE_USER
            )
            // 다른 공급자 처리
        }
        logger.debug("OAuth2 user: ${oauthUser.name}")
        return SecurityUser(oauthUser)
    }
}

//interface OauthUser {
//    val id: String
//    val email: String
//    val name: String
//    val socialProvider: Social.Provider
//}
//
//data class GoogleUser(
//    override val id: String,
//    override val email: String,
//    override val name: String,
//    override val socialProvider: Social.Provider
//): OauthUser
