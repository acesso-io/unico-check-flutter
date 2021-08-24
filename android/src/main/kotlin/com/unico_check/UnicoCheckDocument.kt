package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioDocument
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener
import com.acesso.acessobio_android.onboarding.camera.document.DocumentCameraListener
import com.acesso.acessobio_android.onboarding.types.DocumentType
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.convertObjToMapReflection

class UnicoCheckDocument : UnicoCheck(), iAcessoBioDocument {

    override fun callMethodBio() {
        selectCameraMethod()
    }

    private fun selectCameraMethod() {
        when(methodCall){

            MethodConstants.openCameraDocument -> openCameraDocument()

            else ->  channelResult.notImplemented()
        }
    }

    private fun selectDocument(): DocumentType {
        return when(intent.getIntExtra(MethodConstants.document_type,0)){
            501 -> DocumentType.RG_FRENTE
            502 -> DocumentType.RG_VERSO
            4 -> DocumentType.CNH
            else -> DocumentType.NONE
        }
    }
    
    private fun openCameraDocument() {
        acessoBio.build().prepareDocumentCamera(object : DocumentCameraListener {
            override fun onCameraReady(cameraOpener: UnicoCheckCameraOpener.Document) {
                cameraOpener.open(selectDocument(), this@UnicoCheckDocument)
            }

            override fun onCameraFailed(message: String) {
                TODO()
            }
        })
    }

    override fun onSuccessDocument(base64: String) {
        runCatching {

            channelResult.success(convertObjToMapReflection(base64))
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSuccessDocument)
        }
    }

    override fun onErrorDocument(error: String) {
        runCatching {

            channelResult.error(ReturnConstants.onError,"", convertObjToMapReflection(error))
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onErrorDocument)
        }
    }

}