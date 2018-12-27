

## Network Configuration 

Tuya’s hardware module supports two modes of network configuration: fast connect mode (TLink, or EZ mode), and hotspot mode (AP mode). The EZ mode is relatively more straight- forward. It is recommended to use the hotspot mode as an alternative only when the network configuration fails with the EZ mode. 

##### EZ mode 

```objective-c
// start config wifi EZ mode
NSString *ssid = @"";
NSString *password = @"";
NSString *token = @"";
[[TuyaSmartActivator sharedInstance]
startConfigWiFiWithMode:TYActivatorModeEZ ssid:ssid password:password
token:token];
// stop config
void stop_config_wifi();
```

##### AP mode

```objective-c
// start config wifi AP mode
NSString *ssid = @"";
NSString *password = @"";
NSString *token = @"";
[[TuyaSmartActivator sharedInstance]
startConfigWiFiWithMode:TYActivatorModeAP ssid:ssid password:password
token:token];
// stop config
void stop_config_wifi();
```

##### Zigbee Gateway 

```objective-c
// start config Zigbee Gateway
NSString *token = @"";
[[TuyaSmartActivator sharedInstance]
startConfigWiredDeviceWithToken:token];
// stop config
void stop_config_wifi();
```