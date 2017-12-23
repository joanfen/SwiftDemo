//
//  System.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/21.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation
import UIKit

let SYS_APPVER_VALUE:String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
let SYS_APPVER_KEY = "XRAppVer"

let SYS_OS_VALUE = "iOS"
let SYS_OS_KEY = "XROs"

let IOS_VERSION_VALUE = UIDevice.current.systemVersion
let IOS_VERSION_KEY = "XROsVer"

let SYS_DEVICE_MODEL_VALUE = UIDevice.current.model
let SYS_DEVICE_MODEL_KEY = "XRModel"

let SYS_DID_KEY = "XRDid"

public class System : NSObject {
    class public func createUUID() -> String{
        let uuid = CFUUIDCreate(kCFAllocatorDefault)
        let uuidString = CFUUIDCreateString(kCFAllocatorDefault, uuid)
        return uuidString! as String;
    }
    
    
    
  
}
