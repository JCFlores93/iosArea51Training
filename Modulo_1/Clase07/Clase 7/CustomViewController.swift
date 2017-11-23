//
//  CustomViewController.swift
//  Clase 7
//
//  Created by Alumno on 10/27/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UICollectionViewDataSource,
    UITableViewDataSource,
    UICollectionViewDelegate {
    
    var selected:Int = 0
    
    var valorSeleccionado:Int!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valorSeleccionado
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell")!
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        valorSeleccionado = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        valorSeleccionado = indexPath.row + 1
        tableView.reloadData()
        
    }

}
