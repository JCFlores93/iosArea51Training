//
//  GpsDetailViewController.swift
//  Demo10
//
//  Created by Admin on 22/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit

class GpsDetailViewController: UIViewController {
    
    var objetoPasado: Place?
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var latitudeLabel: UITextField!
    @IBOutlet weak var longitudeLabel: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = objetoPasado?.name
        addressLabel.text = objetoPasado?.address
        latitudeLabel.text = "\(objetoPasado?.location!.latitude)"
        longitudeLabel.text = "\(objetoPasado?.location!.longitude)"
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
