package com.unico_check

import com.acesso.acessobio_android.iAcessoBioLiveness
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultLivenessX

class AcessoBioLiveness : AcessoBio(), iAcessoBioLiveness {


    override fun callMethodBio() {

        when(methodCall){

            "openLiveness" -> acessoBio.openLiveness()
            "openLivenessWithCreateProcess" -> openLivenessWithCreateProcess()

            else -> onError("metedo nao encontrado")
        }


    }

    private fun openLivenessWithCreateProcess(){

        val name = intent.getStringExtra("name")
        val document = intent.getStringExtra("document")

        if(name == null || document == null){
            onError("informe nome e documento")
        }else{
            acessoBio.openLivenessWithCreateProcess(name,document)
        }

    }

    override fun onSuccessLiveness(result: ResultLivenessX?) {
        onSuccess(result)
    }

    override fun onErrorLiveness(errorBio: ErrorBio?) {
        onError(errorBio)
    }

}