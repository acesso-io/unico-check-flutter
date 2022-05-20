package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioDocument
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener
import com.acesso.acessobio_android.onboarding.camera.document.DocumentCameraListener
import com.acesso.acessobio_android.onboarding.types.DocumentType
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultCamera
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.convertObjToHashMap
import com.unico_check.hashMap.errorBioToHashMap

class DocumentCameraActivity : CameraActivity(), iAcessoBioDocument {

    companion object {
        const val RG_FRENTE = 501
        const val RG_VERSO = 502
        const val CNH = 4
        const val NONE = 0
    }

    private var jsonFileName = ""

    override fun callMethodBio() {
        jsonFileName()
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
        acessoBio.build().prepareDocumentCamera(jsonFileName, object : DocumentCameraListener {

            override fun onCameraReady(cameraOpener: UnicoCheckCameraOpener.Document) {
                cameraOpener.open(selectDocument(), this@DocumentCameraActivity)
            }

            override fun onCameraFailed(message: String) {
                Log.d(TAG, ReturnConstants.onError)
            }

        })
    }

    private fun jsonFileName() {
        try {
            jsonFileName = intent.getStringExtra(MethodConstants.jsonName).toString()
        } catch (e: Exception) {
            UnicoCheckPlugin.result.error("0", ReturnConstants.onErrorJsonFileName, null)
        }
    }

    override fun onSuccessDocument(result: ResultCamera) {
        runCatching {

            UnicoCheckPlugin.result.success(convertObjToHashMap(result.base64, result.encrypted))
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
                errorBioToHashMap(ErrorBio(0, "onErrorDocument"))
            )
            finish()

        }.onFailure {
            Log.d(TAG, ReturnConstants.onErrorDocument)
        }
    }

}