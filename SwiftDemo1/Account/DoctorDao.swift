//
//  DoctorDao.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/23.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation
import FMDB

let userTable = "Users";

public class DoctorDao{
    class public func createMainDB(){
        let db = File.DBPath()
        if (!FileManager.default.fileExists(atPath: db)) {
            FileManager.default.createFile(atPath: db, contents: nil, attributes: nil)
        }
    }
    
    class public func createUserTable(){
        
        let createUserTable = "CREATE TABLE " + userTable + " (loginId INTEGER, name TEXT, gender INTEGER, birth INTEGER, thumbnail TEXT, phone TEXT, email TEXT, serial INTEGER, level INTEGER, title TEXT, titleCode INTEGER, hospital TEXT), isDepartment BOOL, department TEXT, expertise TEXT, authCertifyStatus INTEGER, certifyStatus INTEGER, enabled BOOL, created INTEGER, updated INTEGER, XRBind INTEGER, sessionKey TEXT, token TEXT;"
        print(createUserTable)
        DataBaseQueue.shared.inDatabase { DB in
            let  success = DB.executeStatements(createUserTable)
            print("\(success)")
        }
    }
    
    class public func queryDoctorByLoginId(loginId:Int) -> Doctor?{
        let query = "SELECT * FROM TABLE " + userTable + " WHERE loginId = " + loginId.description
        
        var doctorDic:Dictionary<AnyHashable, Any>?;
        DataBaseQueue.shared.inDatabase { DB in
            do{
                let set = try  DB.executeQuery(query, values: nil)
                if(set.next()){
                    if let doctor = set.resultDictionary{
                        doctorDic = doctor
                    }
                }
            }
            catch{ }
        }
        if let doc = doctorDic {
            return Doctor(doctor: doc);
        }
        return nil
    }
    class public func updateDoctor(doctor:Doctor){
        
    }
}

