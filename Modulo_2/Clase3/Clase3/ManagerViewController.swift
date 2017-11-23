//
//  ManagerViewController.swift
//  Clase3
//
//  Created by Admin on 8/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit

class ManagerViewController: JASidePanelController {

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func awakeFromNib() {
        
        leftPanel = storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        centerPanel = storyboard?.instantiateViewController(withIdentifier: "ListaViewController")
        
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
