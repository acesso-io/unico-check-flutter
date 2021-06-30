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

            else -> onError("metedo nao encontrado")
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

    override fun onSuccessCamera(result: ResultCamera?) {
        Log.d("CAMERA RESULT","onSuccessCamera")

        if(result?.base64 != null)
            Log.d("CAMERA RESULT","onSuccessCamera base64: TRUE")

        onSuccess(result!!.base64)
    }

    override fun onErrorCamera(errorBio: ErrorBio?) {
        Log.d("CAMERA RESULT","onErrorCamera")
        //onError(errorBio)
    }



}