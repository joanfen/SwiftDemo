//
//  Login.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/1.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import UIKit
class Login: UIViewController {
    let request : LoginRequest = LoginRequest();
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    @IBAction func login(_ sender: Any) {
        guard let userNameString = userName.text else {
            return
        }
        guard let passwordString = password.text else {
            return;
        }
        
        request.loginRequest(phone: userNameString, password: passwordString) {[weak self] success in
//            guard let weakself = self else{ return }
        }
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
