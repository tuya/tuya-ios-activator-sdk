//
//  TYBLEAdvModel.h
//  TuyaSmartPublic
//
//  Created by 冯晓 on 16/8/24.
//  Copyright © 2016年 Tuya. All rights reserved.
//  单点蓝牙广播包model

typedef enum : NSUInteger {
    TYSmartMiniBLETypeUnknow = 1,
    TYSmartMiniBLETypeBLE,//单点设备
    TYSmartMiniBLETypeBLEPlus,//单点设备
    TYSmartMiniBLETypeBLEWifi,//ble-wifi 设备
    TYSmartMiniBLETypeBLESecurity,//安全协议的设备
    TYSmartMiniBLETypeBLEWifiSecurity,//安全协议的双模多协议配网 BLE WI-FI 设备
} TYSmartMiniBLEType;

@interface TYMiniBLEAdvModel : NSObject

@property (nonatomic, strong) NSString           *uuid;
@property (nonatomic, strong) NSString           *productId;
@property (nonatomic, strong) NSString           *mac;
@property (nonatomic, assign) BOOL               isActive;
@property (nonatomic, assign) TYSmartMiniBLEType bleType;
@property (nonatomic, assign) BOOL               isSupport5G;
@property (nonatomic, assign) BOOL               isProuductKey; // NO 前绑定设备 YES 后绑定设备
//用于安全协议的设备 表示协议版本
@property (nonatomic, assign) int                bleProtocolV;

@end
