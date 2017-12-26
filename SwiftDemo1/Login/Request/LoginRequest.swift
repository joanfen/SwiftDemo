//
//  LoginRequest.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/21.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation
import Alamofire
public typealias successBlock = (_ success:Bool) -> Void

public class LoginRequest {
    let LoginApi = "/api/login";
    
    func loginHttpRequestHeader() -> HTTPHeaders{
        let uuid = System.createUUID()
        let header:HTTPHeaders = [SYS_DID_KEY: uuid, SYS_APPVER_KEY: SYS_APPVER_VALUE, SYS_OS_KEY: SYS_OS_VALUE, IOS_VERSION_KEY: IOS_VERSION_VALUE, SYS_DEVICE_MODEL_KEY: SYS_DEVICE_MODEL_VALUE]
        return header
    }
    func loginRequest(phone:String, password: String, success: @escaping successBlock){
        let parameters = ["phone": phone, "password": password]
        let url = hostName+LoginApi
        Alamofire.request(url, method:.post, parameters: parameters, encoding: URLEncoding.default, headers: loginHttpRequestHeader()).responseJSON { [weak self] response in
            guard let weakself = self else{ return }
            if let json = response.result.value {
                weakself.handleLoginResponse(response: json as! Dictionary<String, Any>)
                
            }
        }
    }
    
    func handleLoginResponse(response: Dictionary<String, Any>){
        if var dic : Dictionary<String, Any> = response["doctor"] as? Dictionary<String, Any>{
            dic["sessionKey"] = response["sessionKey"]
            dic["token"] = response["token"]
            let doctor = Doctor(doctor: dic)
            print(dic)
            DoctorDao.createMainDB()
            DoctorDao.createUserTable()
            DoctorDao.insertDoctor(doctor: doctor)
        }
       
       

    }
}
