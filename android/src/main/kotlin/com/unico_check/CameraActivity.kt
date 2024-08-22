package com.unico_check

import android.os.Bundle
import android.util.Log
import com.acesso.acessobio_android.AcessoBioListener
import com.acesso.acessobio_android.onboarding.AcessoBio
import com.acesso.acessobio_android.onboarding.IAcessoBioBuilder
import com.acesso.acessobio_android.onboarding.types.OriginType
import com.acesso.acessobio_android.onboarding.LocaleTypes
import com.acesso.acessobio_android.onboarding.models.Environment
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.unico_check.config.UnicoTheme
import com.unico_check.config.UnicoTimer
import com.unico_check.constants.MethodConstants.ON_RESULT
import com.unico_check.constants.MethodConstants.UNICO_THEME
import com.unico_check.constants.MethodConstants.SET_LOCALE_TYPES
import com.unico_check.constants.MethodConstants.SET_ENVIRONMENT
import com.unico_check.constants.ReturnConstants
import com.unico_check.constants.VersionTag
import com.unico_check.hashMap.errorBioToHashMap
import com.unico_check.hashMap.errorNotifier
import com.unico_check.permission.CameraPermissionActivity


abstract class CameraActivity : CameraPermissionActivity(), AcessoBioListener {

    companion object {
        const val TAG = "UnicoCheck"
        const val errorLog = "error to return value"
    }

    private var acessoBioStatus: Boolean = true

    protected lateinit var methodCall: String
    protected lateinit var acessoBio: IAcessoBioBuilder

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        initAcessoBio()
        setUnicoTheme()
        setLocale()
        setEnvironment()
        verifyCanCallMethod()
    }

    abstract fun callMethodBio()

    private fun verifyCanCallMethod() {
        if (!getPermission()) {
            getPermission()
        } else {
            if (acessoBioStatus) {
                callMethodBio()
            }
        }
    }

    private fun initAcessoBio() {
        acessoBio = AcessoBio(this, this)
            .setOrigin(OriginType.FLUTTER, VersionTag)
            .apply {
                val unicoTimer = UnicoTimer(UnicoCheckPlugin.methodCall)
                setTimeoutSession(unicoTimer.getTimeoutSession())
            }
    }

    private fun setUnicoTheme() {
        runCatching {
            val theme: Map<Any, Any>? = UnicoCheckPlugin.methodCall.argument(UNICO_THEME)
            if (theme != null) {
                acessoBio.setTheme(UnicoTheme(theme))
                customiseThisActivity(UnicoTheme(theme))
            }
        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    private fun setLocale() {
        runCatching {
            val locale: String? = UnicoCheckPlugin.methodCall.argument(SET_LOCALE_TYPES)
            if (locale != null) {
                acessoBio.setLocale(
                    when (locale) {
                        "PT_BR" -> LocaleTypes.PT_BR
                        "EN_US" -> LocaleTypes.EN_US
                        "ES_ES" -> LocaleTypes.ES_ES
                        "ES_MX" -> LocaleTypes.ES_MX
                        else -> LocaleTypes.PT_BR
                    }
                )
            }
        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    private fun setEnvironment() {
        runCatching {
            val environment: String? = UnicoCheckPlugin.methodCall.argument(SET_ENVIRONMENT)
            if (environment != null) {
                acessoBio.setEnvironment(
                    when (environment) {
                        "PROD" -> Environment.PROD
                        "UAT" -> Environment.UAT
                        "DEV" -> Environment.DEV
                        else -> Environment.PROD
                    }
                )
            }
        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    private fun customiseThisActivity(unicoTheme: UnicoTheme) {
        setContentView(CameraView(this, unicoTheme).getLayout())
    }

    override fun onErrorAcessoBio(errorBio: ErrorBio) {
        acessoBioStatus = false

        runCatching {
            UnicoCheckPlugin.result.error(
                ReturnConstants.ON_ERROR_UNICO.code,
                ReturnConstants.ON_ERROR_UNICO.message,
                errorBioToHashMap(errorBio)
            )

        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
        finish()
    }

    override fun onUserClosedCameraManually() {
        runCatching {
            UnicoCheckPlugin.result.error(
                ReturnConstants.ON_USER_CLOSED_CAMERA_MANUALLY.code,
                ReturnConstants.ON_USER_CLOSED_CAMERA_MANUALLY.message, ""
            )
            finish()
        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    override fun onSystemClosedCameraTimeoutSession() {
        runCatching {
            UnicoCheckPlugin.result.error(
                ReturnConstants.ON_SYSTEM_CLOSED_CAMERA_TIMEOUT_SESSION.code,
                ReturnConstants.ON_SYSTEM_CLOSED_CAMERA_TIMEOUT_SESSION.message,
                ""
            )
            finish()
        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    override fun onSystemChangedTypeCameraTimeoutFaceInference() {
        runCatching {
            UnicoCheckPlugin.channel.invokeMethod(
                ON_RESULT,
                errorNotifier(
                    ReturnConstants.ON_SYSTEM_CHANGED_TYPE_CAMERA_TIMEOUT_FACE_INFERENCE.code
                )
            )
            finish()
        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }
}
