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
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *ssid = @"";
    NSString *password = @"";
    NSString *token = @"";
    [[TuyaSmartActivator sharedInstance] startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password token:token];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
