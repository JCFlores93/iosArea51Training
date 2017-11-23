//
//  LoginManagerViewController.swift
//  Clase1_Mod2
//
//  Created by Alumno on 11/3/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class LoginManagerViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 5.0
        loginButton.layer.borderColor = UIColor.red.cgColor
        loginButton.layer.borderWidth = 1.0

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBAction method
    @IBAction func loginWithFacebook(sender: UIButton) {
        
        let app = UIApplication.shared.delegate as? AppDelegate
        app?.mostrarApp()
        
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
