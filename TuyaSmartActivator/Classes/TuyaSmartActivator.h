//
//  TuyaSmartActivator.h
//  TuyaSmartActivator
//
//  Created by XuChengcheng on 2018/8/9.
//  Copyright © 2018年 tuya. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    TYActivatorModeEZ,//快连模式
    TYActivatorModeAP,//热点模式
} TYActivatorMode;

/// zigbee 重置后app会收到网关的udp包
FOUNDATION_EXPORT NSString * const TuyaSmartNotificationDiscoverUnActivatorDevice;


@interface TuyaSmartActivator : NSObject

+ (instancetype)sharedInstance;

/**
 *  开始配网 (无线配网)
 *
 *  @param mode     配网模式, EZ或AP模式
 *  @param ssid     路由器热点名称
 *  @param password 路由器热点密码
 *  @param token    配网Token
 */
- (void)startConfigWiFiWithMode:(TYActivatorMode)mode
                           ssid:(NSString *)ssid
                       password:(NSString *)password
                          token:(NSString *)token;

/**
 *  开始配网（有线配网,需要保证网关和路由器在一个局域网内）
 *
 *  @param token    配网Token
 */
- (void)startConfigWiredDeviceWithToken:(NSString *)token;

/**
 *  停止配网
 */
- (void)stopConfigWiFi;


@end
