package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioCamera
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultCamera

class AcessoBioCamera: AcessoBio(), iAcessoBioCamera {

    override fun callMethodBio() {
        cameraSetings()
        when(methodCall){

            "openCamera" -> acessoBio.openCamera()
            "openCameraWithCreateProcess" -> openCameraWithCreateProcess()
            "openCameraInsertDocument" -> openCameraInsertDocument()

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

    private fun openCameraWithCreateProcess() {

        val nome = intent.getStringExtra("nome")
        val code = intent.getStringExtra("code")
        val gender = intent.getStringExtra("gender")
        val birthdate = intent.getStringExtra("birthdate")
        val email = intent.getStringExtra("email")
        val phone = intent.getStringExtra("phone")

        if(        nome != null && nome != ""
                && code != null && code != ""
                && gender != null && gender != ""
                && birthdate != null && birthdate != ""
                && email != null && email != ""
                && phone != null && phone != ""
        ){
            acessoBio.openCameraWithCreateProcess(nome,code,gender,birthdate,email,phone)
        }else if(nome != null && nome != "" && code != null && code != ""){
            acessoBio.openCameraWithCreateProcess(nome,code)
        }else{
            onError("ao menos nome e code sao obrigatorios")
        }

    }

    private fun openCameraInsertDocument(){

        val code = intent.getStringExtra("code")
        val nome = intent.getStringExtra("nome")
        val documentType = intent.getIntExtra("DOCUMENT_TYPE",0)

        if(documentType == 0 || code == null || nome == null){
            onError("informe tipo de documento")
        }else{
            acessoBio.openCameraWithCreateProcess(nome, code, documentType)
        }

    }

    override fun onSuccessCamera(result: ResultCamera?) {

        if(result?.base64 != null)
            Log.d("CAMERA RESULT","onSuccessCamera base64: TRUE")

        onSuccess(result!!.base64)
    }

    override fun onErrorCamera(errorBio: ErrorBio?) {
        onError(errorBio)
    }



}