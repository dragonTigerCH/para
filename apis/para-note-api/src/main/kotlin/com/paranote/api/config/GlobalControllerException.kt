package com.paranote.api.config

import com.nimbusds.oauth2.sdk.ErrorResponse
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice

@RestControllerAdvice
class GlobalControllerException {

//    @ExceptionHandler(RuntimeException::class)
//    fun handleBadRequest(ex: RuntimeException): ResponseEntity<ErrorResponse> {
//        return ResponseEntity
//            .status(HttpStatus.BAD_REQUEST)
//            .body(ErrorResponse(ex.message ?: "Invalid request"))
//    }
}