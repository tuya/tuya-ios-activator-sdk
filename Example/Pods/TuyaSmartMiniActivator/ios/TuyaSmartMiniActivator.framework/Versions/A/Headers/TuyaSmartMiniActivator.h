//
//  TuyaSmartActivator.h
//  TuyaSmartActivator
//
//  Created by XuChengcheng on 2018/8/9.
//  Copyright © 2018年 tuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYMiniBLEAdvModel.h"

typedef enum : NSUInteger {
    TYMiniActivatorModeEZ, // fast connect mode (EZ)
    TYMiniActivatorModeAP, // hotspot mode (AP)
} TYMiniActivatorMode;

@interface TuyaSmartMiniActivator : NSObject

+ (instancetype)sharedInstance;

/**
 *  start network configuration
 *
 *  @param mode     mode of network configuration (EZ or AP)
 *  @param ssid     router name
 *  @param password router password
 *  @param token    token
 */
- (void)startConfigWiFiWithMode:(TYMiniActivatorMode)mode
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


#pragma mark - BLE + Wi-Fi config

/// start scan un active ble device
///
/// @param discoveryHandler  block when discovery device
- (void)startDiscovery:(void(^)(TYMiniBLEAdvModel *model))discoveryHandler;


/// stop ble discovery
- (void)stopDiscovery;


/// active discoveryed ble device
///
/// @param advModel ble device
/// @param authKey the device authkey
/// @param random  the device random data
/// @param ssid router name
/// @param password router password
/// @param token token
- (void)startConfigBLEWifiWithAdvModel:(TYMiniBLEAdvModel *)advModel
                               authKey:(NSString *)authKey
                                random:(NSString *)random
                                  ssid:(NSString *)ssid
                              password:(NSString *)password
                                 token:(NSString *)token;


/// stop ble wifi device configuration
- (void)stopConfigBLEWifiWithAdvModel:(TYMiniBLEAdvModel *)advModel;

@end
