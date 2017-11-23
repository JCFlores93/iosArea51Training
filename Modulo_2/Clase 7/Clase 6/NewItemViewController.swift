//
//  NewItemViewController.swift
//  Clase 6
//
//  Created by Alumno on 11/15/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet weak var caja1: UITextField!
    @IBOutlet weak var caja2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func save() {
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appdelegate.persistentContainer.viewContext

        let newPost = Post(context: context)
        newPost.title = caja1.text
        newPost.message = caja2.text
        
        do {
            try context.save()
            dismiss(animated: true, completion: nil)
            
        }catch let error {
            print(error.localizedDescription)
        }

    }
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
