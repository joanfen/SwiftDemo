//
//  Animation.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/1.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import UIKit


class Animation: UIViewController {

    public var animationView : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        WebHandler.WebGet(url: "https://yisheng.aihaisi.com/api/document/search", parameters: ["key":"甲减"]) { (success, object) in
            print(String.init(data: object!, encoding: String.Encoding.utf8)!)
            
        }
        // Do any additional setup after loading the view.
        
        animationView = {
            let view = UIView(frame: {
                CGRect(x: (self.view.frame.width-100)/2, y: (self.view.frame.height-100)/2, width: 100, height: 100)
            }())
            view.backgroundColor = UIColor.red
            self.view.addSubview(view)
            return view
        }();
        let button : UIButton = UIButton(type: UIButtonType.custom);
        button.frame = CGRect(x: 10, y: (animationView?.frame.maxY)! + 10, width: 50, height: 20);
        button.backgroundColor = UIColor.red
        button.setTitle("放大", for: UIControlState.normal);
        button.addTarget(self, action:#selector(zoom), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button);
    }

    @objc func zoom(){
        if let view = animationView {
            UIView.animate(withDuration: 0.3) {
                
                var width : CGFloat = 100
                if(view.frame.width == 100 ) {
                    width = 300
                }
                self.animationView?.frame = CGRect(x: (self.view.frame.width-width)/2, y: (self.view.frame.height-width)/2, width: width, height: width)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
