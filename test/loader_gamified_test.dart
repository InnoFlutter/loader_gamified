import 'package:flutter_test/flutter_test.dart';
import 'package:loader_gamified/loader_gamified.dart';
import 'package:loader_gamified/loader_gamified_platform_interface.dart';
import 'package:loader_gamified/loader_gamified_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLoaderGamifiedPlatform 
    with MockPlatformInterfaceMixin
    implements LoaderGamifiedPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LoaderGamifiedPlatform initialPlatform = LoaderGamifiedPlatform.instance;

  test('$MethodChannelLoaderGamified is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLoaderGamified>());
  });

  test('getPlatformVersion', () async {
    LoaderGamified loaderGamifiedPlugin = LoaderGamified();
    MockLoaderGamifiedPlatform fakePlatform = MockLoaderGamifiedPlatform();
    LoaderGamifiedPlatform.instance = fakePlatform;
  
    expect(await loaderGamifiedPlugin.getPlatformVersion(), '42');
  });
}
