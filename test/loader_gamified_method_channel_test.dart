import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_gamified/loader_gamified_method_channel.dart';

void main() {
  MethodChannelLoaderGamified platform = MethodChannelLoaderGamified();
  const MethodChannel channel = MethodChannel('loader_gamified');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
