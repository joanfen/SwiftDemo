//
//  Login.swift
//  SwiftDemo1
//
//  Created by joanfen on 2017/12/1.
//  Copyright © 2017年 joanfen. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    @IBAction func login(_ sender: Any) {
        guard let userNameString = userName.text else {
            return
        }
        guard let passwordString = password.text else {
            return;
        }
        
        WebHandler.WebPOSTFormData(url: "https://123.207.70.158/api/login", parameters: ["phone":userNameString, "password": passwordString]) { (success, data) in
            do {
                if let response = data {
                    let dic =  try JSONSerialization.jsonObject(with: response, options: [])
                    print(dic);
                }
            }
            catch {
                
            }
        };
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
