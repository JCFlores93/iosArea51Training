//
//  RegistroViewController.swift
//  FirebaseSample
//
//  Created by Admin on 3/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistroViewController: UITableViewController {

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBAction methods
    @IBAction func newUserButton() {
        
        Auth.auth().createUser(withEmail: "algo@gmail.com", password: "algoalgo") { (user, error) in
            print(error?.localizedDescription)
            print(user)
            
        }
        
    }

}
