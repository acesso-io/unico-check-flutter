package com.unico_check

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.unico_check.config.UnicoCameraType
import com.unico_check.config.UnicoTheme
import com.unico_check.config.UnicoTimer
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.MethodConstants.Companion.disableAutoCapture
import com.unico_check.constants.MethodConstants.Companion.disableSmartFrame
import com.unico_check.constants.MethodConstants.Companion.document_type
import com.unico_check.constants.MethodConstants.Companion.openCamera
import com.unico_check.constants.MethodConstants.Companion.setTimeoutSession
import com.unico_check.constants.MethodConstants.Companion.setTimeoutToFaceInference
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** UnicoCheckPlugin */
class UnicoCheckPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    private val REQUEST_BIO = 7
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity
    private lateinit var result: Result
    private lateinit var unicoTheme: UnicoTheme
    private lateinit var unicoTimer: UnicoTimer
    private lateinit var unicoCameraType: UnicoCameraType

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "acessobio")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        this.result = result

        setTheme(call)
        setTimers(call)
        setCameraType(call)
        selectCameraMethod(call)
    }

    private fun selectCameraMethod(call: MethodCall) {
        when (call.method) {

            openCamera -> openCamera(
                call.method
            )

            MethodConstants.openCameraDocument -> openCameraDocument(
                call.method,
                call.argument(document_type)
            )

            else -> result.notImplemented()
        }
    }

    private fun setCameraType(call: MethodCall){
        unicoCameraType = UnicoCameraType(call.argument(disableAutoCapture), call.argument(disableSmartFrame))
    }

    private fun setTheme(call: MethodCall) {
        unicoTheme = UnicoTheme(call)
    }

    private fun setTimers(call: MethodCall) {
        unicoTimer = UnicoTimer(
            call.argument(setTimeoutSession),
            call.argument(setTimeoutToFaceInference)
        )
    }

    private fun getIntent(unicoCheck: UnicoCheck, methodCall: String): Intent {

        unicoCheck.setPluginContext(result)
        unicoCheck.setUnicoTheme(unicoTheme)
        unicoCheck.setTimer(unicoTimer)
        unicoCheck.setCameraType(unicoCameraType)

        val intent = Intent(activity, unicoCheck::class.java)
        intent.putExtra(MethodConstants.methodCall, methodCall)

        return intent
    }

    private fun openCameraDocument(method: String, DOCUMENT_TYPE: Int?) {

        val intent = getIntent(UnicoCheckDocument(), method)
        intent.putExtra(document_type, DOCUMENT_TYPE)
        activity.startActivityForResult(intent, REQUEST_BIO)
    }

    private fun openCamera(methodCall: String) {
        activity.startActivityForResult(getIntent(UnicoCheckCamera(),methodCall), REQUEST_BIO)
    }

    //region ActivityAware
    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() { }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) { }

    override fun onDetachedFromActivityForConfigChanges() { }
    //endregion

}
