package com.paranote.api.content

import org.assertj.core.api.Assertions
import org.junit.jupiter.api.Test

class ContentTest {

    @Test
    fun `유저는 Content를 만들 수 있다`() {

        //given
        val userId = 1L
        val title = "title"
        val body = "body"

        //when
        val new = Content.create(title, body, userId)

        //then
        Assertions.assertThat(new.title).isEqualTo(title)
        Assertions.assertThat(new.body).isEqualTo(body)
        Assertions.assertThat(new.audit.createdBy).isEqualTo(userId)
        Assertions.assertThat(new.audit.updatedAt).isNotNull()
        Assertions.assertThat(new.audit.updatedBy).isEqualTo(userId)
        Assertions.assertThat(new.containerId).isNull()

    }

    @Test
    fun `유저가 만든 컨텐츠 title 빈값이 들어가면 에러를 발생시킨다`() {

        //given
        val userId = 1L
        val title = ""
        val body = "body"

        //when && //then
        Assertions.assertThatThrownBy { Content.Companion.create(title, body, userId) }
            .isInstanceOf(IllegalArgumentException::class.java)
            .hasMessage("Content title must not be blank")

    }

    @Test
    fun `Content는 기본적으로 Inbox 상태로 생성된다`() {

        //given
        val userId = 1L

        //when
        val content = Content.create(
            title = "새로운 아이디어",
            body = "나중에 정리할 내용",
            user = userId
        )

        //then
        Assertions.assertThat(content.isInInbox()).isTrue()
        Assertions.assertThat(content.containerId).isNull()
    }

    @Test
    fun `Content를 Container로 이동할 수 있다`() {
        //given
        val userId = 1L
        val content = Content.create(
            title = "블로그 포스트 아이디어",
            body = "PARA 방법론 소개",
            user = userId
        )
        val containerId = 1L

        //when
        val movedContent = content.moveToContainer(containerId, userId)

        //then
        Assertions.assertThat(movedContent.containerId).isEqualTo(containerId)
        Assertions.assertThat(movedContent.isInInbox()).isFalse()
        Assertions.assertThat(movedContent.title).isEqualTo(content.title) // title은 그대로
        Assertions.assertThat(movedContent.body).isEqualTo(content.body) // body도 그대로
    }

    @Test
    fun `Content를 Container에서 Inbox로 다시 이동할 수 있다`() {
        //given
        val userId = 1L
        val content = Content.create(
            title = "테스트 컨텐츠",
            body = "테스트 내용",
            user = userId
        )
        val containerId = 1L
        val movedContent = content.moveToContainer(containerId, userId)

        //when
        val backToInbox = movedContent.moveToInbox(userId)

        //then
        Assertions.assertThat(backToInbox.isInInbox()).isTrue()
        Assertions.assertThat(backToInbox.containerId).isNull()
    }

    @Test
    fun `Content의 title과 body를 수정할 수 있다`() {
        //given
        val userId = 1L
        val content = Content.create(
            title = "원래 제목",
            body = "원래 내용",
            user = userId
        )

        //when
        val modified = content.modified(
            newTitle = "새로운 제목",
            newBody = "새로운 내용",
            modifiedBy = userId
        )

        //then
        Assertions.assertThat(modified.title).isEqualTo("새로운 제목")
        Assertions.assertThat(modified.body).isEqualTo("새로운 내용")
        Assertions.assertThat(modified.audit.updatedBy).isEqualTo(userId)
    }

    @Test
    fun `Container의 모드가 변경되어도 Content의 containerId는 유지된다`() {
        //given
        val userId = 1L
        val containerId = 1L
        val content = Content.create(
            title = "블로그 포스트",
            body = "PARA 방법론",
            user = userId
        ).moveToContainer(containerId, userId)

        // Container가 PROJECT → AREA로 변경되었다고 가정
        // (실제로는 Container의 currentMode만 변경됨)

        //then
        // Content의 containerId는 여전히 동일
        Assertions.assertThat(content.containerId).isEqualTo(containerId)
        Assertions.assertThat(content.isInInbox()).isFalse()
    }

    @Test
    fun `여러 Content가 동일한 Container를 참조할 수 있다`() {
        //given
        val userId = 1L
        val containerId = 1L

        //when
        val content1 = Content.Companion.create("첫 포스트", "내용1", userId)
            .moveToContainer(containerId, userId)
        val content2 = Content.Companion.create("디자인 시안", "내용2", userId)
            .moveToContainer(containerId, userId)
        val content3 = Content.Companion.create("마케팅 계획", "내용3", userId)
            .moveToContainer(containerId, userId)

        //then
        Assertions.assertThat(content1.containerId).isEqualTo(containerId)
        Assertions.assertThat(content2.containerId).isEqualTo(containerId)
        Assertions.assertThat(content3.containerId).isEqualTo(containerId)
    }

    @Test
    fun `Content는 다른 Container로 이동할 수 있다`() {
        //given
        val userId = 1L
        val container1Id = 1L
        val container2Id = 2L

        val content = Content.Companion.create(
            title = "이동할 컨텐츠",
            body = "처음에는 프로젝트1에 있다가 프로젝트2로 이동",
            user = userId
        ).moveToContainer(container1Id, userId)

        //when
        val movedContent = content.moveToContainer(container2Id, userId)

        //then
        Assertions.assertThat(movedContent.containerId).isNotEqualTo(container1Id)
    }

}