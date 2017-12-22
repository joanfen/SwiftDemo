//
//  LocalConfig.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/22.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation

public class LocalConfig {
    /// LoginId
    class public func loginIdString() -> String{
        if let loginId = UserDefaults.standard.string(forKey: "loginId") {
            return loginId
        }
        else{
            return ""
        }
    }
    class public func setLoginId(loginId: String){
        UserDefaults.standard.set(loginId, forKey: "loginId")
    }
    
    /// Token
    class public func token() -> String{
        if let token = UserDefaults.standard.string(forKey: "token") {
            return token
        }
        else{
            return ""
        }
    }
    class public func setToken(token: String){
         UserDefaults.standard.set(token, forKey: "token")
    }
}
