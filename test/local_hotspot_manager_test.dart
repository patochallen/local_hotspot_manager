import 'package:flutter_test/flutter_test.dart';
import 'package:local_hotspot_manager/local_hotspot_manager.dart';
import 'package:local_hotspot_manager/local_hotspot_manager_platform_interface.dart';
import 'package:local_hotspot_manager/local_hotspot_manager_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLocalHotspotManagerPlatform
    with MockPlatformInterfaceMixin
    implements LocalHotspotManagerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LocalHotspotManagerPlatform initialPlatform = LocalHotspotManagerPlatform.instance;

  test('$MethodChannelLocalHotspotManager is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLocalHotspotManager>());
  });

  test('getPlatformVersion', () async {
    LocalHotspotManager localHotspotManagerPlugin = LocalHotspotManager();
    MockLocalHotspotManagerPlatform fakePlatform = MockLocalHotspotManagerPlatform();
    LocalHotspotManagerPlatform.instance = fakePlatform;

    expect(await localHotspotManagerPlugin.getPlatformVersion(), '42');
  });
}
