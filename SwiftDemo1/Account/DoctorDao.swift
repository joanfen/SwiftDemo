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

extension Doctor{
    public func arrayForDataBase()->Array<String>{
        let array : Array<String> = ["'\(self.loginId.description)'", "'\(self.name)'", "'\(self.gender.rawValue)'", "'\(self.birth)'", "'\(self.thumbnail.description)'", "'\(self.phone)'" , "'\(self.email)'" , "'\(self.serial.description)'" , "'\(self.level)'" , "'\(self.title)'" , "'\(self.hospital)'" , "'\(self.isDepartment.description)'" , "'\(self.department)'" , "'\(self.expertise)'", "'\(self.authCertifyStatus.rawValue)'" , "'\(self.certifyStatus.rawValue)'"  , "'\(self.XRBind)'" , "'\(self.sessionKey)'" , "'\(self.token)'"]
        return array
    }
    public func valuesForDataBase()->String{
        return self.arrayForDataBase().joined(separator: ",")
    }
}

public class DoctorDao{
    class public func createMainDB(){
        let db = File.DBPath()
        if (!FileManager.default.fileExists(atPath: db)) {
            FileManager.default.createFile(atPath: db, contents: nil, attributes: nil)
        }
        print(db)
    }
    
    class public func createUserTable(){
        
        let createUserTable = "CREATE TABLE " + userTable + " (loginId INTEGER, name TEXT, gender INTEGER, birth INTEGER, thumbnail TEXT, phone TEXT, email TEXT, serial INTEGER, level INTEGER, title TEXT, hospital TEXT, isDepartment BOOL, department TEXT, expertise TEXT, authCertifyStatus INTEGER, certifyStatus INTEGER, XRBind INTEGER, sessionKey TEXT, token TEXT);"
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
    class public func updateDoctor(doc:Doctor){
        
        if let doctor = queryDoctorByLoginId(loginId: doc.loginId) {
            let upate = "REPLATE INTO " + userTable + "(loginId, name, gender, birth, thumbnail, phone, email, serial, level, title, hospital, isDepartment, department, expertise, authCertifyStatus, certifyStatus, enabled, XRBind, sessionKey, token)" + "VALUES(" + doctor.valuesForDataBase()  + ") where loginId=\(doctor.loginId)"
            DataBaseQueue.shared.inDatabase { DB in
                DB.executeStatements(upate)
            }
        }
        
    }
    class public func insertDoctor(doctor:Doctor){
        let value =  doctor.valuesForDataBase()
        let insert = "INSERT INTO " + userTable + " VALUES(" + value + ")"
        print(insert)
        DataBaseQueue.shared.inDatabase { DB in
            DB.executeStatements(insert)
        }
    }
    
}

