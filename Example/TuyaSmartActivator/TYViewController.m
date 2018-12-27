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
	
    // EZ
    NSString *ssid = @"ssid";
    NSString *password = @"ssid_pwd";
    NSString *token = @"token";
    [[TuyaSmartActivator sharedInstance] startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password token:token];
    
    
}


@end
