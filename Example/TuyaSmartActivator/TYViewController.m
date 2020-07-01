//
//  TYViewController.m
//  TuyaSmartActivator
//
//  Created by xuchengcheng on 12/27/2018.
//  Copyright (c) 2018 xuchengcheng. All rights reserved.
//

#import "TYViewController.h"
#import "TuyaSmartActivator.h"

@interface TYViewController ()

@end

@implementation TYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
//    NSString *ssid = @"ssid";
//    NSString *password = @"ssid_pwd";
    // ⚠️
    // token = region + token + secret
    
    // example
    /*
     
     {
      "secret":"reKE",
      "region":"AY",
      "token":"nqMwn1Nd"
     }
     NSString *token = "AYnqMwn1NdreKE";// AYnqMwn1NdreKE = "AY" + "nqMwn1Nd" + "reKE"
     
    */
//    NSString *token = @"token";
//
//    // EZ
//    [[TuyaSmartActivator sharedInstance] startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password token:token];
//
//    // AP
//    [[TuyaSmartActivator sharedInstance] startConfigWiFiWithMode:TYActivatorModeAP ssid:ssid password:password token:token];
//
//    // Zigbee Gateway
//    [[TuyaSmartActivator sharedInstance] startConfigWiredDeviceWithToken:token];
//
//    // stop
//    [[TuyaSmartActivator sharedInstance] stopConfigWiFi];
}

- (IBAction)startAction:(id)sender {
    [[TuyaSmartActivator sharedInstance] startConfigWiredDeviceWithToken:@"AYoYoSBrJztrlq"];
}

- (IBAction)stopAction:(id)sender {
    [[TuyaSmartActivator sharedInstance] stopConfigWiFi];
}

// ble wifi activte
- (void)scanDevice {
    [[TuyaSmartActivator sharedInstance] startDiscovery:^(TYBLEAdvModel *model) {
        // did scan un active device
        // stop scan and start active
        // [unactiveArray addObject:model];
        [[TuyaSmartActivator sharedInstance] stopDiscovery];
    }];
}

- (void)stopScan {
    [[TuyaSmartActivator sharedInstance] stopDiscovery];
}

- (void)startActvie {

    // TYBLEAdvModel from scan result
    NSString *authKey = @""; // from clund
    NSString *random = @""; // from random
    NSString *ssid = @"";
    NSString *password = @"";
    NSString *token = @""; // Assembled token
    
    // token = region + token + secret
    
    // example
    /*
     
     {
      "secret":"reKE",
      "region":"AY",
      "token":"nqMwn1Nd"
     }
     NSString *token = "AYnqMwn1NdreKE";// AYnqMwn1NdreKE = "AY" + "nqMwn1Nd" + "reKE"
     
    */
    
    [self stopScan];
    TYBLEAdvModel *model;// = unactiveArray[index] ;
    [[TuyaSmartActivator sharedInstance] startConfigBLEWifiWithAdvModel:model authKey:authKey random:random ssid:ssid password:password token:token];
}

@end
