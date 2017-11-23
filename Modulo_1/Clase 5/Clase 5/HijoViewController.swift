//
//  HijoViewController.swift
//  Clase 5
//
//  Created by Alumno on 10/23/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

//Paso 1
protocol HijoViewControllerDelegate{
    func test()
    func nuevoRegistro(cadena:String)
}

class HijoViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textoDeEntrada: UITextField!
    //Paso 2
    var delegate: HijoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Paso 3
        //delegate?.test()
        
        //llamamos al padreViewController
        //delegate?.nuevoRegistro(cadena: textField.text!)
        //Esconder teclado
        textField.resignFirstResponder()
        //ocultar el modal
        //dismiss(animated: true, completion: nil)
        dismiss(animated: true){
            self.delegate?.nuevoRegistro(cadena: textField.text!)
        }
        return true
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
