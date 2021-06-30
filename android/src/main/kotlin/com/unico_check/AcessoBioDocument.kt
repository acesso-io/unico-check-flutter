package com.unico_check


import com.acesso.acessobio_android.iAcessoBioDocument
import com.acesso.acessobio_android.services.dto.OCRResponse

class AcessoBioDocument : AcessoBio(), iAcessoBioDocument {

    override fun callMethodBio() {
        when(methodCall){

            "openCameraDocument" -> openCameraDocument()

            else -> onError("metedo nao encontrado")
        }
    }


    private fun openCameraDocument() {

        val documentType = intent.getIntExtra("DOCUMENT_TYPE",0)

        if(documentType == 0){
            onError("informe tipo de documento")
        }else{
            acessoBio.openCameraDocument(documentType)
        }

    }

    override fun onSuccesstDocument(base64: String?) {
        onSuccess(base64)
    }

    override fun onErrorDocument(error: String?) {
        onError(error)
    }



}