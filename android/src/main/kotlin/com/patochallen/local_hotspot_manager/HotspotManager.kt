package com.patochallen.local_hotspot_manager

import android.content.Context
import android.net.wifi.WifiManager
import android.os.Build
import io.flutter.plugin.common.MethodChannel.Result

object HotspotManager {

    fun createHotspot(context: Context, result: Result) {
        val wifiManager = context.applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager

        // Verificar condiciones antes de crear el hotspot
        if (!PermissionManager.checkPermissions(context)) {
            result.error("PERMISSIONS_REQUIRED", "Location and nearby devices permissions are required", null)
            return
        }

        if (!ValidationManager.validateConditions(wifiManager)) {
            result.error("INVALID_CONDITIONS", "Device is connected to Wi-Fi or tethering is active", null)
            return
        }

        // Crear el hotspot
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            wifiManager.startLocalOnlyHotspot(object : WifiManager.LocalOnlyHotspotCallback() {
                override fun onStarted(reservation: WifiManager.LocalOnlyHotspotReservation) {
                    val ssid = reservation.wifiConfiguration?.SSID
                    val ip = "192.168.43.1" // IP común para hotspots locales
                    val hotspotDetails = mapOf("ssid" to ssid, "ip" to ip)
                    result.success(hotspotDetails)
                }

                override fun onFailed(reason: Int) {
                    result.error("HOTSPOT_FAILED", "Failed to start hotspot: $reason", null)
                }
            }, null)
        }
    }
}
