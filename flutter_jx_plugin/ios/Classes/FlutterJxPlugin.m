#import "FlutterJxPlugin.h"

@implementation FlutterJxPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_jx_plugin"
            binaryMessenger:[registrar messenger]];
  FlutterJxPlugin* instance = [[FlutterJxPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"duAddOne" isEqualToString:call.method]) {
        NSInteger val = 100;
        val += [[call.arguments objectForKey:@"num"] intValue];
        result([NSNumber numberWithLong:val]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
