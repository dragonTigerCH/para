package com.paranote.api

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class ParaNoteApiApplication

fun main(args: Array<String>) {
    runApplication<ParaNoteApiApplication>(*args)
}
