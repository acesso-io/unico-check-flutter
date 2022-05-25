package com.unico_check.constants

enum class ReturnConstants(val code: String, val message: String) {
    ON_CAMERA_FAILED_PREPARE("101", "onCameraFailedPrepare"),
    ON_ERROR_UNICO("102", "onErrorUnico"),
    ON_USER_CLOSED_CAMERA_MANUALLY("103", "onUserClosedCameraManually"),
    ON_SYSTEM_CLOSED_CAMERA_TIMEOUT_SESSION("104", "onSystemClosedCameraTimeoutSession"),
    ON_SYSTEM_CHANGED_TYPE_CAMERA_TIMEOUT_FACE_INFERENCE("105", "onSystemChangedTypeCameraTimeoutFaceInference"),
    ON_ERROR_SELFIE("106", "onErrorSelfie"),
    ON_ERROR_DOCUMENT("107", "onErrorDocument"),
    ON_ERROR_JSON_FILE_NAME("108", "onErrorJsonFileName"),
}