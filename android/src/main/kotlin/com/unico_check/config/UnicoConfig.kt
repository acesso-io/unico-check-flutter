package com.unico_check.config

import com.acesso.acessobio_android.onboarding.AcessoBioConfigDataSource
import com.unico_check.constants.MethodConstants.BUNDLE_IDENTIFIER
import com.unico_check.constants.MethodConstants.HOST_INFO
import com.unico_check.constants.MethodConstants.HOST_KEY
import com.unico_check.constants.MethodConstants.MOBILE_SDK_APP_ID
import com.unico_check.constants.MethodConstants.PROJECT_ID
import com.unico_check.constants.MethodConstants.PROJECT_NUMBER
import com.unico_check.constants.MethodConstants.UNICO_CONFIG_ANDROID
import io.flutter.plugin.common.MethodCall

class UnicoConfig(call: MethodCall) : AcessoBioConfigDataSource {

    private var argument: Map<Any, Any>? = null

    init {
        argument = call.argument<Map<Any, Any>>(UNICO_CONFIG_ANDROID)
    }

    override fun getProjectNumber(): String {
        return (argument?.get(PROJECT_NUMBER) ?: "") as String
    }

    override fun getProjectId(): String {
        return (argument?.get(PROJECT_ID) ?: "") as String
    }

    override fun getMobileSdkAppId(): String {
        return (argument?.get(MOBILE_SDK_APP_ID) ?: "") as String
    }

    override fun getBundleIdentifier(): String {
        return (argument?.get(BUNDLE_IDENTIFIER) ?: "") as String
    }

    override fun getHostInfo(): String {
        return (argument?.get(HOST_INFO) ?: "") as String
    }

    override fun getHostKey(): String {
        return (argument?.get(HOST_KEY) ?: "") as String
    }
}