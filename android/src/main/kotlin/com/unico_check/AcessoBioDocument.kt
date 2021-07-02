package com.unico_check

import com.acesso.acessobio_android.iAcessoBioDocument

class AcessoBioDocument : AcessoBio(), iAcessoBioDocument {

    override fun callMethodBio() {
        when(methodCall){

            "openCameraDocument" -> openCameraDocument()

            else ->  channelResult.notImplemented()
        }
    }
    
    private fun openCameraDocument() {

        val documentType = intent.getIntExtra("DOCUMENT_TYPE",0)

        if(documentType == 0){
            channelResult.success(convertObjToMapReflection("informe tipo de documento",0))
        }else{
            acessoBio.openCameraDocument(documentType)
        }

    }

    override fun onSuccesstDocument(base64: String) {
        channelResult.success(convertObjToMapReflection(base64,1))
        finish()
    }

    override fun onErrorDocument(error: String) {
        channelResult.success(convertObjToMapReflection(error,0))
        finish()
    }



}