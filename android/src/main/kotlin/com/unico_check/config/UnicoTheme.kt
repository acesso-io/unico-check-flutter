package com.unico_check.config

import com.acesso.acessobio_android.onboarding.IAcessoBioTheme
import com.unico_check.constants.MethodConstants.UNICO_THEME
import io.flutter.plugin.common.MethodCall

data class UnicoTheme(private val theme: Map<Any, Any>) : IAcessoBioTheme {


    override fun getColorBackground(): Any {
        return theme["colorBackground"] ?: 0
    }

    override fun getColorBoxMessage(): Any {
        return theme["colorBoxMessage"] ?: 0
    }

    override fun getColorTextMessage(): Any {
        return theme["colorTextMessage"] ?: 0
    }

    override fun getColorBackgroundPopupError(): Any {
        return theme["colorBackgroundPopupError"] ?: 0
    }

    override fun getColorTextPopupError(): Any {
        return theme["colorTextPopupError"] ?: 0
    }

    override fun getColorBackgroundButtonPopupError(): Any {
        return theme["colorBackgroundButtonPopupError"] ?: 0
    }

    override fun getColorTextButtonPopupError(): Any {
        return theme["colorTextButtonPopupError"] ?: 0
    }

    override fun getColorBackgroundTakePictureButton(): Any {
        return theme["colorBackgroundTakePictureButton"] ?: 0
    }

    override fun getColorIconTakePictureButton(): Any {
        return theme["colorIconTakePictureButton"] ?: 0
    }

    override fun getColorBackgroundBottomDocument(): Any {
        return theme["colorBackgroundBottomDocument"] ?: 0
    }

    override fun getColorTextBottomDocument(): Any {
        return theme["colorTextBottomDocument"] ?: 0
    }

    override fun getColorSilhouetteSuccess(): Any {
        return theme["colorSilhouetteSuccess"] ?: 0
    }

    override fun getColorSilhouetteError(): Any {
        return theme["colorSilhouetteError"] ?: 0
    }

    override fun getColorSilhouetteNeutral(): Any {
        return theme["colorSilhouetteNeutral"] ?: 0
    }
}
