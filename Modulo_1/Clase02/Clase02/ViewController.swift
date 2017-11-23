//
//  ViewController.swift
//  Clase02
//
//  Created by Alumno on 10/16/17.
//  Copyright © 2017 jeancarloflorescarrasco. All rights reserved.
//

import UIKit
//1.- Importar el patron delegate
class ViewController: UIViewController,UITextFieldDelegate {
    
    

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var nombre: UILabel!
    @IBAction func actionButton(_ sender: UIButton) {
        print("click")
            }
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = nil
        nombre.text = "Hola jean carlo"

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //2.-Implementar algung metodo del UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //
        return false
    }

}

