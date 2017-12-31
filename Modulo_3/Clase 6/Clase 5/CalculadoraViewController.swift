//
//  CalculadoraViewController.swift
//  Clase 5
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CalculadoraViewController: UIViewController {
    
    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet private weak var anotherValueTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func verificar() -> Bool {
        return true
    
    }
    
    //MARK: IBAction methods
    @IBAction func sumar() {
        
        let resultado = Calculadora.hacer(operacion: .suma, value1: valueTextField.text!, value2: anotherValueTextField.text!)
        
        resultLabel.text = "El resultdo es\(resultado)"
        
    }
    @IBAction func restar() {
        
    }
    @IBAction func dividir() {
        
    }
    @IBAction func multiplicar() {
        
    }

}
