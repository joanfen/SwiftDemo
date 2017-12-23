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


class Doctor {
    var authCertifyStatus : AuthCertifyStatus
    var certifyStatus : CertifyStatus
    var birth : Int64
    var created : Int64
    var department : String
    var email : String
    var enabled : Bool
    var expertise : String
    var gender : Gender
    var hospital : String
    var isDepartment : Bool
    var level : Int
    var loginId : Int{
        willSet(newLoginId){
            
        }
    }
    
    init(doctor:Dictionary<String, Any>){
       
        self.authCertifyStatus = (doctor["authCertifyStatus"] as? AuthCertifyStatus) ?? AuthCertifyStatus.None
        self.certifyStatus = (doctor["certifyStatus"] as? CertifyStatus) ?? CertifyStatus.None
        self.birth = doctor["birth"] as? Int64 ?? 0
        self.created = doctor["created"] as? Int64 ?? 0
        self.department = doctor["department"] as? String ?? ""
        self.email = doctor["email"] as? String  ?? ""
        self.enabled = doctor["enabled"] as? Bool ?? false
        self.expertise = doctor["expertise"] as? String ?? ""
        self.gender = doctor["gender"] as? Gender ?? Gender.Unknown
        self.hospital = doctor["hospital"] as? String ?? ""
        self.isDepartment = doctor["isDepartment"] as? Bool ?? false
        self.level = doctor["level"] as? Int ?? 0
        self.loginId = doctor["loginId"] as? Int ?? 0
        LocalConfig.setLoginId(loginId: self.loginId)
    }
    
    
    
    
}
