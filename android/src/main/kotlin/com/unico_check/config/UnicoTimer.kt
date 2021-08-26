package com.unico_check.config

import com.unico_check.constants.MethodConstants
import io.flutter.plugin.common.MethodCall

class UnicoTimer(private val call: MethodCall ){

    fun getTimeoutSession(): Double{
        return call.argument(MethodConstants.setTimeoutSession) ?: 40.5
    }

    fun timeoutToFaceInference(): Double{
        return call.argument(MethodConstants.setTimeoutToFaceInference) ?: 15.0
    }
}

