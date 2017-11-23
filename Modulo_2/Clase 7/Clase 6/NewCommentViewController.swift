//
//  NewCommentViewController.swift
//  Clase 6
//
//  Created by Admin on 11/17/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit
import CoreData

class NewCommentViewController: UIViewController {
    
    
    var postToAddNewComment: Post!
    @IBOutlet weak var caja1: UITextField!

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBAction methods
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButton() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext

        let newComment = Comment(entity: Comment.entity(), insertInto: context)
        newComment.message = caja1.text
        newComment.post = postToAddNewComment
        
        do {
            try context.save()
            dismiss(animated: true, completion: nil)
            
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }

}
