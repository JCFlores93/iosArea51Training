//
//  ManagerViewController.swift
//  Clase 5
//
//  Created by Admin on 12/4/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {
    
    @IBOutlet private weak var pacmanImageView: UIImageView!
    @IBOutlet weak var leadingPacmanView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = CalculadoraViewController()
        d.sumar()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
        //moveShape()
        moveShapeWithAutolayout()
    }
    
    func moveShapeWithAutolayout() {

        UIView.animate(withDuration: 5) {
            self.leadingPacmanView.constant = self.leadingPacmanView.constant + 100
            self.view.layoutIfNeeded()
        }
        
    }
    
    func moveShape() {

        UIView.animate(withDuration: 3) {
            self.pacmanImageView.frame = CGRect(x: UIScreen.main.bounds.size.width-30, y: self.pacmanImageView.frame.origin.y, width: self.pacmanImageView.frame.size.width, height: self.pacmanImageView.frame.size.height)
        }
        
    }

}
