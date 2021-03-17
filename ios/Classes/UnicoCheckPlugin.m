#import "UnicoCheckPlugin.h"
#if __has_include(<unico_check/unico_check-Swift.h>)
#import <unico_check/unico_check-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "unico_check-Swift.h"
#endif

@implementation UnicoCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUnicoCheckPlugin registerWithRegistrar:registrar];
}
@end
