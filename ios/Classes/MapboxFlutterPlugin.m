#import "MapboxFlutterPlugin.h"
#import "MapBoxViewFactory.h"



@implementation MapboxFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  
    
    MapBoxViewFactory *mapboxFactory = [[MapBoxViewFactory alloc] initWithMessenger:registrar.messenger];
    
    [registrar registerViewFactory:mapboxFactory withId:@"plugins.flutter.io/mapbox_gl"];
    
    
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
