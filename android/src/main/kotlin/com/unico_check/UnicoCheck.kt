package com.unico_check


import android.os.Bundle
import android.util.Log
import com.acesso.acessobio_android.AcessoBioListener
import com.acesso.acessobio_android.onboarding.AcessoBio
import com.acesso.acessobio_android.onboarding.IAcessoBioBuilder
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.unico_check.config.UnicoCameraType
import com.unico_check.config.UnicoTheme
import com.unico_check.config.UnicoTimer
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.ConvertAcessoBioHashMap
import com.unico_check.permission.CameraPermission
import io.flutter.plugin.common.MethodChannel


abstract class UnicoCheck : CameraPermission(), AcessoBioListener {

    companion object {
        var TAG = "UnicoCheck"
        var methodCall : String? = null
        lateinit var channelResult: MethodChannel.Result
        lateinit var unicoTheme: UnicoTheme
        lateinit var unicoTimer: UnicoTimer
        lateinit var unicoCameraType: UnicoCameraType
    }

    lateinit var acessoBio: IAcessoBioBuilder
    private var acessoBioStatus: Boolean = true

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        getMethodCall()
        initAcessoBio()
        verifyCanCallMethod()
    }

    abstract fun callMethodBio()

    private fun getMethodCall(){
        methodCall = intent.getStringExtra(MethodConstants.methodCall)
    }

    private fun verifyCanCallMethod() {
        if (!getPermission()) {
            getPermission()
        } else {
            if(acessoBioStatus){
                callMethodBio()
            }
        }
    }

    private fun initAcessoBio() {
        acessoBio = AcessoBio(this, this)
            .setAutoCapture(unicoCameraType.autoCapture)
            .setSmartFrame(unicoCameraType.smartFrame)
            .setTimeoutSession(unicoTimer.getTimeoutSession())
            .setTimeoutToFaceInference(unicoTimer.timeoutToFaceInference())
            .setTheme(unicoTheme)
            .setSafeMode(false)
    }

    fun setPluginContext(res: MethodChannel.Result) {
        channelResult = res
    }

    fun setUnicoTheme(theme: UnicoTheme){
        unicoTheme = theme
    }

    fun setTimer(timer: UnicoTimer){
        unicoTimer = timer
    }

    fun setCameraType(cameraType: UnicoCameraType){
        unicoCameraType = cameraType
    }

    override fun onErrorAcessoBio(errorBio: ErrorBio) {
        acessoBioStatus = false

        runCatching {

            channelResult.error(ReturnConstants.onErrorAcessoBio, "", ConvertAcessoBioHashMap.errorBioToHashMap(errorBio))

        }.onFailure {
            Log.d(TAG, ReturnConstants.onErrorAcessoBio)
        }
        finish()
    }

    override fun onUserClosedCameraManually() {
        runCatching {

            channelResult.error(ReturnConstants.onUserClosedCameraManually,"", "")
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onUserClosedCameraManually)
        }
    }

    override fun onSystemClosedCameraTimeoutSession() {
        runCatching {

            channelResult.error(ReturnConstants.onSystemClosedCameraTimeoutSession,"" ,"")
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSystemClosedCameraTimeoutSession)
        }
    }

    override fun onSystemChangedTypeCameraTimeoutFaceInference() {
        runCatching {

            channelResult.error(ReturnConstants.onSystemChangedTypeCameraTimeoutFaceInference,"", "")
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSystemChangedTypeCameraTimeoutFaceInference)
        }
    }

}
