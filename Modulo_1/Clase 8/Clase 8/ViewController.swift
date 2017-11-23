//
//  ViewController.swift
//  Clase 8
//
//  Created by Alumno on 10/30/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    let autos = ["Toyota", "Nissan", "Kia"]

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = "\(datePicker.date)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:  IBAction method
    @IBAction func dateSelectedButton(_ sender: UIDatePicker) {
        dateLabel.text = "\(sender.date)"
    }
    
    //MARK: UIPickerViewDelegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return autos.count
    }
    
    //MARK: UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return autos[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        dateLabel.text = autos[row]
        
    }
    
}

