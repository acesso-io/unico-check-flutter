package com.unico_check.config

import com.acesso.acessobio_android.onboarding.AcessoBioConfigDataSource
import io.flutter.plugin.common.MethodCall

class UnicoConfig(call: MethodCall) : AcessoBioConfigDataSource {

    private var argument: Map<Any, Any>? = null

    init {
        argument = call.argument<Map<Any, Any>>("unico_config_android")
    }

    override fun getProjectNumber(): String {
        return (argument?.get("project_number") ?: "") as String
    }

    override fun getProjectId(): String {
        return (argument?.get("project_id") ?: "") as String
    }

    override fun getMobileSdkAppId(): String {
        return (argument?.get("mobile_sdk_app_id") ?: "") as String
    }

    override fun getBundleIdentifier(): String {
        return (argument?.get("bundle_identifier") ?: "") as String
    }

    override fun getHostInfo(): String {
        return (argument?.get("host_info") ?: "") as String
    }

    override fun getHostKey(): String {
        return (argument?.get("host_Key") ?: "") as String
    }
}