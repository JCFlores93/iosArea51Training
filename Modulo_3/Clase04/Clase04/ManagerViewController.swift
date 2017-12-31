//
//  ManagerViewController.swift
//  C22_0412_M03_C4_
//
//  Created by Alumno on 12/4/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {

    @IBOutlet var leadingPacmanView: NSLayoutConstraint!
    @IBOutlet private weak var pacmanImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //moveShape()
        //moveShapeWithAutolayout()
        let d = CalculadoraViewController()
        d.sumar()
    }

    func moveShapeWithAutolayout(){
        UIView.animate(withDuration: 3) {
            //self.view.setNeedsLayout() Incorrecto
            self.leadingPacmanView.constant = 250
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //x: self.pacmanImageView.frame.origin .x+50,
    func moveShape(){
        UIView.animate(withDuration: 3) {
            self.pacmanImageView.frame = CGRect(x: UIScreen.main.bounds.size.width-10, y: self.pacmanImageView.frame.origin.y, width: self.pacmanImageView.frame.size.width, height: self.pacmanImageView.frame.size.height
            )
        }
        
    }

}
