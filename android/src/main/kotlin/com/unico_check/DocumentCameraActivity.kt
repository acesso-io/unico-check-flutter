package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioDocument
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener
import com.acesso.acessobio_android.onboarding.camera.document.DocumentCameraListener
import com.acesso.acessobio_android.onboarding.types.DocumentType
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.errorBioToHashMap
import com.unico_check.hashMap.convertObjToMapReflection

class DocumentCameraActivity : CameraActivity(), iAcessoBioDocument {

    companion object {
        const val RG_FRENTE = 501
        const val RG_VERSO = 502
        const val CNH = 4
        const val NONE = 0
    }

    override fun callMethodBio() {
        selectCameraMethod()
    }

    private fun selectCameraMethod() {
        when (UnicoCheckPlugin.methodCall.method) {

            MethodConstants.openCameraDocument -> openCameraDocument()

            else -> UnicoCheckPlugin.result.notImplemented()
        }
    }

    private fun selectDocument(): DocumentType {
        return when (intent.getIntExtra(MethodConstants.document_type, NONE)) {
            RG_FRENTE -> DocumentType.RG_FRENTE
            RG_VERSO -> DocumentType.RG_VERSO
            CNH -> DocumentType.CNH
            else -> DocumentType.NONE
        }
    }

    private fun openCameraDocument() {
        acessoBio.build().prepareDocumentCamera(object : DocumentCameraListener {
            override fun onCameraReady(cameraOpener: UnicoCheckCameraOpener.Document) {
                cameraOpener.open(selectDocument(), this@DocumentCameraActivity)
            }

            override fun onCameraFailed(message: String) {
                Log.d(TAG, ReturnConstants.onError)
            }
        })
    }

    override fun onSuccessDocument(base64: String) {
        runCatching {

            UnicoCheckPlugin.result.success(convertObjToMapReflection(base64))
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onSuccessDocument)
        }
    }

    override fun onErrorDocument(error: String) {
        runCatching {

            UnicoCheckPlugin.result.error(
                ReturnConstants.onError,
                "",
                errorBioToHashMap(ErrorBio(0,"onErrorDocument",error))
            )
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onErrorDocument)
        }
    }

}