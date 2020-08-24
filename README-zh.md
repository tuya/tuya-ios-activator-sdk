# TuyaSmartMiniActivator iOS SDK（云云对接方案）

[中文版](README-zh.md) | [English](README.md)

---

## 功能概述

TuyaSmartMiniActivator SDK 提供了 AP，EZ 模式，Zigbee 网关配网和 WiFi + BLE 双模配网的功能，开始配网和停止配网要结合使用。主要是配合云云对接使用。

## 快速集成 (推荐)

### 使用 Cocoapods 集成

在 `Podfile` 文件中添加以下内容：

```ruby
platform :ios, '8.0'

target 'your_target_name' do

   pod 'TuyaSmartMiniActivator', :git => 'https://github.com/TuyaInc/tuyasmart_ios_activator_sdk', :branch => 'develop_unicom'

end
```

然后在项目根目录下执行 `pod update` 命令，集成第三方库。

CocoaPods 的使用请参考：[CocoaPods Guides](https://guides.cocoapods.org/)


## 设备配网

涂鸦硬件模块支持四种配网模式：快连模式（TLink，简称 EZ 模式）、热点模式（AP 模式）、Zigbee 网关配网，BLE +  Wi-Fi 双模配网。快连模式操作较为简便，建议在配网失败后，再使用热点模式作为备选方案。Zigbee 网关配网需要网关和路由器在一个局域网内进行配网。BLE + Wi-Fi 双模配网需要开启蓝牙进行设备搜索后进行配网。

### 获取 Token

通过云云对接获取配网的信息串，里面包含有

```json
{
  "secret":"reKE",
  "region":"AY",
  "token":"nqMwn1Nd"
}

// 配网所需的 token = region + token + secret
// 以上为例, 传递给下列方法的 token = "AYnqMwn1NdreKE" = "AY" + "nqMwn1Nd" + "reKE"
```

> 需要对配网 token 信息进行拼接，错误的 token、未拼接的 token 会导致设备激活、配网失败

### EZ 模式配网

```objective-c
// start config wifi EZ mode
NSString *ssid = @"";
NSString *password = @"";
NSString *token = @""; // 组装后的 token
[[TuyaSmartMiniActivator sharedInstance] startConfigWiFiWithMode:TYMiniActivatorModeEZ ssid:ssid password:password token:token];
```

### 停止配网

开始配网操作后，APP会持续广播配网信息（直到配网成功，或是超时）。如果需要中途取消操作或配网完成，需要调用`[TuyaSmartMiniActivator stopConfigWiFi]`方法。

```
- (void)stopConfigWifi {
    [[TuyaSmartMiniActivator sharedInstance] stopConfigWiFi];
}
```

### AP 模式配网

```objective-c
// start config wifi AP mode
- (void)startConfig {
    NSString *ssid = @"";
    NSString *password = @"";
    NSString *token = @""; // 组装后的 token
    [[TuyaSmartMiniActivator sharedInstance] startConfigWiFiWithMode:TYMiniActivatorModeAP ssid:ssid password:password token:token];
}

// stop config
- (void)stopConfigWifi {
    [[TuyaSmartMiniActivator sharedInstance] stopConfigWiFi];
}
```

### Zigbee 网关配网

```objective-c
// start config Zigbee Gateway
- (void)startConfig {
    NSString *token = @""; // 组装后的 token
    [[TuyaSmartMiniActivator sharedInstance] startConfigWiredDeviceWithToken:token];
}

// stop config
- (void)stopConfigWifi {
    [[TuyaSmartMiniActivator sharedInstance] stopConfigWiFi];
}
```

### BLE + Wi-Fi 双模配网

```objective-c
// start discovery device with bluetooth
- (void)startDiscovery {
    [[TuyaSmartMiniActivator sharedInstance] startDiscovery:^(TYMiniBLEAdvModel *model){

    }];
}

// stop discovery
- (void)stopDiscovery {
    [[TuyaSmartMiniActivator sharedInstance] stopDiscovery];
}

// start config
- (void)startConfigBLEWifi {
    TYMiniBLEAdvModel *model = #<startDiscovery result>;
    NSString *authKey = @""; // from clund
    NSString *random = @""; // from random
    NSString *ssid = @"";
    NSString *password = @"";
    NSString *token = @""; // 组装后的 token

    [[TuyaSmartMiniActivator sharedInstance] startConfigBLEWifiWithAdvModel:model
                                                                authKey:authKeyauthKey
                                                                 random:random
                                                                   ssid:ssid
                                                               password:password
                                                                  token:token];
}

// stop config
- (void)stopConfigBLEWifi {
    [[TuyaSmartMiniActivator sharedInstance] stopConfigBLEWifiWithAdvModel:#<discoveryModel>];
}
```
