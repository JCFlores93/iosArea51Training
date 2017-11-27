//
//  NewPostViewController.swift
//  Clase1
//
//  Created by Admin on 11/24/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newPostButton() {
        
        PostService.new(text: "Area51") {
            (success, error) in
            
            if success {
                print("done")
            }else {
                print(error?.localizedDescription)
            }
        }

    }
    @IBAction func closeButton() {
        dismiss(animated: true) {
            //algo
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
