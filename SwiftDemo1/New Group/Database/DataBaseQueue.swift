//
//  DataBaseQueue.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/24.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import Foundation

final class DataBaseQueue : FMDatabaseQueue{
    static let shared = DataBaseQueue.init(path: File.RootDBPath())!

}
