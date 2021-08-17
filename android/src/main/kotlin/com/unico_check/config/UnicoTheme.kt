package com.unico_check.config

import com.acesso.acessobio_android.onboarding.IAcessoBioTheme
import io.flutter.plugin.common.MethodCall

class UnicoTheme(private val call: MethodCall) : IAcessoBioTheme {

    override fun getColorBackground(): Any {
        return call.argument("androidColorBackground") ?: 0
    }

    override fun getColorBoxMessage(): Any {
        return call.argument("androidColorBoxMessage") ?: 0
    }

    override fun getColorTextMessage(): Any {
        return call.argument("androidColorTextMessage") ?: 0
    }

    override fun getColorBackgroundPopupError(): Any {
        return call.argument("androidColorBackgroundPopupError") ?: 0
    }

    override fun getColorTextPopupError(): Any {
        return call.argument("androidColorTextPopupError") ?: 0
    }

    override fun getColorBackgroundButtonPopupError(): Any {
        return call.argument("androidColorBackgroundButtonPopupError") ?: 0
    }

    override fun getColorTextButtonPopupError(): Any {
        return call.argument("androidColorTextButtonPopupError") ?: 0
    }

    override fun getColorBackgroundTakePictureButton(): Any {
        return call.argument("androidColorBackgroundTakePictureButton") ?: 0
    }

    override fun getColorIconTakePictureButton(): Any {
        return call.argument("androidColorIconTakePictureButton") ?: 0
    }

    override fun getColorBackgroundBottomDocument(): Any {
        return call.argument("androidColorBackgroundBottomDocument") ?: 0
    }

    override fun getColorTextBottomDocument(): Any {
        return call.argument("androidColorTextBottomDocument") ?: 0
    }

    override fun getColorSilhouetteSuccess(): Any {
        return call.argument("androidColorSilhouetteSuccess") ?: 0
    }

    override fun getColorSilhouetteError(): Any {
        return call.argument("androidColorSilhouetteError") ?: 0
    }

}
