package com.adeeteya.classipod

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.view.WindowManager
import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * Hosts the Flutter engine and, when the user opted in, keeps ClassiPod on
 * screen in place of the system lock screen.
 *
 * Two pieces are needed for that: the activity has to be allowed to draw over
 * the keyguard, and it has to be brought back to the front when the screen
 * turns on, since by then the keyguard is what the user would otherwise see.
 */
class MainActivity : AudioServiceActivity() {
    private var screenOnReceiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            LOCK_SCREEN_CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "setShowWhenLocked" -> {
                    val enabled = call.argument<Boolean>("enabled") ?: false
                    applyShowWhenLocked(enabled)
                    result.success(null)
                }
                "canDrawOverlays" -> result.success(canDrawOverlays())
                "requestDrawOverlays" -> {
                    requestDrawOverlays()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onDestroy() {
        unregisterScreenOnReceiver()
        super.onDestroy()
    }

    private fun applyShowWhenLocked(enabled: Boolean) {
        runOnUiThread {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
                setShowWhenLocked(enabled)
            } else if (enabled) {
                @Suppress("DEPRECATION")
                window.addFlags(
                    WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED
                )
            } else {
                @Suppress("DEPRECATION")
                window.clearFlags(
                    WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED
                )
            }
            if (enabled) {
                registerScreenOnReceiver()
            } else {
                unregisterScreenOnReceiver()
            }
        }
    }

    private fun registerScreenOnReceiver() {
        if (screenOnReceiver != null) {
            return
        }
        val receiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                if (intent.action != Intent.ACTION_SCREEN_ON) {
                    return
                }
                bringToFront(context)
            }
        }
        // Registered on the application context so that it keeps working while
        // the activity is stopped but the process is alive, which is the case
        // whenever audio_service holds its foreground service.
        applicationContext.registerReceiver(
            receiver,
            IntentFilter(Intent.ACTION_SCREEN_ON)
        )
        screenOnReceiver = receiver
    }

    private fun unregisterScreenOnReceiver() {
        val receiver = screenOnReceiver ?: return
        runCatching { applicationContext.unregisterReceiver(receiver) }
        screenOnReceiver = null
    }

    private fun bringToFront(context: Context) {
        val intent = Intent(context, MainActivity::class.java).apply {
            addFlags(
                Intent.FLAG_ACTIVITY_NEW_TASK or
                    Intent.FLAG_ACTIVITY_SINGLE_TOP or
                    Intent.FLAG_ACTIVITY_REORDER_TO_FRONT
            )
        }
        runCatching { context.startActivity(intent) }
    }

    private fun canDrawOverlays(): Boolean = Settings.canDrawOverlays(this)

    private fun requestDrawOverlays() {
        if (canDrawOverlays()) {
            return
        }
        val intent = Intent(
            Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
            Uri.parse("package:$packageName")
        ).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        runCatching { startActivity(intent) }
    }

    private companion object {
        const val LOCK_SCREEN_CHANNEL = "com.adeeteya.classipod/lock_screen"
    }
}
