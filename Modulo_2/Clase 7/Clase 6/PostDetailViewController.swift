//
//  PostDetailViewController.swift
//  Clase 6
//
//  Created by Alumno on 11/15/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit
import CoreData

class PostDetailViewController: UITableViewController {
    
    var postSelected: Post!
    var comments: [Comment]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Post detail"
        setupRightButton()

    }
    override func viewWillAppear(_ animated: Bool) {

        if let c = postSelected.comments {
            comments = c.allObjects as! [Comment]
            tableView.reloadData()
        }else {
            comments = [Comment]()
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupRightButton() {
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newCommentButton))
        
        let filterButton = UIBarButtonItem(title: "Filter", style: .done, target: self, action: #selector(filterComments))
        
        navigationItem.rightBarButtonItems = [rightButton, filterButton]
        
    }
    @objc func filterComments() {
        
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Date", style: .default, handler: { (action) in
            self.filter()
        }))
        ac.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
        
        present(ac, animated: true, completion: nil)
        
    }
    @objc func newCommentButton() {
        performSegue(withIdentifier: "newCommentSegue", sender: nil)
    }
    
    func filter() {
        
        let predicate = NSPredicate(format: "createdAt == %@", "nil")
        
        if let commentSet = postSelected.comments?.filtered(using: predicate) as? Set<Comment> {
            comments = Array(commentSet)
            
            if comments.count != 0 {
                self.tableView.reloadSections(IndexSet(integer: 1), with: .fade)
            }else {
                self.tableView.reloadData()
            }

        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newCommentSegue" {
            
            let nav = segue.destination as! UINavigationController
            let detail = nav.topViewController as! NewCommentViewController
            detail.postToAddNewComment = postSelected
            
        }
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return comments.count == 0 ? 1 : 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 1 : comments.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
            cell1.textLabel?.text = postSelected.message
            return cell1
        default:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
            cell2.textLabel?.text = comments[indexPath.row].message
            return cell2
        }

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Post" : (comments.count != 0 ? "Comments": "")
    }
    
}
