//
//  FormularioViewController.swift
//  Clase02
//
//  Created by Alumno on 10/16/17.
//  Copyright © 2017 jeancarloflorescarrasco. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldOne: UITextField!
    
    @IBOutlet weak var textFieldTwo: UITextField!
    
    @IBOutlet weak var total: UILabel!
    //conectar la opcion delegate a las cajas 
    @IBAction func sumaDeEnteros(_ sender: Any) {
        let n1 = textFieldOne.text
        let n2 = textFieldTwo.text
        //total.text = textFieldOne!.text + " " +textFieldTwo!.text
        total.text =  n1! + n2!
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldOne {
            return textFieldTwo.becomeFirstResponder()
        }else {
            //desaparecer el textinput
            return textField.resignFirstResponder()
        }
        
    }


}
