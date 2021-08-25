package com.unico_check

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.unico_check.config.UnicoTheme
import com.unico_check.config.UnicoTimer
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.MethodConstants.Companion.disableAutoCapture
import com.unico_check.constants.MethodConstants.Companion.disableSmartFrame
import com.unico_check.constants.MethodConstants.Companion.document_type
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

    companion object {
        const val BRIDGE_NAME = "acessobio"
        lateinit var result: Result
        lateinit var methodCall: MethodCall
    }

    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, BRIDGE_NAME)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        UnicoCheckPlugin.result = result
        UnicoCheckPlugin.methodCall = call

        selectTypeOffCamera(call)
    }

    private fun selectTypeOffCamera(call: MethodCall) {
        when (call.method) {

            MethodConstants.openCamera -> openCamera(
                call.argument(disableAutoCapture),
                call.argument(disableSmartFrame)
            )

            MethodConstants.openCameraDocument -> openCameraDocument(
                call.argument(document_type)
            )

            else -> result.notImplemented()
        }
    }

    private fun getIntent(unicoCheckActivity: UnicoCheckActivity): Intent =
        Intent(activity, unicoCheckActivity::class.java)

    private fun openCameraDocument(DOCUMENT_TYPE: Int?) {

        val intent = getIntent(UnicoCheckActivityDocument())
        intent.putExtra(document_type, DOCUMENT_TYPE)
        activity.startActivity(intent)
    }

    private fun getCameraIntent(
        disableAutoCapture: Boolean?,
        disableSmartFrame: Boolean?
    ): Intent {

        val intent = getIntent(UnicoCheckActivityCameraActivity())

        if (disableAutoCapture != null && disableAutoCapture == true) {
            intent.putExtra(MethodConstants.disableAutoCapture, disableAutoCapture)
        } else {
            intent.putExtra(MethodConstants.disableAutoCapture, false)
        }

        if (disableSmartFrame != null && disableSmartFrame == true) {
            intent.putExtra(MethodConstants.disableSmartFrame, disableSmartFrame)
        } else {
            intent.putExtra(MethodConstants.disableSmartFrame, false)
        }

        return intent
    }

    private fun openCamera(
        disableAutoCapture: Boolean?,
        disableSmartFrame: Boolean?
    ) {

        val intent = getCameraIntent(disableAutoCapture, disableSmartFrame)

        activity.startActivity(intent)

    }

    //region ActivityAware
    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

    override fun onDetachedFromActivityForConfigChanges() {}
    //endregion


}
