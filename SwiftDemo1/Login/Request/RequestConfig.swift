//
//  RequestConfig.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/21.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation
import Alamofire

let hostName = "http://119.29.122.96"
let hostNameHttp = "https://xingren.com/"
let hostNameWS = "https://xingren.com/"
let webViewHost = "https://xingren.com/"
let wsHostName = "ws"
let LOGINID_KEY = "XRLoginId"

public class RequestConfig {
    class public func httpRequestHeader() -> HTTPHeaders{
        let uuid = System.createUUID()
        let header:HTTPHeaders = [SYS_DID_KEY: uuid, SYS_APPVER_KEY: SYS_APPVER_VALUE, SYS_OS_KEY: SYS_OS_VALUE, IOS_VERSION_KEY: IOS_VERSION_VALUE, LOGINID_KEY:LocalConfig.loginIdString()]
        return header
    }
    
   
   
    class public func requestByUrl(url: String, parameters: Parameters, method: HTTPMethod, completionHandler: @escaping (DataResponse<Any>) -> Void){
        Alamofire.request(url, method:method, parameters: parameters, encoding: URLEncoding.default, headers: httpRequestHeader()).responseJSON(completionHandler: completionHandler)
        
    }

}


