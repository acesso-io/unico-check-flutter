package com.unico_check

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.unico_check.constants.MethodConstants
import com.unico_check.constants.MethodConstants.AUTO_CAPTURE
import com.unico_check.constants.MethodConstants.BRIDGE_NAME
import com.unico_check.constants.MethodConstants.DOCUMENT_TYPE
import com.unico_check.constants.MethodConstants.SMART_FRAME
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
        lateinit var result: Result
        lateinit var methodCall: MethodCall
        lateinit var channel: MethodChannel
    }

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

            MethodConstants.OPEN_CAMERA_SELFIE -> getCameraSelfie(
                call.argument(AUTO_CAPTURE),
                call.argument(SMART_FRAME)
            )

            MethodConstants.OPEN_CAMERA_DOCUMENT -> openCameraDocument(
                call.argument(DOCUMENT_TYPE),
            )

            else -> result.notImplemented()
        }
    }

    private fun openCameraDocument(document_type: String?) {
        val intent = Intent(activity, DocumentCameraActivity::class.java)

        intent.putExtra(DOCUMENT_TYPE, document_type)

        activity.startActivity(intent)
    }

    private fun getCameraSelfie(
        disableAutoCapture: Boolean?,
        disableSmartFrame: Boolean?,
    ) {
        val intent = Intent(activity, SelfieCameraActivity::class.java)

        intent.putExtra(AUTO_CAPTURE, disableAutoCapture)
        intent.putExtra(SMART_FRAME, disableSmartFrame)

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
