//
//  FileManager.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/23.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation

let DBNAME = "XRDoctor.sqlite"

public class File {
    class public func DocumentDirectory()->String{
        let document = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentPath = document.first!
        return documentPath
    }
    class public func UserDirectory()->String{
        if let loginId = LocalConfig.loginId() {
            let user = DocumentDirectory() + "/" + loginId.description
            if(!FileManager.default.fileExists(atPath: user)){
                do{
                    try FileManager.default.createDirectory(atPath: user, withIntermediateDirectories: true, attributes: nil)
                } catch{
                    return ""
                }
            }
            return user
        }
        return ""
    }
    class public func DBPath() -> String{
        
        return UserDirectory() + "/" + DBNAME
    }
}
