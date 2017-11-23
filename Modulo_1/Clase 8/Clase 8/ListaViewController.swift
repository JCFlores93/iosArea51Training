//
//  ListaViewController.swift
//  Clase 8
//
//  Created by Alumno on 10/30/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let autos = Auto.data()
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "autoCell", for: indexPath) as! AutoCell
        
        let auto = autos[indexPath.row]
        cell.marcaLabel.text = auto.marca
        cell.descripcionLabel.text = auto.descripcion
        
        UIImage(named: auto.marca)
        
        return cell
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
