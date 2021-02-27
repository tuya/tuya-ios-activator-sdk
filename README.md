#### Note: This repository is inherited from the old Tuya Github repository that will be deprecated soon. Please use this repository for Tuya SDK development instead. For changing the existing remote repository URL, see this [tutorial](https://docs.github.com/en/free-pro-team@latest/github/using-git/changing-a-remotes-url)

# TuyaSmartActivator iOS SDK (cloud-to-cloud connection)

[中文版](README-zh.md) | [English](README.md)

---
## Overview

TuyaSmartActivator iOS SDK supports four pairing modes, fast pairing (TLink. EZ mode), hotspot pairing (AP mode), Zigbee gateway pairing, and Wi-Fi + BLE dual-module pairing. 

## Rapid integration (recommended)

### Use CocoaPods for integration

Add the following to the `Podfile` file:

```ruby
platform :ios, '8.0'
  
target 'your_target_name' do
  
       pod "TuyaSmartActivator"
      
end
```
Execute the `pod update` command in the root directory of the project to integrate the third-party library. 

For the usage of CocoaPods, see [CocoaPods Guides](https://guides.cocoapods.org/)


## Manual integration (not recommended)

Tuya Smart iOS SDK employs the following third-party dependency libraries: 

- CocoaAsyncSocket

The system dependency linkbases are:

- libc++
- libz
### Use CocoaPods to add a third-party library dependency.
Add the following to the `Podfile` in the root directory of the project

```ruby  
platform :ios, '8.0'

target 'Your_App_Name' do
       pod "CocoaAsyncSocket"
end
```
Execute the `pod install` command in the root directory of the project to integrate the third-party library. 
### Add system dependency library: 
Add `libc++` and `libz` system linkbases to  `Target -> Build Phases -> Link Binary With Libraries` of the project.
![image-20181227195226694](./image-20181227195226694.png)
## Device pairing
Tuya hardware modules support four pairing modes, fast pairing (TLink. EZ mode), hotspot pairing (AP mode), Zigbee gateway pairing, and Wi-Fi + BLE dual-module pairing.  Use fast pairing as preference and hotspot pairing as backup if the fast pairing fails. Zigbee gateway pairing requires the gateway and the router to pair in the same LAN BLE + Wi-Fi dual-module pairing requires enabled bluetooth to search for the device to pair.
### Get token
The pairing information string obtained through cloud-to-cloud connection includes: 
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
 NSString *token = "AYnqMwn1NdreKE";// AYnqMwn1NdreKE = "AY" + "nqMwn1Nd" + 
 "reKE" 
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
 
  startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password 
 token:token];
  ```
### Stop pairing
Once the pairing is started, the app keeps broadcasting pairing information until the pairing is completed or timeout.  If you need to cancel the pairing or the pairing is completed, you need to call `[TuyaSmartActivator stopConfigWiFi]`.

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
  startConfigWiFiWithMode:TYActivatorModeAP ssid:ssid password:password 
 token:token];
```
### Zigbee gateway mode
```objective-c
// start config Zigbee Gateway
NSString *token = @""; // Assembled token
[[TuyaSmartActivator sharedInstance] startConfigWiredDeviceWithToken:token]
```
### BLE + Wi-Fi dual-module mode
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
    [[TuyaSmartActivator sharedInstance] stopConfigBLEWifiWithAdvModel:#
 <discoveryModel>];
   }
```

