## Note: This repository is inherited from the old Tuya Github repository: https://github.com/TuyaInc/tuyasmart_ios_activator_sdk, which will be deprecated soon. Please use this repository for Tuya SDK development instead. For changing the existing remote repository URL, please check this tutorial: https://docs.github.com/en/free-pro-team@latest/github/using-git/changing-a-remotes-url

# TuyaSmartActivator iOS SDK

[中文版](README-zh.md) | [English](README.md)

---

## Features Overview

TuyaSmartActivator APP SDK supports four network configuration modes, quick connection mode (TLink, it is referred to as the EZ mode) and hotspot mode (AP mode),  wired network configuration of zigbee gateway, BLE + Wi-Fi Dual-mode.

## Rapid Integration

### Installation with CocoaPods (version 8.0 or above is supported)

Add the following content in file `Podfile`:

```ruby
platform :ios, '8.0'

target 'your_target_name' do

      pod "TuyaSmartActivator"

end
```

Execute command `pod update` in the project's root directory to begin integration.

For the instructions of CocoaPods, please refer to: [CocoaPods Guides](https://guides.cocoapods.org/)

## Manual Integration

TuyaSmartActivator iOS SDK dependence on third-party libraries:

- CocoaAsyncSocket

dependence on system libraries:

- libc++
- libz

### Using CocoaPods integration add third-party libraries

Add the following content in file `Podfile`:

```ruby
platform :ios, '8.0'
	
target 'Your_App_Name' do
	pod "CocoaAsyncSocket"
end
```

Execute command `pod update` in the project's root directory to begin integration.

### Add system libraries

In the `Target -> Build Phases -> Link Binary With Libraries`, add `libc++`, `libz` system libraries:

![image-20181227195226694](./image-20181227195226694.png)



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

// startConfig token = region + token + secret
// example. 
NSString *ssid = @"";
NSString *password = @"";
NSString *token = "AYnqMwn1NdreKE";// AYnqMwn1NdreKE = "AY" + "nqMwn1Nd" + "reKE" 
[[TuyaSmartActivator sharedInstance]
startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password token:token];
```

### EZ mode 

```objective-c
// start config wifi EZ mode
NSString *ssid = @"";
NSString *password = @"";
NSString *token = @""; // Assembled token
[[TuyaSmartActivator sharedInstance]
startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password token:token];
```

###  Stop network configuration

The App will continuously broadcast the network configuration information until the network configuration succeeds or the timeout is reached once the network configuration starts. The `[TuyaSmartActivator stopConfigWiFi]` method has to be invoked if you need to cancel the network configuration or the network configuration is completed.

```objc
- (void)stopConfigWifi {
    [[TuyaSmartActivator sharedInstance] stopConfigWiFi];
}
```

### AP mode

```objective-c
// start config wifi AP mode
NSString *ssid = @"";
NSString *password = @"";
NSString *token = @""; // Assembled token
[[TuyaSmartActivator sharedInstance]
startConfigWiFiWithMode:TYActivatorModeAP ssid:ssid password:password token:token];
```

### Zigbee Gateway 

```objective-c
// start config Zigbee Gateway
NSString *token = @""; // Assembled token
[[TuyaSmartActivator sharedInstance] startConfigWiredDeviceWithToken:token];
```

### BLE + Wi-Fi 

```objective-c
// start discovery device with bluetooth
- (void)startDiscovery { 
    [[TuyaSmartActivator sharedInstance] startDiscovery:^(TYBLEAdvModel *model){
      
    }];
}

// stop discovery
- (void)stopDiscovery {
    [[TuyaSmartActivator sharedInstance] stopDiscovery];
}

// start config
- (void)startConfigBLEWifi {
    TYBLEAdvModel *model = #<startDiscovery result>;
    NSString *authKey = @""; // from clund
    NSString *random = @""; // from random
    NSString *ssid = @"";
    NSString *password = @"";
    NSString *token = @""; // Assembled token
  
    [[TuyaSmartActivator sharedInstance] startConfigBLEWifiWithAdvModel:model
                                                                authKey:authKeyauthKey
                                                                 random:random
                                                                   ssid:ssid
                                                               password:password
                                                                  token:token];
}

// stop config
- (void)stopConfigBLEWifi {
    [[TuyaSmartActivator sharedInstance] stopConfigBLEWifiWithAdvModel:#<discoveryModel>];
}
```

## Support

You can get support from Tuya with the following methods:

* Tuya Smart Help Center: https://support.tuya.com/en/help
* Technical Support Council: https://iot.tuya.com/council/

## License

This Tuya Home iOS SDK Sample is licensed under the MIT License.
