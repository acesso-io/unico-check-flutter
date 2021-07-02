package com.unico_check


import android.Manifest
import android.annotation.SuppressLint
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.acesso.acessobio_android.AcessoBio
import com.acesso.acessobio_android.iAcessoBio
import com.acesso.acessobio_android.services.dto.ErrorBio
import io.flutter.plugin.common.MethodChannel


abstract class AcessoBio : AppCompatActivity(), iAcessoBio {

    companion object {
        var methodCall : String? = null
        lateinit var channelResult: MethodChannel.Result
        val REQUIRED_PERMISSIONS = arrayOf(Manifest.permission.CAMERA)
        const val REQUEST_CODE_PERMISSIONS = 10
    }

    lateinit var acessoBio: AcessoBio
    private var acessoBioStatus: Boolean = true
    //colors
    private var setColorSilhoutte: String? = null
    private var setColorBackground: String? = null
    private var setColorBoxMessage: String? = null
    private var setColorTextMessage: String? = null
    private var setColorBackgroundPopupError: String? = null
    private var setColorTextPopupError: String? = null
    private var setColorBackgroundButtonPopupError: String? = null
    private var setColorTextButtonPopupError: String? = null
    private var setColorBackgroundTakePictureButton: String? = null
    private var setColorIconTakePictureButton: String? = null
    private var setColorBackgroundBottomDocument: String? = null
    private var setColorTextBottomDocument: String? = null

    private var setTimeoutSession: Double? = null
    private var setTimeoutToFaceInference: Double? = null

    abstract fun callMethodBio()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        methodCall = intent.getStringExtra("methodCall")

        initAcessoBio()

        getColors()
        setColors()

        getTimmer()
        setTimmer()

