//
//  TuyaSmartActivator.h
//  TuyaSmartActivator
//
//  Created by XuChengcheng on 2018/8/9.
//  Copyright © 2018年 tuya. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    TYActivatorModeEZ, // smart config mode (EZ)
    TYActivatorModeAP, // hotspot mode (AP)
} TYActivatorMode;


@interface TuyaSmartActivator : NSObject

+ (instancetype)sharedInstance;

/**
 *  start network configuration
 *
 *  @param mode     mode of network configuration (EZ or AP)
 *  @param ssid     router name
 *  @param password router password
 *  @param token    token
 */
- (void)startConfigWiFiWithMode:(TYActivatorMode)mode
                           ssid:(NSString *)ssid
                       password:(NSString *)password
                          token:(NSString *)token;

/**
 *  Zigbee gateway configuration
 *
 *  @param token    token
 */
- (void)startConfigWiredDeviceWithToken:(NSString *)token;

/**
 *  stop network configuration
 */
- (void)stopConfigWiFi;


@end
