package com.unico_check


import com.acesso.acessobio_android.iAcessoBioDocument
import com.acesso.acessobio_android.services.dto.OCRResponse

class AcessoBioDocument : AcessoBio(), iAcessoBioDocument {

    override fun callMethodBio() {
        when(methodCall){

            "openCameraDocumentOCR" -> openCameraDocumentOCR()
            "openFaceMatch" -> openFaceMatch()
            "openCameraDocument" -> openCameraDocument()


            else -> onError("metedo nao encontrado")
        }
    }

    private fun openCameraDocumentOCR() {

        val documentType = intent.getIntExtra("DOCUMENT_TYPE",0)

        if(documentType == 0){
            onError("informe tipo de documento")
        }else{
            acessoBio.openCameraDocumentOCR(documentType)
        }

    }

    private fun openFaceMatch() {

        val documentType = intent.getIntExtra("DOCUMENT_TYPE",0)

        if(documentType == 0){
            onError("informe tipo de documento")
        }else{
            acessoBio.openFaceMatch(documentType)
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

    //override
    override fun onSuccessOCR(ocr: OCRResponse?) {
        onSuccess(ocr)
    }

    override fun onErrorOCR(error: String) {
        onError(error)
    }

    override fun onSucessFaceMatch(status: Boolean) {
        onSuccess(status)
    }

    override fun onErrorFaceMatch(error: String?) {
        onError(error)
    }

    override fun onSuccesstDocument(base64: String?) {
        onSuccess(base64)
    }



    override fun onErrorDocument(error: String?) {
        onError(error)
    }

    override fun onSucessDocumentInsert(processId: String?, typed: String?) {

        if(processId == null || typed == null ){
            onError("Erro desconhecido")
        }else{

            data class temp(
                    var processId: String,
                    var typed: String
            )

            val obj = temp(
                    processId,
                    typed
            )

            onSuccess(obj)
        }


    }

    override fun onErrorDocumentInsert(error: String?) {
        onError(error)
    }



}