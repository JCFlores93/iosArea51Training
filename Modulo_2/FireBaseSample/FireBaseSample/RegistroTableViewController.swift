//
//  RegistroTableViewController.swift
//  FireBaseSample
//
//  Created by Admin on 3/11/17.
//  Copyright © 2017 Carlos. All rights reserved.
//

import UIKit
import Firebase

class RegistroTableViewController: UITableViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passworText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func newUserButton(_ sender: Any) {
        Auth.auth().createUser(withEmail:"algo@gmail.com", password: "algo"){
            (user, error) in
            print(error?.localizeDescription)
            print("user")
        }
        
    }
    

}
