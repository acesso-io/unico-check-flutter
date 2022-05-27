package com.unico_check.hashMap

import com.acesso.acessobio_android.services.dto.ErrorBio
import java.util.HashMap


fun errorBioToHashMap(error: ErrorBio): HashMap<String, Any> {

    val hashMap: HashMap<String, Any> = HashMap()

    hashMap["status"] = false
    hashMap["code"] = error.code
    hashMap["description"] = error.description

    return hashMap
}

fun successBioToHashMap(base64: String, encrypted: String): HashMap<String, Any> {

    val hashMap: HashMap<String, Any> = HashMap()

    hashMap["status"] = true
    hashMap["base64"] = base64
    hashMap["encrypted"] = encrypted

    return hashMap
}

fun errorNotifier(errorMethodName: String): HashMap<String, Any> {

    val hashMap: HashMap<String, Any> = HashMap()

    hashMap["status"] = false
    hashMap["errorMethodName"] = errorMethodName

    return hashMap
}