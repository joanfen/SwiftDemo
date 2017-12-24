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
    class public func loginId() -> Int?{
        let loginId = UserDefaults.standard.integer(forKey: "loginId")
        return loginId
    }
    class public func setLoginId(loginId: Int){
        UserDefaults.standard.set(loginId, forKey: "loginId")
    }
    
    /// Token
    class public func token() -> String?{
        let token = UserDefaults.standard.string(forKey: "token")
        return token
        
    }
    class public func setToken(token: String){
         UserDefaults.standard.set(token, forKey: "token")
    }
}
