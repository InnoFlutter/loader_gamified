import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'loader_gamified_platform_interface.dart';

/// An implementation of [LoaderGamifiedPlatform] that uses method channels.
class MethodChannelLoaderGamified extends LoaderGamifiedPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('loader_gamified');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
