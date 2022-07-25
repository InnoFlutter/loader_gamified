import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'loader_gamified_method_channel.dart';

abstract class LoaderGamifiedPlatform extends PlatformInterface {
  /// Constructs a LoaderGamifiedPlatform.
  LoaderGamifiedPlatform() : super(token: _token);

  static final Object _token = Object();

  static LoaderGamifiedPlatform _instance = MethodChannelLoaderGamified();

  /// The default instance of [LoaderGamifiedPlatform] to use.
  ///
  /// Defaults to [MethodChannelLoaderGamified].
  static LoaderGamifiedPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LoaderGamifiedPlatform] when
  /// they register themselves.
  static set instance(LoaderGamifiedPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
