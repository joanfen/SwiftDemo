//
//  Doctor.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/23.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation

enum AuthCertifyStatus : Int{
    case None, Certifying, Fail, Success, Invalid
}

enum CertifyStatus{
    case None, Certifying, Fail, Success, Invalid
}

enum Gender : Int{
    case Unknown = -1
    case Female = 0
    case male = 1
}

public class Doctor {
    var loginId : Int
    var name : String
    var gender : Gender
    var birth : Int64
    var thumbnail : URL

    var phone : String
    var email : String
    var serial : Int
    var level : Int ///< 等级

    var title : String ///< 职称
    var titleCode : Int
    var hospital : String
    
    var isDepartment : Bool
    var department : String
    var expertise : String

    var authCertifyStatus : AuthCertifyStatus
    var certifyStatus : CertifyStatus
    
    var enabled : Bool
    var created : Int64
    var updated : Int64
    var XRBind : Int
    
    var sessionKey : String
    var token : String
    
    init(doctor:Dictionary<AnyHashable, Any>){
        self.loginId = doctor["loginId"] as? Int ?? 0
        LocalConfig.setLoginId(loginId: self.loginId)

        self.name = doctor["name"] as? String ?? ""
        self.gender = doctor["gender"] as? Gender ?? Gender.Unknown
        self.birth = doctor["birth"] as? Int64 ?? 0

        self.thumbnail = URL.init(string: doctor["thumbnail"] as? String ?? "")!
        
        self.phone = doctor["phone"] as? String ?? ""
        self.email = doctor["email"] as? String ?? ""
        self.serial = doctor["serial"] as? Int ?? 0

        self.level = doctor["level"] as? Int ?? 0

        self.title = doctor["title"] as? String ?? ""
        
        self.titleCode = doctor["titleCode"] as? Int ?? 0
        
        self.hospital = doctor["hospital"] as? String ?? ""

        self.department = doctor["department"] as? String ?? ""
        self.isDepartment = doctor["isDepartment"] as? Bool ?? false

        self.expertise = doctor["expertise"] as? String ?? ""

        self.authCertifyStatus = (doctor["authCertifyStatus"] as? AuthCertifyStatus) ?? AuthCertifyStatus.None
        self.certifyStatus = (doctor["certifyStatus"] as? CertifyStatus) ?? CertifyStatus.None
        
        self.created = doctor["created"] as? Int64 ?? 0
        self.enabled = doctor["enabled"] as? Bool ?? false
        self.updated = doctor["updated"] as? Int64 ?? 0
        self.XRBind = doctor["XRBind"] as? Int ?? 0
        
        self.sessionKey = doctor["session"] as? String ?? ""
        self.token = doctor["token"] as? String ?? ""
        
        
    }
    
}
