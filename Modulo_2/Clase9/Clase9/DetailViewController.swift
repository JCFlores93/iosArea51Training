//
//  DetailViewController.swift
//  Clase9
//
//  Created by Alumno on 11/22/17.
//  Copyright © 2017 Area51 Training Center. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var objetoPasado: Place?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = objetoPasado?.name
        addressLabel.text = objetoPasado?.address
        latitudeLabel.text = "\(objetoPasado?.location?.latitude)"
        longitudeLabel.text = "\(objetoPasado?.location?.longitude)"
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
