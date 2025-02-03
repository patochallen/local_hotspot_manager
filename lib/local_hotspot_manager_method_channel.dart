import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'local_hotspot_manager_platform_interface.dart';

/// An implementation of [LocalHotspotManagerPlatform] that uses method channels.
class MethodChannelLocalHotspotManager extends LocalHotspotManagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('local_hotspot_manager');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
