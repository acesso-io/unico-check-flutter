package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioCamera
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultCamera

class AcessoBioCamera: AcessoBio(), iAcessoBioCamera {

    override fun callMethodBio() {
        cameraSetings()
        when(methodCall){

            "openCamera" -> {
                Log.d("CAMERA RESULT","openCamera")
                acessoBio.openCamera()
            }

            else -> channelResult.notImplemented()
        }
    }

    private fun cameraSetings(){

        val disableAutoCapture = intent.getBooleanExtra("disableAutoCapture", false)
        val disableSmartFrame = intent.getBooleanExtra("disableSmartFrame", false)

        if(disableAutoCapture){
            acessoBio.disableAutoCapture()
        }
        if(disableSmartFrame){
            acessoBio.disableSmartFrame()
        }

    }

    override fun onSuccessCamera(result: ResultCamera) {
        Log.d("Teste","onSuccessCamera")
        channelResult.success(convertObjToMapReflection(result.base64,1))
        finish()
    }

    override fun onErrorCamera(errorBio: ErrorBio) {
        Log.d("Teste","onErrorCamera")
        channelResult.success(errorBioToHashMap(errorBio,0))
        finish()
    }



}