//
//  NewPostViewController.swift
//  Clase1
//
//  Created by Admin on 11/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController {
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var contentTextField: UITextField!

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    private func send(newPost: Post) {
        
        PostService.new(post: newPost) {
            (id, error) in
            
            if let _ = error {
                print(error?.localizedDescription)
            }else {
                newPost.uid = id!
                
                guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContent.viewContext else { return }
                do {
                    try context.save()
                    self.dismiss(animated: true, completion: nil)
                    
                }catch let error {
                    print(error.localizedDescription)
                }

            }
            
        }
        
        /*
        PostService.new(text: "Area51") {
            (success, error) in
            
            if success {
                print("done")
            }else {
                print(error?.localizedDescription)
            }
        }*/
        
    }
    private func saveincoredata() -> Post? {
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContent.viewContext else { return nil }
        
        let newPost = Post(context: context)
        newPost.title = titleTextField.text
        newPost.content = contentTextField.text
        
        do {
            try context.save()
            return newPost
           
        }catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    @IBAction func newPostButton() {

        if let post = saveincoredata() {
            send(newPost: post)
        }

    }
    @IBAction func closeButton() {
        dismiss(animated: true) {
            //algo
        }
    }

}
