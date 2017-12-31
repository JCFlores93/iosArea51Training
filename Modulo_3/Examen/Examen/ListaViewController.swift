
//
//  ListaViewController.swift
//  Examen
//
//  Created by Alumno on 12/15/17.
//  Copyright © 2017 Area51 Training Center. All rights reserved.
//

import UIKit

class ListaViewController: UITableViewController, AppCellDelegate {
    
    var lista: [Int: [App]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        
        lista = [0: [App(), App(), App()], 1: [App(), App()], 2: [App(), App(), App(), App(), App(), App(), App(), App()]]

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: AppCellDelegate method
    func itemSelected(item: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: item)
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = sender as? IndexPath {
            let detail = segue.destination as! DetailViewController
            //let appsArray = lista[indexPath.section]!
            //let appItem = appsArray[indexPath.ro
            detail.currentApp = lista[indexPath.section]![indexPath.row] //appItem
            
        }
 
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return lista.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "appCell", for: indexPath) as! AppCell
        cell.apps = lista[indexPath.section]
        cell.section = indexPath.section
        cell.delegate = self
        return cell
        
    }
}
