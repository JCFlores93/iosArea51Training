//
//  MyViewController.swift
//  Clase 8
//
//  Created by jean on 11/2/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let autos = ["Toyota", "Nissan", "Kia"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return autos.count
    }
    

   
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var txtToShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtToShow.text = "\(datePickerView.date)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func datePPicker(_ sender: UIDatePicker) {
        txtToShow.text = "\(datePickerView.date)"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return autos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtToShow.text = autos[row]
    }
    
}
