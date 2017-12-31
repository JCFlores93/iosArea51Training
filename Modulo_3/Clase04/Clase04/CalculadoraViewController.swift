//
//  CalculadoraViewController.swift
//  C22_0412_M03_C4_
//
//  Created by Alumno on 12/4/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit

class CalculadoraViewController: UIViewController {

    @IBOutlet private weak var valueTextField : UITextField!
    @IBOutlet private weak var anotherValueTextField : UITextField!
    @IBOutlet private weak var resultLabel : UILabel!

    
    //MARK IBAction methods
    @IBAction func sumar(){
      let n1 = valueTextField.text!
        let n2 = anotherValueTextField.text!
        
        let result = Int(n1)! + Int(n2)!
        resultLabel.text = "El resultado es \(result)"
        
        Calculadora.hacer(operacion: .suma, value1: nil)
    }
    //En la siguiente clase se implementara todo
    
    @IBAction func restar(){
        
    }
    
    @IBAction func dividir(){
        
    }
    
    @IBAction func multiplicar(){
        
    }
    
    private func verificar() -> Bool {
        
        return true
    }
    
    //MARK Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
