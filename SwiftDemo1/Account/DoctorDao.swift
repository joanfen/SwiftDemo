//
//  DoctorDao.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/23.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation
import FMDB

public class DoctorDao{
    class public func createDB(){

        let db = File.DBPath()

        FileManager.default.createFile(atPath: db, contents: nil, attributes: nil)

    }
    
    
}

