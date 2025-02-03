package com.patochallen.local_hotspot_manager

import android.net.wifi.WifiManager

object ValidationManager {

    fun validateConditions(wifiManager: WifiManager): Boolean {
        // Verificar que el dispositivo no esté conectado a una red Wi-Fi
        if (wifiManager.connectionInfo.networkId != -1) {
            return true
        }

        // Verificar que el tethering no esté activo
        return false//!wifiManager.isWifiApEnabled
    }
}