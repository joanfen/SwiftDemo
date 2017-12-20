//
//  ViewController.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/10/29.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import UIKit

enum TriStateSwitch {
    case off, low, high
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    init?(f: Double, level: Double){
        return nil;
    }
    
    subscript(index: Int)->Int{
        return currentLevel*index;
    }

    static func unlock(_ level: Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
//    func test(){
//        currentLevel = 3
//    }
    
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }
        else{
            return false
        }
    }
}

class View: ViewController {
    override func viewDidLoad(){

    }
}

class Test {
    private var s : String?
    
}

class ViewController: UIViewController {
    
    private var string : String?;
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(increment(by: 1, and: 1))
        var ovenLight = TriStateSwitch.low;
        ovenLight.next();
        ovenLight.next();
//        var test = LevelTracker.init()
//        test.advance(to: 3)
//        LevelTracker(currentLevel: 1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var counter = 0;
    func increment(by amount: Int, and a:Int){
        counter += amount
    }
}

