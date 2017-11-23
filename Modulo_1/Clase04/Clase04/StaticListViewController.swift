//
//  StaticListViewController.swift
//  Clase04
//
//  Created by Alumno on 10/20/17.
//  Copyright © 2017 jeancarloflorescarrasco. All rights reserved.
//

import UIKit

class StaticListViewController: UITableViewController {

    @IBOutlet weak var lblToShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblToShow.text = "Jean Carlo Flores Carrasco"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
