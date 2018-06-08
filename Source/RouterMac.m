//
//  RouterMac.m
//  WeexEros
//
//  Created by WL on 2018/6/8.
//  Copyright © 2018年 benmu. All rights reserved.
//

#import "RouterMac.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <WeexPluginLoader/WeexPluginLoader.h>

@implementation RouterMac
@synthesize weexInstance;

WX_PLUGIN_EXPORT_MODULE(netinfo, RouterMac)
WX_EXPORT_METHOD(@selector(getMacAddress:))
WX_EXPORT_METHOD(@selector(getIpAddress:))
WX_EXPORT_METHOD(@selector(getConnectedWifiMacAddress:))

-(NSString *)getMacAddress(WXModuleCallback)callback{
    
}

-(void)getIpAddress(WXModuleCallback)callback{
    
}

-(NSString *)getConnectedWifiMacAddress(WXModuleCallback)callback{
    NSString *ssid = @"Not Found";
    
    NSString *macIp = @"Not Found";
    
    CFArrayRef myArray =CNCopySupportedInterfaces();
    
    if (myArray != nil) {
        
        CFDictionaryRef myDict =CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray,0));
        
        if (myDict != nil) {
            
            NSDictionary *dict = (NSDictionary*)CFBridgingRelease(myDict);
            
            ssid = [dict valueForKey:@"SSID"];           //WiFi名称
            
            macIp = [dict valueForKey:@"BSSID"];     //Mac地址
            
        }
        
    }
    
    callback(macIp);
}


@end
