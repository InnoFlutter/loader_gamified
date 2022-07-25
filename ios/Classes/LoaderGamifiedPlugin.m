#import "LoaderGamifiedPlugin.h"
#if __has_include(<loader_gamified/loader_gamified-Swift.h>)
#import <loader_gamified/loader_gamified-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "loader_gamified-Swift.h"
#endif

@implementation LoaderGamifiedPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLoaderGamifiedPlugin registerWithRegistrar:registrar];
}
@end
