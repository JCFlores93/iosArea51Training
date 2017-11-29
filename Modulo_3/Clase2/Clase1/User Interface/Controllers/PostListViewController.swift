//
//  PostListViewController.swift
//  Clase1
//
//  Created by Admin on 11/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CoreData

class PostListViewController: UITableViewController {

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCell()
        
        
        /*
        PostService.list {
            (response, error) in
            
            if let data = response as? [[String: Any]] {
                self.posts = data
                self.tableView.reloadData()
            }else {
                print(error?.localizedDescription)
            }

        }**/

    }
    override func viewWillAppear(_ animated: Bool) {
        loadPostFromDatabase()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func registerTableViewCell() {
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "postCell")
    }
    
    private func setDeleteFlag(post: Post) {
        
        post.operation = Operation.delete.rawValue
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContent.viewContext else { return }

        do {
            try context.save()
            loadPostFromDatabase()
            removeInNetwork(post: post)
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    private func removeInNetwork(post: Post) {
        
        PostService.delete(post: post) {
            (success, error) in
            
            if success {
                self.removePostFromDatabase(post: post)
            }else {
                print(error?.localizedDescription)
            }
            
        }
        
    }
    private func removePostFromDatabase(post: Post) {
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContent.viewContext else { return }
        
        context.delete(post)
        
        do {
            try context.save()
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
    private func loadPostFromDatabase() {
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContent.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
        fetchRequest.predicate = NSPredicate(format: "operation != %i", Operation.delete.rawValue)
        
        do {
            self.posts = try context.fetch(fetchRequest)
            self.tableView.reloadData()
        }catch let error {
            print(error.localizedDescription)
        }
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newPostSegue" {
            
        }else if segue.identifier == "detailSegue" {
            
            if let indexPath = sender as? IndexPath {
                
                let detail = segue.destination as! DetailPostViewController
                //detail.postSelected = posts[indexPath.row]
 
            }

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell

        cell.title.text = "\(posts[indexPath.row].uid)" //posts[indexPath.row].title as? String

        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            setDeleteFlag(post: posts[indexPath.row])
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }

}
