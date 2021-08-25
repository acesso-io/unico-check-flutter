package com.unico_check


import android.os.Bundle
import android.util.Log
import com.acesso.acessobio_android.AcessoBioListener
import com.acesso.acessobio_android.onboarding.AcessoBio
import com.acesso.acessobio_android.onboarding.IAcessoBioBuilder
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.unico_check.config.UnicoTheme
import com.unico_check.config.UnicoTimer
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.errorBioToHashMap
import com.unico_check.permission.CameraPermissionActivity
import io.flutter.plugin.common.MethodChannel


abstract class CameraActivity : CameraPermissionActivity(), AcessoBioListener {

    companion object {
        const val TAG = "UnicoCheck"
    }

    private var acessoBioStatus: Boolean = true

    protected lateinit var methodCall: String
    protected lateinit var acessoBio: IAcessoBioBuilder

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        initAcessoBio()
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
            .setSafeMode(false)
            .setTheme(UnicoTheme(UnicoCheckPlugin.methodCall))
            .apply {
                val unicoTimer = UnicoTimer(UnicoCheckPlugin.methodCall)

                setTimeoutSession(unicoTimer.getTimeoutSession())
                setTimeoutToFaceInference(unicoTimer.timeoutToFaceInference())
            }
    }

    override fun onErrorAcessoBio(errorBio: ErrorBio) {
        acessoBioStatus = false

        runCatching {

            UnicoCheckPlugin.result.error(
                ReturnConstants.onErrorAcessoBio,
                "",
                errorBioToHashMap(errorBio)
            )

        }.onFailure {
            Log.d(TAG, ReturnConstants.onErrorAcessoBio)
        }
        finish()
    }

    override fun onUserClosedCameraManually() {
        runCatching {

            UnicoCheckPlugin.result.error(ReturnConstants.onUserClosedCameraManually, "", "")
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onUserClosedCameraManually)
        }
    }

    override fun onSystemClosedCameraTimeoutSession() {
        runCatching {

            UnicoCheckPlugin.result.error(
                ReturnConstants.onSystemClosedCameraTimeoutSession,
                "",
                ""
            )
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSystemClosedCameraTimeoutSession)
        }
    }

    override fun onSystemChangedTypeCameraTimeoutFaceInference() {
        runCatching {

            UnicoCheckPlugin.result.error(
                ReturnConstants.onSystemChangedTypeCameraTimeoutFaceInference,
                "",
                ""
            )
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSystemChangedTypeCameraTimeoutFaceInference)
        }
    }

}
