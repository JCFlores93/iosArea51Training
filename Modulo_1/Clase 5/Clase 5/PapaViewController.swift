//
//  PapaTableViewController.swift
//  Clase 5
//
//  Created by Alumno on 10/23/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class PapaTableViewController: UITableViewController, HijoViewControllerDelegate {
    //Declaro
    var nombres: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        nombres = [String]()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //hay que implementar las opciiones del relgae
    func test() {
        print("Funciona")
    }
    func nuevoRegistro(cadena: String) {
        //Agregar al arreglo
        nombres.append(cadena)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nombres.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = nombres[indexPath.row]
        return cell
    }
    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSegue", sender: nil)
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
    //evalua si se hace la tranasicion o no
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    //realiza la transicion, viene a ser el segue que contiene toda la info sobre el segue
    //cuando es manual solo se lla ma  a este metodo
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //nos da el identificador que tiene
        
        if let identifier = segue.identifier {
            if identifier == "showSegue" {
                
            }else {
                let detail = segue.destination as? HijoViewController
                detail?.delegate = self
            }
        }
        
        
        
        
    }
}
