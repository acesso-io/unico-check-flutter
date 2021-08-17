package com.unico_check.config

class UnicoTimer(
    var timeoutSession: Double?,
    var timeoutToFaceInference: Double?
){
    fun getTimeoutSession(): Double{
        return timeoutSession ?: 40.5
    }

    fun timeoutToFaceInference(): Double{
        return timeoutToFaceInference ?: 15.0
    }
}

