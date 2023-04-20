package com.unico_check

import android.R
import android.content.Context
import android.content.res.ColorStateList
import android.graphics.Color
import android.view.View
import android.view.ViewGroup
import android.widget.ProgressBar
import android.widget.RelativeLayout
import com.unico_check.config.UnicoTheme

class CameraView(
    private val context: Context, private val unicoTheme: UnicoTheme
) {

    fun getLayout(): ViewGroup {
        return customiseLayout(createLayout())
    }

    private fun createLayout(): RelativeLayout {
        return RelativeLayout(context)
    }

    private fun customiseLayout(layout: ViewGroup): ViewGroup {
        layout.setBackgroundColor(getColors(unicoTheme.colorBackground))

        val params = RelativeLayout.LayoutParams(
            RelativeLayout.LayoutParams.WRAP_CONTENT,
            RelativeLayout.LayoutParams.WRAP_CONTENT
        )
        params.addRule(RelativeLayout.CENTER_IN_PARENT)

        layout.addView(getProgressBar(unicoTheme), params)

        return layout
    }

    private fun getProgressBar(unicoTheme: UnicoTheme): ProgressBar {
        val progressBar = ProgressBar(context, null, R.attr.progressBarStyleLarge)
        progressBar.isIndeterminate = true
        progressBar.visibility = View.VISIBLE
        progressBar.indeterminateTintList = getColorProgressBar(unicoTheme)
        return progressBar
    }

    private fun getColorProgressBar(unicoTheme: UnicoTheme): ColorStateList {
        return getColors(unicoTheme.colorIconTakePictureButton).let {
            if (it != 0) {
                ColorStateList.valueOf(it)
            } else {
                ColorStateList.valueOf(Color.BLACK)
            }
        }
    }

    private fun getColors(color: Any?): Int = try {
        color?.let {
            when {
                it is String -> Color.parseColor(it)
                (it as Int) <= 0 -> it
                else -> context.resources.getColor(it as Int)
            }
        } ?: 0
    } catch (e: Exception) {
        0
    }
}