
import 'local_hotspot_manager_platform_interface.dart';

class LocalHotspotManager {
  Future<String?> getPlatformVersion() {
    return LocalHotspotManagerPlatform.instance.getPlatformVersion();
  }
}
