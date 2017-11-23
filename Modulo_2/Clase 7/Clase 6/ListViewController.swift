//
//  ListViewController.swift
//  Clase 6
//
//  Created by Alumno on 11/15/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UITableViewController {
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBAction methods
    @IBAction func showFilters() {
        
        let actionSheet = UIAlertController(title: nil, message: "Criterio de ordenación", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Ascendente", style: .default, handler: { (action) in
            self.sortData(value: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Descendente", style: .default, handler: { (action) in
            self.sortData(value: false)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    func sortData(value: Bool) {
        
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = app.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: value)]
        
        do {
            self.posts = try context.fetch(fetchRequest)
            self.tableView.reloadData()
            
        }catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func requestData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
        
        do {
            let result = try context.fetch(fetchRequest)
            self.posts = result
            self.tableView.reloadData()
            
        }catch let error {
            print(error.localizedDescription)
        }

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)

        cell.textLabel?.text = "\(posts[indexPath.row].title!) -- \(posts[indexPath.row].comments!.count)"
        return cell
        
    }

    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addNewPostSegue" {
            
        }else if segue.identifier == "postDetailSegue" {
            
            let indexPath = tableView.indexPathForSelectedRow!
            let detail = segue.destination as! PostDetailViewController
            detail.postSelected = posts[indexPath.row]
            
        }

    }

}