        if (!getPermission()) {
            getPermission()
        } else {
            if(acessoBioStatus){
                callMethodBio()
            }
        }

    }

    private fun setTimmer(){
        if(setTimeoutSession != 0.0 && setTimeoutSession != null){
            acessoBio.setTimeoutSession(setTimeoutSession!!)
        }
        if(setTimeoutToFaceInference != 0.0 && setTimeoutToFaceInference != null){
            acessoBio.setTimeoutToFaceInference(setTimeoutToFaceInference!!)
        }
    }
    private fun getTimmer(){
        setTimeoutSession = intent.getDoubleExtra("setTimeoutSession",0.0)
        setTimeoutToFaceInference = intent.getDoubleExtra("setTimeoutToFaceInference",0.0)
    }

    private fun setColors() {
        if(setColorSilhoutte != "" && setColorSilhoutte != null){
            val strs = setColorSilhoutte!!.split(";").toTypedArray()
            acessoBio.setColorSilhoutte(strs[0],strs[1])
        }
        if(setColorBackground != "" && setColorBackground != null){
            acessoBio.setColorBackground(setColorBackground)
        }
        if(setColorBoxMessage != "" && setColorBoxMessage != null){
            acessoBio.setColorBoxMessage(setColorBoxMessage)
        }
        if(setColorTextMessage != "" && setColorTextMessage != null){
            acessoBio.setColorTextMessage(setColorTextMessage)
        }
        if(setColorBackgroundPopupError != "" && setColorBackgroundPopupError != null){
            acessoBio.setColorBackgroundPopupError(setColorBackgroundPopupError)
        }
        if(setColorTextPopupError != "" && setColorTextPopupError != null){
            acessoBio.setColorTextPopupError(setColorTextPopupError)
        }
        if(setColorBackgroundButtonPopupError != "" && setColorBackgroundButtonPopupError != null){
            acessoBio.setColorBackgroundButtonPopupError(setColorBackgroundButtonPopupError)
        }
        if(setColorTextButtonPopupError != "" && setColorTextButtonPopupError != null){
            acessoBio.setColorTextButtonPopupError(setColorTextButtonPopupError)
        }
        if(setColorBackgroundTakePictureButton != "" && setColorBackgroundTakePictureButton != null){
            acessoBio.setColorBackgroundTakePictureButton(setColorBackgroundTakePictureButton)
        }
        if(setColorIconTakePictureButton != "" && setColorIconTakePictureButton != null){
            acessoBio.setColorIconTakePictureButton(setColorIconTakePictureButton)
        }
        if(setColorBackgroundBottomDocument != "" && setColorBackgroundBottomDocument != null){
            acessoBio.setColorBackgroundBottomDocument(setColorBackgroundBottomDocument)
        }
        if(setColorTextBottomDocument != "" && setColorTextBottomDocument != null){
            acessoBio.setColorTextBottomDocument(setColorTextBottomDocument)
        }
    }
    private fun getColors() {
        setColorSilhoutte = intent.getStringExtra("setColorSilhoutte")
        setColorBackground = intent.getStringExtra("setColorBackground")
        setColorBoxMessage = intent.getStringExtra("setColorBoxMessage")
        setColorTextMessage = intent.getStringExtra("setColorTextMessage")
        setColorBackgroundPopupError = intent.getStringExtra("setColorBackgroundPopupError")
        setColorTextPopupError = intent.getStringExtra("setColorTextPopupError")
        setColorBackgroundButtonPopupError = intent.getStringExtra("setColorBackgroundButtonPopupError")
        setColorTextButtonPopupError = intent.getStringExtra("setColorTextButtonPopupError")
        setColorBackgroundTakePictureButton = intent.getStringExtra("setColorBackgroundTakePictureButton")
        setColorIconTakePictureButton = intent.getStringExtra("setColorIconTakePictureButton")
        setColorBackgroundBottomDocument = intent.getStringExtra("setColorBackgroundBottomDocument")
        setColorTextBottomDocument = intent.getStringExtra("setColorTextBottomDocument")
    }

    fun setPluginContext(res: MethodChannel.Result) {
        channelResult = res
    }

    //ACESSOBIO
    private fun initAcessoBio() {
        acessoBio = AcessoBio(
                this
        )
        acessoBio.setLanguageOrigin(AcessoBio.LanguageOrigin.FLUTTER,"2.0.0-beta.2")
    }
    
    //ERROR AcessoBio
    override fun onErrorAcessoBio(errorBio: ErrorBio) {
        acessoBioStatus = false
        channelResult.success(errorBioToHashMap(errorBio,2))
        finish()
    }

    override fun userClosedCameraManually() {
        channelResult.success(convertObjToMapReflection(0,-1))
        finish()
    }

    override fun systemClosedCameraTimeoutSession() {
        channelResult.success(convertObjToMapReflection(0,3))
        finish()
    }

    override fun systemChangedTypeCameraTimeoutFaceInference() {
        channelResult.success(convertObjToMapReflection(0,4))
        finish()
    }

    
    //region Convert to HashMap

    protected fun errorBioToHashMap(error: ErrorBio, status: Int): HashMap<String, Any> {
        val hashMap:HashMap<String,Any> = HashMap()

        hashMap["code"] = error.code
        hashMap["method"] = error.method
        hashMap["description"] = error.description
        hashMap["flutterstatus"] = status

        return hashMap

    }
    protected fun convertObjToMapReflection(result: String, status: Int): java.util.HashMap<String, Any> {

        val hashMap:HashMap<String,Any> = HashMap()

        hashMap["result"] = result
        hashMap["flutterstatus"] = status

        return hashMap

    }
    protected fun convertObjToMapReflection(result: Int, status: Int): java.util.HashMap<String, Any> {

        val hashMap:HashMap<String,Any> = HashMap()

        hashMap["result"] = result
        hashMap["flutterstatus"] = status

        return hashMap

    }

    //endregion
    
    //region Camera Permission
    @SuppressLint("MissingSuperCall")
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode != REQUEST_CODE_PERMISSIONS) {
            Toast.makeText(this, "Permissão acesso camera negada", Toast.LENGTH_SHORT).show()
            finish()
        }
    }

    private fun getPermission() = REQUIRED_PERMISSIONS.all {
        ContextCompat.checkSelfPermission(this, it) == PackageManager.PERMISSION_GRANTED
    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onResume() {
        super.onResume()
        if (!getPermission()) {
            requestPermissions(
                    arrayOf(Manifest.permission.CAMERA),
                    10
            )
            finish()
        }
    }

    //endregion

}
