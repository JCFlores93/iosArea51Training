//
//  ViewController.swift
//  Clase02
//
//  Created by Admin on 6/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func loginButtonCustome(_ sender: UIButton) {
        let login = FBSDKLoginManager()
        login.logIn(withReadPermissions: ["public_profile"], from: self) { (result, error) in
            if error == nil {
                if result!.isCancelled {
                    print("cancel")
                }else {
                    print(result)
                }
            }else {
                print(error?.localizedDescription)
            }
        }
    }
    //MARK: Llifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupButton() {
        let fButton = FBSDKLoginButton()
        fButton.center = view.center
        fButton.readPermissions = ["public_profile","email","user_friends"]
        view.addSubview(fButton)
        
    }


}

