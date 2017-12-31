//
//  PlatosTableViewController.swift
//  C24_1112_M03_C6
//
//  Created by Alumno on 12/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit

class PlatosTableViewController: UITableViewController {

    var platos: [Plato]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        platos = PlatoCollection.platos()
        //platos = PlatoCollection().bulkdata()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: IBAction Methods
    @IBAction func share(){
        let share = UIActivityViewController(activityItems: ["Texto"], applicationActivities: nil)
        share.excludedActivityTypes = [.copyToPasteboard]
        present(share, animated: true, completion: nil)
    }
    
    func sortByName(){
        
        
        /*
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        temporal = (platos as NSArray).sortedArray(using: [sortDescriptor]) as! [Plato]
        self.tableView.reloadData()
        */
        
        /*
        temporal = platos.sorted {
            (item1, item2) -> Bool in
            
            return item1.name!.characters.count > item2.name!.characters.count
        }
        */
        
    }
    
    @IBAction func apply(){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Ordenar por Nombre", style: .default, handler: {(alert) in
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Ordenar por fecha de creacion", style: .default, handler: { (alert) in
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return platos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plato = platos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        cell.textLabel?.text = plato.name
        cell.detailTextLabel?.text = "\(plato.createdAt)"
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
