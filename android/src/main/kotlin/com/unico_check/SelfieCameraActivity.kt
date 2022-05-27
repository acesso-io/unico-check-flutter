package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioSelfie
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener
import com.acesso.acessobio_android.onboarding.camera.selfie.SelfieCameraListener
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultCamera
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.errorBioToHashMap
import com.unico_check.hashMap.successBioToHashMap

class SelfieCameraActivity : CameraActivity(), iAcessoBioSelfie {

    private var jsonFileName = ""

    override fun callMethodBio() {
        jsonFileName()
        cameraSettings()
        selectCameraMethod()
    }

    private fun selectCameraMethod() {
        when (UnicoCheckPlugin.methodCall.method) {

            MethodConstants.OPEN_CAMERA_SELFIE -> openCamera()

            else -> UnicoCheckPlugin.result.notImplemented()
        }
    }

    private fun openCamera() {
        acessoBio.build().prepareSelfieCamera(jsonFileName, object : SelfieCameraListener {
            override fun onCameraReady(cameraOpener: UnicoCheckCameraOpener.Selfie) {
                cameraOpener.open(this@SelfieCameraActivity)
            }

            override fun onCameraFailed(message: String) {
                UnicoCheckPlugin.result.error(
                    ReturnConstants.ON_CAMERA_FAILED_PREPARE.code,
                    ReturnConstants.ON_CAMERA_FAILED_PREPARE.message,
                    errorBioToHashMap(
                        ErrorBio(
                            ReturnConstants.ON_CAMERA_FAILED_PREPARE.code.toInt(),
                            message
                        )
                    )
                )
                finish()
            }
        })
    }

    private fun jsonFileName() {
        try {
            jsonFileName = intent.getStringExtra(MethodConstants.JSON_NAME).toString()
        } catch (e: Exception) {
            UnicoCheckPlugin.result.error(
                ReturnConstants.ON_ERROR_JSON_FILE_NAME.code,
                ReturnConstants.ON_ERROR_JSON_FILE_NAME.message,
                null
            )
        }
    }

    private fun cameraSettings() {
        acessoBio.setAutoCapture(intent.getBooleanExtra(MethodConstants.AUTO_CAPTURE, false))
        acessoBio.setSmartFrame(intent.getBooleanExtra(MethodConstants.SMART_FRAME, false))
    }

    override fun onSuccessSelfie(result: ResultCamera) {
        runCatching {
            finish()
            UnicoCheckPlugin.result.success(successBioToHashMap(result.base64, result.encrypted))
            finish()

        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    override fun onErrorSelfie(errorBio: ErrorBio) {
        runCatching {

            UnicoCheckPlugin.result.error(
                ReturnConstants.ON_ERROR_SELFIE.code,
                ReturnConstants.ON_ERROR_SELFIE.message,
                errorBioToHashMap(errorBio)
            )
            finish()

        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    companion object {
        const val errorLog = "error to return value"
    }
}