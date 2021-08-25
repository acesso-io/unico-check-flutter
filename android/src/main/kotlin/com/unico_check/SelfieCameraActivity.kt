package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioSelfie
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener
import com.acesso.acessobio_android.onboarding.camera.selfie.SelfieCameraListener
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultCamera
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.convertObjToMapReflection
import com.unico_check.hashMap.errorBioToHashMap

class SelfieCameraActivity : CameraActivity(), iAcessoBioSelfie {

    override fun callMethodBio() {
        cameraSetings()
        selectCameraMethod()
    }

    private fun selectCameraMethod() {
        when (UnicoCheckPlugin.methodCall.method) {

            MethodConstants.openCamera -> openCamera()

            else -> UnicoCheckPlugin.result.notImplemented()
        }
    }

    private fun openCamera() {
        acessoBio.build().prepareSelfieCamera(object : SelfieCameraListener {
            override fun onCameraReady(cameraOpener: UnicoCheckCameraOpener.Selfie) {
                cameraOpener.open(this@SelfieCameraActivity)
            }

            override fun onCameraFailed(message: String) {
                Log.d(TAG, ReturnConstants.onError)
            }
        })
    }

    private fun cameraSetings() {
        acessoBio.setAutoCapture(intent.getBooleanExtra(MethodConstants.disableAutoCapture, false))
        acessoBio.setSmartFrame(intent.getBooleanExtra(MethodConstants.disableAutoCapture, false))
    }

    override fun onSuccessSelfie(result: ResultCamera) {
        runCatching {

            UnicoCheckPlugin.result.success(convertObjToMapReflection(result.base64))
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSuccessSelfie)
        }
    }

    override fun onErrorSelfie(errorBio: ErrorBio) {
        runCatching {

            UnicoCheckPlugin.result.error(ReturnConstants.onError, "", errorBioToHashMap(errorBio))
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onErrorSelfie)
        }
    }


}