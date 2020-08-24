# TuyaSmartMiniActivator iOS SDK

[中文版](README-zh.md) | [English](README.md)

---

## Features Overview

TuyaSmartMiniActivator APP SDK supports four network configuration modes, quick connection mode (TLink, it is referred to as the EZ mode) and hotspot mode (AP mode),  wired network configuration of zigbee gateway, BLE + Wi-Fi Dual-mode.

## Rapid Integration

### Installation with CocoaPods (version 8.0 or above is supported)

Add the following content in file `Podfile`:

```ruby
platform :ios, '8.0'

target 'your_target_name' do

    pod 'TuyaSmartMiniActivator', :git => 'https://github.com/TuyaInc/tuyasmart_ios_activator_sdk', :branch => 'develop_unicom'

end
```

Execute command `pod update` in the project's root directory to begin integration.

For the instructions of CocoaPods, please refer to: [CocoaPods Guides](https://guides.cocoapods.org/)


## Network Configuration

Tuya’s hardware module supports four modes of network configuration: fast connect mode (TLink, or EZ mode), and hotspot mode (AP mode), Wired network configuration of zigbee gateway, and BLE + Wi-Fi configuration. The EZ mode is relatively more straight- forward. It is recommended to use the hotspot mode as an alternative only when the network configuration fails with the EZ mode. BLE + Wi-Fi configuration needs to turn on Bluetooth for device search and then configure.

### Obtain Token

Obtain the token information from the server.

```objective-c
{
  "secret":"reKE",
  "region":"AY",
  "token":"nqMwn1Nd"
}

```

### EZ mode

```objective-c
// start config wifi EZ mode
NSString *ssid = @"";
NSString *password = @"";
NSString *token = @""; // Assembled token
[[TuyaSmartMiniActivator sharedInstance]
startConfigWiFiWithMode:TYMiniActivatorModeEZ ssid:ssid password:password token:token];
```

###  Stop network configuration

The App will continuously broadcast the network configuration information until the network configuration succeeds or the timeout is reached once the network configuration starts. The `[TuyaSmartMiniActivator stopConfigWiFi]` method has to be invoked if you need to cancel the network configuration or the network configuration is completed.

```objc
- (void)stopConfigWifi {
    [[TuyaSmartMiniActivator sharedInstance] stopConfigWiFi];
}
```

### AP mode

```objective-c
// start config wifi AP mode
NSString *ssid = @"";
NSString *password = @"";
NSString *token = @""; // Assembled token
[[TuyaSmartMiniActivator sharedInstance]
startConfigWiFiWithMode:TYMiniActivatorModeAP ssid:ssid password:password token:token];
```

### Zigbee Gateway

```objective-c
// start config Zigbee Gateway
NSString *token = @""; // Assembled token
[[TuyaSmartMiniActivator sharedInstance] startConfigWiredDeviceWithToken:token];
```

### BLE + Wi-Fi

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
    NSString *token = @""; // Assembled token

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
