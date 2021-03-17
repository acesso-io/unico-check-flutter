package com.unico_check


import android.Manifest
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


abstract class AcessoBio : AppCompatActivity(), iAcessoBio {

    companion object {
        var methodCall : String? = null
        var pluginContext: UnicoCheckPlugin? = null
        val REQUIRED_PERMISSIONS = arrayOf(Manifest.permission.CAMERA)
        const val REQUEST_CODE_PERMISSIONS = 10
    }

    lateinit var acessoBio: AcessoBio
    private var acessoBioStatus: Boolean = true

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

    abstract fun callMethodBio()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        methodCall = intent.getStringExtra("methodCall")

        initAcessoBio(
                intent.getStringExtra("urlIntance"),
                intent.getStringExtra("apikey"),
                intent.getStringExtra("authToken")
        )

        getColors()
        setColors()

        if (!getPermission()) {
            getPermission()
        } else {
            if(acessoBioStatus){
                callMethodBio()
            }
        }

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

    fun setPluginContext(context: UnicoCheckPlugin) {
        pluginContext = context
    }

    //ACESSOBIO
    private fun initAcessoBio(urlIntance: String?, apikey: String?, authToken: String?) {

        if (urlIntance != null && apikey != null && authToken != null) {
            createAcessoBio(
                    urlIntance,
                    apikey,
                    authToken
            )
        } else onError("informe urlIntance, apikey, authToken para proceguir.")

    }

    private fun createAcessoBio(urlIntance: String, apikey: String, authToken: String) {
        acessoBio = AcessoBio(
                this,
                urlIntance,
                apikey,
                authToken
        )
        acessoBio.setLanguageOrigin(AcessoBio.LanguageOrigin.FLUTTER,"0.1.2")
    }

    //SUCCESS
    protected fun onSuccess(result: Any?){
        if(pluginContext != null){
            if(result != null){
                pluginContext!!.onSuccessPlugin(result)
            }else{
                onError("erro desconhecido")
            }
        }else{
            onError("Erro ao retornar resultado, o contexto foi perdido")
        }
        finish()
    }

    protected fun onSuccess(result: Boolean){
        if(pluginContext != null){
            pluginContext!!.onSuccessPlugin(result)
        }else{
            onError("Erro ao retornar resultado, o contexto foi perdido")
        }
        finish()
    }

    protected fun onSuccess(result: String?){
        if(pluginContext != null){
            if(result != null || result != ""){
                pluginContext!!.onSuccessPlugin(result!!)
            }else{
                onError("Erro ao retornar resultado")
            }
        }else{
            onError("Erro ao retornar resultado, o contexto foi perdido")
        }
        finish()
    }

    protected fun onSuccess(result: Int?){
        if(pluginContext != null){
            if(result == null || result == 0){
                pluginContext!!.onSuccessPlugin(result!!)
            }else{
                onError("Erro ao retornar resultado")
            }
        }else{
            onError("Erro ao retornar resultado, o contexto foi perdido")
        }
        finish()
    }

    //ERROR
    protected fun onError(result: String) {

        if (pluginContext != null) {
            pluginContext!!.onErrorPlugin(result)
        }

        finish()
    }

    protected fun onError(result: Any?){
        if(pluginContext != null){
            if(result != null){
                pluginContext!!.onErrorPlugin(result)
            }else{
                onError("erro desconhecido")
            }
        }else{
            onError("Erro ao retornar resultado, o contexto foi perdido")
        }
        finish()
    }

    //ERROR AcessoBio
    override fun onErrorAcessoBio(errorBio: ErrorBio?) {
        acessoBioStatus = false
        if(pluginContext != null){
            if(errorBio != null){
                pluginContext!!.onErrorPluginAcessoBio(errorBio)
            }else{
                onError("erro desconhecido")
            }
        }else{
            onError("Erro ao retornar resultado, o contexto foi perdido")
        }
        finish()
    }

    override fun userClosedCameraManually() {
        pluginContext!!.userClosedCameraManually()
        finish()
    }

    //region Camera Permission
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
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
