package com.unico_check

import com.acesso.acessobio_android.iAcessoBioAuthenticate
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultAuthenticate


class AcessoBioAuthenticate : AcessoBio(), iAcessoBioAuthenticate {

    override fun callMethodBio() {

        when(methodCall){

            "openLivenessAuthenticate" -> openLivenessAuthenticate()


            else -> onError("metedo nao encontrado")
        }

    }

    private fun openLivenessAuthenticate() {

        val code = intent.getStringExtra("code")

        if(code != null){
            acessoBio.openLivenessAuthenticate(code)
        }else{
            onError("informe o code")
        }

    }

    override fun onSuccessAuthenticate(result: ResultAuthenticate?) {
        onSuccess(result)
    }

    override fun onErrorAuthenticate(errorBio: ErrorBio?) {
        onError(errorBio)
    }




}