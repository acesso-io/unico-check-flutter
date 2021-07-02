package com.unico_check

import android.app.Activity
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import com.acesso.acessobio_android.services.dto.ErrorBio
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlin.collections.HashMap

/** UnicoCheckPlugin */
class UnicoCheckPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  private val REQUEST_BIO = 7
  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity
  private lateinit var result: Result

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

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "acessobio")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    this.result = result

    getColors(call)
    getTimers(call)

    when(call.method){
      "openCameraDocument" -> openCameraDocumentOCR(
              call.method,
              call.argument("DOCUMENT_TYPE")
        )
      "openCamera" -> openCamera(
              call.method,
              call.argument("disableAutoCapture"),
              call.argument("disableSmartFrame")
      )
      else -> result.notImplemented()
    }

  }


  
  private fun getIntent(acessoBio: AcessoBio, methodCall: String): Intent {

    acessoBio.setPluginContext(result)

    val intent = Intent(activity, acessoBio::class.java)

    intent.putExtra("methodCall",methodCall)

    

    return setTimers(setColors(intent))

  }

  

  //region Document

  private fun openCameraDocumentOCR(method: String, DOCUMENT_TYPE: Int?) {

    val intent = getIntent(AcessoBioDocument(),method)

    intent.putExtra("DOCUMENT_TYPE", DOCUMENT_TYPE)

    activity.startActivityForResult(intent, REQUEST_BIO)

  }

  private fun openCameraInsertDocument(method: String, code: String?, nome: String?, DOCUMENT_TYPE: Int?) {

    val intent = getIntent(AcessoBioCamera(),method)

    intent.putExtra("code", code)
    intent.putExtra("nome", nome)
    intent.putExtra("DOCUMENT_TYPE", DOCUMENT_TYPE)

    activity.startActivityForResult(intent, REQUEST_BIO)

  }

  //endregion

  //region Camera

  private fun getCameraIntent(methodCall: String, disableAutoCapture: Boolean?, disableSmartFrame: Boolean?): Intent {

    val intent = getIntent(AcessoBioCamera(),methodCall)

    if(disableAutoCapture != null && disableAutoCapture == true){
      intent.putExtra("disableAutoCapture", disableAutoCapture)
    }else{
      intent.putExtra("disableAutoCapture", false)
    }

    if(disableSmartFrame != null && disableSmartFrame == true){
      intent.putExtra("disableSmartFrame", disableSmartFrame)
    }else{
      intent.putExtra("disableSmartFrame", false)
    }


    return intent
  }

  private fun openCamera(methodCall: String, disableAutoCapture: Boolean?, disableSmartFrame: Boolean?) {

    val intent = getCameraIntent(methodCall,disableAutoCapture,disableSmartFrame)

    activity.startActivityForResult(intent, REQUEST_BIO)



  }

  private fun openCamera(methodCall: String, nome: String?,code: String?, gender: String?, birthdate: String?, email: String?, phone: String?, disableAutoCapture: Boolean?, disableSmartFrame: Boolean? ) {

    val intent = getCameraIntent(methodCall,disableAutoCapture,disableSmartFrame)

    intent.putExtra("nome", nome)
    intent.putExtra("code", code)
    intent.putExtra("gender", gender)
    intent.putExtra("birthdate", birthdate)
    intent.putExtra("email", email)
    intent.putExtra("phone", phone)


    activity.startActivityForResult(intent, REQUEST_BIO)

  }

  //endregion

  //region Colors
  private fun getColors(call: MethodCall) {
    setColorSilhoutte = call.argument("setAndroidColorSilhoutte")
    setColorBackground = call.argument("setAndroidColorBackground")
    setColorBoxMessage = call.argument("setAndroidColorBoxMessage")
    setColorTextMessage = call.argument("setAndroidColorTextMessage")
    setColorBackgroundPopupError = call.argument("setAndroidColorBackgroundPopupError")
    setColorTextPopupError = call.argument("setAndroidColorTextPopupError")
    setColorBackgroundButtonPopupError = call.argument("setAndroidColorBackgroundButtonPopupError")
    setColorTextButtonPopupError = call.argument("setAndroidColorTextButtonPopupError")
    setColorBackgroundTakePictureButton = call.argument("setAndroidColorBackgroundTakePictureButton")
    setColorIconTakePictureButton = call.argument("setAndroidColorIconTakePictureButton")
    setColorBackgroundBottomDocument = call.argument("setAndroidColorBackgroundBottomDocument")
    setColorTextBottomDocument = call.argument("setAndroidColorTextBottomDocument")
  }
  private fun setColors(intent: Intent): Intent {
    intent.putExtra("setColorSilhoutte",setColorSilhoutte)
    intent.putExtra("setColorBackground",setColorBackground)
    intent.putExtra("setColorBoxMessage",setColorBoxMessage)
    intent.putExtra("setColorTextMessage",setColorTextMessage)
    intent.putExtra("setColorBackgroundPopupError",setColorBackgroundPopupError)
    intent.putExtra("setColorTextPopupError",setColorTextPopupError)
    intent.putExtra("setColorBackgroundButtonPopupError",setColorBackgroundButtonPopupError)
    intent.putExtra("setColorTextButtonPopupError",setColorTextButtonPopupError)
    intent.putExtra("setColorBackgroundTakePictureButton",setColorBackgroundTakePictureButton)
    intent.putExtra("setColorIconTakePictureButton",setColorIconTakePictureButton)
    intent.putExtra("setColorBackgroundBottomDocument",setColorBackgroundBottomDocument)
    intent.putExtra("setColorTextBottomDocument",setColorTextBottomDocument)

    return intent
  }
  //endregion
  
  //region Timers
  private fun getTimers(call: MethodCall) {
    setTimeoutSession = call.argument("setTimeoutSession")
    setTimeoutToFaceInference = call.argument("setTimeoutToFaceInference")
  }
  private fun setTimers(intent: Intent): Intent {
    intent.putExtra("setTimeoutSession",setTimeoutSession)
    intent.putExtra("setTimeoutToFaceInference",setTimeoutToFaceInference)
    return intent
  }
  //endregion

  //region ActivityAware
  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onDetachedFromActivity() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {

  }
  //endregion


}
