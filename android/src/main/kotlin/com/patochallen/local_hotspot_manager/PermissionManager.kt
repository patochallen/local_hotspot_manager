package com.patochallen.local_hotspot_manager

import android.content.Context
import android.content.pm.PackageManager
import androidx.core.content.ContextCompat

object PermissionManager {

    fun checkPermissions(context: Context): Boolean {
        val locationPermission = ContextCompat.checkSelfPermission(
            context,
            android.Manifest.permission.ACCESS_FINE_LOCATION
        ) == PackageManager.PERMISSION_GRANTED

        val nearbyPermission = ContextCompat.checkSelfPermission(
            context,
            android.Manifest.permission.NEARBY_WIFI_DEVICES
        ) == PackageManager.PERMISSION_GRANTED

        val writeSettingsPermission = ContextCompat.checkSelfPermission(
            context,
            android.Manifest.permission.WRITE_SETTINGS
        ) == PackageManager.PERMISSION_GRANTED

        return locationPermission && nearbyPermission && writeSettingsPermission
    }
}