package com.unico_check.hashMap

import com.acesso.acessobio_android.services.dto.ErrorBio
import java.util.HashMap

class ConvertAcessoBioHashMap {
    companion object {
        fun errorBioToHashMap(error: ErrorBio): HashMap<String, Any> {

            val hashMap: HashMap<String, Any> = HashMap()

            hashMap["code"] = error.code
            hashMap["method"] = error.method
            hashMap["description"] = error.description

            return hashMap
        }

        fun convertObjToMapReflection(result: String): HashMap<String, Any> {

            val hashMap: HashMap<String, Any> = HashMap()

            hashMap["result"] = result

            return hashMap
        }

        fun convertObjToMapReflection(result: Int): HashMap<String, Any> {

            val hashMap: HashMap<String, Any> = HashMap()

            hashMap["result"] = result

            return hashMap
        }
    }
}