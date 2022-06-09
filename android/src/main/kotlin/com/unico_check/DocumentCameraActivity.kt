package com.unico_check

import android.util.Log
import com.acesso.acessobio_android.iAcessoBioDocument
import com.acesso.acessobio_android.onboarding.camera.UnicoCheckCameraOpener
import com.acesso.acessobio_android.onboarding.camera.document.DocumentCameraListener
import com.acesso.acessobio_android.onboarding.types.DocumentType
import com.acesso.acessobio_android.services.dto.ErrorBio
import com.acesso.acessobio_android.services.dto.ResultCamera
import com.unico_check.config.UnicoConfig
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.ReturnConstants
import com.unico_check.hashMap.errorBioToHashMap
import com.unico_check.hashMap.successBioToHashMap

class DocumentCameraActivity : CameraActivity(), iAcessoBioDocument {

    companion object {
        const val RG_FRENTE = "RG_FRENTE"
        const val RG_VERSO = "RG_VERSO"
        const val CNH = "CNH"
        const val CNH_FRENTE = "CNH_FRENTE"
        const val CNH_VERSO = "CNH_VERSO"
        const val CPF = "CPF"
        const val NONE = "NONE"
        const val errorLog = "error to return value"
    }

    override fun callMethodBio() {
        selectCameraMethod()
    }

    private fun selectCameraMethod() {
        when (UnicoCheckPlugin.methodCall.method) {

            MethodConstants.OPEN_CAMERA_DOCUMENT -> openCameraDocument()

            else -> UnicoCheckPlugin.result.notImplemented()
        }
    }

    private fun selectDocument(): DocumentType {
        return when (intent.getStringExtra(MethodConstants.DOCUMENT_TYPE)) {
            RG_FRENTE -> DocumentType.RG_FRENTE
            RG_VERSO -> DocumentType.RG_VERSO
            CNH -> DocumentType.CNH
            CNH_FRENTE -> DocumentType.CNH_FRENTE
            CNH_VERSO -> DocumentType.CNH_VERSO
            CPF -> DocumentType.CPF
            else -> DocumentType.NONE
        }
    }

    private fun openCameraDocument() {
        acessoBio.build().prepareDocumentCamera(UnicoConfig(UnicoCheckPlugin.methodCall), object : DocumentCameraListener {

            override fun onCameraReady(cameraOpener: UnicoCheckCameraOpener.Document) {
                cameraOpener.open(selectDocument(), this@DocumentCameraActivity)
            }

            override fun onCameraFailed(message: String) {
                UnicoCheckPlugin.result.error(
                    ReturnConstants.ON_CAMERA_FAILED_PREPARE.code,
                    ReturnConstants.ON_CAMERA_FAILED_PREPARE.message,
                    errorBioToHashMap(
                        ErrorBio(
                            ReturnConstants.ON_CAMERA_FAILED_PREPARE.code.toInt(),
                            message
                        )
                    )
                )
                finish()
            }
        })
    }

    override fun onSuccessDocument(result: ResultCamera) {
        runCatching {

            UnicoCheckPlugin.result.success(successBioToHashMap(result.base64, result.encrypted))
            finish()

        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }

    override fun onErrorDocument(error: String) {
        runCatching {

            UnicoCheckPlugin.result.error(
                ReturnConstants.ON_ERROR_DOCUMENT.code,
                ReturnConstants.ON_ERROR_DOCUMENT.message,
                errorBioToHashMap(
                    ErrorBio(
                        ReturnConstants.ON_ERROR_DOCUMENT.code.toInt(),
                        error
                    )
                )
            )
            finish()

        }.onFailure {
            Log.d(TAG, errorLog)
            finish()
        }
    }
}