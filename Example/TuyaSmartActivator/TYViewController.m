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
    
    NSString *ssid = @"ssid";
    NSString *password = @"ssid_pwd";
    NSString *token = @"token";
	
    // EZ
    [[TuyaSmartActivator sharedInstance] startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password token:token];
    
    // AP
    [[TuyaSmartActivator sharedInstance] startConfigWiFiWithMode:TYActivatorModeAP ssid:ssid password:password token:token];
    
    // Zigbee Gateway
    [[TuyaSmartActivator sharedInstance] startConfigWiredDeviceWithToken:token];
    
    // stop
    [[TuyaSmartActivator sharedInstance] stopConfigWiFi];
}


@end
