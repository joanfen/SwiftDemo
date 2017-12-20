//
//  WebHandler.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/10/29.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation

public class WebHandler : NSObject, URLSessionDelegate {
    public typealias webCallBack = (_ success:Bool, _ data: Data?) -> Void


    
    class public func WebGet(url:String,  parameters: Dictionary<String, Any>,  callback:@escaping webCallBack){
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 8
        
        let session = URLSession.shared
        
        let url:URL = URL.init(string: url)!;
        
        let request = NSMutableURLRequest(url: url);

        request.httpMethod = "GET";
        request .setValue("15656", forHTTPHeaderField: "XRLoginId")
        let dataTask = session.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error: Error?) -> Void in
        
            callback(true, data)
        }
        dataTask.resume()
        
    }
    
    class public func WebPOSTFormData(url:String, parameters: Dictionary<String, Any>,  callback:@escaping webCallBack){
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 8
        
        let session = URLSession.shared
        
        let url:URL = URL.init(string: url)!;
        
        let request = NSMutableURLRequest(url: url);
        
        request.httpMethod = "POST";
    
        request.httpBody = try?JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error: Error?) -> Void in
            callback(true, data)
            
        }
        dataTask.resume()
        
    }
}
