package com.unico_check

import com.acesso.acessobio_android.iAcessoBioAuthenticate
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultAuthenticate


class AcessoBioAuthenticate : AcessoBio(), iAcessoBioAuthenticate {

    override fun callMethodBio() {

        when(methodCall){

            "openAuthenticate" -> openAuthenticate()


            else -> onError("metedo nao encontrado")
        }

    }

    private fun openAuthenticate() {

        val code = intent.getStringExtra("code")

        if(code != null){
            acessoBio.openCameraAuthenticate(code)
        }else{
            onError("informe o CPF")
        }

    }

    override fun onSuccessAuthenticate(result: ResultAuthenticate?) {
        onSuccess(result)
    }

    override fun onErrorAuthenticate(errorBio: ErrorBio?) {
        onError(errorBio)
    }




}