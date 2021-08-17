package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioSelfie
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener
import com.acesso.acessobio_android.onboarding.camera.selfie.SelfieCameraListener
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultCamera
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.ConvertAcessoBioHashMap

class UnicoCheckCamera: UnicoCheck(), iAcessoBioSelfie {

    override fun callMethodBio() {
        cameraSetings()
        selectCameraMethod()
    }

    private fun selectCameraMethod(){
        when(methodCall){

            MethodConstants.openCamera -> {
                openCamera()
            }

            else -> channelResult.notImplemented()
        }
    }

    private fun openCamera(){
        acessoBio.build().prepareSelfieCamera(object : SelfieCameraListener {
            override fun onCameraReady(cameraOpener: UnicoCheckCameraOpener.Selfie) {
                cameraOpener.open(this@UnicoCheckCamera)
            }

            override fun onCameraFailed(message: String) {
                TODO()
            }
        })
    }

    private fun cameraSetings(){
        acessoBio.setAutoCapture(intent.getBooleanExtra(MethodConstants.disableAutoCapture, false))
        acessoBio.setSmartFrame(intent.getBooleanExtra(MethodConstants.disableAutoCapture, false))
    }

    override fun onSuccessSelfie(result: ResultCamera) {
        runCatching {

            channelResult.success(ConvertAcessoBioHashMap.convertObjToMapReflection(result.base64))
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSuccessSelfie)
        }
    }

    override fun onErrorSelfie(errorBio: ErrorBio) {
        runCatching {

            channelResult.error(ReturnConstants.onErrorSelfie, "", ConvertAcessoBioHashMap.errorBioToHashMap(errorBio))
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onErrorSelfie)
        }
    }


}