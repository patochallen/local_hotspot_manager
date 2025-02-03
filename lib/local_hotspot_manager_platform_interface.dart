import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'local_hotspot_manager_method_channel.dart';

abstract class LocalHotspotManagerPlatform extends PlatformInterface {
  /// Constructs a LocalHotspotManagerPlatform.
  LocalHotspotManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocalHotspotManagerPlatform _instance = MethodChannelLocalHotspotManager();

  /// The default instance of [LocalHotspotManagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelLocalHotspotManager].
  static LocalHotspotManagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocalHotspotManagerPlatform] when
  /// they register themselves.
  static set instance(LocalHotspotManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
