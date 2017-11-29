//
//  DetailPostViewController.swift
//  Clase1
//
//  Created by Admin on 11/27/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CoreData

class DetailPostViewController: UIViewController {
    
    @IBOutlet private weak var titleTextField: UITextField!
    
    var postSelected: [String: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = postSelected["title"] as? String
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
