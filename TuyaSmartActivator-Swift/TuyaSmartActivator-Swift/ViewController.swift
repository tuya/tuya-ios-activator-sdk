//
//  ViewController.swift
//  TuyaSmartActivator-Swift
//
//  Created by 黄凯 on 2019/4/18.
//  Copyright © 2019 Tuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let ssid = "ssid"
//        let password = "ssid_pwd"
//        let token = "token"
//        
//        // EZ
//        TuyaSmartActivator.sharedInstance()?.startConfigWiFi(with: TYActivatorModeEZ,
//                                                             ssid: ssid,
//                                                             password: password,
//                                                             token: token)
//        
//        // AP
//        TuyaSmartActivator.sharedInstance()?.startConfigWiFi(with: TYActivatorModeAP,
//                                                             ssid: ssid,
//                                                             password: password,
//                                                             token: token)
//        // Zigbee Gateway
//        TuyaSmartActivator.sharedInstance()?.startConfigWiredDevice(withToken: token)
//
//        
//        // stop
//        TuyaSmartActivator.sharedInstance()?.stopConfigWiFi()
    }

    
    @IBAction func start() {
        TuyaSmartActivator.sharedInstance()?.startConfigWiredDevice(withToken: "AYoYoSBrJztrlq")
    }
    
    @IBAction func stop() {
        TuyaSmartActivator.sharedInstance()?.stopConfigWiFi()
    }

}

